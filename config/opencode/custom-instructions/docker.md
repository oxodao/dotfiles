# Compose

## Definition

* Follow the `[BASEPATH]/coding/yaml.md` instructions.


* Unless explicitely requested, do not use container names.
* Containers should most of the time have `restart: 'unless-stopped'`
* Prefer modern compose structure over old deprecated stuff.
* Try to avoid using anchor and aliases unless it’s for reusing a lot of stuff
* Try to always include proper healthchecks when not defined by the base image, but do not add ones just for the sake of it, they must properly detect that the image is properly running, no dumb checks. Also if it is too complicated (e.g. multi-line scripts, etc…) tell the user and do not add it yet.
* Most of the time, you should expose ports on `127.0.0.1:XXXX:XXXX`instead of just the port.
* Do not use legacy settings (e.g. `mem_reservation` instead of `deploy.resources`)

## Images

* Always prefer official images, if none is available but community ones are, let the user decide if they want to use them.
* Prefer debian slim variants of the image, do not use alpine.
* Do check for newer versions, e.g. do not recommend mariadb:11.8 when we are already at mariadb:12.3 unless the project specifically requires it.

## Storage

* Unless explicitely stated, do not use docker volumes, prefer bind mounts of folder.
* In development, most of the time stuff should be stored in `.data/[app_name]`.
* In homelab, most of the time stuff should be stored in `config/[app_name]`with eventually `config/[app_name]/[mount_name]`if multiple are required for any given app. This does not apply for mount locations that are remote (e.g. smb / nfs shares mounted on the host).
