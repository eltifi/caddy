ARG VERSION=2.10.0-builder-alpine

FROM caddy:${VERSION} AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/cache-handler

FROM caddy:alpine

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
