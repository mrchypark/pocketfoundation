FROM alpine:3.19.1

RUN apk add ca-certificates fuse3 sqlite

COPY --from=litestream/litestream:0.3.13 /usr/local/bin/litestream /usr/local/bin/litestream
COPY --from=flyio/litefs:0.5.11 /usr/local/bin/litefs /usr/local/bin/litefs
COPY --from=ghcr.io/muchobien/pocketbase:0.21.3 /usr/local/bin/pocketbase /usr/local/bin/pocketbase

COPY ./config/litestream.yaml /etc/litestream.yml
COPY ./config/litefs.yaml /etc/litefs.yml

CMD [ "/usr/local/bin/litefs", "mount", "-config", "/etc/litefs.yml"]