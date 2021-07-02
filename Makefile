ASSETS = ibd-imputation

all: $(ASSETS)

$(ASSETS):
	$(MAKE) -C $@

.PHONY: all $(ASSETS)
