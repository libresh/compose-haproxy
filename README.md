# HAProxy
HAProxy for IndieHosters

## What is it?

This repository contains one of the most advanced and libre HAproxy for docker setup that we are aware of.
It ships with:
 - container discovery though docker API (like [smartstack](http://nerds.airbnb.com/smartstack-service-discovery-cloud/)) based on Env var `VIRTUAL_HOST` (Based on [docker-gen](https://github.com/jwilder/docker-gen))
 - [ocsp](https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol)
 - [letsencrypt](https://letsencrypt.org/)

Each time you add a container with the environment variable `VIRTUAL_HOST` it will:
 - generate a valid certificate (if the dns is pointing correctly)
 - serves the OCSP response
 - serves your web container with https

## Prerequistes

 - docker
 - docker-compose

## Get started

```
docker network create lb_web
git clone https://github.com/indiehosters/haproxy.git
cd haproxy
docker-compose up -d
```

And profit!

```
docker run -e VIRTUAL_HOST=example.org nginx
```

## Contributing

If you have any issue (something not working, missing doc), please do report an issue here! Thanks

This system is used in production at [IndieHosters](https://indiehosters.net/) so it is maintained. If you use it, please tell us, and we'll be really happy to update this README!

You can help us by:
 - starring this project
 - sending us a thanks email
 - reporting bugs
 - writing documentation/blog on how you got up and running in 5mins
 - writing more documentation
 - sending us cake :) We loove cake!

## TODO

 - renewal :)
 - docker-swarm compatibility
