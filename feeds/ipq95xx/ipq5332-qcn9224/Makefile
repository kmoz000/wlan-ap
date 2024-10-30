include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=ipq5332-qcn9224-wifi
PKG_RELEASE:=1
PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile

endef

define Package/ipq5332-qcn9224-wifi-default
  SUBMENU:=ipq5332-qcn9224 DTS-Specific Overrides
  SECTION:=firmware
  CATEGORY:=Firmware
  DEPENDS:=@(TARGET_ipq53xx)
  TITLE:=Custom Board
endef

define Package/ipq5332-qcn9224-wifi-qcom-qcn9274
$(call Package/ipq5332-qcn9224-wifi-default)
    TITLE:=QCA MI01.2 9124 DTS eval kits
endef

define Package/ipq5332-qcn9224-wifi-qcom-qcn9274/install
	$(INSTALL_DIR) $(1)/lib/firmware/IPQ5332
	$(CP) -r $(PKG_BUILD_DIR)/ipq5332-qcn9224/wifi/* \
		$(1)/lib/firmware/IPQ5332
endef

$(eval $(call BuildPackage,ipq5332-qcn9224-wifi-qcom-qcn9274))
