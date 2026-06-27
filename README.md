# homelab-compose

This repository stores Docker Compose definitions and infrastructure notes for my homelab.

## Principles

- Git is the source of truth.
- Docker Compose is the native runtime format.
- Dockge is only a visual management panel.
- Runtime data is not stored in Git.
- Secrets are stored in local `.env` files, not committed.
- Each stack should be runnable with plain `docker compose up -d`.

## Main paths on infra-docker-01

- Compose stacks: `/data/compose/stacks`
- Git repository: `/data/compose/repo/homelab-compose`
- App config: `/data/docker/config`
- App data: `/data/docker/data`
- Cache: `/data/docker/cache`
- Backups: `/data/docker/backups`
- Media mount points: `/data/media`

## Current hosts

- `pve`: Proxmox VE host, 192.168.3.16
- `infra-docker-01`: Docker Compose host, 192.168.3.30
- `net-gateway-01`: OpenWrt gateway, 192.168.3.20
