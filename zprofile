if [ "$(tty)" = "/dev/tty1" ]; then
  clear; exec xinit &> ~/.xlog
fi

if [ -f /tmp/ssh-agent-$(id -u) ]; then
  export SSH_AUTH_SOCK=$(head -1 /tmp/ssh-agent-$(id -u))
  export SSH_AGENT_PID=$(tail -1 /tmp/ssh-agent-$(id -u))
else
  eval `ssh-agent`
  echo "$SSH_AUTH_SOCK" > /tmp/ssh-agent-$(id -u)
  echo "$SSH_AGENT_PID" >> /tmp/ssh-agent-$(id -u)
  echo "Please run ssh-add to add your keys to the agent"
fi

