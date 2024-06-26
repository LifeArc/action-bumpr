FROM alpine:3.14

ENV BUMP_VERSION=v1.1.0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache add git git-lfs jq grep curl
RUN wget -O - -q https://raw.githubusercontent.com/haya14busa/bump/master/install.sh| sh -s -- -b /usr/local/bin/ ${BUMP_VERSION}

COPY entrypoint.sh /entrypoint.sh

# set the runtime user to a non-root user and the same user as used by the github runners for actions runs.
# In some runners, default user `runner` has UID 1000 not 10001
# USER 1001

ENTRYPOINT ["/entrypoint.sh"]
