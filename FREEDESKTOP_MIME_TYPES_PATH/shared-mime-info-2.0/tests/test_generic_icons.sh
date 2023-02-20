#!/usr/bin/env bash

xml_db_file="${1}"

generic_icons_required=$(
    grep "mime-type type=" "${xml_db_file}" \
        | grep -cv 'video/|image/|text/|audio/|octet-stream'
)
generic_icons_present=$(
    grep -c "generic-icon name=" "${xml_db_file}"
)

echo "Number of mime-types that might need generic-icon: ${generic_icons_required}"
echo "Number of mime-types with a generic icon: ${generic_icons_present}"
