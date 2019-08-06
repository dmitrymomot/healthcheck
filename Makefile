.PHONY: help build docker push

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build health check utility
	@rm -vf healthchecker
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix nocgo -o healthchecker ./cmd/main.go

docker: ## Build docker image
	@docker rmi -f dmitrymomot/healthcheck:alpine
	@docker system prune -f
	@docker build --rm -t dmitrymomot/healthcheck:alpine .
	@rm -vf healthchecker

push: ## Push image to docker hub
	@docker tag dmitrymomot/healthcheck:alpine dmitrymomot/healthcheck:latest
	@docker push dmitrymomot/healthcheck
	@docker system prune -f

%:
	@: