# Prowlarr

Prowlarr is used as an indexer manager for services such as Radarr, Sonarr, Lidarr, and other download automation tools.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:9696

## Paths

- Compose source: stacks/prowlarr/compose.yaml
- Runtime compose path: /data/compose/stacks/prowlarr
- Config path: /data/docker/config/prowlarr

## Related services

- FlareSolverr: http://flaresolverr:8191 inside the `homelab` Docker network
- Temporary PVE Radarr URL: http://192.168.3.16:7878
- Temporary PVE qBittorrent URL: http://192.168.3.16:8181

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

    docker compose up -d

Dockge is only a visual management panel, not the source of truth.
