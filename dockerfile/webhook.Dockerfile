FROM golang:alpine as build
RUN apk --update add \
  git \
  && go get github.com/adnanh/webhook

FROM alpine:edge
COPY --from=build /go/bin/webhook /bin/
EXPOSE 9000
ENTRYPOINT ["/bin/webhook", "-verbose", "-hooks", "/opt/webhook/hooks.json", "-urlprefix"]
