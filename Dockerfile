FROM minio/minio:RELEASE.2018-06-09T03-43-35Z
COPY config.json /root/.minio/config.json
EXPOSE 9000
