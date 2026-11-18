FROM cgr.dev/chainguard/nginx:latest@sha256:5c0cd0b697f534d3222bf3c4e52da1a5dbe0007faf75db48a93254e57b9566a2

COPY nginx.conf /etc/nginx/nginx.conf
