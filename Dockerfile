FROM binhnv/openjdk
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

ENV GRADLE_VERSION=3.0
ENV GRADLE_HOME=${MY_APP_DIR}/gradle
ENV PATH=${PATH}:${GRADLE_HOME}/bin

RUN apt-get update \
    && apt-get install -y --no-install-recommends maven \
    && curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}*.zip -d ${MY_APP_DIR} \
    && ln -s ${MY_APP_DIR}/gradle-${GRADLE_VERSION} ${GRADLE_HOME} && rm gradle-*.zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
