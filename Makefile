devup:
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.yml up 

devup-build:
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.yml up --build

exec:
	docker exec -it ${t} bash