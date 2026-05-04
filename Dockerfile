FROM ubuntu:22.04

RUN apt update && apt install -y curl kubectl

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
