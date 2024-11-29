FROM docker.io/library/golang AS builder

COPY hello.go /src/
COPY go.mod /src/
COPY go.sum /src/

WORKDIR /src/

# CGO_ENABLED is necessary to run on a system with different libc compared to the one in the docker container
ENV CGO_ENABLED=0
RUN go build

FROM scratch

COPY --from=builder /src/hello /hello

ENTRYPOINT ["/hello"]
