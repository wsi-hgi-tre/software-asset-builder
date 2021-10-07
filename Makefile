BUILD  = assets
ASSETS = $(shell find . -mindepth 2 -maxdepth 2 -name Makefile | cut -d/ -f2)

all: $(ASSETS)

clean: $(ASSETS:%=clean-%)
	rm -rf $(BUILD)

clean-%:
	$(MAKE) -C $* clean

$(ASSETS): | $(BUILD)
	$(MAKE) -C $@
	ln -f $@/$@.deb $(BUILD)/

$(BUILD):
	mkdir -p $@

.PHONY: all clean clean-% $(ASSETS)
