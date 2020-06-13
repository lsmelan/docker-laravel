.PHONY: up down rm composer-install composer-update composer-dump-autoload generate-key test fresh-db

up:
	@docker-compose up -d

down:
	@docker-compose stop

rm:
	@docker-compose rm -v

composer-install:
	@docker-compose exec -u 0 app composer install

composer-update:
	@docker-compose exec -u 0 app composer update

composer-dump-autoload:
	@docker-compose exec -u 0 app composer dump-autoload

generate-key:
	@docker-compose exec -u 1001 app php artisan key:generate

test:
	@docker-compose exec -u 1001 app ./vendor/bin/phpunit

fresh-db:
	@docker-compose exec -u 1001 app php artisan migrate:fresh --seed
