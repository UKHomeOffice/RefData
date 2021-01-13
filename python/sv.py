# pip install psycopg2

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from psycopg2.errors import DuplicateDatabase

import os

# connect and create db
conn = psycopg2.connect(host="postgres", database="postgres", user="postgres", password="postgres")
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = conn.cursor()
try:
    cur.execute("CREATE DATABASE ref;")
except DuplicateDatabase:
    pass

# find scripts
root = "../../schemas/reference"
_, _, files =  next(os.walk(root))

# sort by version number as integer
sfiles = sorted(files, key=lambda fn: int(fn[1:].split("_")[0]))

for i, fn in enumerate(sfiles, start=1):
    print(f"processing {fn} (#{i})")
    path = os.path.join(root, fn)
    print(path)
