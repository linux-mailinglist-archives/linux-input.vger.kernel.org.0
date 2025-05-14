Return-Path: <linux-input+bounces-12356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C9AB62EB
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF8E3A6733
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570C41FE474;
	Wed, 14 May 2025 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJR1SZYi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48710202978;
	Wed, 14 May 2025 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203646; cv=none; b=dF5t5/1/3RtCj9b6IvEBBna7WiPqALgfEWgGQ3GUKAx3BEJS0ZZzntc+YIoEIqpDodAoYpH83z75LMYxYNlBG2+qVqRZ7XYSW6halmAlHg2+hQQUDEosEosn7GAsnVN4BMrpAilM3YJrQTbf4aIClU1Xhq8MQO9R7eGlIf+6LXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203646; c=relaxed/simple;
	bh=n5kd8CCZSlwZ4U7XJFkOn3Tq2btt9JYOxgor8y1+5yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tyAnG6aTlmwRD1RlwqIpc8wP0/psSWxPX9RNYwNSztePsjViVWwPUXMw4wlzSimohE4d2VHe22zda/2qoNaOkLfphiLwlwEIRqnJTXUTLwHvREKQz3d3aWY54+lL64H9UeIIXrxDfHJLNCndAQ9nIuCKqkBmPVD5QRReUN3IDuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJR1SZYi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203644; x=1778739644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n5kd8CCZSlwZ4U7XJFkOn3Tq2btt9JYOxgor8y1+5yA=;
  b=eJR1SZYiSL5AeHAuAsmWORHJCU7Awz9gmkCBS/adLR1NLGuQnafnA1yc
   4hLSPpL8Gz1HhGAn9cRPyZTAm2R4CLOF/VpXkkzd39VYIS6hJVCGhuSHo
   FiyX+XM22tjLp/DerAOEKKVgmCVuKEvcyls4uRIfLXVwoL5PCU2R9gEyG
   hlnU/17AouVwLaoA/OSdC3Ps+0pMPfhK8NMiJ3b/4XlEqKaOGwYfxyvxO
   1zaKjHYCbS9A/sNFCVKeDCWLqACeIjLyjGjfmVzaHPCa2F/OTjajQgkZh
   65FIktwxymAiV1MiYe6u6Pke22v8ln6l9zVMdf6FSttpO3zYFf7MXkvIe
   g==;
X-CSE-ConnectionGUID: qt37FGvTRwKcA72haNIMrg==
X-CSE-MsgGUID: +7Lle5t2QWKrjjUFR58HgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192366"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:43 -0700
X-CSE-ConnectionGUID: LZMShITzSfCLG/Tl+aFbiA==
X-CSE-MsgGUID: 7CSRjUp/QtWwbuPJYAOa4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138866990"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:42 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/7] HID: Intel-thc-hid: Intel-thc: Introduce max input size control
Date: Wed, 14 May 2025 14:19:40 +0800
Message-Id: <20250514061944.125857-4-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250514061944.125857-1-even.xu@intel.com>
References: <20250514061944.125857-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for a new feature, named "Max Input Size
Control", allowing driver to set a maximum input size for RxDMA. This
enhancement aims to prevent RxDMA buffer overruns caused by data
corruption on the I2C bus, thereby improving overall system stability.

APIs added:
- thc_i2c_set_rx_max_size(): Set the maximum input size for I2C RxDMA.
- thc_i2c_rx_max_size_enable(): Enable or disable the max input size
  control.

As this max input size control feature is only applicable to RxDMA
and must remain disabled during SWDMA operations, it also involves
a change in SWDMA code to record the max input size control feature
state before SWDMA and restore the state after SWDMA.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/hid/intel-thc-hid.rst           | 14 ++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 69 +++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  7 ++
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   | 22 ++++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  4 ++
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  3 +
 6 files changed, 119 insertions(+)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..52b80f06f744 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -188,6 +188,20 @@ Control register.
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
 device ACPI _RST method to reset touch IC during initialization.
 
