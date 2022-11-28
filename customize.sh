#!/sbin/sh

SKIPUNZIP=1
ASH_STANDALONE=1

if [ $BOOTMODE ! = true ] ; then
  abort "Error: Please install in Magisk Manager"
fi

unzip -qo "${ZIPFILE}" -x 'META-INF/*' -d $MODPATH

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin/ 0 0 0755 0700

if [ ! -f /data/adb/modules/core_update/disable ] ; then
  for core in $(ls $MODPATH/system/bin/) ; do
    cat $MODPATH/system/bin/$core > /system/bin/$core
    set_perm /system/bin/$core 0 0 0700
  done
fi
