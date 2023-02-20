#!/usr/bin/env bash

# Go to po directory
cd "$(dirname "${0}")" || exit 1

RET=0

for i in *.po; do
    lang="$(basename "${i}" | sed 's,.po,,')"
    if ! grep -q ^"${lang}" "LINGUAS"; then
        echo "*** Language ${lang} is missing from LINGUAS ***"
        RET=1
    fi
done

exit "${RET}"
