TAG ?= latest
CHANNEL ?= latest
IMAGE := viblo/static-pages:$(CHANNEL)

.PHONY: build push

build:
	docker build . --tag $(IMAGE)

push:
	docker push $(IMAGE)
