# Basic Makefile for Docker build and push

# Docker image settings
IMAGE_NAME := artanalyzer
REGISTRY := ericblue
TAG ?= "latest"

# Usage: make release VERSION=0.1
#
# This will create an updated version.py file, git tag and push it to the remote repository
#

release:
	test -n "$(VERSION)" || (echo "VERSION is required" && exit 1)
	@echo "Generating version.py and generating git tag $(VERSION)"
	echo "__version__ = \"$(VERSION)\"" > version.py
	@if git status --porcelain | grep -q "version.py"; then \
		echo "Commit version changes before releasing."; \
		git add version.py; \
		git commit -m "Bumped version to $(VERSION)"; \
		git tag -f -a $(VERSION) -m "Release $(VERSION)"; \
		git push origin $(VERSION); \
	else \
		echo "version.py has not been modified."; \
	fi

# Build the Docker image
buildDocker:
	@docker build -t $(IMAGE_NAME):$(TAG) .

# Push the Docker image
pushDocker:
	@docker tag $(IMAGE_NAME):$(TAG) $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	@docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)

# Display usage information
help:
	@echo "Makefile for generating releases and building/pushing Docker images"
	@echo ""
	@echo "Usage:"
	@echo "  make release [VERSION=tag] - Generate a new version (v0.x), create and push a git tag"
	@echo "  make buildDocker [TAG=tag] - Build Docker image with optional tag (default: 'latest')"
	@echo "  make pushDocker [TAG=tag] - Push Docker image to registry with optional tag (default: 'latest')"
	@echo "  make help           - Display this message"
	@echo ""
	@echo "Example:"
	@echo "  make release VERSION=0.1"
	@echo "  make buildDocker TAG=0.1"
	@echo "  make pushDocker TAG=0.1"

# Define default goal
.DEFAULT_GOAL := help

# Mark commands as phony (they don't represent files)
.PHONY: release build push help