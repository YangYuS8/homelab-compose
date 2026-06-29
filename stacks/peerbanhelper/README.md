# PeerBanHelper

PeerBanHelper is used as an anti-leeching and peer management helper for qBittorrent.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:9898

## Paths

Config and data:

```text
/data/docker/config/peerbanhelper
```

Container path:

```text
/app/data
```

## Network mode

This stack uses host network mode:

```yaml
network_mode: host
```

PeerBanHelper's official Docker deployment example uses host networking.

## qBittorrent connection

Since PeerBanHelper runs with host networking, it should connect to qBittorrent through the host-published WebUI/API port:

```text
http://127.0.0.1:8080
```

Do not use Docker service name here:

```text
http://qbittorrent:8080
```

PeerBanHelper is not attached to the Docker bridge network, so Docker service DNS names are not available.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "manual"
```

PeerBanHelper can affect qBittorrent peer banning behavior, so updates should be reviewed manually.

## Notes

qBittorrent currently runs in Docker bridge mode in this homelab setup.

If PeerBanHelper reports inaccurate peer IP detection or related network issues, reconsider qBittorrent's network mode later. Do not change qBittorrent networking until the existing ANI-RSS, Radarr, and Prowlarr workflows are fully verified.
