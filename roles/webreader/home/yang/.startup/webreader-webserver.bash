#!/usr/bin/env bash
{ cat ~/.screenrc; echo 'logfile "/tmp/webreader-webserver.log"'; echo 'deflog on' ; } > /tmp/webreader-webserver.screenrc
screen -c /tmp/webreader-webserver.screenrc -D -m -U -S webreader-webserver bash -lc 'workon web-reader; web-reader webserver -p 5050'
