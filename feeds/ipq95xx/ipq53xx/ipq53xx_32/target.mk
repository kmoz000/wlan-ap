
ARCH:=arm
SUBTARGET:=ipq53xx_32
BOARDNAME:=QTI IPQ53XX(32bit) based boards
CPU_TYPE:=cortex-a7

DEFAULT_PACKAGES += \
	uboot-2016-ipq5332 uboot-2016-ipq5332_tiny fwupgrade-tools \
	kmod-usb-phy-ipq5018 kmod-usb-dwc3-qcom-internal kmod-bt_tty kmod-clk-test

define Target/Description
	Build firmware image for IPQ53xx SoC devices.
endef
