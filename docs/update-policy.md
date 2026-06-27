# Container Update Policy

This homelab uses a conservative container update strategy.

## Current decision

Do not deploy an unattended container auto-updater for now.

The previously considered Watchtower project is no longer suitable as a core component because its original upstream has been archived. Update automation should not depend on an unmaintained project.

## Principles

- Git is the source of truth.
- Docker Compose remains the native runtime format.
- Runtime `.env` files and secrets must not be committed.
- Do not blindly auto-update every container.
- Critical services must be updated manually.
- Update checks and update execution should be separated.
- Future automation should support backup, health check, rollback, and manual approval.

## Update policy labels

Stacks may use a neutral metadata label:

```yaml
labels:
  dev.nesoriel.update.policy: "manual"
```

Possible values:

```text
auto    - May be auto-updated in the future if backup, health check, and rollback are implemented.
notify  - Should only notify about available updates.
manual  - Must be manually reviewed and updated.
```

These labels are metadata for future tooling. They are not tied to Watchtower or any specific updater.

## Recommended service classes

### Class A: Auto-update candidates

Low-risk, stateless, or easily rebuildable services.

Examples:

- flaresolverr
- small helper services
- temporary utility services

Policy:

- May use `latest`.
- May use `dev.nesoriel.update.policy: "auto"`.
- Future platform may update them after health checks.

### Class B: Notify-first services

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

- Prefer update notification first.
- Manual review is recommended before applying updates.
- Back up config before major upgrades.

### Class C: Manual-update services

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
- Back up config and data before major upgrades.
- Prefer maintenance windows.

## Future options

Possible future update-checking approaches:

- Renovate: update Compose image references through Git pull requests.
- Diun: notify when container images have new tags or digest changes.
- WUD: monitor container image updates and expose them through UI/notifications.
- Custom Nesoriel platform: implement update detection, approval, deployment, backup, health checks, and rollback.

## Current operational rule

For now, updates are manual.

The standard manual update flow is:

```bash
cd /data/compose/stacks/<stack-name>
docker compose pull
docker compose up -d
docker compose logs --tail=100
```

For critical services, back up the relevant config/data directories before updating.
