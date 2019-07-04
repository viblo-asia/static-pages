RELEASE_CHANNEL ?= latest
RELEASE_IMAGE := viblo/static-pages:$(RELEASE_CHANNEL)

.PHONY: build push

build:
	docker build . --tag $(RELEASE_IMAGE) --build-arg SURVEY_RESULTS_VERSION=$(VERSION)

push:
	docker push $(RELEASE_IMAGE)
