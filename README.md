# oslo.labs

Openstack Oslo labs

Aim to help you to debug Openstack Oslo libraries, by setting up
automatically a complete environment ready for hacking and debug.

Labs provide some preconfigured scenario to help you to test and debug
libraries.

## Install

```sh
$ git clone git@github.com:4383/oslo.labs.git
$ cd oslo.labs
```
## Usage

Choose the lab you want to use:

```sh
$ ./list.sh
oslo.cache labs:
-  memcache_pool_backend
```

Start your lab:

```sh
$ ./run.sh oslo.cache/memcache_pool_backend
```

Enter in your lab:
```sh
$ docker exec -it oslo-lab /bin/zsh
lab $ python lab/app.py
lab $ ls ~/debug # here are all the libs you may want to modify for your tests
```

Stop your lab:
```sh
./stop oslo.cache/memcache_pool_backend
```

## Labs

## Overview

A lab is an environment automatically setup with many services.
Oslo libraries aim to to give an abstraction between services and users.
A services could be a memcached server or rabbitmq server by example, and
oslo's users are commonly openstack services like nova, neutron, etc...

A lab provide some scripts to give you an abstraction and emulate openstack
services.

All the libs that you want to debug, example dogpile.cache, oslo.cache,
pymemcache are all stored as git repositories in `~/debug`. All these git
repositories have openstack gerrit remote and github remote (origin).

Your payload are stored in `lab/` and you can configure your caching by
editing `lab/app.conf`.
