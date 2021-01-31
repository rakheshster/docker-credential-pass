# == start with this image ==
FROM golang:1.15-alpine AS gobase

ENV DCH_VERSION 0.6.3

# I need make to compile stuff later on
RUN apk add --update --no-cache make

# Download the release; untar it; make it
ADD https://github.com/docker/docker-credential-helpers/archive/v${DCH_VERSION}.zip /go/src/github.com/docker/
WORKDIR /go/src/github.com/docker/
RUN unzip v${DCH_VERSION}.zip
RUN mv docker-credential-helpers-${DCH_VERSION} docker-credential-helpers
WORKDIR /go/src/github.com/docker/docker-credential-helpers
RUN make pass

# == new base for the final image ==
FROM golang:1.15-alpine AS gofinal

LABEL maintainer="Rakhesh Sasidharan"
LABEL org.opencontainers.image.source=https://github.com/rakheshster/docker-credential-pass

# Copy the binary we created above
COPY --from=gobase /go/src/github.com/docker/docker-credential-helpers/bin/docker-credential-pass /bin/docker-credential-pass

# Set a working directory (we can mount the user's $(pwd) here later on)
WORKDIR /home

# Set this as the entry point for the image
ENTRYPOINT ["/bin/docker-credential-pass"]