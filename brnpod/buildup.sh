#!/bin/bash

#################
### Warehouse ###
#################

printf 'crafting warehouse.. \n'

if [[ ! -d warehouse ]]; 
  then
    printf '\nbuilding application.. \n'
    printf 'go take a coffe, this will take a while! ☕ \n'
    mkdir warehouse 
    cd warehouse
    printf 'cloning from github.. \n'
    git clone https://github.com/brnbp/warehouse.git . --quiet
    
    chmod +x composer.phar
    printf 'installing dependecies..\n'
    ./composer.phar install --quiet

    cp .env.example .env
    php artisan key:generate

  else
    cd warehouse 
    printf 'updating project, this can take a while ☕ \n'
    #git pull origin master --quiet
    printf 'update dependecies.. \n'
    #./composer.phar update --quiet
fi

printf 'serving application.. \n'
#php artisan serve --port 8082 --quiet &
printf 'running on localhost:8082\n'


#---------------------------------------------------------------#


###############
##### API #####
###############

cd ..

printf '\ncrafting api..\n'

if [[ ! -d api ]];
  then
    printf '\nbuilding application.. \n'
    printf 'go take a coffe, this will take a while! ☕ \n'
    mkdir api
    cd api
    printf 'cloning from github.. \n'
    git clone https://github.com/brnbp/brnpod-api.git . --quiet
    
    chmod +x composer.phar
    printf 'installing dependecies..\n'
    ./composer.phar install --quiet

    cp .env.example .env
    php artisan key:generate
    php artisan migrate

  else
    cd api
    printf 'updating project, this can take a while ☕ \n'
    git pull origin master --quiet
    printf 'update dependecies.. \n'
    ./composer.phar update --quiet
fi

printf 'serving application.. \n'
php artisan serve --port 8081 --quiet &

# start api queue
printf 'running queue listener on background\n'
php artisan queue:listen --timeout 180 --sleep 120 --quiet &

printf 'running on localhost:8081\n'

#---------------------------------------------------------------#


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
