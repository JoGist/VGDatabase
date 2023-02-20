#!/usr/bin/env bash
set -e

source_root="${1}"
build_root="${2}"
xml_db_file="${3}"
update_mime_database="${4}"
xdgmime_test_mime_data="${5}"
xdgmime_test_mime="${6}"
test_tree_magic="${7}"

tmp_dir=`mktemp -d`

mkdir -p "${tmp_dir}/mime/packages"

cp -a "${xml_db_file}" "${tmp_dir}/mime/packages/"

export XDG_DATA_DIRS="${tmp_dir}"
export XDG_DATA_HOME="${tmp_dir}"

"${update_mime_database}" "${tmp_dir}/mime/"
"${xdgmime_test_mime_data}" -v "${source_root}/tests/mime-detection/list"
"${xdgmime_test_mime}"
"${test_tree_magic}" "${source_root}/tests/mime-detection/tree-list"

rm -rf "${tmp_dir}"
