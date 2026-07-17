# Networks

## Docker networks

New stacks on `infra-docker-01` should normally use the shared external network:

```text
homelab
```

Do not continue the old `1panel-network` naming on new hosts unless compatibility is explicitly required.

Network-mode exceptions must be documented. The current known exception is PeerBanHelper, which uses host networking and reaches qBittorrent through the host-published WebUI/API port:

```text
http://127.0.0.1:8080
```

qBittorrent remains on the Docker bridge network because ANI-RSS, Radarr, and other services already depend on Docker service-name connectivity.

## LAN

- LAN subnet: `192.168.3.0/24`
- PVE host: `192.168.3.16`
- `net-gateway-01`: `192.168.3.20`
- `infra-docker-01`: `192.168.3.30`

## Proxy direction

Proxy responsibilities should converge on OpenClash running on `net-gateway-01`.

The legacy v2rayA instance on the PVE host is not a migration target and should eventually be retired after dependent traffic has been moved to OpenClash.

Current proxy endpoint:

```text
http://192.168.3.20:7890
```

The proxy port is `7890`, not `7893`.

Avoid hardcoding Docker bridge addresses such as:

```text
172.18.0.1:20172
```

Use host-level environment variables where a service needs an explicit HTTP proxy:

```text
HTTP_PROXY=http://192.168.3.20:7890
HTTPS_PROXY=http://192.168.3.20:7890
NO_PROXY=localhost,127.0.0.1,192.168.3.0/24
```

Do not commit proxy credentials or private subscription information to this repository.