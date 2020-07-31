.PHONY: sync

##########
# Manala #
##########

MANALA_MAKE_DIR := $(abspath $(patsubst %/Makefile,%,$(lastword $(MAKEFILE_LIST))))

include \
	$(MANALA_MAKE_DIR)/Makefile.manala

########
# Sync #
########

MANALA_HELP += $(SYNC_HELP)

SYNC_HELP = \
	$(call help_section,Sync) \
	$(call help,sync,Sync templates)

sync:
	$(call fail_unless,FROM)
	$(call confirm,Please confirm sync from \"$(FROM)\" packer template)
	for TEMPLATE in */; do \
		echo $$TEMPLATE; \
		cp $$FROM/.gitignore $$TEMPLATE; \
		cp -r $$FROM/.manala $$TEMPLATE; \
	done
