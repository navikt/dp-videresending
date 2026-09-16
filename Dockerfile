FROM cgr.dev/chainguard/nginx:latest@sha256:8037a296f9faaec6c6d973bcb4486fc35b1449c75801de7170c083907f01ca0b

COPY nginx.conf /etc/nginx/nginx.conf
