# Hosts

## pve

- Hostname: pve
- IP: 192.168.3.16
- Role: Proxmox VE host
- Notes:
  - Should gradually return to being a clean virtualization host.
  - Existing Docker services are still running here.
  - Existing compose files are split between `/mnt/pve/sda/docker` and `/opt/1panel/apps`.

## infra-docker-01

- Hostname: infra-docker-01
- IP: 192.168.3.30
- OS: Debian GNU/Linux 13 trixie
- Role: Docker Compose host
- Root disk: `/`, 59G SSD-like system disk
- Data disk: `/data`, 196G mechanical HDD
- Docker root dir: keep default `/var/lib/docker`
- Compose path: `/data/compose/stacks`
- App data path: `/data/docker`

## net-gateway-01

- Hostname: net-gateway-01
- IP: 192.168.3.20
- Role: OpenWrt gateway / proxy gateway
- Proxy assumption:
  - HTTP proxy: `http://192.168.3.20:7890`
