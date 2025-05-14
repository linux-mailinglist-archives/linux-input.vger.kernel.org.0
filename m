Return-Path: <linux-input+bounces-12357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCEAB62E9
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D9C619E4DE2
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A0B202F9A;
	Wed, 14 May 2025 06:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WARZgN/2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80707202C2A;
	Wed, 14 May 2025 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203648; cv=none; b=BJgDkh6OxxMxQjLn/W5DQpFbCYkzFVttwfSOvvr2pSS/puy0CiY2Bep+4hkpbRKdWBoBza2UPnQEc9G7Ik8nx46ffyu3GEh5ktZ1DCSorhUWtm4cOAbUPeYRL0OVSJRU1pgVBTAn+QgAS9Xw91INrSjf4WDd8f3wF9ClolNfVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203648; c=relaxed/simple;
	bh=Dq1XYw3Ci71KWf7ui1IOAXa5SikkXGBC0na7Uru9pBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VfMMMeMD6FxQz4ijZQxWRH9G6kXXcmn77QdDfGJyNgu1MGwOsE1pdCZpCA8r4JUhP4em6mdWTyoLJmV0r5azl+npSak7P7qd/FlGtoCfu0MEEFAbQvRUsn7lljL+7hOFm91HDesPyG5GBj/PiB9faKsi8y4kahDNZIZMUiQDRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WARZgN/2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203646; x=1778739646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dq1XYw3Ci71KWf7ui1IOAXa5SikkXGBC0na7Uru9pBU=;
  b=WARZgN/22imr8Ou1wouKA+YDWABD9iYhanZh69W45KZNmFj3mrxFsPFG
   Dp57wbsAmhUnFuP2Iv8p6VLTLgwsS0aKysSbXFRs6OgpOYFMRkKd6yB2z
   MPB6Cshs9ETcur7fO4I3GWpTpBf7l08gZmQyIk3Rfrm/96A6zYbmIrwr7
   kNOozUrrvC0IedeGSXPfSDkQlVKhSuF0kg8UjNqrv2E0D8/9gnMryB4yq
   YPWgU9HEDFNkC1+oUL9fKUx1rRv9uX/0gjziNYga+OwWzdtptFCXMm7OW
   ZNGv7Njd6cykuc+2Si6gYfBArr3PzVpE4Fnb8tIWjoEIlUQPmRTfK0fjP
   A==;
X-CSE-ConnectionGUID: mEp2WIvHTFShJHwea89xSg==
X-CSE-MsgGUID: AlSi6UANQdOZ+47KbFg5QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192369"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:46 -0700
X-CSE-ConnectionGUID: O9taSoOCQlS6bkwsxI0KtA==
X-CSE-MsgGUID: J8PCuBGqRSeNzXmf+5D0Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138867002"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:44 -0700
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
Subject: [PATCH v1 4/7] HID: Intel-thc-hid: Intel-thc: Introduce interrupt delay control
Date: Wed, 14 May 2025 14:19:41 +0800
Message-Id: <20250514061944.125857-5-even.xu@intel.com>
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

This patch adds support for a new feature, named "Interrupt Delay",
allowing driver to set a specific delay time for next interrupt
detection. It gives driver a capability to control THC waiting time for
the next interrupt, to reduce the likelihood of spurious readings.

APIs added:
- thc_i2c_set_rx_int_delay(): Set I2C Rx input interrupt delay value
- thc_i2c_rx_int_delay_enable(): Enable or disable I2C Rx interrupt delay

As this interrupt delay feature is only applicable to RxDMA and must
remain disabled during SWDMA operations, it also involves a change
in SWDMA code to record the max input size control feature state
before SWDMA and restore the state after SWDMA.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/hid/intel-thc-hid.rst           | 13 ++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 71 +++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  6 ++
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   | 18 +++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  3 +
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  2 +
 6 files changed, 113 insertions(+)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 52b80f06f744..9f86164e7356 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -202,6 +202,19 @@ input packet size with the given max size:
 This feature is used to avoid data corruption which will cause RxDMA buffer overrun issue for
 I2C bus, and enhance whole system stability.
 
+2.4 Interrupt delay
+-------------------
+
+Because of MCU performance limitation, some touch devices cannot de-assert interrupt pin
+immediately after input data is transferred, which cause an interrupt toggle delay. But THC
+always detects next interrupt immediately after last input interrupt is handled. In this
+case, the delayed interrupt de-assertion will be recognized as a new interrupt signal by THC,
+and causes THC to start an input report reading spuriously.
+
+In order to avoid this situation, THC introduced interrupt delay new feature in Panther Lake
+platform, where THC allows driver to set an interrupt delay. After this feature is enabled,
+THC will delay this given time for next interrupt detection.
+
 3. High level concept
 =====================
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 9b92437a298f..e1c25fad6409 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2024 Intel Corporation */
 
 #include <linux/bitfield.h>
+#include <linux/math.h>
 #include <linux/regmap.h>
 
 #include "intel-thc-dev.h"
@@ -1640,6 +1641,76 @@ int thc_i2c_rx_max_size_enable(struct thc_device *dev, bool enable)
 }
 EXPORT_SYMBOL_NS_GPL(thc_i2c_rx_max_size_enable, "INTEL_THC");
 
