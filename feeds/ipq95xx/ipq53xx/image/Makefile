include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

UBIFS_OPTS = -m 2048 -e 124KiB -c 4096 -U -F
UBI_OPTS = -m 2048 -p 128KiB

IPQ53XX_KERNEL_SIZE=6044k
IPQ53XX_ROOTFS_SIZE=40036k
IPQ53XX_32_KERNEL_LOADADDR = 0x40008000
IPQ53XX_KERNEL_LOADADDR = 0x40080000

IMG_PREFIX:=$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)$(BOARD)

define Image/BuildKernel/ipq53xx_32
	$(foreach device, $(call FindDeviceTrees, ipq5332-), \
		$(call Image/BuildKernel/$(1),$(device),$(IPQ53XX_32_KERNEL_LOADADDR));)

	$(call Image/BuildKernel/MultiDTBFIT,ipq5332-mixx, \
		$(call FindDeviceTrees, ipq5332-), $(IPQ53XX_32_KERNEL_LOADADDR))
endef

# default all platform image(fit) build 
define Device/Default
  PROFILES = Default $$(DEVICE_NAME)
  FILESYSTEMS := squashfs
  DEVICE_DTS_DIR := $(DTS_DIR)/qcom
  KERNEL_IN_UBI := 1
  ROOTFSNAME_IN_UBI := ubi_rootfs
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGES := sysupgrade.tar nand-factory.bin
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  KERNEL_NAME := Image
  KERNEL = kernel-bin | gzip | fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  #KERNEL_INITRAMFS = kernel-bin | gzip | fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS = kernel-bin | fit none $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
endef

include ipq53xx.mk

$(eval $(call BuildImage))
