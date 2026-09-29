FROM cgr.dev/chainguard/nginx:latest@sha256:567df6c255a4f25814a8c089b6d498d79771ba1b0dd825ad3a70c2bbe4388e86

COPY nginx.conf /etc/nginx/nginx.conf
