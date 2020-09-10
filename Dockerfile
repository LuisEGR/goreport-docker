FROM golang:1.15-buster
RUN apt-get update && apt-get install -y graphviz
RUN go get -u github.com/360EntSecGroup-Skylar/goreporter
WORKDIR /go/src/github.com/360EntSecGroup-Skylar/goreporter
RUN ["go", "build", "main.go"]
RUN mv main /bin/goreport
# VOLUME ["/go/src"]
# VOLUME ["/go/output"]
# RUN mkdir /go/src
RUN mkdir -p /go/output
WORKDIR /go/src
# ENTRYPOINT ../report -p $path -e $except -r /go/output -f html
ENTRYPOINT ["/bin/bash", "-c"]