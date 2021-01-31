# docker-sops
![Build & Push to DockerHub](https://github.com/rakheshster/docker-credential-pass/workflows/Docker%20Build%20&%20Push/badge.svg)
## What is this?
I wanted to try out [SOPS](https://github.com/mozilla/sops) on my Raspberry Pi and there was no ARM version available. Thought I'd Dockerize it. I have a bash function in my `.bash_profile` to then run the container. 

## Bash function example
```bash
function docker-credential-pass { 
        docker run -it --rm \
          --name docker-credential-pass \
          -v $HOME/.password-store:/root/.password-store \
          rakheshster/docker-credential-helper:latest $@ ;
}
```

This pulls the image from DockerHub, calls it "docker-credential-pass" (the name doesn't matter), mounts the ".password-store" directory in your home folder into the container (so your `pass` database can be accessed), and runs the container with the arguments to the function passed to it. Simple!

## DockerHub

You can find it on DockerHub [here](https://hub.docker.com/repository/docker/rakheshster/docker-credential-pass). 