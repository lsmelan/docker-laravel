## About DockerLaravel

DockerLaravel is a CLI application built in PHP 7.4 on top of the Laravel Framework. This repository uses docker to build the following images:

- PHP
- Mysql

## How to install

`$ cp .env.example .env`

`$ make up`

`$ make composer-install` Or

`$ make composer-update` (To be run eventually)

`$ make generate-key`

## Accessing containers

`$ docker-compose exec app bash`

`$ docker-compose exec db bash`

## Run PHPUnit

`$ make test`

## Artisan CLI

### List commands

`$ docker-compose exec app php artisan list`


### Managing DB

### Create migrations files

The following command will create a new file in app/database/migrations everytime you run it, so that you can put all the sql statements like create or alter table there. They are versioned by timestamp:

`$ docker-compose exec -u 1001 app php artisan make:migration create_yourtable_table`


### Run all migrations (only first time)

`$ docker-compose exec -u 1001 app php artisan migrate`

### With seed option

You may want to run some insert statements as well at once, by using `--seed` option:

`$ docker-compose exec -u 1001 app php artisan migrate --seed`

### Fresh command

If you need to drop your tables and re-create them:

`make fresh-db`

### Only seed

Probably you will need to run first the `composer dump-autoload` command if the seeders classes are new in your repository:

`$ make composer-dump-autoload`

`$ docker-compose exec -u 1001 app php artisan db:seed`

### Create a new seeder

Seeders are useful when you want to perform some operations like `insert` into some tables for example. Similarly the migrations files, you can create the seeder classes in app/database/seeds with the command below, then you will have to put the statements there:

`$ docker-compose exec -u 1001 app php artisan make:seeder YourSeeder`

### Build a new command class

`$ docker-compose exec -u 1001 app php artisan make:command FooCommand`

Note that `FooCommand` is the name of the class, which will be created in: app/Console/Commands/FooCommand.php. You still need to open it and define the signature that will be something like: `any name:any action` and a description as well that can be useful for whom is reading after run the list command in the terminal. The logic can be put all inside the `handle` method or you are free to create new methods or classes to organize the code the way you like most. After that you can run the command by typing on terminal (Bear in mind that is not always you will need to use root `-u 0` privileges):

`$ docker-compose exec -u 1001 app php artisan yourcommand:theaction`

### Verify version

`$ docker-compose exec app php artisan --version`

## Documentation

Read the complete documentation on Laravel site at https://laravel.com/docs/7.x/artisan for more details
