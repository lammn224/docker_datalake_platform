# Trino on Docker Compose

## Description

Trino is a distributed SQL query engine designed to query large data sets distributed over one or more heterogeneous
data sources.

## 1. Prerequisites

* Familiarity with [Docker Compose](https://docs.docker.com/compose/overview/).
* Docker installed on your machine. Download the relevant installer
  from [here](https://www.docker.com/community-edition#/download).

## 2. Run Trino on Docker Compose

Please make relevant changes to `hive.s3.aws-access`, `hive.s3.aws-secret`, `hive.s3.endpoint` to point to your local
**MinIO** and `hive.metastore.uri` to point to your local **Hive Metastore**, file to be modified
is `./etc/catalog/minio.properties`

```
hive.metastore.uri=thrift://hive-metastore:9083

hive.s3.endpoint=http://nginx:9000
hive.s3.aws-access-key=minio
hive.s3.aws-secret-key=minio123
```

Run below command

```bash
docker-compose up -d
```

Next let's query the data from Trino. Run `docker exec -it <trino_container_id> /bin/bash` or using DBeaver to connect
to Trino

```
$ trino --server localhost:8080 --catalog hive --schema default
trino> use minio.default;
trino:default> show tables;
     Table
---------------
 customer_text
(2 rows)

presto:default> select * from customer_text;
 id | fname | lname
----+-------+-------
 5  | Bob   | Jones
 6  | Phil  | Brune
(2 rows)
```

[1]: http://www.github.com/lammn224

[2]: https://www.linkedin.com/in/lammn

--- 

**Connect with me**

[<img alt="github" height="50" src="https://cloud.githubusercontent.com/assets/17016297/18839843/0e06a67a-83d2-11e6-993a-b35a182500e0.png" width="50"/>][1]
[<img alt="linkedin" height="50" src="https://cloud.githubusercontent.com/assets/17016297/18839848/0fc7e74e-83d2-11e6-8c6a-277fc9d6e067.png" width="50"/>][2]

---