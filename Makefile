BUILD = assets
ASSETS = ibd-imputation

all: $(ASSETS)

clean:
	for target in $(ASSETS); do \
	  $(MAKE) -C $${target} $@; \
	done
	rm -rf $(BUILD)

$(ASSETS): $(BUILD)
	$(MAKE) -C $@
	ln -f $@/$@.deb $(BUILD)/

$(BUILD):
	mkdir $@

.PHONY: all clean $(ASSETS)
