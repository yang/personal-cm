# This script is enabled by first creating a superuser:
#
#   sudo -u postgres psql
#   create user backupuser login superuser;
#   \password backupuser
#
# and adding the credentials to your .pgpass:
#
#   localhost:5432:*:backupuser:PASSWORD
#
# Then you can test out this script by just running it.
#
# Add the cron entry:
#
#   0 0 * * * bash -il /Users/yang/.cron/backup-pg.bash

set -o errexit -o nounset -o pipefail

mkdir -p ~/.backup-pg/
pg_dumpall -h localhost -U backupuser | gzip -9 > ~/.backup-pg/$(date +%Y-%m-%d).psql.gz
