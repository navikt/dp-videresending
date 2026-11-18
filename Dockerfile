FROM cgr.dev/chainguard/nginx:latest@sha256:b05ccf9fdba84cdbd11e89a55e8845d875516bd7e4bbc49a2de8380a42b2ab9d

COPY nginx.conf /etc/nginx/nginx.conf
