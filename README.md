# docker-cmdbuild
A fully functional CMDBuild docker image with docker-compose for integrating with Postgres, BIMServer and GeoServer

## Run using Docker Compose

Download [docker-compose.yml](https://github.com/rsilva4/docker-cmdbuild/blob/master/docker-compose.yml) file and run

`docker-compose up --file /path/to/docker-compose.yml`

After that a BIMServer will be available at [http://localhost:8890/bimserver/](http://localhost:8890/bimserver/), a GeoServer will be available at [http://localhost:8889/geoserver/](http://localhost:8889/geoserver/) and CMDBuild will be available at [http://localhost:8888/cmdbuild/](http://localhost:8888/cmdbuild/).

DMS still to be done.

## Configuration

Check [Dockerfile](https://github.com/rsilva4/docker-cmdbuild/blob/master/Dockerfile) for available environment variables, they are pretty much self descriptive.

## Notes

* BIMServer version currently necessary is 1.2 (old),so I created my own at [Docker Hub rsilva4/bimserver](https://hub.docker.com/r/rsilva4/bimserver/)
* Geoserver 2.6.1 from [Docker Hub kartoza/geoserver](https://hub.docker.com/r/kartoza/geoserver/)
* Postgres 9.4 with Postgis 2.1.7 from [Docker Hub kpettijohn/postgis](https://hub.docker.com/r/kpettijohn/postgis/)

## Development notes

If you wish to contribute be sure to run the `test.bats` after your changes and ensuring that every test passes. Add more tests if necessary. Tests built using [BATS](https://github.com/sstephenson/bats) (Bash Automated Testing System).
