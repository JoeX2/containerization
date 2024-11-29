FROM ubuntu:24.04 AS builder

RUN mkdir /srv/containerization

COPY Containerization.odp /srv/containerization/
COPY hello/go.mod /srv/containerization/hello/
COPY hello/Dockerfile /srv/containerization/hello/
COPY hello/hello.go /srv/containerization/hello/
COPY hello/go.sum /srv/containerization/hello/
COPY Dockerfile /srv/containerization/
COPY eclipse/Dockerfile /srv/containerization/eclipse/
COPY README.md /srv/containerization/

WORKDIR /srv/

RUN tar -cv \
      containerization/Containerization.odp \
      containerization/hello/go.mod \
      containerization/hello/Dockerfile \
      containerization/hello/hello.go \
      containerization/hello/go.sum \
      containerization/Dockerfile \
      containerization/eclipse \
      containerization/eclipse/Dockerfile \
      containerization/README.md \
      > /srv/containerization.tar

FROM alpine

COPY --from=builder /srv/containerization.tar /containerization.tar

CMD ["cat", "/containerization.tar"]
