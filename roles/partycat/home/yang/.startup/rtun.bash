# This will ensure that at startup a reverse ssh tunnel is created to the
# remote host (HOST) of your choice. This enables connections made to HOST:1122
# to connect to localhost:22.
#
# Locally:
#
#   ssh-keygen -P '' -f ~/.ssh/rtun
#
# On the remote host (HOST):
#
#   useradd -mr --shell=/usr/sbin/nologin rtun
#   sudo -u rtun bash -c 'mkdir -p ~rtun/.ssh; vim ~rtun/.ssh/authorized_keys'
#
# Warning: creating keys that are not protected by a passphrase will let anyone
# ssh into HOST as rtun (hence the nologin shell).

while true ; do
  pkill -f "^ssh -N -S none -i /home/yang/.ssh/rtun" ;
  sleep 1 ;
  ssh -N -S none -i /home/yang/.ssh/rtun \
    -R1124:localhost:22 \
    -o BatchMode=yes -o ServerAliveInterval=300 -o TCPKeepAlive=yes \
    -o ExitOnForwardFailure=yes rtun@yz.xvm.mit.edu ;
  sleep 5 ;
done &>> /tmp/rtun.log
