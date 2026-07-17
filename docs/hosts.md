# Hosts

## pve

- Hostname: `pve`
- IP: `192.168.3.16`
- Role: Proxmox VE virtualization host
- Target state: gradually return to a clean virtualization host

Legacy Docker and 1Panel-managed services are still present on this host. A container being `running` is not evidence that the service is actively used or should be migrated.

Existing application files are split between paths such as:

```text
/mnt/pve/sda/docker
/opt/1panel/apps
```

Do not copy these old Compose definitions directly to `infra-docker-01`.

### Legacy service disposition

| Service | Actual status | Decision |
|---|---|---|
| PeerBanHelper, Radarr, qBittorrent, Navidrome, FlareSolverr, Prowlarr, Jellyfin, Suwayomi, Komga, Komf | Standardized replacements already run on `infra-docker-01` | Retire the old PVE instances after confirming no clients still use the old endpoints |
| Sun Panel | Replaced by Glance | Do not migrate; retire the old instance |
| AutoBangumi | Replaced by ANI-RSS | Do not migrate |
| Jenkins | Experimental deployment; not used day to day | Do not migrate |
| OpenList | Experimental deployment; not used day to day | Do not migrate |
| Zabbix Agent | Experimental deployment; not used day to day | Do not migrate |
| RustFS | Currently not needed | Migration is paused; do not prepare or deploy a replacement |
| OpenResty | Not used on PVE | Do not migrate |
| 1Panel | Only firewall and file-management features were used | Do not treat it as the application source of truth; no application migration is planned |
| v2rayA | Legacy proxy path | Replace with OpenClash on `net-gateway-01`; do not migrate v2rayA |

Migration decisions must be based on confirmed need and actual dependencies, not container uptime.

## infra-docker-01

- Hostname: `infra-docker-01`
- IP: `192.168.3.30`
- OS: Debian GNU/Linux 13 trixie
- Role: standardized Docker Compose host
- Root disk: `/`, approximately 59G system disk
- Data disk: `/data`, approximately 196G mechanical HDD
- Docker root dir: `/var/lib/docker`
- Compose source repository: `/data/compose/repo/homelab-compose`
- Runtime Compose path: `/data/compose/stacks`
- Application data path: `/data/docker`

Git is the source of truth. Dockge is only a visual management layer.

## net-gateway-01

- Hostname: `net-gateway-01`
- IP: `192.168.3.20`
- Role: OpenWrt gateway and centralized proxy gateway
- Proxy implementation: OpenClash
- HTTP proxy endpoint: `http://192.168.3.20:7890`

Proxy responsibilities should converge on this host instead of remaining on the PVE host.