# Run command to install python libraryes
set-up: clean
	pip install -r requirements.txt

# Run command to initialize django server
server: clean
	python manage.py runserver

# Run command to create an django super user
su: clean
	python manage.py createsuperuser

# Run command to show all django routes
show_urls: clean
	python manage.py show_urls

# Run command to initialize django shell
shell: clean
	python manage.py shell

# Run command to create django migrations
migrations: clean
	python manage.py makemigrations

# Run command to run django migrations
migrate: clean
	python manage.py migrate

# Run command to start postgres container
psql_start: clean
	docker-compose -f .docker/docker-compose.yml up -d postgres_local

# Run command to stop postgres container
psql_stop: clean
	docker-compose -f .docker/docker-compose.yml stop postgres_local

# Run command to destroy all docker images
destroy_images: clean
	docker rmi -f $(docker images -a -q)

# Run command to destroy all containers
destroy_containers: clean
	docker rm -vf $(docker ps -a -q)

# Run command to clean trash files
clean:
	find . -name "*.pyc" -delete
	find . -name "*.pyo" -delete
	rm -f pylint.out
