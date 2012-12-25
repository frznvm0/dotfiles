source ~/.zshenv

if [ "$(tty)" = "/dev/tty1" ]; then
  clear; exec startx &> ~/.xlog
fi

if [ -e "$HOME/.ssh/auth.sock" ]; then
  export SSH_AUTH_SOCK="$HOME/.ssh/auth.sock"
  export SSH_AGENT_PID=$(cat "$HOME/.ssh/agent.pid")
else
  eval `ssh-agent`
  ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/auth.sock"
  echo "$SSH_AGENT_PID" > "$HOME/.ssh/agent.pid"
  echo "Please run ssh-add to add your keys to the agent"
fi

