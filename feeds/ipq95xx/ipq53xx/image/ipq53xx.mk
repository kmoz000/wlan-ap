KERNEL_LOADADDR := 0x40080000

define Device/FitImage
	KERNEL_SUFFIX := -fit-uImage.itb
	KERNEL = kernel-bin | gzip | fit gzip $$(DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitImageLzma
	KERNEL_SUFFIX := -fit-uImage.itb
	KERNEL = kernel-bin | lzma | fit lzma $$(DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitzImage
	KERNEL_SUFFIX := -fit-zImage.itb
	KERNEL = kernel-bin | fit none $$(DTS_DIR)/$$(DEVICE_DTS).dtb
	KERNEL_NAME := zImage
endef

define Device/UbiFit
	KERNEL_IN_UBI := 1
	IMAGES := nand-factory.ubi nand-sysupgrade.bin
	IMAGE/nand-factory.ubi := append-ubi
	IMAGE/nand-sysupgrade.bin := sysupgrade-tar | append-metadata
endef

define Device/cig_wf189
  DEVICE_TITLE := CIG WF189
  DEVICE_DTS := ipq5332-cig-wf189
  DEVICE_DTS_CONFIG := config@mi01.6
  IMAGES := sysupgrade.tar nand-factory.bin nand-factory.ubi
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  IMAGE/nand-factory.ubi := append-ubi
  DEVICE_PACKAGES := ath12k-wifi-cig-wf189 ath12k-firmware-qcn92xx-split-phy ath12k-firmware-ipq53xx
endef
TARGET_DEVICES += cig_wf189

define Device/wallys_dr5332
  $(call Device/FitImage)
	$(call Device/UbiFit)
	BLOCKSIZE := 128k
	PAGESIZE := 2048
  DEVICE_VENDOR := Wallys
	DEVICE_MODEL := DR5332
  DEVICE_DTS := ipq5332-wallys-dr5332
  DEVICE_DTS_CONFIG := config@mi01.2-qcn9160-c1
	SOC := qcom-ipq5332
  DEVICE_PACKAGES := ath12k-wifi-qcom-qcn9274 ath12k-firmware-qcn92xx-split-phy ath12k-firmware-ipq53xx
endef
TARGET_DEVICES += wallys_dr5332


define Device/sercomm_ap72tip
  DEVICE_TITLE := Sercomm AP72 TIP
  DEVICE_DTS := ipq5332-sercomm-ap72tip
  DEVICE_DTS_CONFIG := config@mi01.2-qcn9160-c1
  IMAGES := sysupgrade.tar nand-factory.bin nand-factory.ubi
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  IMAGE/nand-factory.ubi := append-ubi
  DEVICE_PACKAGES := ath12k-wifi-sercomm-ap72tip ath12k-firmware-qcn92xx-split-phy ath12k-firmware-ipq53xx
endef
TARGET_DEVICES += sercomm_ap72tip

define Device/edgecore_eap105
  DEVICE_TITLE := Edgecore EAP105
  DEVICE_DTS := ipq5332-edgecore-eap105
  DEVICE_DTS_CONFIG := config@mi01.6
  IMAGES := sysupgrade.tar nand-factory.bin nand-factory.ubi
  IMAGE/sysupgrade.tar := sysupgrade-tar | append-metadata
  IMAGE/nand-factory.bin := append-ubi | qsdk-ipq-factory-nand
  IMAGE/nand-factory.ubi := append-ubi
  DEVICE_PACKAGES := ath12k-wifi-edgecore-eap105 ath12k-firmware-qcn92xx-split-phy ath12k-firmware-ipq53xx
endef
TARGET_DEVICES += edgecore_eap105
