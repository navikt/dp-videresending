FROM cgr.dev/chainguard/nginx:latest@sha256:8b23d452af450c1de3d2e8c2eab0b697b8b7c253582090d9c0df87b15569fcc9

COPY nginx.conf /etc/nginx/nginx.conf
