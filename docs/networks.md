# Networks

## Docker networks

New stacks on `infra-docker-01` should use:

```text
homelab
```

Do not continue the old `1panel-network` naming on new hosts unless compatibility is required.

## LAN

- LAN subnet: `192.168.3.0/24`
- PVE host: `192.168.3.16`
- infra-docker-01: `192.168.3.30`
- OpenWrt gateway: `192.168.3.20`

## Proxy

Avoid hardcoding Docker bridge addresses such as:

```text
172.18.0.1:20172
```

Use host-level environment variables instead:

```text
HTTP_PROXY=http://192.168.3.20:7890
HTTPS_PROXY=http://192.168.3.20:7890
NO_PROXY=localhost,127.0.0.1,192.168.3.0/24
```

