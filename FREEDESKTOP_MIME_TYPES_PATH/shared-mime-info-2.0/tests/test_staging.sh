#!/usr/bin/env bash
set -e

source_root="${1}"
build_root="${2}"
xml_db_file="${3}"
update_mime_database="${4}"
xdgmime_print_mime_data="${5}"

tmp_dir=`mktemp -d`

if [ ! -d "${source_root}/staging-tests" ]; then
    echo "***************************************************************************"
    echo "*** Add your file to process to staging-tests/ and run local-test again ***"
    echo "***************************************************************************"
    exit 1
fi

rm -rf "${tmp_dir}"
mkdir -p "${tmp_dir}/mime/packages"

cp -a "${xml_db_file}" "${tmp_dir}/mime/packages/"

export XDG_DATA_DIRS="${tmp_dir}"
export XDG_DATA_HOME="${tmp_dir}"

"${update_mime_database}" "${tmp_dir}/mime/"
"${xdgmime_print_mime_data}" "${source_root}/staging-tests"

rm -rf "${tmp_dir}"
