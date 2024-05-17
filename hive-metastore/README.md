# Hive Metastore on Docker Compose

## Description

Hive selects **corresponding database servers** to store the schema or metadata of tables, databases, columns in a
table,
their data types, and HDFS mappings.

Corresponding database server is used in this repo is `Postgres`

## 1. Prerequisites

* Familiarity with [Docker Compose](https://docs.docker.com/compose/overview/).
* Docker installed on your machine. Download the relevant installer
  from [here](https://www.docker.com/community-edition#/download).

## 2. Run Hive Metastore on Docker Compose

Create `jars` folder and download these jar files:

```
- hadoop-aws-3.3.4.jar
- hadoop-client-api-3.3.4.jar
- hadoop-client-runtime-3.3.4.jar
- aws-java-sdk-bundle-1.12.262.jar
- postgresql-42.7.2.jar
```

Please make relevant changes to `fs.s3a.access.key`, `fs.s3a.secret.key`, `fs.s3a.endpoint` to point to your local MinIO
setup, file to be modified
is `hive-site.xml`

```
<property>
    <name>fs.s3a.access.key</name>
    <value>minio</value>
</property>

<property>
    <name>fs.s3a.secret.key</name>
    <value>minio123</value>
</property>
    
<property>
    <name>fs.s3a.endpoint</name>
    <value>http://nginx:9000</value>
</property>
```

Make changes for your Postgres database user (if needed) in `docker-compose.yaml`

```
  environment:
    POSTGRES_USER: postgres
    POSTGRES_PASSWORD: postgres
    POSTGRES_DB: dev
```

Also check `./init-scripts/init.sql` to change database name to store metadata (if needed) corresponding with
environment variable `SERVICE_OPTS` in `docker-compose.yaml`

```
  SERVICE_OPTS: "-Djavax.jdo.option.ConnectionDriverName=org.postgresql.Driver -Djavax.jdo.option.ConnectionURL=jdbc:postgresql://hive-postgres:5432/metastore_db -Djavax.jdo.option.ConnectionUserName=hive -Djavax.jdo.option.ConnectionPassword=datalake"
```

Run below command

```bash
docker-compose up -d
```