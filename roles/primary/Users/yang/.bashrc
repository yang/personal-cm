# Use <https://github.com/Bash-it/bash-it>.

source $BASH_IT/bash_it.sh # virtualenvwrapper.sh-2.7

export EDITOR=vim

. virtualenvwrapper.sh-2.7

unalias c - ..

alias l='gls --color=auto'

c() {
  cd "$@"
  l
}

alias -- -='c -'
alias gd='git diff'

..() {
  local count=${1:-1} path=
  for i in $(seq $count)
  do
    path=${path:-}../
  done
  c $path
}

if false ; then
  tree() {
    find "$@" -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  }
fi

go-wab() {
  c ~/proj/wab/
  workon wab
  . ~/.node/wab-4.1.0/bin/activate
}

rsync-sales() {
  bash ~/proj/sales/scripts/rsync.bash "$@"
}

rsync-wab() {
  rsync -ri --exclude '.*.swp' --exclude 'node_modules/**' --exclude 'bower_components/**' "$@"
}

rsync-to-pod() { rsync-sales ~/proj/sales/ pod@eng:pod/sales-dev/ ; }
rsync-from-nut() { rsync-sales nut:pod/sales/ ~/proj/sales/ ; }
rsync-to-nut() { rsync-sales ~/proj/sales/ nut:pod/sales/ ; }
rsync-from-vm() { rsync-sales vm:proj/sales/ ~/proj/sales/ ; }
rsync-to-vm() { rsync-sales ~/proj/sales/ vm:proj/sales/ ; }
rsync-to-pod@keystone() { rsync-sales ~/proj/sales/ pod@keystone:pod/sales-dev/ ; }
rsync-to-keystone() { rsync-sales ~/proj/sales/ keystone:pod/sales/ ; }
rsync-to-playground() { rsync-sales "$@" ~/proj/sales/ playground:pod/sales/ ; }
rsync-from-playground() { rsync-sales playground:pod/sales/ ~/proj/sales/ ; }
rsync-p2-from-keystone() { rsync-sales keystone:pod/sales/sandbox/p2/ ~/proj/sales/sandbox/p2/ ; }
rsync-to-lnut() { rsync-sales ~/proj/sales/ lnut:pod/sales/ ; }
rsync-wab-from-vm() { rsync-wab vm:proj/wab/ ~/proj/wab/ ; }
rsync-wab-to-vm() { rsync-wab ~/proj/wab/ vm:proj/wab/ ; }
rsync-webreader-to-nut() { rsync-webreader ~/proj/web-reader/ nut:web-reader/ ; }

rsync-webreader() {
  rsync -ril \
    --exclude '*.egg-info' \
    --exclude '.git/' \
    --include '*/' \
    --include '*.py' \
    --exclude '*' \
    "$@"
}

rsync-p2() {
  rsync -ril \
    --exclude '.*.swp' \
    --exclude 'node_modules/**' \
    --exclude 'bower_components/**' \
    --exclude 'htmlcov' \
    --exclude 'test_root_orgdir' \
    --exclude '/pod_sales.egg-info' \
    --exclude '/pod/segrep/mocks/build' \
    --exclude '/pod/keystone/static/dist' \
    --exclude '.webassets-cache/**' \
    --exclude '.tmp/**' \
    --exclude '.git/**' \
    --include '/pod/' \
    --include '/glados/app/**' \
    --include '/glados/*' \
    --include '/glados/.*' \
    --include '/glados/test' \
    --include '*.py' \
    --include '*.coffee' \
    --include '*.html' \
    --include '*.jade' \
    --include '*.sass' \
    --include '*.css' \
    --include '*.js' \
    --include '*.proto' \
    --include '*.yaml' \
    --include '*.txt' \
    --include 'scripts/**' \
    --include 'test*/**.py' \
    --include 'sandbox/**.py' \
    --include '*/' \
    --include 'setup.py' \
    --exclude '*' \
    ~/proj/sales/ \
    keystone:pod/sales/
}

rsync-p2() {
  rsync -ril \
    --exclude '.*.swp' \
    --exclude 'node_modules/**' \
    --exclude 'bower_components/**' \
    --exclude 'htmlcov' \
    --exclude 'test_root_orgdir' \
    --exclude '/pod_sales.egg-info' \
    --exclude '/pod/segrep/mocks/build' \
    --exclude '/pod/keystone/static/dist' \
    --exclude '.webassets-cache/**' \
    --exclude '.tmp/**' \
    --exclude '.git/**' \
    --include '*.coffee' \
    --include '*/' \
    --exclude '*' \
    ~/proj/sales/sandbox/p2/ \
    keystone:pod/sales/sandbox/p2/
}

audio-to-video() {
  # From <https://superuser.com/questions/1041816/combine-one-image-one-audio-file-to-make-one-video-using-ffmpeg>
  ffmpeg -loop 1 -y -i "${2:-/Users/yang/Documents/Infer white logo.png}" -i "$1" -acodec copy -vcodec libx264 -shortest "${1%.*}.avi"
}

truncate-mp3() {
  local duration="$1" input="$2" output="${3:-${2%.mp3}-preview.mp3}"
  ffmpeg -y -t "$duration" -i "$input" -acodec copy "$output"
}
