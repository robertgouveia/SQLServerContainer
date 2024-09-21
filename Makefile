run_sql:
	@echo "Building SQL Server"
	docker build --platform linux/amd64 -t my-sql-server .
	docker run -e 'SA_PASSWORD=YourPassword123!' -p 1433:1433 --name sql1 -d my-sql-server

stop_sql:
	@echo "Stopping SQL Server"
	docker stop sql1

remove_sql:
	@echo "Removing SQL Server"
	docker rm sql1
