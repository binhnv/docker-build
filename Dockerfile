FROM binhnv/openjdk
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

ENV GRADLE_VERSION="3.4" \
    MAVEN_VERSION="3.3.9" \
    GRADLE_HOME="${MY_APP_DIR}/gradle" \
    MAVEN_HOME="${MY_APP_DIR}/maven"
ENV PATH=${PATH}:${GRADLE_HOME}/bin:${MAVEN_HOME}/bin

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
    && curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}*.zip -d ${MY_APP_DIR} \
    && ln -s ${MY_APP_DIR}/gradle-${GRADLE_VERSION} ${GRADLE_HOME} && rm gradle-*.zip \
    && curl -sL http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -xz -C ${MY_APP_DIR} \
    && ln -s ${MY_APP_DIR}/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
