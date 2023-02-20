
project('shared-mime-info',
    'c',
    version: '2.0',
    meson_version: '>=0.49.0'
)

config = configuration_data()

i18n = import('i18n')
pkgconfig = import('pkgconfig')

cc = meson.get_compiler('c')

###############################################################################
# Project configuration

config.set_quoted('PACKAGE', meson.project_name())
config.set_quoted('VERSION', meson.project_version())

###############################################################################
# Find tools

itstool = find_program('itstool')
xmllint = find_program('xmllint')
xmlto   = find_program('xmlto')

###############################################################################
# Find xdgmime

xdgmime = get_option('xdgmime-path') / 'src'

xdgmime_print_mime_data = find_program(xdgmime/'print-mime-data', required: false)
xdgmime_test_mime_data  = find_program(xdgmime/'test-mime-data', required: false)
xdgmime_test_mime       = find_program(xdgmime/'test-mime', required: false)
xdgmime_found = (
    xdgmime_print_mime_data.found() and
    xdgmime_test_mime_data.found()  and
    xdgmime_test_mime.found()
)

if not xdgmime_found
    warning('''
***************************************************************************
*** xdgmime not compiled, test suite cannot run. Check HACKING for info ***
***************************************************************************
    ''')
endif

###############################################################################
# Dependencies

check_functions = [
    'fdatasync',
]
foreach function : check_functions
    config.set('HAVE_'+function.to_upper(), cc.has_function(function))
endforeach


libxml = dependency('libxml-2.0',   version: '>=2.4')
glib2  = dependency('glib-2.0',     version: '>=2.6.0')

gio = dependency('gio-2.0', required: false)

subdir('po')
subdir('data')
subdir('src')
subdir('tests')

if get_option('update-mimedb')
    upd_tool = (meson.is_cross_build()
        ? find_program('update-mime-database').path()
        : update_mime_database.full_path()
    )
    meson.add_install_script('sh', '-c', ' '.join([
        upd_tool, '-V', '${MESON_INSTALL_DESTDIR_PREFIX}' / get_option('datadir') / 'mime',
    ]))
endif
