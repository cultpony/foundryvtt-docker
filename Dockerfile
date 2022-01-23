FROM ubuntu:21.04

RUN apt-get update && apt-get install -y unzip curl libssl-dev sudo && curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get update && apt-get install -y nodejs && useradd -ms /bin/bash foundryvtt
RUN mkdir /app && mkdir /data && chown foundryvtt:foundryvtt /app /data
USER foundryvtt
WORKDIR /app
EXPOSE 30000
VOLUME /data
VOLUME /app
CMD node resources/app/main.js --dataPath=/data
