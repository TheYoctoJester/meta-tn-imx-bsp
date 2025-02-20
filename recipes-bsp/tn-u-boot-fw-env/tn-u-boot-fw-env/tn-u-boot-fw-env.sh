#!/bin/sh
MMC_TAR=$(cat /proc/cmdline | grep -io "mmcblk[[:digit:]]")
ARCH=$(uname -m)

if [ -z "$MMC_TAR" ]; then
       echo "Can not find MMC device path from kernel argument!"
       exit 1
fi

if [ ${ARCH} == 'aarch64' ];then
       echo -e "/dev/${MMC_TAR}\t0x400000\t0x4000" > /etc/fw_env.config
else
       echo -e "/dev/${MMC_TAR}\t0xc0000\t0x2000" > /etc/fw_env.config
fi

