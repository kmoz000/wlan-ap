include $(TOPDIR)/rules.mk

PKG_NAME:=ath12k-firmware
PKG_MIRROR_HASH:=692c7d82b6a5206af8210c44a0c1fd903a6bb2037d7ed7956db71b9779169be6
PKG_SOURCE_PROTO:=git
PKG_BRANCH:=main
PKG_SOURCE_URL:=https://github.com/kmoz000/upstream-wifi-fw.git
PKG_SOURCE_VERSION:=572404654cbf392827b9b20a1ccec6e82b192c9c

PKG_MAINTAINER:=John Crispin <john@phrozen.org>

include $(INCLUDE_DIR)/package.mk

define Package/ath12k-firmware-default
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=$(PKG_SOURCE_URL)
  DEPENDS:=
endef

define Package/ath12k-firmware-qcn92xx-split-phy
  $(Package/ath12k-firmware-default)
  TITLE:=ath12k firmware for qcn92xx split phy devices
  DEPENDS:=@(TARGET_ipq95xx||TARGET_ipq53xx)
endef

define Package/ath12k-firmware-qcn92xx
  $(Package/ath12k-firmware-default)
  TITLE:=ath12k firmware for qcn92xx devices
  DEPENDS:=@(TARGET_ipq95xx||TARGET_ipq53xx)
endef

define Package/ath12k-firmware-ipq53xx
  $(Package/ath12k-firmware-default)
  TITLE:=ath12k firmware for ipq53xx devices
  DEPENDS:=@TARGET_ipq53xx
endef

define Package/ath12k-firmware-ipq53xx-wk-wk
  $(Package/ath12k-firmware-default)
  TITLE:=ath12k firmware for ipq53xx + wk + wk devices
  DEPENDS:=@TARGET_ipq53xx
endef

define Build/Compile

endef

define Package/ath12k-firmware-qcn92xx-split-phy/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath12k/QCN92XX/hw1.0
	$(CP) $(PKG_BUILD_DIR)/ath12k-firmware/QCN9274/hw2.0_split_phy/1.3.1/WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1/* \
		$(1)/lib/firmware/ath12k/QCN92XX/hw1.0
endef

define Package/ath12k-firmware-qcn92xx/install
	$(INSTALL_DIR) $(1)/lib/firmware/ath12k/QCN92XX/hw1.0
	$(CP) $(PKG_BUILD_DIR)/ath12k-firmware/QCN9274/hw2.0/1.3.1/WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1/* \
		$(1)/lib/firmware/ath12k/QCN92XX/hw1.0
endef

define Package/ath12k-firmware-ipq53xx/install
	$(INSTALL_DIR) $(1)/lib/firmware/IPQ5332/
	$(CP) $(PKG_BUILD_DIR)/ath12k-firmware/IPQ5322/hw1.0/1.3.1/WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1/* \
		$(1)/lib/firmware/IPQ5332/
endef

define Package/ath12k-firmware-ipq53xx-wk-wk/install
	$(INSTALL_DIR) $(1)/lib/firmware/IPQ5332/
	$(CP) $(PKG_BUILD_DIR)/ath12k-firmware/IPQ5322_QCN6432_QCN6432/hw1.0/1.3.1/WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1/* \
		$(1)/lib/firmware/IPQ5332/
endef

$(eval $(call BuildPackage,ath12k-firmware-qcn92xx))
$(eval $(call BuildPackage,ath12k-firmware-qcn92xx-split-phy))
$(eval $(call BuildPackage,ath12k-firmware-ipq53xx))
$(eval $(call BuildPackage,ath12k-firmware-ipq53xx-wk-wk))
