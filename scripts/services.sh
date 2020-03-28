#!/bin/bash
# from https://gitlab.com/jennydaman/PigeonStats/-/blob/master/services.sh

clear=$(tput sgr0)
inactive="$(tput setaf 1)▲ inactive$clear"
active="$(tput setaf 2)● active$clear"

ufw=$inactive
mian=$inactive
caddy=$inactive
mariadb=$inactive
nextcloud=$inactive
laverna=$inactive

printf "%s\n\n" "$(tput bold)Services$clear"

systemctl is-active --quiet ufw && ufw=$active

# caddy doesn't support HEAD request anymore, can't use curl's --head flag
# https://github.com/mholt/caddy/commit/4f8ff095514b75fc72a54be36d2e3d923db97988
[ "$(curl --http2 --silent --output /dev/null --head -w '%{http_code}' https://mian.teaso.me/health)" -eq "200" ] && mian=$active
[ "$(curl --http2 --silent --output /dev/null -w '%{http_code}' https://pro.teaso.me/)" -eq "200" ] && caddy=$active
[ "$(curl --http2 --silent --output /dev/null --head -w '%{http_code}' https://cloud.teaso.me/status.php)" -eq "200" ] && nextcloud=$active
mysql --execute="SELECT 1" --silent --quick > /dev/null 2>/dev/null && mariadb=$active

printf " Firewall:   %24s  MariaDB:   %24s\n" "$ufw"           "$mariadb"
printf " NextCloud:  %24s  MIAN:      %24s\n" "$nextcloud"     "$mian"


