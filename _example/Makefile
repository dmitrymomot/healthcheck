.PHONY: build docker run

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix nocgo -o ./app ./

docker:
	docker build -f ./Dockerfile -t myapp:latest .

run:
	HEALTHCHECK_URL=localhost:8080/health docker run -d -p 8181:8080 myapp:latest