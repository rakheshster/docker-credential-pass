# docker-credential-pass
![Build & Push to DockerHub](https://github.com/rakheshster/docker-credential-pass/workflows/Docker%20Build%20&%20Push/badge.svg)
## What is this?
This is a Docker image containing `docker-credential-pass` from [docker/docker-credential-helpers/](https://github.com/docker/docker-credential-helpers/).

## Bash function example
```bash
function docker-credential-pass { 
        docker run -it --rm \
          --name docker-credential-pass \
          -v $HOME/.password-store:/root/.password-store \
          rakheshster/docker-credential-pass:latest $@ ;
}
```

This pulls the image from DockerHub, calls it "docker-credential-pass" (the name doesn't matter), mounts the ".password-store" directory in your home folder into the container (so your `pass` database can be accessed), and runs the container with the arguments to the function passed to it. Simple!

## DockerHub

You can find it on DockerHub [here](https://hub.docker.com/repository/docker/rakheshster/docker-credential-pass). 