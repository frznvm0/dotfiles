# Setup hub function for git, if it is available; http://github.com/defunkt/hub
if [ "$commands[(I)hub]" ] && [ "$commands[(I)ruby]" ]; then
  function git() { hub "$@" } # eval `hub alias -s zsh`
  compdef hub=git
fi
