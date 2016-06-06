#!/bin/bash


###############
##### APP #####
###############

cd ..

printf '\ncrafting app..\n'

if [[ ! -d app ]];
  then
    printf '\nbuilding application.. \n'
    printf 'go take a coffe, this will take a while! ☕ \n'
    mkdir app
    cd app
    printf 'cloning from github.. \n'
    git clone https://github.com/brnbp/brnpod.git . --quiet
    
    chmod +x composer.phar
    printf 'installing dependecies..\n'
    ./composer.phar install --quiet

    cp .env.example .env
    php artisan key:generate

    php artisan migrate

  else
    cd app
    printf 'updating project, this can take a while ☕ \n'
    git pull origin master --quiet
    printf 'update dependecies.. \n'
    ./composer.phar update --quiet
fi
  
printf 'serving application.. \n'
php artisan serve --port 8080 -vv
#printf 'running on localhost:8080 \n'