+2.3 Max input size control
+--------------------------
+
+This is a new feature introduced in Panther Lake platform, THC hardware allows driver to set
+a max input size for RxDMA. After this max size gets set and enabled, for every input report
+packet reading, THC hardware sequencer will first read incoming input packet size, then compare
+input packet size with the given max size:
+- if input packet size <= max size, THC continues using input packet size to finish the reading
+- if input packet size > max size, there is potential input data crash risk during
+  transferring, THC will use max size instead of input packet size for reading
+
+This feature is used to avoid data corruption which will cause RxDMA buffer overrun issue for
+I2C bus, and enhance whole system stability.
+
 3. High level concept
 =====================
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 4fc78b5a04b5..9b92437a298f 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1571,6 +1571,75 @@ int thc_i2c_subip_regs_restore(struct thc_device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(thc_i2c_subip_regs_restore, "INTEL_THC");
 
+/**
+ * thc_i2c_set_rx_max_size - Set I2C Rx transfer max input size
+ * @dev: The pointer of THC private device context
+ * @max_rx_size: Max input report packet size for input report
+ *
+ * Set @max_rx_size for I2C RxDMA max input size control feature.
+ *
+ * Return: 0 on success, other error codes on failure.
+ */
+int thc_i2c_set_rx_max_size(struct thc_device *dev, u32 max_rx_size)
+{
+	u32 val;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!max_rx_size)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &val);
+	if (ret)
+		return ret;
+
+	val |= FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE, max_rx_size);
+
+	ret = regmap_write(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, val);
+	if (ret)
+		return ret;
+
+	dev->i2c_max_rx_size = max_rx_size;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_set_rx_max_size, "INTEL_THC");
+
+/**
+ * thc_i2c_rx_max_size_enable - Enable I2C Rx max input size control
+ * @dev: The pointer of THC private device context
+ * @enable: Enable max input size control or not
+ *
+ * Enable or disable I2C RxDMA max input size control feature.
+ * Max input size control only can be enabled after max input size
+ * was set by thc_i2c_set_rx_max_size().
+ *
+ * Return: 0 on success, other error codes on failure.
+ */
+int thc_i2c_rx_max_size_enable(struct thc_device *dev, bool enable)
+{
+	u32 mask = THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE_EN;
+	u32 val = enable ? mask : 0;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!dev->i2c_max_rx_size)
+		return -EOPNOTSUPP;
+
+	ret = regmap_write_bits(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, mask, val);
+	if (ret)
+		return ret;
+
+	dev->i2c_max_rx_size_en = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_rx_max_size_enable, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index fb4d9d875860..3e0bb0b31ed9 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -62,6 +62,8 @@ enum thc_int_type {
  * @swdma_done: Bool value that indicates if SWDMA sequence is done
  * @perf_limit: The delay between read operation and write operation
  * @i2c_subip_regs: The copy of THC I2C sub-system registers for resuming restore
+ * @i2c_max_rx_size: I2C Rx transfer max input size
+ * @i2c_max_rx_size_en: Bool value that indicates I2C max input size control enabled or not
  */
 struct thc_device {
 	struct device *dev;
@@ -81,6 +83,9 @@ struct thc_device {
 	u32 perf_limit;
 
 	u32 *i2c_subip_regs;
+
+	u32 i2c_max_rx_size;
+	bool i2c_max_rx_size_en;
 };
 
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
@@ -112,5 +117,7 @@ int thc_i2c_subip_init(struct thc_device *dev, const u32 target_address,
 		       const u32 speed, const u32 hcnt, const u32 lcnt);
 int thc_i2c_subip_regs_save(struct thc_device *dev);
 int thc_i2c_subip_regs_restore(struct thc_device *dev);
+int thc_i2c_set_rx_max_size(struct thc_device *dev, u32 max_rx_size);
+int thc_i2c_rx_max_size_enable(struct thc_device *dev, bool enable);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
index 8f97e71df7f4..5bef342cd738 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -712,6 +712,19 @@ static int thc_swdma_read_start(struct thc_device *dev, void *write_buff,
 
 	thc_reset_dma_settings(dev);
 
+	/*
+	 * Max input size control feature is only available for RxDMA, it must keep disabled
+	 * during SWDMA operation, and restore to previous state after SWDMA is done.
+	 * Max input size variables in THC device context track hardware state, and keep change
+	 * when feature state was changed, so those variables cannot be used to record feature
+	 * state after state was changed during SWDMA operation. Here have to use a temp variable
+	 * in DMA context to record feature state before SWDMA operation.
+	 */
+	if (dev->i2c_max_rx_size_en) {
+		thc_i2c_rx_max_size_enable(dev, false);
+		dev->dma_ctx->rx_max_size_en = true;
+	}
+
 	mask = THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC |
 	       THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_RX_DLEN_EN;
 	val = FIELD_PREP(THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC, write_len) |
@@ -754,6 +767,15 @@ static int thc_swdma_read_completion(struct thc_device *dev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Restore max input size control feature to previous state after SWDMA if it was
+	 * enabled before SWDMA, and reset temp rx_max_size_en variable for next time.
+	 */
+	if (dev->dma_ctx->rx_max_size_en) {
+		thc_i2c_rx_max_size_enable(dev, true);
+		dev->dma_ctx->rx_max_size_en = false;
+	}
+
 	thc_reset_dma_settings(dev);
 
 	dma_set_start_bit(dev, &dev->dma_ctx->dma_config[THC_RXDMA2]);
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
index 2664f35383d1..42cfd55c3e2c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -121,10 +121,14 @@ struct thc_dma_configuration {
  * struct thc_dma_context - THC DMA context
  * @thc_dma_configuration: Array of all THC Channel configures
  * @use_write_interrupts: Indicate TxDMA using interrupt or polling
+ * @rx_max_size_en: Temp flag to indicate THC I2C Rx max input size control feature
+ *                  enabled or not, only be used during SWDMA operation.
  */
 struct thc_dma_context {
 	struct thc_dma_configuration dma_config[MAX_THC_DMA_CHANNEL];
 	u8 use_write_interrupts;
+
+	bool rx_max_size_en;
 };
 
 struct thc_device;
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index 6729c4c25dab..ed8e28858e0c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -399,6 +399,9 @@
 #define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_DIO	GENMASK(23, 16)
 #define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_QIO	GENMASK(15, 8)
 
+#define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE		GENMASK(15, 0)
+#define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE_EN	BIT(31)
+
 #define THC_M_PRT_INT_EN_SIPE				BIT(0)
 #define THC_M_PRT_INT_EN_SBO				BIT(1)
 #define THC_M_PRT_INT_EN_SIDR				BIT(2)
-- 
2.40.1


