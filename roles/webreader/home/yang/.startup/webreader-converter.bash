#!/usr/bin/env bash
{ cat ~/.screenrc; echo 'logfile "/tmp/webreader-converter.log"'; echo 'deflog on' ; } > /tmp/webreader-converter.screenrc
screen -c /tmp/webreader-converter.screenrc -D -m -U -S webreader-converter bash -lc 'workon web-reader; web-reader converter -t yaaang@gmail.com'
