cache:
    untracked: true

stages:
    - test

test:
    stage: test
    script:
        - php -v
        - rm -rf .env.example
        - mv .env.testing.example .env
        - cat .env
        - ls -al
        - cat ./shipit.sh
        - ./shipit.sh
        - chmod 766 -R storage
        - echo "Running PHP Unit test"
        - rm -rf ./vendor
        - composer install -o
        - phpunit --coverage-text --colors=never

