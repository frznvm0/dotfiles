.PHONY: install update remove

install:
	git submodule update --init
	ln -s "${PWD}/vim" "${HOME}/.vim"
	ln -s "${PWD}/zsh" "${HOME}/.zsh"
	ln -s "${PWD}/gemrc" "${HOME}/.gemrc"
	ln -s "${PWD}/gitconfig" "${HOME}/.gitconfig"
	ln -s "${PWD}/gvimrc" "${HOME}/.gvimrc"
	ln -s "${PWD}/muttrc" "${HOME}/.muttrc"
	ln -s "${PWD}/pryrc" "${HOME}/.pryrc"
	ln -s "${PWD}/tmux.conf" "${HOME}/.tmux.conf"
	ln -s "${PWD}/vimrc" "${HOME}/.vimrc"
	ln -s "${PWD}/xinitrc" "${HOME}/.xinitrc"
	ln -s "${PWD}/Xresources" "${HOME}/.Xresources"
	ln -s "${PWD}/zprofile" "${HOME}/.zprofile"
	ln -s "${PWD}/zshenv" "${HOME}/.zshenv"
	ln -s "${PWD}/zshrc" "${HOME}/.zshrc"
	mkdir -p "${HOME}/bin"
	ln -s "${PWD}/bin/open" "${HOME}/bin"
	ln -s "${PWD}/bin/wallpaper" "${HOME}/bin"
	ln -s "${PWD}/bin/statusbar" "${HOME}/bin"

update:
	git pull
	git submodule update
	git submodule foreach git pull origin master

remove:
	rm -rv "${HOME}/.vim"
	rm -rv "${HOME}/.zsh"
	rm -v "${HOME}/.gemrc"
	rm -v "${HOME}/.gitconfig"
	rm -v "${HOME}/.gvimrc"
	rm -v "${HOME}/.muttrc"
	rm -v "${HOME}/.pryrc"
	rm -v "${HOME}/.tmux.conf"
	rm -v "${HOME}/.vimrc"
	rm -v "${HOME}/.xinitrc"
	rm -v "${HOME}/.Xresources"
	rm -v "${HOME}/.zprofile"
	rm -v "${HOME}/.zshenv"
	rm -v "${HOME}/.zshrc"
	rm -v "${HOME}/bin/open"
	rm -v "${HOME}/bin/wallpaper"
	rm -v "${HOME}/bin/statusbar"

