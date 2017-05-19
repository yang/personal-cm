get_tunnels() {
  curl -s http://127.0.0.1:4040/api/tunnels | grep -oP 'http://\w+\.ngrok\.io'
}

screen -d -m -U -S ngrok ngrok http --host-header=y_z.scripts.mit.edu 80

while true ; do
  sleep 1
  name="$( get_tunnels 2> /dev/null )"
  if [[ "$name" ]]
  then break
  fi
done

echo "$name" |
sshpass -f ~/.y_z.sshpass ssh -o PubkeyAuthentication=no -S none y_z@athena.dialup.mit.edu \
  'cat > ~/web_scripts/.proxy-address'
