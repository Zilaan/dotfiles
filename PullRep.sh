find ~/.vim/bundle/ -type d -name .git \
  | xargs -n 1 dirname \
  | while read line; do echo $line && cd $line && git pull; done
