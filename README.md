# code-server

Image from linuxserver/docker-code-server (https://github.com/linuxserver/docker-code-server) with package python, docker and environment variable.

| Parameter | Function |
| :----: | --- |
| `-p 8443` | web gui |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London |
| `-e PASSWORD=password` | Optional web gui password, if `PASSWORD` or `HASHED_PASSWORD` is not provided, there will be no auth. |
| `-e HASHED_PASSWORD=` | Optional web gui password, overrides `PASSWORD`, instructions on how to create it is below. |
| `-e SUDO_PASSWORD=password` | If this optional variable is set, user will have sudo access in the code-server terminal with the specified password. |
| `-e SUDO_PASSWORD_HASH=` | Optionally set sudo password via hash (takes priority over `SUDO_PASSWORD` var). Format is `$type$salt$hashed`. |
| `-e PROXY_DOMAIN=code-server.my.domain` | If this optional variable is set, this domain will be proxied for subdomain proxying. See [Documentation](https://github.com/cdr/code-server/blob/master/docs/FAQ.md#sub-domains) |
| `-e DEFAULT_WORKSPACE=/config/workspace` | If this optional variable is set, code-server will open this directory by default |
| `-v /config` | Contains all relevant configuration files. |