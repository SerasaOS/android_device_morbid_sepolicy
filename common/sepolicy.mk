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
    device/morbid/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/dynamic \
    device/morbid/sepolicy/common/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/morbid/sepolicy/atv/sepolicy.mk
endif

# Pixel common
TARGET_INCLUDE_PIXEL_SEPOLICY ?= true
ifeq ($(TARGET_INCLUDE_PIXEL_SEPOLICY), true)
BOARD_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/private/google

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/system/google
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/morbid/sepolicy/common/vendor/google
endif

# Flipendo
BOARD_SEPOLICY_DIRS += \
    hardware/google/pixel-sepolicy/flipendo

# google_battery service
BOARD_SEPOLICY_DIRS += \
    hardware/google/pixel-sepolicy/googlebattery

# turbo_adapter
BOARD_SEPOLICY_DIRS += \
    hardware/google/pixel-sepolicy/turbo_adapter
endif
