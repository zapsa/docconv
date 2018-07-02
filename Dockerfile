FROM golang:latest

MAINTAINER Julien Ganichot

RUN apt-get update && apt-get install -y \
 zip \
 poppler-utils \
 wv \
 unrtf \
 tidy \
 lynx \
 tesseract-ocr \
 libtesseract-dev \
 libleptonica-dev

ADD . /go/src/github.com/zapsa/docconv

WORKDIR /go/src/github.com/zapsa/docconv

RUN go get . && go get github.com/otiai10/gosseract

WORKDIR /go/src/github.com/zapsa/docconv/docd

RUN go get .
RUN go build -o /docd -tags ocr

EXPOSE 8888

CMD ["/docd"]
