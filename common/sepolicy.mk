#
# This policy configuration will be used by all products that
# inherit from Morbid
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/dynamic \
    device/morbid/sepolicy/common/system \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/dynamic \
    device/morbid/sepolicy/common/vendor \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter

endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/morbid/sepolicy/atv/sepolicy.mk
endif

# Flipendo
BOARD_SEPOLICY_DIRS += \
    hardware/google/pixel-sepolicy/flipendo

# google_battery service
BOARD_SEPOLICY_DIRS += \
    hardware/google/pixel-sepolicy/googlebattery
