# Komga

Komga is used as a comic and manga library server.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:25600

## Paths

- Compose source: stacks/komga/compose.yaml
- Runtime compose path: /data/compose/stacks/komga
- Config path: /data/docker/config/komga
- Library path: /data/media/manga

## Library

The manga library path is mounted as:

```text
/data/media/manga:/data
```

At this stage, the library directory may be empty. The goal is only to start Komga cleanly first.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Komga has a local database and metadata, so updates should be reviewed before applying.

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
