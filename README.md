# docker-for-php

A stack for run PHP7 with docker

## Features
- [x] Using PHP 7.0.x , NGINX 1.10.x (stable) and MySQL 5.7.x (stable)
- [x] You can manage all logs in a directory (`storage/logs`)
- [x] You can specify NGINX amd PHP FPM config
- [x] All database file of MySQL are saved and restored in `storage/database`
- [x] Forward agent to php7 container, that allow `git clone source` and `ssh` to your server easily

## Requirement
- docker-compose 1.11+

## Installation & Usage

```bash
$ git clone git@github.com:rikkeisoft/docker-for-php.git deploy
$ docker-compose up -d
```

If you have problem with file permission, please ensure you were setting correct HTTPDUSER in `php-fpm.conf` file and run
> My case, HTTPDUSER is www-data

```bash
$ extract $HTTPDUSER=www-data
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
