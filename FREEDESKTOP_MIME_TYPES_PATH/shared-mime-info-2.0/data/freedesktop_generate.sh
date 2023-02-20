#!/bin/bash -e

src_root="$1"
build_root="$2"

ninja -C "${build_root}" shared-mime-info-gmo

itstool \
    --its "${src_root}/data/its/shared-mime-info.its" \
    --join "${src_root}/data/freedesktop.org.xml.in" \
    -o "${build_root}/data/freedesktop.org.xml" \
    "${build_root}/po/"*".gmo"
