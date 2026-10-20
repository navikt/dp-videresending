FROM cgr.dev/chainguard/nginx:latest@sha256:2031a31bfd755368f6778cf6b295afe83ceb4018d176868698a9db9f811f9bc9

COPY nginx.conf /etc/nginx/nginx.conf
