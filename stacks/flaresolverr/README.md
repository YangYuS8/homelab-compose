# FlareSolverr

FlareSolverr is used by services such as Prowlarr to solve Cloudflare-protected requests.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:8191

## Paths

- Compose source: stacks/flaresolverr/compose.yaml
- Runtime compose path: /data/compose/stacks/flaresolverr
- Config path: /data/docker/config/flaresolverr

## Environment

Use `.env.example` as a public template.

Real runtime values should be stored in local `.env` files and must not be committed.

## Notes

This stack should be runnable with plain Docker Compose:

    docker compose up -d

Dockge is only a visual management panel, not the source of truth.
