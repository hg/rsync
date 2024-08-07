I couldn't find any "official" container images for the rsync + ssh combo, and
got tired of repeating the same setup boilerplate in every job, so here it is.

The tag encodes the version of Alpine used to build the container.

## Usage

Woodpecker:

```yaml
  deploy:
    image: ghcr.io/hg/rsync:3.20
    commands:
      - add-host DEV joe dev.example.com 2222
      - add-host PROD jane prod.example.com
      - rsync -a ./dist/ DEV:/var/www/site/
      - ssh PROD 'sudo dnf upgrade --refresh'
    secrets:
      - SSH_KEY
```
