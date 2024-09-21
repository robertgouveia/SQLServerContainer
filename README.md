
# Simple SQL Dummy Server
Easy spin up server with one command.

```bash
make run_sql
```

Your credentails are below:
```bash
USERNAME=sa
PASSWORD=YourPassword123!
```

Connection string in Golang
```bash
sqlserver://sa:YourPassword123!@localhost:1433?database=master&encrypt=false&trustServerCertificate=true
```

Dummy Seed SQL File you can run
```SQL

CREATE DATABASE test;
GO

USE test;
GO

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    age INT
);
GO

-- Insert 1000 employees into the employees table
USE test;
GO

-- Inserting 1000 random employees
INSERT INTO employees (id, first_name, last_name, age)
VALUES (1, 'John', 'Doe', 25),
       (2, 'Jane', 'Smith', 34),
       (3, 'Michael', 'Johnson', 28),
       (4, 'Emily', 'Davis', 22),
       (5, 'Chris', 'Brown', 40),
       (6, 'Sarah', 'Wilson', 31),
       (7, 'David', 'Moore', 45),
       (8, 'Ashley', 'Taylor', 29),
       (9, 'Matthew', 'Anderson', 37),
       (10, 'Jessica', 'Thomas', 27),
       -- (Keep repeating similar inserts up to 1000 employees)
       (1000, 'Peter', 'Roberts', 50);
GO
```

