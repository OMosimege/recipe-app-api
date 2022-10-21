COMPOSE_DOCKER_CLI_BUILD=1
DOCKER_BUILDKIT=1

makemigrations:
	@docker-compose run --rm app sh -c "python manage.py makemigrations"


migrate:
	@docker-compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate"

createsuperuser:
	@docker-compose run --rm app sh -c "python manage.py createsuperuser"

reset:
	@docker-compose down
	@docker rm -f $(docker ps -a -q)
	@docker volume rm $(docker volume ls -q)

test:
	@docker-compose run --rm app sh -c "python manage.py test"
