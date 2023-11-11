#!/bin/sh
DB_NAME=postgres
DB_USER=postgres

if [ -z ${FROM} ]; then
  echo "set ENV var 'FROM' to restore db"
  exit 1
fi
if [ -z ${PGPASSWORD} ]; then
  echo "set ENV var 'PGPASSWORD' to restore db"
  exit 2
fi
pg_restore -d ${DB_NAME} -U ${DB_USER} -h localhost -p 40000 -Fc ${FROM}
echo "successfully restored from the file: ${OUT}"
exit
