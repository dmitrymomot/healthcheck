# healthcheck

HTTP health checker for your docker container

## Usage

Docker image
```Dockerfile
FROM saaskit/alpine:healthcheck
ENV APP_PORT=8080
WORKDIR /
COPY ./your-application /
EXPOSE $APP_PORT
CMD ["/your-application"]
```
Build it
```
docker build --rm -t your-app:latest .
```

Run your app
```
HEALTHCHECK_URL=localhost:8080/health \
docker run -d -p 8080:8080 your-app:latest
```

> See `_example` path for more details

---

Licensed under [Apache License 2.0](https://github.com/dmitrymomot/healthcheck/blob/master/LICENSE)