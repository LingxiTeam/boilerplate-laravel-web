#!/bin/bash

function assert_ok()
{
    if [ "$1" != 0 ]; then
        exit 1
    fi
}

rm -f *.json
rm -f composer.lock
rm -f gulpfile.js
rm -f shipit.sh
rm -f .gitignore
rm -f README.md
rm -f *.txt
rm -f *.yml
rm -f model.txt.example
rm -f .eslintrc.js
rm -f .env.example
rm -f .gitattributes
rm -f .jslintrc
rm -f LICENSE
rm -f CHANGELOG.md
rm -rf .env.testing


rm -rf ./bower_components || assert_ok $?
rm -rf ./node_modules || assert_ok $?

# phpunit --colors --debug --coverage-text || assert_ok $?

php artisan inspire || assert_ok $?

rm -rf ./tests
rm -f *.xml

rm -f after_shipit.sh

exit 0

