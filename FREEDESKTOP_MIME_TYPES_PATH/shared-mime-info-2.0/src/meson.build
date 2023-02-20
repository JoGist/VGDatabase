
configure_file(
    output: 'config.h',
    configuration: config,
)

update_mime_database = executable('update-mime-database',
    'update-mime-database.c',
    dependencies: [
        glib2,
        libxml,
    ],
    install: true,
)

test_subclassing = executable('test-subclassing',
    'test-subclassing.c',
    dependencies: [
        glib2,
        libxml,
    ],
    install: false,
)

if gio.found()
    test_tree_magic = executable('tree-magic',
        'test-tree-magic.c',
        dependencies:[
            glib2,
            gio,
        ],
        install: false,
    )
endif
