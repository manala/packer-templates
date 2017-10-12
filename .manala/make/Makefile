.PHONY: split sync

##########
# Manala #
##########

MANALA_DIR := $(abspath $(patsubst %/make/Makefile,%,$(firstword $(filter %.manala/make/Makefile,$(MAKEFILE_LIST)))))

include \
	$(MANALA_DIR)/make/Makefile.manala \
	$(MANALA_DIR)/make/Makefile.gitsplit

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
