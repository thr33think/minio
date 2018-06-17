.PHONY: local-deploy local-build build push deploy

# Config
dockerHubOrg := "threethink"
imageName := "minio"
commitHash := $(TRAVIS_COMMIT)
fullImageName := $(dockerHubOrg)/$(imageName):$(commitHash)

local-build:
	docker build -t threethink/minio-test .

local-deploy: local-build
	docker run --rm --name minio-test -p 9000:9000 -e MINIO_ACCESS_KEY=turd -e MINIO_SECRET_KEY=iloveturds threethink/minio-test server /data

build:
	@docker build --pull --rm -t $(fullImageName) .

push:
ifeq ($(TRAVIS_PULL_REQUEST_BRANCH),)
	@docker push $(fullImageName)
else
	@echo "BRANCH not Master. Nothing to do!"
endif

deploy:
ifeq	($(TRAVIS_PULL_REQUEST_BRANCH),)
	@docker-compose up -d
else
	@echo "BRANCH not Master. Nothing to do!"
endif