FROM alpine:3.10

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache add git jq grep
RUN wget -O - -q https://raw.githubusercontent.com/haya14busa/bump/master/install.sh| sh -s -- -b /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]