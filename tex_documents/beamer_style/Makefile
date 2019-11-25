INS         = source/beamerthememetro.ins
PACKAGE_SRC = $(wildcard source/*.dtx)
PACKAGE_STY = $(notdir $(PACKAGE_SRC:%.dtx=%.sty))


DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(DESTDIR)/tex/latex/metro
CACHE_DIR   := $(shell pwd)/.latex-cache

export TEXINPUTS:=$(shell pwd):$(shell pwd)/source:${TEXINPUTS}



.PHONY: sty clean install uninstall clean-cache clean-sty


sty: $(PACKAGE_STY)

clean: clean-cache clean-sty

install: $(PACKAGE_STY) $(DOC_PDF)
	@echo metro sty files installed in $(INSTALL_DIR)
	@mkdir -p $(INSTALL_DIR)
	@cp $(PACKAGE_STY) $(INSTALL_DIR)

uninstall:
	@echo remove directory $(INSTALL_DIR)
	@rm -rf "$(INSTALL_DIR)"

clean-cache:
	@rm -rf "$(CACHE_DIR)"

clean-sty:
	@rm -f $(PACKAGE_STY)


$(CACHE_DIR):
	@mkdir -p $(CACHE_DIR)

$(PACKAGE_STY): $(PACKAGE_SRC) $(INS) | clean-cache $(CACHE_DIR)
	@cd $(dir $(INS)) && latex -output-directory=$(CACHE_DIR) $(notdir $(INS))
	@cp $(addprefix $(CACHE_DIR)/,$(PACKAGE_STY)) .
