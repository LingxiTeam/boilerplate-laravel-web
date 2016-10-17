#!/usr/bin/env bash

rm -rf template

git clone https://github.com/laravel/laravel

mv laravel template

cd template

cp .env.example .env
cp .env.example .env.testing.example

cp ../shipit.sh shipit.sh
cp ../after_shipit.sh after_shipit.sh
cp ../gitlab.ci.yml gitlab.ci.yml
cp ../composer.json composer.json
cp ../run.sh init.sh

cp ../app.php app.php

composer install

#cp ../app.php config/app.php
#cp ../kernel.php app/Http/kernel.php

#php artisan vendor:publish --provider="Lingxi\Hashids\HashidsServiceProvider"
#php artisan vendor:publish --provider="Lingxi\BrowserDetect\BrowserDetectServiceProvide"
#php artisan vendor:publish --provider="Lingxi\OptionsManager\Providers\OptionsManagerProvider"
#php artisan vendor:publish --provider="Lingxi\Cookie\CookieServiceProvider"

rm -rf vendor
rm composer.lock

echo "test.php" >> .gitignore

rm -rf .git

touch test.php

echo "Complete!!!"

