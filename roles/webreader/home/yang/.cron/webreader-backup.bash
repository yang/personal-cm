pg_dump -U webreader -h localhost webreader | gzip -9 > /mnt/store/yang/backup/webreader/`date +%Y-%m-%d`.pgdump.gz
