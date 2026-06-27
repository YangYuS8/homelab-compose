# Watchtower

Watchtower is used to automatically update selected low-risk containers.

## Runtime host

- Preferred host: infra-docker-01
- Runtime path: /data/compose/stacks/watchtower

## Policy

This Watchtower instance uses opt-in mode:

```text
WATCHTOWER_LABEL_ENABLE=true
```

Only containers with the following label will be automatically updated:

```yaml
labels:
  com.centurylinklabs.watchtower.enable: "true"
```

Containers without this label, or with it set to `"false"`, will not be updated.

## Current auto-update candidates

- flaresolverr

## Protected services

These should not be auto-updated unattended:

- dockge
- prowlarr
- sun-panel
- jellyfin
- qbittorrent
- rustfs
- jenkins
- openresty

## Notes

Watchtower mounts the Docker socket:

```text
/var/run/docker.sock
```

This gives it control over the local Docker daemon. Do not expose Watchtower publicly.

Git remains the source of truth. Watchtower only updates running containers that are explicitly allowed by labels.
