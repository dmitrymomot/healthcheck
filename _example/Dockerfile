FROM saaskit/alpine:healthcheck
ENV APP_PORT=8080
WORKDIR /
COPY ./app /
EXPOSE $APP_PORT
CMD ["/app"]