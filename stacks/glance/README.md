# Glance

Glance is the homelab start page and navigation dashboard.

It replaces Sun Panel. Sun Panel is no longer part of this homelab stack.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:3003

## Paths

Compose source:

```text
stacks/glance/compose.yaml
```

Runtime compose path:

```text
/data/compose/stacks/glance
```

Runtime config path:

```text
/data/docker/config/glance
```

## Config deployment

The generic deploy script only copies `compose.yaml` and `.env.example`.

Glance also needs YAML config files, so copy them manually:

```bash
mkdir -p /data/docker/config/glance/assets
cp stacks/glance/config/glance.yml /data/docker/config/glance/glance.yml
cp stacks/glance/config/home.yml /data/docker/config/glance/home.yml
cp stacks/glance/assets/user.css /data/docker/config/glance/assets/user.css
```

## Docker socket

This stack mounts Docker socket read-only:

```text
/var/run/docker.sock:/var/run/docker.sock:ro
```

This is required for the Glance Docker containers widget.

Do not expose Glance directly to the public internet.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```
