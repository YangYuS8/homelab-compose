# Suwayomi

Suwayomi is used as a manga source and download server.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:4567

## Paths

- Compose source: stacks/suwayomi/compose.yaml
- Runtime compose path: /data/compose/stacks/suwayomi
- Config path: /data/docker/config/suwayomi
- Downloads path: /data/media/manga

## Library relation

Suwayomi downloads are mounted to:

```text
/data/media/manga
```

Komga can later scan the same directory as its manga library.

## Proxy

Some sources may require a proxy. Runtime proxy values should be stored in local `.env` files.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Suwayomi has local configuration and downloaded content, so updates should be reviewed before applying.

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
