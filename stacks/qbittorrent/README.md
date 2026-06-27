# qBittorrent

qBittorrent is used as the shared download backend for multiple automation tools.

## Runtime host

- Preferred host: infra-docker-01
- Default WebUI: http://192.168.3.30:8080
- Internal service URL: http://qbittorrent:8080

## Role

qBittorrent is not dedicated to a single service.

It may receive tasks from:

- ANI-RSS
- Radarr
- manual downloads
- future automation tools

## Paths

Config:

```text
/data/docker/config/qbittorrent
```

Download workspace:

```text
/data/downloads
├── incomplete
├── manual
├── ani-rss
├── radarr
└── temp
```

Media paths mounted into the container:

```text
/data/media/anime
/data/media/movie
/data/media/manga
```

Music is intentionally not mounted.

## Recommended categories

Create these categories in qBittorrent WebUI later:

```text
ani-rss -> /data/media/anime
radarr  -> /data/downloads/radarr
manual  -> /data/downloads/manual
temp    -> /data/downloads/temp
```

ANI-RSS may save directly to `/data/media/anime`.

Radarr should usually download to `/data/downloads/radarr` and then import into `/data/media/movie`.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "manual"
```

qBittorrent is a core download service and should not be updated unattended.

## Security notes

- Change the default temporary password immediately after first login.
- Do not expose the WebUI directly to the public internet.
- Automation services should connect through the internal Docker network when possible:

```text
http://qbittorrent:8080
```

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
