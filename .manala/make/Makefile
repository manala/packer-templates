.PHONY: split sync

##########
# Manala #
##########

MANALA_MAKE_DIR := $(abspath $(patsubst %/Makefile,%,$(lastword $(MAKEFILE_LIST))))

include \
	$(MANALA_MAKE_DIR)/Makefile.manala \
	$(MANALA_MAKE_DIR)/Makefile.gitsplit

#########
# Split #
#########

MANALA_HELP += $(SPLIT_HELP)\n

SPLIT_HELP = \
	$(call help_section,Split) \
	$(call help,split,Split git repositories)

split:
	$(call gitsplit)

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
