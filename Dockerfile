FROM alpine:3.19

RUN apk add --no-cache bash curl kubectl tar gzip

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
