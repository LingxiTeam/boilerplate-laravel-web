#!/usr/bin/env bash

# overwrite
cp app.php config/app.php
cp .env.example .env

# composer
composer install

php artisan vendor:publish --provider="Lingxi\Hashids\HashidsServiceProvider"
php artisan vendor:publish --provider="Lingxi\BrowserDetect\BrowserDetectServiceProvide"
php artisan vendor:publish --provider="Lingxi\OptionsManager\Providers\OptionsManagerProvider"
php artisan vendor:publish --provider="Lingxi\Cookie\CookieServiceProvider"
php artisan vendor:publish --provider="Prettus\Repository\Providers\RepositoryServiceProvider"

php artisan key:generate

# remove
rm app.php
rm init.sh

