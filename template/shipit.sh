#!/bin/bash

function assert_ok()
{
    if [ "$1" != 0 ]; then
        exit 1
    fi
}

function command_exists () {
    type "$1" &> /dev/null ;
}

rm -rm storage/*/

mkdir storage
mkdir storage/app
mkdir storage/debugbar
mkdir storage/framework
mkdir storage/logs
mkdir storage/framework/sessions
mkdir storage/framework/cache
mkdir storage/framework/views

composer install -o --no-dev || assert_ok $?

php artisan key:generate || assert_ok $?
php artisan env || assert_ok $?

#npm config set registry https://registry.npm.taobao.org
type npm
type cnpm
if command_exists cnpm ; then
    SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass cnpm install --production || assert_ok $?
else
    SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass npm install --production || assert_ok $?
fi

bower install --allow-root || assert_ok $?

gulp prepare-resource --production || assert_ok $?
gulp --production || assert_ok $?
gulp clean

chmod 766 -R storage || assert_ok $?
chmod 766 bootstrap/cache || assert_ok $?

# php artisan migrate || assert_ok $?

php artisan route:cache || assert_ok $?

php artisan optimize || assert_ok $?

php artisan route:list || assert_ok $?


exit 0

