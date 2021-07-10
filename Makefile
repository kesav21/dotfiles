modules = .zshenv $(wildcard .config/*) $(shell find .local/bin -type d ! -path .local/bin ! -path '.local/bin/.git*')
targets = $(foreach i, $(modules), $(HOME)/$(i))

.PHONY: all
all: $(targets)

$(targets): $(HOME)/%: %
	@ln -svf $(PWD)/$^ $@
