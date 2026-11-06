FROM cgr.dev/chainguard/nginx:latest@sha256:56827eefb441357ccbbbf2c38074bb942109a0ec433aba9c457be490eef5bdc2

COPY nginx.conf /etc/nginx/nginx.conf
