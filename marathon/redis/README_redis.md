
### YCSB on Mesos - Redis 

#### Start Redis :

	curl -i -H 'Content-Type: application/json' -d@redis.json $marathonIp:8080/v2/apps

#### Run workload

	// TO Load
	curl -i -H 'Content-Type: application/json' -d@ycsb-redis-load.json $marathonIp:8080/v2/apps
		
	// TO Run
	curl -i -H 'Content-Type: application/json' -d@ycsb-redis-run.json $marathonIp:8080/v2/apps
	