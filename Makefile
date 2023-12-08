# Basic Makefile for Docker build and push

# Docker image settings
IMAGE_NAME := artanalyzer
TAG ?= latest
REGISTRY := ericblue

# Build the Docker image
build:
	@docker build -t $(IMAGE_NAME):$(TAG) .

# Push the Docker image
push:
	@docker tag $(IMAGE_NAME):$(TAG) $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	@docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)

# Display usage information
help:
	@echo "Makefile for building and pushing Docker images"
	@echo ""
	@echo "Usage:"
	@echo "  make build [TAG=tag] - Build Docker image with optional tag (default: 'latest')"
	@echo "  make push [TAG=tag] - Push Docker image to registry with optional tag (default: 'latest')"
	@echo "  make help           - Display this message"
	@echo ""
	@echo "Example:"
	@echo "  make build TAG=0.1"
	@echo "  make push TAG=0.1"

# Define default goal
.DEFAULT_GOAL := help

# Mark commands as phony (they don't represent files)
.PHONY: build push help