# Docker Composer

[![Docker Pulls](https://img.shields.io/docker/pulls/willhallonline/composer.svg)][hub] [![MicroBadger Layers](https://img.shields.io/microbadger/layers/willhallonline/composer/alpine.svg)][microbadger] [![Docker Automated build](https://img.shields.io/docker/automated/willhallonline/composer.svg)][hub] [![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)][hub]

## Supported tags and respective ```Dockerfile``` links
* ```php-7.2```, ```7.2```, ```alpine```, ```latest``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php72/alpine/Dockerfile)
* ```php-7.3``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php73/alpine/Dockerfile)
* ```php-5.6``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php56/alpine/Dockerfile)
* ```php-7.2-stretch```, ```stretch```, ```debian``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php72/stretch/Dockerfile)
* ```php-7.3-stretch``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php73/stretch/Dockerfile)
* ```php-5.6-stretch``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php56/stretch/Dockerfile)
* ```php-7.2-apache```, ```apache``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php72/apache/Dockerfile)
* ```php-7.3-apache``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php73/apache/Dockerfile)
* ```php-5.6-apache``` [Dockerfile](https://github.com/willhallonline/docker-composer/blob/master/php72/apache/Dockerfile)

## What is Composer?

[Composer](https://getcomposer.org) is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

**This is a Dockerised Solution for running Composer**.

## Docker Commands

### Pull

```
$  docker pull willhallonline/composer
$  docker pull willhallonline/composer:stretch
$  docker pull willhallonline/composer:apache
```

### Run

#### Composer Running

```
$  docker run -it --rm -v $(pwd):/app willhallonline/composer --version
Composer version 1.7.2 2018-08-16 16:57:12
```

#### Composer Require Package

```
$  docker run --rm -it -v $(pwd):/app willhallonline/composer:alpine composer require guzzlehttp/guzzle
Using version ^6.3 for guzzlehttp/guzzle
./composer.json has been created
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 4 installs, 0 updates, 0 removals
  - Installing guzzlehttp/promises (v1.3.1): Downloading (100%)         
  - Installing psr/http-message (1.0.1): Downloading (100%)         
  - Installing guzzlehttp/psr7 (1.4.2): Downloading (100%)         
  - Installing guzzlehttp/guzzle (6.3.3): Downloading (100%)         
guzzlehttp/guzzle suggests installing psr/log (Required for using the Log middleware)
Writing lock file
Generating autoload files
```

**Will create**:

```
composer.json
composer.lock
vendor/  # vendor packages installed here
```

#### Composer Install

Providing you already have ```composer.json``` (and maybe ```composer.lock```)

```
docker run --rm -it -v $(pwd):/app willhallonline/composer:alpine composer install
Loading composer repositories with package information
Installing dependencies (including require-dev) from lock file
Package operations: 4 installs, 0 updates, 0 removals
  - Installing psr/http-message (1.0.1): Downloading (100%)         
  - Installing guzzlehttp/psr7 (1.4.2): Downloading (100%)         
  - Installing guzzlehttp/promises (v1.3.1): Downloading (100%)         
  - Installing guzzlehttp/guzzle (6.3.3): Downloading (100%)         
guzzlehttp/guzzle suggests installing psr/log (Required for using the Log middleware)
Generating autoload files
```

**Note that this will install files as ```root``` user. You can potentially add the ```-u 1000:1000``` options to the command, however, this may introduce other challenges.** 

## Maintainer

* Will Hall, contact me on [https://www.willhallonline.co.uk](https://www.willhallonline.co.uk).

[hub]: https://hub.docker.com/r/willhallonline/composer
[microbadger]: https://microbadger.com/images/willhallonline/composer
