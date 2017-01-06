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

In these commands, we just created one network (lb_web) to isolate HAProxy with the web servers, and then, we started the containers of HAProxy and companions.

```
docker run --network=lb_web -e VIRTUAL_HOST=example.org nginx
```

Here, we just started the most simple web server, and added to the lb_web network.
The only thing that HAProxy needs to see and connect to this container are the following:
 - expose a port 80
 - have a VIRTUAL_HOST variable setup with the domain name
 - be in the lb_web network
 
And finally for HAProxy to be able to provision the Let's encrypt certificate, you need to configure your DNS for example.org to point to the IP of HAProxy.


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
