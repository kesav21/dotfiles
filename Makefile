modules = .zshenv $(wildcard .config/*)
targets = $(foreach i, $(modules), $(HOME)/$(i))

.PHONY: all
all: $(targets)

$(targets): $(HOME)/%: %
	@ln -svf $(PWD)/$^ $@
