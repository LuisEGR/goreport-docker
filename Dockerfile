FROM golang:1.14.9-stretch
RUN apt-get update && apt-get install -y graphviz
RUN go get -u github.com/360EntSecGroup-Skylar/goreporter
WORKDIR /go/src/github.com/360EntSecGroup-Skylar/goreporter
RUN ["go", "build", "main.go"]
RUN mv main /go/report
ENV path ""
ENV except ""
VOLUME ["/go/src"]
VOLUME ["/go/output"]
WORKDIR /go/src
ENTRYPOINT ../report -p $path -e $except -r /go/output -f html