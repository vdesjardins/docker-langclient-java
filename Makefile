NAME = vdesjardins/langclient-java
VERSION = v0.8.0

.PHONY: all build

all: build

build:
	docker build --build-arg eclipse_jdt_version=$(VERSION) -t $(NAME):$(VERSION) .

push:
	docker push $(NAME):$(VERSION)
