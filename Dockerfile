FROM minio/minio:RELEASE.2019-08-29T00-25-01Z
COPY config.json /root/.minio/config.json
EXPOSE 9000
