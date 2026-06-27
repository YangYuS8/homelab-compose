# Storage Layout

## infra-docker-01

Docker engine data should stay on the system disk for now:

```text
/var/lib/docker
```

Do not move Docker `data-root` to `/data` for now because `/data` is a mechanical HDD.

Use `/data` for Compose files, app configs, backups, and large low-frequency data:

```text
/data/compose/stacks
/data/compose/repo
/data/docker/config
/data/docker/data
/data/docker/cache
/data/docker/backups
/data/media
```

## Media

Media files should not be copied into the Docker VM directly.

Preferred strategy:

```text
NAS / SMB / NFS
↓
mounted on infra-docker-01
↓
bind-mounted into containers
```

