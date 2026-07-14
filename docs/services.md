# Homelab Services

## Host: infra-docker-01

IP:

```text
192.168.3.30
```

## Core management

| Service   | URL                      | Role                      | Update Policy |
| --------- | ------------------------ | ------------------------- | ------------- |
| Dockge    | http://192.168.3.30:5001 | Compose visual management | manual        |
| Glance    | http://192.168.3.30:3003 | Homelab start page       | notify        |

## Media automation

| Service      | URL                      | Role                        | Update Policy  |
| ------------ | ------------------------ | --------------------------- | -------------- |
| Jellyfin     | http://192.168.3.30:8096 | Video media library         | manual         |
| Navidrome    | http://192.168.3.30:4533 | Music library               | notify         |
| qBittorrent  | http://192.168.3.30:8080 | Shared download backend     | manual         |
| ANI-RSS      | http://192.168.3.30:7789 | Anime RSS automation        | notify         |
| Radarr       | http://192.168.3.30:7878 | Movie automation            | notify         |
| Prowlarr     | http://192.168.3.30:9696 | Indexer management          | manual         |
| FlareSolverr | http://192.168.3.30:8191 | Cloudflare challenge solver | auto-candidate |

## Manga automation

| Service  | URL                       | Role                         | Update Policy |
| -------- | ------------------------- | ---------------------------- | ------------- |
| Komga    | http://192.168.3.30:25600 | Manga library                | notify        |
| Suwayomi | http://192.168.3.30:4567  | Manga source/download server | notify        |
| Komf     | http://192.168.3.30:8085  | Komga metadata companion     | notify        |

## Notes

- Git repository is the source of truth.
- Runtime `.env` files are local-only and must not be committed.
- Dockge is only a visual management layer.
- Services should remain runnable through plain Docker Compose.

## Peer management

| Service | URL | Role | Update Policy |
|---|---|---|---|
| PeerBanHelper | http://192.168.3.30:9898 | qBittorrent peer management and anti-leech helper | manual |


### PeerBanHelper 验证状态

- Web 服务：正常
- qBittorrent 下载器连接：正常
- 真实 Torrent 和 Peer 数据读取验证通过
- 网络模式：host
- qBittorrent 地址：`http://127.0.0.1:8080`
- 更新策略：manual
