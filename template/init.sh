#!/usr/bin/env bash

# composer
composer install

# overwrite
cp overwrite/app.php config/app.php

php artisan vendor:publish --provider="Lingxi\Hashids\HashidsServiceProvider"
php artisan vendor:publish --provider="Lingxi\BrowserDetect\BrowserDetectServiceProvide"
php artisan vendor:publish --provider="Lingxi\OptionsManager\Providers\OptionsManagerProvider"
php artisan vendor:publish --provider="Lingxi\Cookie\CookieServiceProvider"
php artisan vendor:publish --provider="Prettus\Repository\Providers\RepositoryServiceProvider"

php artisan key:generate

# remove
rm -rf overwrite
rm init.sh

