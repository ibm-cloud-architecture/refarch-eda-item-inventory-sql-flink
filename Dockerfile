##############################################################################
# Versions and constants
##############################################################################
ARG FLINK_VERSION=1.14.0
ARG SCALA_VERSION=2.12
ARG FLINK_IMAGE=flink:${FLINK_VERSION}-scala_${SCALA_VERSION}-java11
ARG MAVEN_IMAGE=maven:3.8-jdk-11

##############################################################################
# Build job jar
##############################################################################
FROM ${MAVEN_IMAGE} AS build
WORKDIR /usr/app

# download dependencies in separate stage for caching (enables quicker image builds when just changing /src)
COPY pom.xml .
RUN mvn install

# build jar
COPY src src/
RUN mvn package

##############################################################################
# Final image
##############################################################################
FROM ${FLINK_IMAGE}
WORKDIR ${FLINK_HOME}

# update os
RUN apt-get update && apt-get upgrade -y && apt-get clean

# add job jar and dependency jars
COPY --from=build /usr/app/target/item-aggregator-1.0.0-SNAPSHOT.jar ${FLINK_HOME}/lib/job.jar
COPY --from=build /usr/app/target/lib/* ${FLINK_HOME}/lib/