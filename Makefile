# Run command to start postgres container
psql_start: clean
	docker-compose -f .docker/docker-compose.yml up -d postgres_local

# Run command to stop postgres container
psql_stop: clean
	docker-compose -f .docker/docker-compose.yml stop postgres_local

# Run command to clean trash files
clean:
	find . -name "*.pyc" -delete
	find . -name "*.pyo" -delete
	rm -f pylint.out
