FROM alpine:latest
RUN apk add --update ca-certificates && \
    rm -rf /var/cache/apk/* /tmp/*

WORKDIR /
COPY ./healthchecker /

HEALTHCHECK --start-period=60s --interval=60s --timeout=1s --retries=3 \
    CMD /healthchecker