# Komf

Komf is used as a metadata companion service for Komga.

## Runtime host

- Preferred host: infra-docker-01
- Default URL: http://192.168.3.30:8085

## Paths

- Compose source: stacks/komf/compose.yaml
- Runtime compose path: /data/compose/stacks/komf
- Config path: /data/docker/config/komf
- Library path: /data/media/manga

## Komga integration

Komf connects to Komga through the shared Docker network:

```text
http://komga:25600
```

This relies on both Komf and Komga joining the external Docker network:

```text
homelab
```

## Proxy

Some metadata sources may require a proxy. Runtime proxy values should be stored in local `.env`.

## Update policy

```yaml
labels:
  dev.nesoriel.update.policy: "notify"
```

Komf has runtime configuration and depends on Komga, so updates should be reviewed before applying.

## Notes

Real runtime values should be stored in local `.env` files and must not be committed.

This stack should be runnable with plain Docker Compose:

```
docker compose up -d
```

Dockge is only a visual management panel, not the source of truth.

## Required application.yml

Komf requires an application config file:

```text
/config/application.yml
```

On the runtime host, create it from the example:

```bash
cp /data/compose/repo/homelab-compose/stacks/komf/application.example.yml /data/docker/config/komf/application.yml
```

Real credentials should not be written into the public repository. Runtime credentials should be stored in the local `.env` file.
