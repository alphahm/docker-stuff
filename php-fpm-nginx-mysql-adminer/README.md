# PHP docker setup

This is a docker template to get up to speed with most PHP applications.

## Contents

* php:8.1.9 with xdebug
* nginx:1.23.1 (port 8000)
* mysql:8.0.30 (port 3306)
* adminer (port 8080)

## Usage

* Start

```
docker-compose up
```

To rebuild:

```
docker-compose up --build
```

* Stop

```
docker-compose stop
```

* Destroy

```
docker-compose down
```

## Debugging in VSCode

Install [php-debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug) extension.