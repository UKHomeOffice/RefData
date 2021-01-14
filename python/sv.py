# pip install psycopg2
from typing import Tuple, List

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
# noinspection PyUnresolvedReferences
from psycopg2.errors import DuplicateDatabase, DuplicateObject, DuplicateTable
import os
import json
from json.decoder import JSONDecodeError
import configparser
from datetime import datetime

db_name = "ref"
service_user_name = "postgres"
ro_user_name = "postgres"
anon_user_name = "postgres"
auth_user_role = "role_au"
schema_name = "public"
script_root = "../schemas/reference"

# connect and create db
host = os.getenv("POSTGRES_HOST", "postgres")

config = configparser.ConfigParser()
with open("../docker/flyway_reference_docker.conf") as stream:
    config.read_string("[top]\n" + stream.read())

flyway_target = int(config["top"]["flyway.target"])

def ensure_db():
    conn = psycopg2.connect(host=host, database="postgres", user="postgres", password="postgres")
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = conn.cursor()
    try:
        cur.execute(f"CREATE DATABASE {db_name};")
    except DuplicateDatabase:
        pass

ensure_db()

# reconnect to the reference database
conn = psycopg2.connect(host=host, database=db_name, user="postgres", password="postgres")
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)


def find_and_sort_scripts() -> Tuple[List[str], int]:
    # find scripts
    _, _, files = next(os.walk(script_root))

    # sort by version number as integer
    files = [(fn, (int(fn[1:].split("_")[0]))) for fn in files]
    sfiles = sorted(files, key=lambda t: t[1])

    return [x[0] for x in sfiles], sfiles[-1][1]


def apply_scripts(script_files):
    cur = conn.cursor()
    for i, fn in enumerate(script_files, start=1):
        print(f"processing {fn} (#{i})")
        path = os.path.join(script_root, fn)
        with open(path, "r") as file:
            script = file.read()

        script = script.replace("${serviceuser}", service_user_name)
        script = script.replace("${readonlyuser}", ro_user_name)
        script = script.replace("${authenticatoruser}", auth_user_role)
        script = script.replace("${schema}", schema_name)
        script = script.replace("${anonuser}", anon_user_name)

        try:
            cur.execute(script)
        except (DuplicateObject, DuplicateTable):
            pass

        # print(script)

    cur.close()


def list_tables() -> List[str]:
    # get list of tables
    cur = conn.cursor()
    cur.execute("select table_name from information_schema.tables where table_schema='public';")
    tables = cur.fetchall()
    tables = [x[0] for x in tables]
    return tables


def list_columns(table_name: str):
    cur = conn.cursor()
    cur.execute(
        f"select column_name, ordinal_position, data_type from information_schema.columns where table_name='{table_name}';")
    cols = cur.fetchall()

    cols = [(x[0], get_column_comment_json(cur, table_name, x[1])) for x in cols]

    cur.close()
    return cols


def get_table_comment_json(cur, table_name: str):
    cur.execute(f"select obj_description('public.{table_name}'::regclass)")
    jt = cur.fetchone()[0]

    try:
        j = json.loads(jt)
    except JSONDecodeError:
        return None

    return j


def get_column_comment_json(cur, table_name: str, column_index: str):
    cur.execute(f"select col_description('public.{table_name}'::regclass, {column_index});")
    jt = cur.fetchone()[0]
    if not jt:
        return None

    try:
        j = json.loads(jt)
    except JSONDecodeError:
        return None

    return j


def print_error(text: str, err_count: int, level=1) -> int:
    print(level * "  ", end="")
    print("!!!", end="")
    print(text)
    return err_count + 1


def check_j_present(j, props, err_count, level) -> int:
    for prop in props:
        if not j.get(prop):
            err_count = print_error(f"'{prop}' is missing", err_count, level)
    return err_count


def validate_tables(table_names: List[str]):
    err_count = 0
    cur = conn.cursor()
    for table in table_names:
        print(f"validating '{table}'")
        j = get_table_comment_json(cur, table)
        if not j:
            err_count = print_error("comment is not a valid JSON.", err_count)
            continue

        err_count = check_j_present(j,
                                    ["description", "schemalastupdated", "dataversion", "owner"],
                                    err_count, 1)

        # schemalastupdated is present and is in dd/MM/yyyy format
        schemalastupdated = j.get("schemalastupdated")
        if schemalastupdated:
            try:
                datetime.strptime(schemalastupdated, "%d/%m/%Y")
            except ValueError:
                err_count = print_error(
                    f"schemalastupdated needs to be in dd/MM/yyyy format, but the value found was '{schemalastupdated}'",
                    err_count)

        columns = list_columns(table)
        bk_cols = []
        # check json comment validity
        for column in columns:
            name = column[0]
            j = column[1]
            print(f"  validating '{name}'")
            if not j:
                err_count = print_error("comment is not a valid JSON", err_count, 2)
            else:
                err_count = check_j_present(j, ["label", "description", "summaryview"], err_count, 2)

                if j.get("businesskey"):
                    bk_cols.append(name)

        # there should be only one businesskey
        if len(bk_cols) != 1:
            if len(bk_cols):
                err_count = print_error(
                    f"exactly one column needs to have 'businesskey' attribute, following do: {bk_cols}",
                    err_count)
            else:
                err_count = print_error("one of the columns must have 'businesskey' attribute", err_count)

        # check we have validfrom and validto columns
        cnames = [x[0] for x in columns]
        if "validfrom" not in cnames:
            err_count = print_error("missing 'validfrom' column", err_count)
        if "validto" not in cnames:
            err_count = print_error("missing 'validto' column", err_count)

    return err_count


sfiles, sfiles_max = find_and_sort_scripts()

if sfiles_max != flyway_target:
    print(f"flyway.target in docker/flyway_reference_docker.conf is {flyway_target} but the last script number is {sfiles_max}")
    exit(1)

apply_scripts(sfiles)

tables = list_tables()

err_count = validate_tables(tables)

if err_count:
    print(f"{err_count} error(s).")

exit(err_count)
