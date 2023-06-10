<?php

return [
    'paths' => [
        'migrations' => '%%PHINX_CONFIG_DIR%%/db/migrations',
        'seeds' => '%%PHINX_CONFIG_DIR%%/db/seeds'
    ],
    'environments' => [
        'default_migration_table' => 'phinxlog',
        'default_environment' => 'default',
        'default' => [
            'adapter' => $_ENV['PHINX_DB_ADAPTER'] ?? 'mysql',
            'host' => $_ENV['PHINX_DB_HOST'] ?? 'localhost',
            'name' => $_ENV['PHINX_DB_DATABASE'],
            'user' => $_ENV['PHINX_DB_USERNAME'] ?? 'root',
            'pass' => $_ENV['PHINX_DB_PASSWORD'],
            'port' => $_ENV['PHINX_DB_PORT'] ?? 3306,
            'charset' => 'utf8',
            'collation' => 'utf8_unicode_ci',
        ]
    ],
    'version_order' => 'creation'
];
