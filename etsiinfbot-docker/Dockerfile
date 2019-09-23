FROM debian:jessie

# This composer.json is the same as is on dcc92699, but with frozen
# dependencies
ARG github_api_token

RUN apt update && apt install -y git php5-cli php5-mysql php5-curl unzip
COPY composer.lock start.sh wait-for-it.sh /

RUN \
  if [ "x$github_api_token" != "x" ]; then \
    mkdir -p /root/.composer/ && echo "{\n\
      \"github-oauth\": {\n\
          \"github.com\": \"$github_api_token\"\n\
	  }\n\
      }\n" > /root/.composer/auth.json; \
  fi

RUN git clone https://github.com/batmafia/ETSIINFbot /sources && \
    cd /sources && \
    git checkout dcc9269924c949c0efe30df0983b6a6b6ecc2aaa && \
    mv /composer.lock . && \
    ./composer.phar self-update && \
    ./composer.phar global require "fxp/composer-asset-plugin:1.4.6" && \
    ./composer.phar install

RUN rm -f /root/.composer/auth.json

EXPOSE 8000
ENTRYPOINT [ "bash", "/start.sh" ]