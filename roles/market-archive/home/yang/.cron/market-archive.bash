workon marketarchive
cd /mnt/store/yang/t/
python ~/marketarchive/dl.py &>> /tmp/marketarchive-dl.log ||
  cat /tmp/marketarchive-dl.log
