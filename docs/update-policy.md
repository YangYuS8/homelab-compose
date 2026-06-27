# Container Update Policy

This homelab uses a tiered container update strategy.

## Principles

- Do not blindly auto-update every container.
- Low-risk stateless services may be auto-updated.
- Stateful or critical services should be reviewed before updating.
- Git remains the source of truth for Compose definitions.
- Runtime `.env` files and secrets must not be committed.
- Every stack should remain runnable with plain `docker compose up -d`.

## Update classes

### Class A: Auto-update allowed

Low-risk, stateless, or easily rebuildable services.

Examples:

- flaresolverr
- simple dashboard services
- small helper services

Policy:

- `latest` tag is acceptable.
- Watchtower auto-update is allowed.
- Service should have simple logs and easy rollback.

### Class B: Notify or manual update preferred

Services with local configuration databases, but not core infrastructure.

Examples:

- prowlarr
- radarr
- sonarr
- lidarr
- autobangumi
- komf
- suwayomi
- navidrome
- komga

Policy:

- `latest` or stable channel tags may be used.
- Prefer update notification first.
- Manual review is recommended before applying updates.

### Class C: Manual update only

Critical, stateful, or infrastructure-level services.

Examples:

- jellyfin
- qbittorrent
- rustfs
- jenkins
- openresty
- dockge
- databases
- object storage
- reverse proxies

Policy:

- Do not auto-update unattended.
- Read release notes before updating.
- Backup config and data before major upgrades.
- Prefer maintenance windows.

## Image tag guidance

### Acceptable for low-risk services

```yaml
image: example/service:latest
```

### Better for critical services

```yaml
image: example/service:1.2
```

or:

```yaml
image: example/service:1.2.3
```

### Most reproducible

```yaml
image: example/service@sha256:<digest>
```

Digest pinning provides the strongest reproducibility, but is more difficult to maintain manually.

## Watchtower labels

Auto-update allowed:

```yaml
labels:
  com.centurylinklabs.watchtower.enable: "true"
```

Manual or protected service:

```yaml
labels:
  com.centurylinklabs.watchtower.enable: "false"
```

## Current recommendation

Start with opt-in auto-updates only.

Do not allow Watchtower to update every running container by default.
