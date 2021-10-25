modules = .zshenv .pam_environment $(wildcard .config/*) .local/share/applications
targets = $(foreach i, $(modules), $(HOME)/$(i))

.PHONY: all
all: $(targets)

$(targets): $(HOME)/%: %
	@ln -svf $(PWD)/$^ $@
