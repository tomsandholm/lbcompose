DB = "librebooking"

# allow multiline target to keep all commands in one shell
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

# shutdown everything
down:
	cd docker
	docker-compose down

# open a docker shell to the database instance
dbshell:
	docker exec -it librebooking-db bash

# open a docker shell to the php instance
phpshell:
	docker exec -it librebooking bash

# get docker status of our libre processes
status:
	docker ps -f "name=libre*"

# list the databases on the database instance
list-db:
	docker exec -it librebooking-db list-databases

# list the tables on the database instance
list-tb:
	docker exec -it librebooking-db list-tables $(DB)

# list the table data on the database instance
show-tb:
	docker exec -it librebooking-db show-table-data $(DB) $(table)


