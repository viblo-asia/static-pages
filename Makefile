TAG ?= latest
CHANNEL ?= latest
IMAGE := viblo/static-pages
VIBLO_PLATFORM_VERSION ?= v1.0.0-alpha.3

.PHONY: build push

build:
	docker build . --tag $(IMAGE):$(CHANNEL) --build-arg VIBLO_PLATFORM_VERSION=$(VIBLO_PLATFORM_VERSION)

release:
	docker tag $(IMAGE):$(CHANNEL) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):$(CHANNEL)
