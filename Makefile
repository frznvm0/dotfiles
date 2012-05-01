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

remove:
	rm -ri "${HOME}/.vim"
	rm -ri "${HOME}/.zsh"
	rm -i "${HOME}/.gemrc"
	rm -i "${HOME}/.gitconfig"
	rm -i "${HOME}/.gvimrc"
	rm -i "${HOME}/.muttrc"
	rm -i "${HOME}/.pryrc"
	rm -i "${HOME}/.vimrc"
	rm -i "${HOME}/.xinitrc"
	rm -i "${HOME}/.Xresources"
	rm -i "${HOME}/.zprofile"
	rm -i "${HOME}/.zshenv"
	rm -i "${HOME}/.zshrc"
	rm -i "${HOME}/bin/open"
	rm -i "${HOME}/bin/wallpaper"
	rm -i "${HOME}/bin/statusbar"

