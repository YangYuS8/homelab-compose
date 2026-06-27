# Download Workflow

## Design principle

qBittorrent is the shared download backend.

It is not dedicated to ANI-RSS, Radarr, or any single automation tool.

## Main paths

```text
/data/downloads
/data/media/anime
/data/media/movie
/data/media/music
/data/media/manga
```

## qBittorrent categories

| Category | Final Path             | Incomplete Path                    | Used By          |
| -------- | ---------------------- | ---------------------------------- | ---------------- |
| ani-rss  | /data/media/anime      | /data/downloads/incomplete/ani-rss | ANI-RSS          |
| radarr   | /data/downloads/radarr | /data/downloads/incomplete/radarr  | Radarr           |
| manual   | /data/downloads/manual | /data/downloads/incomplete/manual  | Manual downloads |
| temp     | /data/downloads/temp   | /data/downloads/incomplete/temp    | Temporary tests  |

## Anime workflow

```text
ANI-RSS
  -> qBittorrent category: ani-rss
  -> /data/media/anime
  -> Jellyfin Anime library
```

ANI-RSS and qBittorrent must see the same path:

```text
/data/media/anime
```

## Movie workflow

```text
Prowlarr
  -> Radarr
  -> qBittorrent category: radarr
  -> /data/downloads/radarr
  -> Radarr import
  -> /data/media/movie
  -> Jellyfin Movies library
```

Radarr root folder:

```text
/data/media/movie
```

## Music workflow

```text
Navidrome
  -> /data/media/music
```

Jellyfin does not manage music in this setup.

## Manga workflow

```text
Suwayomi
  -> /data/media/manga
  -> Komga
  -> Komf
```

## Notes

- Incomplete downloads should not be placed directly in media library paths.
- Jellyfin media mounts should be read-only.
- qBittorrent WebUI/API should not be exposed directly to the public internet.
- Internal service communication should use Docker service names, for example:

```text
http://qbittorrent:8080
http://radarr:7878
http://prowlarr:9696
```

