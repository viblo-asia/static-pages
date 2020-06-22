TAG ?= latest
CHANNEL ?= latest
IMAGE := viblo/static-pages

.PHONY: build push

build:
	docker build . --tag $(IMAGE):$(CHANNEL)

release:
	docker tag $(IMAGE):$(CHANNEL) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):$(CHANNEL)

clean:
	docker images $(IMAGE) --format "{{.ID}}" | xargs -r docker rmi -f
