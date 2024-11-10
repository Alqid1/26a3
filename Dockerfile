FROM golang:latest AS compiling_stage
RUN mkdir -p /go/src/26a3
WORKDIR /go/src/26a3
ADD main.go .
ADD go.mod .
RUN go install .
 
FROM alpine:latest
LABEL version="1.0.0"
LABEL maintainer="tuapkhind2@mail.ru"
WORKDIR /root/
COPY --from=compiling_stage /go/bin/26a3 .
ENTRYPOINT ./26a3