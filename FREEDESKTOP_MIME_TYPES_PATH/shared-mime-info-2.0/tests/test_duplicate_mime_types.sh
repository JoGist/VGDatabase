#!/usr/bin/env bash

xml_db_file="${1}"

duplicated=$(
    grep '<mime-type' ${xml_db_file} | tr -d '[:blank:]' | sort | uniq -d
)

if [[ -n "${duplicated}" ]]; then
    echo "*************************************************************"
    echo "** Some mime-types are duplicated, fix before committing:  **"
    echo "${duplicated}"
    echo "*************************************************************"
    exit 1
fi
