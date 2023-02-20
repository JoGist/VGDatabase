#!/bin/sh

set -e

if [ ! -f po/shared-mime-info.pot ] ; then
	echo "Please generate “po/shared-mime-info.pot” before running this command"
	exit 1
fi

if [ data/freedesktop.org.xml.in -nt po/shared-mime-info.pot ] ; then
	echo "Please update “po/shared-mime-info.pot” before running this command"
	exit 1
fi

if [ ! -f .tx/config ] ; then
	echo "Please run this command from the root of the source directory"
	exit 1
fi

tx pull --all --force --skip
tx push --source
