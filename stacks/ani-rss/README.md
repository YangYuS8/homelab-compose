# ANI-RSS

ANI-RSS is used for RSS-based anime subscription and download automation.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:7789
- Internal qBittorrent URL: http://qbittorrent:8080

## Role

ANI-RSS is not a downloader itself.

It should send tasks to the shared qBittorrent backend.

## Paths

Config:

```text
/data/docker/config/ani-rss
```

Media paths mounted into the container:

```text
/data/media/anime
/data/media/movie
```

These paths must stay consistent with qBittorrent.

## Recommended download settings

Inside ANI-RSS, configure qBittorrent as:

```text
Download tool: qBittorrent
Address: http://qbittorrent:8080
Username: <qBittorrent username>
Password: <qBittorrent password>
Save path: /data/media/anime/${title}/Season ${season}
Movie save path: /data/media/movie/${title}
```

In qBittorrent, the `ani-rss` category should use:

```text
Final path: /data/media/anime
Incomplete path: /data/downloads/incomplete/ani-rss
```

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

ANI-RSS has runtime configuration and connects to qBittorrent, so updates should be reviewed before applying.

## Security notes

- Change the default admin password after first login.
- Do not expose ANI-RSS directly to the public internet.
- Runtime secrets must stay in local config and must not be committed.

## Notes

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.
