# docker-for-php

A stack for running PHP7 application inside Docker containers.

## Features
- [x] Using PHP-FPM 7.0.x, Nginx 1.10.x (stable) and MySQL 5.7.x (stable).
- [x] You can manage all logs in a directory (`storage/logs`).
- [x] You can specify your own Nginx and PHP-FPM config.
- [x] All MySQL database files are saved in `storage/database`.
- [x] Enable SSH Agent Forwarding from your host machine to `php7` container. It allows you to use your local SSH keys instead of leaving keys sitting on your server.

## Requirement
- Docker Engine 1.13.0+
- Docker Compose 1.11.0+

## Installation & Usage

```bash
$ git clone git@github.com:rikkeisoft/docker-for-php.git deploy
$ docker-compose up -d
```

If you have problem with file permission, please ensure you were setting correct HTTPDUSER in `php-fpm.conf` file and run
> My case, HTTPDUSER is www-data

```bash
$ export HTTPDUSER=www-data
$ sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX storage bootstrap/cache
$ sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX storage bootstrap/cache
```

## Contributing
All code contributions must go through a pull request and approved by
a core developer before being merged. This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](issues).

## License
This project is released under the MIT License.   
Copyright © 2017 Rikkeisoft Co. Ltd.,   
Please see [License File](LICENSE.md) for more information.
