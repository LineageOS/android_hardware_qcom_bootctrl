ifneq ($(filter msm8996 msm8953,$(TARGET_BOARD_PLATFORM)),)
ifeq ($(AB_OTA_UPDATER),true)
LOCAL_PATH := $(call my-dir)

# HAL Shared library for the target. Used by libhardware.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += hardware/libhardware/include
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog $(TARGET_RECOVERY_UPDATER_LIBS) libcutils
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
include $(BUILD_SHARED_LIBRARY)

# Static library for the target. Used by update_engine_sideload from recovery.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += hardware/libhardware/include
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog $(TARGET_RECOVERY_UPDATER_LIBS) libcutils
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
include $(BUILD_STATIC_LIBRARY)

endif
endif
