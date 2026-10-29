FROM cgr.dev/chainguard/nginx:latest@sha256:b8a124e0e602e4316159b748f851f1725c72efb3e18ffbfd0728fcd44bc7cb44

COPY nginx.conf /etc/nginx/nginx.conf
