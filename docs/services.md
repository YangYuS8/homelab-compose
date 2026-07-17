# Homelab Services

This document records the intended, standardized services on `infra-docker-01`.

Legacy services still running on the PVE host are not automatically migration targets. Their status and disposition are documented in [`hosts.md`](hosts.md).

## Host: infra-docker-01

```text
192.168.3.30
```

## Core management

| Service | URL | Role | Update Policy |
|---|---|---|---|
| Dockge | http://192.168.3.30:5001 | Compose visual management | manual |
| Glance | http://192.168.3.30:3003 | Homelab start page | notify |

## Media automation

| Service | URL | Role | Update Policy |
|---|---|---|---|
| Jellyfin | http://192.168.3.30:8096 | Video media library | manual |
| Navidrome | http://192.168.3.30:4533 | Music library | notify |
| qBittorrent | http://192.168.3.30:8080 | Shared download backend | manual |
| ANI-RSS | http://192.168.3.30:7789 | Anime RSS automation | notify |
| Radarr | http://192.168.3.30:7878 | Movie automation | notify |
| Prowlarr | http://192.168.3.30:9696 | Indexer management | manual |
| FlareSolverr | http://192.168.3.30:8191 | Cloudflare challenge solver | auto |

## Manga automation

| Service | URL | Role | Update Policy |
|---|---|---|---|
| Komga | http://192.168.3.30:25600 | Manga library | notify |
| Suwayomi | http://192.168.3.30:4567 | Manga source and download server | notify |
| Komf | http://192.168.3.30:8085 | Komga metadata companion | notify |

## Peer management

| Service | URL | Role | Update Policy |
|---|---|---|---|
| PeerBanHelper | http://192.168.3.30:9898 | qBittorrent peer management and anti-leech helper | manual |

### PeerBanHelper verification

- Web service is healthy.
- qBittorrent downloader connection is healthy.
- Real Torrent and Peer data retrieval has been verified.
- PeerBanHelper uses host networking.
- It connects to qBittorrent through `http://127.0.0.1:8080`.
- qBittorrent remains on the Docker bridge network.

## Explicit non-targets

The following legacy services are not part of the active service inventory and should not be migrated by default:

```text
Jenkins
OpenList
Zabbix Agent
AutoBangumi
RustFS
OpenResty
1Panel application stacks
v2rayA
Sun Panel
```

See [`hosts.md`](hosts.md) for the reason and replacement path for each service.

## Operating principles

- Git is the source of truth.
- Runtime `.env` files and secrets are local-only and must not be committed.
- Dockge is only a visual management layer.
- Services must remain runnable through plain Docker Compose.
- A legacy container being online does not make it a migration candidate.
- Do not add a service to this inventory until its continued use has been confirmed.