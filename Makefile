NAME       := cmak
TAG        := test
IMAGE_NAME := panubo/$(NAME)

.PHONY: *

help:
	@printf "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)\n"

build:  ## build image
	docker build --platform linux/amd64 --pull -t $(IMAGE_NAME):$(TAG) .

push:
	docker push $(IMAGE_NAME):$(TAG)

clean:
	docker rmi $(IMAGE_NAME):$(TAG)

run:  ## run image
	docker run --rm -it $(IMAGE_NAME):$(TAG)

shell:  ## get a shell in the image
	docker run --rm -it --entrypoint sh $(IMAGE_NAME):$(TAG)

test:  ## run test suite
	( cd tests; bats . )

_ci_test:
	( cd tests; bats . )
