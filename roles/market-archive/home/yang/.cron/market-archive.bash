workon marketarchive
cd /mnt/store/yang/t/
log=/tmp/marketarchive-dl-$(date +%Y-%m-%d).log
python ~/marketarchive/dl.py &>> $log || cat $log
