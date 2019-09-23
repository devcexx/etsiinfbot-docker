# ETSIInfBot Dockerfile & Docker compose files

This repository contains the Dockerfile for building the image that allows you to run the ETSIInfBot ([https://github.com/batmafia/etsiinfbot](https://github.com/batmafia/etsiinfbot)) inside a Docker container. It is also provided a Docker composer file to automatically deploy an environment with both a bot and a MySQL Docker container.

## Legal notice

This repository uses a copy of `wait-for-it.sh` file originally published [here](https://github.com/vishnubob/wait-for-it/blob/54d1f0bfeb6557adf8a3204455389d0901652242/wait-for-it.sh). To read the full license of this file, please go to this [link](https://github.com/vishnubob/wait-for-it/blob/54d1f0bfeb6557adf8a3204455389d0901652242/LICENSE).

## Configuration

To set the Telegram Bot token, create a `bot.env` file on the root of the repository and set there the `BOT_TOKEN` environment variable as follows:
```
BOT_TOKEN=YOUR_TELEGRAM_TOKEN_HERE
```

If everything works fine, you should be able to launch the environment just by typing the command `docker-compose up`

If you encounter any problems while building the ETSIInfbot, regarding to PHP Composer not being able to download all the required files from Github, create an Github API Token and build the image setting the environment variable `GITHUB_API_TOKEN`:

```
$ GITHUB_API_TOKEN=YOUR_TOKEN docker-compose build etsiinfbot
```

You might also change the MySQL parameters on the `docker-compose.yml` file before building the image, to change the default database settings.

