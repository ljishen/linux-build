include Makefile.versions.mk

export RELEASE_NAME ?= $(VERSION)~dev
export RELEASE ?= 1

BUILD_SYSTEMS := xenial bionic disco stretch buster
BUILD_VARIANTS := minimal mate lxde i3 openmediavault containers
BUILD_ARCHS := armhf arm64
BUILD_MODELS := rock64 rockpro64 pinebookpro rockpi4b

BOARD_TARGET ?= rock64

ifeq (,$(filter $(BUILD_MODELS), $(BOARD_TARGET)))
$(error Unsupported BOARD_TARGET)
endif

IMAGE_SUFFIX := $(RELEASE_NAME)-$(RELEASE)

all: linux-variants linux-virtual

ifneq (,$(CI))
include Makefile.latest.mk
endif

include Makefile.package.mk
include Makefile.system.mk
include Makefile.variants.mk
include Makefile.dev.mk
