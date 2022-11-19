ROOT_DIR := $(shell getent passwd nezlit  | cut -d: -f6)
CURRENT_DIR := ${CURDIR}

PKG_INSTALL = yes | pacman -S

LANGUAGES = python nodejs haskell crystal golang ruby java clojure elixir erlang

.PHONY: install-languages
install-languages:
	-asdf plugin-add python
	-asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	-asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
	-asdf plugin-add crystal https://github.com/asdf-community/asdf-crystal.git
	-asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
	-asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	-asdf plugin-add java https://github.com/halcyon/asdf-java.git
	-asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git
	-asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
	-asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
	$(foreach language, $(LANGUAGES), asdf install $(language) latest;)

.PHONY: install-emacs
install-emacs:
	$(PKG_INSTALL) emacs

.PHONY: install-doom
install-doom: install-emacs
	git clone --depth 1 https://github.com/doomemacs/doomemacs $(ROOT_DIR)/.emacs.d
	$(ROOT_DIR)/.emacs.d/bin/doom install

.PHONY: create-dotfiles-syml
create-dotfiles-syml:
	ln -sf $(CURRENT_DIR)/.zshrc $(ROOT_DIR)/.zshrc
	ln -sf $(CURRENT_DIR)/.config/alacritty $(ROOT_DIR)/.config/alacritty
	ln -sf $(CURRENT_DIR)/.config/i3 $(ROOT_DIR)/.config/i3
	ln -sf $(CURRENT_DIR)/.config/polybar $(ROOT_DIR)/.config/polybar
	ln -sf $(CURRENT_DIR)/.config/lvim $(ROOT_DIR)/.config/lvim
	ln -sf $(CURRENT_DIR)/.gitconfig $(ROOT_DIR)/.gitconfig
	ln -sf $(CURRENT_DIR)/.doom.d $(ROOT_DIR)/.doom.d
