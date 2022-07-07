
LANGUAGES = python nodejs haskell crystal rust golang ruby java clojure elixir erlang

.PHONY: install-languages
install-languages:
	asdf plugin-add python
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf plugin-add haskell https://github.com/vic/asdf-haskell.git
	asdf plugin-add crystal https://github.com/asdf-community/asdf-crystal.git
	asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
	asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf plugin-add java https://github.com/halcyon/asdf-java.git
	asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git
	asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
	asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
	$(foreach language, $(LANGUAGES), asdf install $(language) latest;)
