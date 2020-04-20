#
# This policy configuration will be used by all products that
# inherit from Calyx
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/calyx/sepolicy/common/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/calyx/sepolicy/common/public

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/calyx/sepolicy/common/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/calyx/sepolicy/common/dynamic \
    vendor/calyx/sepolicy/common/vendor
endif
