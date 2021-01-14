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


def ensure_db():
    conn = psycopg2.connect(host=host, database="postgres", user="postgres", password="postgres")
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = conn.cursor()
    try:
        cur.execute(f"CREATE DATABASE {db_name};")
    except DuplicateDatabase:
        pass


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


def get_table_comment_json(cur, table_name: str):
    cur.execute(f"select obj_description('public.{table_name}'::regclass)")
    jt = cur.fetchone()[0]

    try:
        j = json.loads(jt)
    except JSONDecodeError:
        print(f"  comment is not a valid JSON.")
        return None

    return j


def validate_tables(table_names: List[str]):
    err_count = 0
    cur = conn.cursor()
    for table in table_names:
        print(f"validating '{table}'")
        j = get_table_comment_json(cur, table)
        if not j:
            err_count += 1
            continue

        # description is present
        if not j.get("description"):
            print("  description missing.")

        # schemalastupdated is present and is in dd/MM/yyyy format
        schemalastupdated = j.get("schemalastupdated")
        if not schemalastupdated:
            print("  schemalastupdated missing")
        try:
            datetime.strptime(schemalastupdated, "%d/%m/%Y")
        except ValueError:
            print(f"  schemalastupdated needs to be in dd/MM/yyyy format, but the value found was '{schemalastupdated}'")

        # dataversion is present
        if not j.get("dataversion"):
            print(f"  dataversion is missing")

        # owner is present
        if not j.get("owner"):
            print(f"  owner is missing")

    return err_count



sfiles, sfiles_max = find_and_sort_scripts()

apply_scripts(sfiles)

tables = list_tables()

err_count = validate_tables(tables)

exit(err_count)