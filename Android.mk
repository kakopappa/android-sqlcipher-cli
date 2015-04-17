 #
# Before building using this do:
#	make -f Android.mk build-local-hack
#   ndk-build
#   ndk-build
#	make -f Android.mk copy-libs-hack

PROJECT_ROOT_PATH := $(call my-dir)
LOCAL_PATH := $(PROJECT_ROOT_PATH)
LOCAL_PRELINK_MODULE := false

project_ldflags:= -Landroid-libs/$(TARGET_ARCH_ABI)/

#------------------------------------------------------------------------------#
# libsqlite3 

#------------------------------------------------------------------------------#
# sqlite3-static-cli

include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3-static-cli
LOCAL_MODULE_FILENAME   := sqlite3-static
LOCAL_STATIC_LIBRARIES  := libsqlite3-a

LOCAL_SRC_FILES := \
  shell.c \
  sqlite3.c

LOCAL_C_INCLUDES += \
  $(LOCAL_PATH)
 
LOCAL_EXPORT_C_INCLUDES := ./openssl/include/openssl
LOCAL_CFLAGS            := -DSQLITE_THREADSAFE=1 -fPIE
LOCAL_LDFLAGS           := -fPIE -pie

LOCAL_CFLAGS := \
  -Wno-multichar \
  -D_ANDROID \
  -DLIBDIR="c" \
  -DIN_LIBRARY \
  -DSQLITE_HAS_CODEC=1 \
  -DCODEC_TYPE=CODEC_TYPE_AES128 \
  -DSQLITE_CORE \
  -DTHREADSAFE \
  -DSQLITE_SECURE_DELETE \
  -DSQLITE_SOUNDEX \
  -DSQLITE_ENABLE_COLUMN_METADATA \
  -DSQLITE_THREADSAFE=1 \
  -fPIE

include $(BUILD_EXECUTABLE)


