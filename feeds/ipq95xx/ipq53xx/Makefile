include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=ipq53xx
BOARDNAME:=Qualcomm Technologies, Inc IPQ53xx
FEATURES:=ubifs squashfs fpu ramdisk nand pcie usbgadget
CPU_TYPE:=cortex-a73
CPU_SUBTYPE:=neon-vfpv4
MAINTAINER:=John Crispin <blogic@openwrt.org>
SUBTARGETS:=generic ipq53xx_32 ipq95xx_32

KERNELNAME:=zImage Image dtbs

KERNEL_PATCHVER:=5.4
KERNEL_NAME_SUFFIX=-qsdk-b2d40c94fad765a48c03f492d669aeecbbb9b617

GENERIC_BACKPORT_DIR :=
GENERIC_PATCH_DIR :=
GENERIC_HACK_DIR :=
GENERIC_FILES_DIR := 
GENERIC_LINUX_CONFIG:=${CURDIR}/config-$(KERNEL_PATCHVER)-qsdk

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	uboot-envtools kmod-leds-gpio kmod-gpio-button-hotplug kmod-button-hotplug \
	kmod-usb3 swconfig kmod-qca-nss-dp \
	kmod-usb-phy-ipq5018 kmod-usb-dwc3-qcom-internal \
	kmod-qca-nss-ppe kmod-qca-ssdk-nohnat kmod-qca-psdk \
	kmod-gpio-button-hotplug iwinfo uboot-envtools swconfig \
	kmod-ath12k wpad-openssl \
	-procd-ujail

$(eval $(call BuildTarget))
