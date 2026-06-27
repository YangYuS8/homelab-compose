# Radarr

Radarr is used for movie collection management and automation.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:7878
- Internal qBittorrent URL: http://qbittorrent:8080
- Internal Prowlarr URL: http://prowlarr:9696

## Paths

Config:

```text
/data/docker/config/radarr
```

Movie library:

```text
/data/media/movie
```

Download workspace:

```text
/data/downloads
```

Recommended qBittorrent category:

```text
Category: radarr
Final path: /data/downloads/radarr
Incomplete path: /data/downloads/incomplete/radarr
```

Radarr root folder:

```text
/data/media/movie
```

## Import model

In this homelab, `/data/media/movie` is mounted from NAS through CIFS/SMB.

This means hardlink or atomic move may not be available between `/data/downloads/radarr` and `/data/media/movie`.

Accept copy/move import behavior first. Optimize later if needed.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Radarr has a local database and can modify the movie library, so updates should be reviewed before applying.

## Notes

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
