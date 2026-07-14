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


## Peer management workflow

```text
ANI-RSS / Radarr / manual downloads
  -> qBittorrent
  -> PeerBanHelper observes and manages peers
```

PeerBanHelper runs with host networking, so it should connect to qBittorrent through the host-published WebUI/API port:

```text
http://127.0.0.1:8080
```

Do not use Docker service name here:

```text
http://qbittorrent:8080
```

qBittorrent currently remains in Docker bridge mode. Do not change qBittorrent networking unless PeerBanHelper actually reports peer detection issues.

## PeerBanHelper 实际流量验证

验证日期：2026-07-14

已使用合法的 Linux ISO Torrent 完成真实下载流量验证：

- PeerBanHelper 成功连接 qBittorrent；
- PeerBanHelper 能识别活动 Torrent；
- PeerBanHelper 能读取活动 Peer；
- 测试结束后，Torrent 和临时下载文件已清理；
- qBittorrent 继续使用 Docker bridge 网络；
- PeerBanHelper 继续使用 host 网络，并通过 `http://127.0.0.1:8080` 访问 qBittorrent。

结论：当前网络结构无需调整。
