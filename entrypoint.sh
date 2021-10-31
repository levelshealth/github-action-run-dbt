#!/bin/bash
set -o pipefail

DBT_ROOT=${DBT_ROOT:-.}

echo "==> cd ${DBT_ROOT}"
cd ${DBT_ROOT}

DBT_LOG_FILE=${DBT_LOG_FILE:="dbt_console_output.txt"}
DBT_LOG_PATH="${DBT_ROOT}/${DBT_LOG_FILE}"

echo "DBT_LOG_PATH=${DBT_LOG_PATH}" >> $GITHUB_ENV

echo "==> Running $1 > ${DBT_LOG_PATH}"

$1 2>&1 | tee "${DBT_LOG_FILE}"
if [ $? -eq 0 ]
  then
    echo "DBT_RUN_STATE=passed" >> $GITHUB_ENV
    echo "::set-output name=result::passed"
    echo "DBT run OK" >> "${DBT_LOG_FILE}"
  else
    echo "DBT_RUN_STATE=failed" >> $GITHUB_ENV
    echo "::set-output name=result::failed"
    echo "DBT run failed" >> "${DBT_LOG_FILE}"
    exit 1
fi
