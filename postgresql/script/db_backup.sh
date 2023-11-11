#!/bin/sh
DB_NAME=postgres
DB_USER=postgres
DATE=$(date -Iseconds)
OUT="db__${DB_NAME}__${DATE}.dump"

if [ -z ${PGPASSWORD} ]; then
  echo "set ENV var 'PGPASSWORD' to run backup"
  exit 1
fi

pg_dump -d ${DB_NAME} -U ${DB_USER} -h localhost -p 5432 -Fc -v > ${OUT}
echo "successfully dumped to the file: ${OUT}"
exit