+/**
+ * thc_i2c_set_rx_int_delay - Set I2C Rx input interrupt delay value
+ * @dev: The pointer of THC private device context
+ * @delay_us: Interrupt delay value, unit is us
+ *
+ * Set @delay_us for I2C RxDMA input interrupt delay feature.
+ *
+ * Return: 0 on success, other error codes on failure.
+ */
+int thc_i2c_set_rx_int_delay(struct thc_device *dev, u32 delay_us)
+{
+	u32 val;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!delay_us)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &val);
+	if (ret)
+		return ret;
+
+	/* THC hardware counts at 10us unit */
+	val |= FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_I2C_INTERVAL, DIV_ROUND_UP(delay_us, 10));
+
+	ret = regmap_write(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, val);
+	if (ret)
+		return ret;
+
+	dev->i2c_int_delay_us = delay_us;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_set_rx_int_delay, "INTEL_THC");
+
+/**
+ * thc_i2c_rx_int_delay_enable - Enable I2C Rx interrupt delay
+ * @dev: The pointer of THC private device context
+ * @enable: Enable interrupt delay or not
+ *
+ * Enable or disable I2C RxDMA input interrupt delay feature.
+ * Input interrupt delay can only be enabled after interrupt delay value
+ * was set by thc_i2c_set_rx_int_delay().
+ *
+ * Return: 0 on success, other error codes on failure.
+ */
+int thc_i2c_rx_int_delay_enable(struct thc_device *dev, bool enable)
+{
+	u32 mask = THC_M_PRT_SPI_ICRRD_OPCODE_I2C_INTERVAL_EN;
+	u32 val = enable ? mask : 0;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!dev->i2c_int_delay_us)
+		return -EOPNOTSUPP;
+
+	ret = regmap_write_bits(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, mask, val);
+	if (ret)
+		return ret;
+
+	dev->i2c_int_delay_en = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_rx_int_delay_enable, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index 3e0bb0b31ed9..8666e2362e32 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -63,7 +63,9 @@ enum thc_int_type {
  * @perf_limit: The delay between read operation and write operation
  * @i2c_subip_regs: The copy of THC I2C sub-system registers for resuming restore
  * @i2c_max_rx_size: I2C Rx transfer max input size
+ * @i2c_int_delay_us: I2C input interrupt delay, unit is us
  * @i2c_max_rx_size_en: Bool value that indicates I2C max input size control enabled or not
+ * @i2c_int_delay_en: Bool value that indicates I2C input interrupt delay enabled or not
  */
 struct thc_device {
 	struct device *dev;
@@ -85,7 +87,9 @@ struct thc_device {
 	u32 *i2c_subip_regs;
 
 	u32 i2c_max_rx_size;
+	u32 i2c_int_delay_us;
 	bool i2c_max_rx_size_en;
+	bool i2c_int_delay_en;
 };
 
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
@@ -119,5 +123,7 @@ int thc_i2c_subip_regs_save(struct thc_device *dev);
 int thc_i2c_subip_regs_restore(struct thc_device *dev);
 int thc_i2c_set_rx_max_size(struct thc_device *dev, u32 max_rx_size);
 int thc_i2c_rx_max_size_enable(struct thc_device *dev, bool enable);
+int thc_i2c_set_rx_int_delay(struct thc_device *dev, u32 delay_us);
+int thc_i2c_rx_int_delay_enable(struct thc_device *dev, bool enable);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
index 5bef342cd738..82b8854843e0 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -725,6 +725,15 @@ static int thc_swdma_read_start(struct thc_device *dev, void *write_buff,
 		dev->dma_ctx->rx_max_size_en = true;
 	}
 
+	/*
+	 * Interrupt delay feature is in the same situation with max input size control feature,
+	 * needs record feature state before SWDMA.
+	 */
+	if (dev->i2c_int_delay_en) {
+		thc_i2c_rx_int_delay_enable(dev, false);
+		dev->dma_ctx->rx_int_delay_en = true;
+	}
+
 	mask = THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC |
 	       THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_RX_DLEN_EN;
 	val = FIELD_PREP(THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC, write_len) |
@@ -776,6 +785,15 @@ static int thc_swdma_read_completion(struct thc_device *dev)
 		dev->dma_ctx->rx_max_size_en = false;
 	}
 
+	/*
+	 * Restore input interrupt delay feature to previous state after SWDMA if it was
+	 * enabled before SWDMA, and reset temp rx_int_delay_en variable for next time.
+	 */
+	if (dev->dma_ctx->rx_int_delay_en) {
+		thc_i2c_rx_int_delay_enable(dev, true);
+		dev->dma_ctx->rx_int_delay_en = false;
+	}
+
 	thc_reset_dma_settings(dev);
 
 	dma_set_start_bit(dev, &dev->dma_ctx->dma_config[THC_RXDMA2]);
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
index 42cfd55c3e2c..78917400492c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -123,12 +123,15 @@ struct thc_dma_configuration {
  * @use_write_interrupts: Indicate TxDMA using interrupt or polling
  * @rx_max_size_en: Temp flag to indicate THC I2C Rx max input size control feature
  *                  enabled or not, only be used during SWDMA operation.
+ * @rx_int_delay_en: Temp flag to indicate THC I2C Rx interrupt delay feature
+ *                   enabled or not, only be used during SWDMA operation.
  */
 struct thc_dma_context {
 	struct thc_dma_configuration dma_config[MAX_THC_DMA_CHANNEL];
 	u8 use_write_interrupts;
 
 	bool rx_max_size_en;
+	bool rx_int_delay_en;
 };
 
 struct thc_device;
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index ed8e28858e0c..413730f8e3f7 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -400,6 +400,8 @@
 #define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_QIO	GENMASK(15, 8)
 
 #define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE		GENMASK(15, 0)
+#define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_INTERVAL		GENMASK(23, 16)
+#define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_INTERVAL_EN	BIT(30)
 #define THC_M_PRT_SPI_ICRRD_OPCODE_I2C_MAX_SIZE_EN	BIT(31)
 
 #define THC_M_PRT_INT_EN_SIPE				BIT(0)
-- 
2.40.1


