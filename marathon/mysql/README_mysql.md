
### YCSB on Mesos - MYSQL 

#### Start MySQL :

	curl -i -H 'Content-Type: application/json' -d@mysql.json $marathonIp:8080/v2/apps

#### Create Database and Table 

	docker run -it --rm mysql mysql -h YOUR_MYSQL_HOST_IP -u root -p
	
	mysql> create database ycsb;
	mysql> use ycsb;
	mysql> CREATE TABLE usertable (
           YCSB_KEY VARCHAR(255) PRIMARY KEY,
           FIELD0 TEXT, FIELD1 TEXT,
           FIELD2 TEXT, FIELD3 TEXT,
           FIELD4 TEXT, FIELD5 TEXT,
           FIELD6 TEXT, FIELD7 TEXT,
           FIELD8 TEXT, FIELD9 TEXT
       );
	mysql> show tables;

#### Run workload

	// TO Load
	curl -i -H 'Content-Type: application/json' -d@ycsb-mysql-load.json $marathonIp:8080/v2/apps
		
	// TO Run
	curl -i -H 'Content-Type: application/json' -d@ycsb-mysql-run.json $marathonIp:8080/v2/apps
	