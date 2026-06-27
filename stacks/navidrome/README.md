# Navidrome

Navidrome is used as a lightweight music streaming server.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:4533

## Paths

- Compose source: stacks/navidrome/compose.yaml
- Runtime compose path: /data/compose/stacks/navidrome
- Config path: /data/docker/config/navidrome
- Music path: /data/media/music

## Media mount

Music files are mounted from NAS through CIFS/SMB:

```text
//192.168.3.3/music -> /data/media/music
```

The music directory is mounted read-only into the container:

```text
/data/media/music:/music:ro
```

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Navidrome has a local database and music metadata cache, so updates should be reviewed before applying.

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
