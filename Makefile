# Makefile

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

ifeq (${KERNELRELEASE},)
    KERNEL_SOURCE := ../linux
    PWD := $(shell pwd)
default:
	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} modules

clean:
	${MAKE} -C ${KERNEL_SOURCE} SUBDIRS=${PWD} clean

else
	obj-m := mac802154_hwsim.o
	CFLAGS_mac802154_hwsim.o := -DDEBUG
endif

remote_install:
	scp mac802154_hwsim.ko pi@raspberrypi.local:
