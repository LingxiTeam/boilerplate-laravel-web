<?php

/**
 * default: 默认option连接, 多个connections就加在connections里面
 */
return [
    'default'     => 'global_option',
    'connections' => [
        'global_option' => [
            'connection' => env('OPTIONS_CONNECTION', 'lingxi_options'),
            'table'      => env('OPTIONS_TABLE', 'options'),
        ],
    ],
];
