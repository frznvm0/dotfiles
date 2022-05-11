export PATH=$HOME/.local/bin:$HOME/.local/share/google-cloud-sdk/bin:$PATH
export LC_ALL=$LANG
export ENV=$HOME/.env

[ -L $HOME/.cache ] && [ -d $HOME/.cache/ ] ||
  ln -sf $(mktemp -d) $HOME/.cache

SSH_AUTH_SOCK=~/.cache/ssh-agent.sock
SSH_AGENT_PIDFILE=~/.cache/ssh-agent.pid
if [ -S $SSH_AUTH_SOCK ] && [ -d /proc/$(cat $SSH_AGENT_PIDFILE 2>/dev/null) ]; then
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID="$(cat $SSH_AGENT_PIDFILE)"
else
  eval "$(ssh-agent -sa $SSH_AUTH_SOCK)"
  echo $SSH_AGENT_PID > $SSH_AGENT_PIDFILE
fi

[ "$(tty)" = /dev/tty1 ] &&
  exec ~/.wlrc #startx
