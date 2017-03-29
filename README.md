# docker-for-php

[![Build Status](https://travis-ci.org/rikkeisoft/docker-for-php.svg?branch=master)](https://travis-ci.org/rikkeisoft/docker-for-php)

A stack for running PHP7 application inside Docker containers.

## Features
- [x] Using PHP-FPM 7.0.x, Nginx 1.10.x (stable) and MySQL 5.7.x (stable).
- [x] You can manage all logs in a directory (`data/logs`).
- [x] You can specify your own Nginx and PHP-FPM config.
- [x] All MySQL database files are saved in `data/database`.
- [x] Enable SSH Agent Forwarding from your host machine to `php7` container. It allows you to use your local SSH keys instead of leaving keys sitting on your server.

## Requirement
- Docker Engine 1.13.0+
- Docker Compose 1.11.0+

## Installation

```bash
$ git clone git@github.com:rikkeisoft/docker-for-php.git deploy
$ docker-compose up -d
```

If you have problem with file permission, please ensure you set correct the owner, which PHP-FPM is running under, in `php-fpm.conf`. Then execute:

```bash
$ docker exec -it dockerforphp_php7_1 /usr/local/bin/app/fix_permission.sh -u <your_php_fpm_user> <your_path>
```

> **Notice**:
> - By default, `php7` is running under `www-data` user. So you don't need to use `-u` flag if you didn't change the default owner of PHP-FPM.

## Usage

```bash
$ docker exec -it source_php7_1 /bin/bash
root@159466f09128:/app#
```

## Contributing
All code contributions must go through a pull request and approved by
a core developer before being merged. This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](issues).

## License
This project is released under the MIT License.   
Copyright © 2017 Rikkeisoft Co. Ltd.,   
Please see [LICENSE](LICENSE.md) for more information.
