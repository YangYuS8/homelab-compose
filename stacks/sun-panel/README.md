# Sun Panel

Sun Panel is used as a lightweight navigation dashboard for homelab services.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:3002

## Paths

- Compose source: stacks/sun-panel/compose.yaml
- Runtime compose path: /data/compose/stacks/sun-panel
- Config path: /data/docker/config/sun-panel

## Docker socket

This stack mounts:

```text
/var/run/docker.sock
```

This allows Sun Panel to access the local Docker daemon on `infra-docker-01`.

Do not expose this service directly to the public internet.

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
