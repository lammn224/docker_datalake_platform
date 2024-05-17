# Distributed MinIO on Docker Compose

## Description

MinIO is a High Performance Object Storage released under GNU Affero General Public License v3.0. It is API compatible
with Amazon S3 cloud storage service. Use MinIO to build high performance infrastructure for machine learning, analytics
and application data workloads.

## 1. Prerequisites

* Familiarity with [Docker Compose](https://docs.docker.com/compose/overview/).
* Docker installed on your machine. Download the relevant installer
  from [here](https://www.docker.com/community-edition#/download).

## 2. Run Distributed MinIO on Docker Compose

Run below command

```bash
docker-compose up -d
```

Distributed instances are now accessible on the host using the Minio CLI on port 9000
and the Minio Web Console on port 9001. Proceed to access the Web browser at <http://127.0.0.1:9001/>. Here 4 MinIO
server instances are reverse proxied
through Nginx load balancing.

### Notes

* By default, the Docker Compose file uses the Docker image for latest MinIO server release. You can change the image
  tag to pull a specific [MinIO Docker image](https://hub.docker.com/r/minio/minio/).

* There are 4 minio distributed instances created by default. You can add more MinIO services (up to total 16) to your
  MinIO Compose deployment. To add a service
    * Replicate a service definition and change the name of the new service appropriately.
    * Update the command section in each service.
    * Add a new MinIO server instance to the upstream directive in the Nginx configuration file.

  Read more about distributed
  MinIO [here](https://min.io/docs/minio/container/operations/install-deploy-manage/deploy-minio-single-node-multi-drive.html)
  .

[1]: http://www.github.com/lammn224

[2]: https://www.linkedin.com/in/lammn

--- 

**Connect with me**

[<img alt="github" height="50" src="https://cloud.githubusercontent.com/assets/17016297/18839843/0e06a67a-83d2-11e6-993a-b35a182500e0.png" width="50"/>][1]
[<img alt="linkedin" height="50" src="https://cloud.githubusercontent.com/assets/17016297/18839848/0fc7e74e-83d2-11e6-8c6a-277fc9d6e067.png" width="50"/>][2]

---