
install_man('update-mime-database.1')

freedesktop_org_xml = custom_target('freedesktop.org.xml',
    input : files(
        'freedesktop.org.xml.in',
        'its/shared-mime-info.its',
        'its/shared-mime-info.loc',
    ),
    output: 'freedesktop.org.xml',
    command: [
        find_program('freedesktop_generate.sh'),
        meson.source_root(),
        meson.build_root()
    ],
    install: true,
    install_dir: get_option('datadir') / 'mime' / 'packages',
)

install_data(
  [ 'its/shared-mime-info.loc', 'its/shared-mime-info.its', ],
  install_dir : get_option('datadir') / 'gettext/its'
)

custom_target('shared-mime-info-spec-html',
    input : 'shared-mime-info-spec.xml',
    output: 'shared-mime-info-spec-html',
    command: [
        xmlto,
        '-o', '@OUTPUT@',
        'html-nochunks',
        '@INPUT@',
    ],
    build_by_default: true,
)

pkgconfig.generate(
    name: 'shared-mime-info',
    description: 'Freedesktop common MIME database',
    version: meson.project_version(),
)
