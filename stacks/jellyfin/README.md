# Jellyfin

Jellyfin is used as the video media library and streaming server.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:8096

## Role

Jellyfin manages video media only in this homelab setup.

Music is managed by Navidrome.

## Paths

Config:

```text
/data/docker/config/jellyfin
```

Cache:

```text
/data/docker/cache/jellyfin
```

Video media libraries:

```text
/data/media/anime
/data/media/movie
```

These media paths are mounted read-only into the container to avoid accidental modification.

## Recommended libraries

After first login, create libraries:

```text
Anime  -> /data/media/anime
Movies -> /data/media/movie
```

Do not add `/data/media/music` here by default. Music should be managed by Navidrome.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "manual"
```

Jellyfin is a core media service with plugins, metadata, cache, and possible hardware transcoding settings, so it should not be updated unattended.

## Hardware acceleration

This initial stack does not enable hardware acceleration.

If the host has `/dev/dri`, hardware acceleration can be added later by passing the render device into the container.

Check on host:

```bash
ls -lah /dev/dri || true
```

## Notes

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
