FROM tomcat:8-jre8

RUN	apt-get update && \
	apt-get install -y postgresql-client netcat unzip gettext-base fontconfig

WORKDIR /tmp
ENV CMDBUILD_ZIP_URL=http://downloads.sourceforge.net/project/cmdbuild/2.4.0/cmdbuild-2.4.0.zip \
	SHARK_ZIP_URL=http://downloads.sourceforge.net/project/cmdbuild/2.4.0/shark-cmdbuild-2.4.0.zip \
	PGSQL_JDBC_DRIVER_URL=https://jdbc.postgresql.org/download/postgresql-9.4.1208.jar

RUN set -x \
	&& curl -fSL "$CMDBUILD_ZIP_URL" -o cmdbuild.zip \	
	&& unzip cmdbuild.zip  \
	&& rm cmdbuild.zip \
	&& mv cmdbuild* cmdbuild
RUN set -x \
	&& curl -fSL "$SHARK_ZIP_URL" -o shark.zip \	
	&& unzip shark.zip  \
	&& rm shark.zip \
	&& mv shark* shark
COPY configuration /tmp/cmdbuild/configuration
RUN set -x \
	&& curl -fSL "$PGSQL_JDBC_DRIVER_URL" -O \
	&& mv postgresql* $CATALINA_HOME/lib/
COPY docker-entrypoint.sh /
WORKDIR $CATALINA_HOME

## CMDBUILD CONFIGURATION {

ENV CMDBUILD_DEFAULT_LANG=pt_PT

ENV DB_USER=postgres \
	DB_PASS=test \	
	DB_HOST=postgres \
	DB_PORT=5432 \
	DB_NAME=cmdbuild

ENV BIM_ACTIVE=false \
	BIM_URL=http://bimserver:8080/bimserver \
	BIM_USER=admin@example.org \
	BIM_PASSWORD=bimserver

ENV GIS_ENABLED=false \
	GEOSERVER_ON_OFF=off \
	GEOSERVER_URL=http://geoserver:8080/geoserver \
	GEOSERVER_USER=admin \
	GEOSERVER_PASSWORD=geoserver \
	GEOSERVER_WORKSPACE=cmdbuild

## }

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["cmdbuild"]