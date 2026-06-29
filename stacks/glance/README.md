# Glance

Glance is the homelab start page.

It is used for:

- Service bookmarks
- Health checks
- Technical RSS feeds
- Release tracking
- Repository overview
- Search shortcuts

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

This stack does not mount `/var/run/docker.sock`.

Container state should be managed through Dockge, Docker CLI, or a future dedicated monitoring stack.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```
