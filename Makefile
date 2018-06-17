.PHONY: local-deploy

local-build:
	docker build -t threethink/minio-test .

local-deploy: local-build
	docker run --rm --name minio-test -p 9000:9000 -e MINIO_ACCESS_KEY=turd -e MINIO_SECRET_KEY=iloveturds threethink/minio-test server /data