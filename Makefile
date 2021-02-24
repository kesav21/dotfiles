modules = .zshenv $(wildcard .config/*)
targets = $(foreach i, $(modules), $(HOME)/$(i))

all: $(targets)

$(targets): $(HOME)/%: %
	@ln -svf $(PWD)/$^ $@

.PHONY: all
