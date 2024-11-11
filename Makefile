.ONESHELL:

up:
	cd docker
	cp ../docker-compose.yml .
	docker-compose up -d
	cd ..
	docker cp ./my.cnf librebooking-db:/root/.my.cnf
	docker cp run-backup librebooking-db:/usr/local/bin/
	docker cp list-databases librebooking-db:/usr/local/bin/
	docker cp list-tables librebooking-db:/usr/local/bin/
	docker cp describe-table librebooking-db:/usr/local/bin/
	docker cp show-table-data librebooking-db:/usr/local/bin/

down:
	cd docker
	docker-compose down

shell:
	docker exec -it librebooking-db bash

status:
	docker ps -f "name=libre*"

list-db:
	docker exec -it librebooking-db list-databases

list-tb:
	docker exec -it librebooking-db list-tables



