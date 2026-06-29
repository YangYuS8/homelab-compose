# Glance

Glance is used as the homelab start page and navigation dashboard.

It replaces Sun Panel as the preferred long-term dashboard.

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
cp -n stacks/glance/config/glance.yml /data/docker/config/glance/glance.yml
cp -n stacks/glance/config/home.yml /data/docker/config/glance/home.yml
cp -n stacks/glance/assets/user.css /data/docker/config/glance/assets/user.css
```

Use `cp` without `-n` only when you intentionally want to overwrite runtime config.

## Docker socket

This stack intentionally does not mount `/var/run/docker.sock`.

Glance supports Docker container widgets, but Docker socket access should be reviewed separately, preferably through a restricted socket proxy.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Glance is a dashboard and is not on the critical media data path, so notify is acceptable.
