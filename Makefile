.ONESHELL:

up:
	cd docker
	docker-compose up -d
	cd ..
	docker cp ./my.cnf librebooking-db:/root/.my.cnf
	docker cp run-backup librebooking-db:/usr/local/bin/

down:
	cd docker
	docker-compose down

shell:
	docker exec -it librebooking-db bash


