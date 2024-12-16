Return-Path: <linux-input+bounces-8583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC89F27E7
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 709A31655F8
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521BA139CEF;
	Mon, 16 Dec 2024 01:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frheV0Cf"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559513A24D;
	Mon, 16 Dec 2024 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313334; cv=none; b=koG7uUe2wAUsv3aNtlW8XEchr9xP4xC3uK9/k+qpuIn9029gR1w/v03WDLCxBy9bRqvDuDhL/cLc4Q7SiNHczwn9NSeW5m2i648w2MktvIhBsXR/dpWZxXJYJfucGTzfV03j581EIXeAMrW2AqYZ5nnNu7Pmh1ke9x74RvNwSIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313334; c=relaxed/simple;
	bh=eWC65HK46t+PpgXGIHBAgkW5f8olh2v5dxR/WB3uSJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=trh4xEGSY+Gzfb9CIKIQzc7TYcAu68OOEg7VPQIYmldmnwVVgB1GoG/ZeYvGFo8brjDex/jZgP+iMKC+55QuOwskPO87PjMfPPMZV487mBTVJwguHUUa4F8zxBBHV5Hv3EvvTl9gNS5rTcE9h6F+nbeoOoiud/JEdu8EZv7L6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frheV0Cf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313332; x=1765849332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eWC65HK46t+PpgXGIHBAgkW5f8olh2v5dxR/WB3uSJk=;
  b=frheV0Cf5Zt0bH9nh49JT27m+0V7vhon4IJzFmBUMHGOHRAlSRDH2PhZ
   yRsGzdeLpdeeIP3vZ7EBDccCusJQie9yv2T2Eh4j8PfGipfzlqJg00jzR
   lweoAVmW9tHyLg2YXPIpU2bDSVKn02WbgGFHaNossAw6uWEeW330/noKc
   8grY/hi0jol4PYmx6FNnIxgcAZR/zrSkHCzqdBQYcTZkrk8Y67AOryTJh
   i6r038YG3LLT3AhlFEF1a4HcLP03Th7JyzbDwp/FvMitz81wP5+QAiOSA
   NGTgqU8rPuwyHc8KBlsHdVO6zStlcGJ0AztyKKpTLICaN/+uSjJar5wa9
   w==;
X-CSE-ConnectionGUID: 2RSKmQjMT7SKcu4x36dYQw==
X-CSE-MsgGUID: TMqqPtGIRVK4HweATy1xVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34012987"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34012987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:12 -0800
X-CSE-ConnectionGUID: CbiSibYiRxyT3JiUPPz+Iw==
X-CSE-MsgGUID: K/ELDRBCSnq597UjPfklHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084205"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:08 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 07/22] HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
Date: Mon, 16 Dec 2024 09:41:12 +0800
Message-Id: <20241216014127.3722172-8-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xinpeng Sun <xinpeng.sun@intel.com>

THC supports LTR configuration and runtimely mode switching. There
are two LTR modes: Active LTR and Low Power LTR.

THC hardware layer provides APIs for LTR configuration and mode
switching.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 114 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |   3 +
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  21 ++++
 3 files changed, 138 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 4cb9ceaf395c..f09832016d9c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -688,6 +688,120 @@ void thc_set_pio_interrupt_support(struct thc_device *dev, bool supported)
 }
 EXPORT_SYMBOL_NS_GPL(thc_set_pio_interrupt_support, "INTEL_THC");
 
+/**
+ * thc_ltr_config - Configure THC Latency Tolerance Reporting(LTR) settings
+ *
+ * @dev: The pointer of THC private device context
+ * @active_ltr_us: active LTR value, unit is us
+ * @lp_ltr_us: low power LTR value, unit is us
+ */
+void thc_ltr_config(struct thc_device *dev, u32 active_ltr_us, u32 lp_ltr_us)
+{
+	u32 active_ltr_scale, lp_ltr_scale, ltr_ctrl, ltr_mask, orig, tmp;
+
+	if (active_ltr_us >= THC_LTR_MIN_VAL_SCALE_3 &&
+	    active_ltr_us < THC_LTR_MAX_VAL_SCALE_3) {
+		active_ltr_scale = THC_LTR_SCALE_3;
+		active_ltr_us = active_ltr_us >> 5;
+	} else if (active_ltr_us >= THC_LTR_MIN_VAL_SCALE_4 &&
+		   active_ltr_us < THC_LTR_MAX_VAL_SCALE_4) {
+		active_ltr_scale = THC_LTR_SCALE_4;
+		active_ltr_us = active_ltr_us >> 10;
+	} else if (active_ltr_us >= THC_LTR_MIN_VAL_SCALE_5 &&
+		   active_ltr_us < THC_LTR_MAX_VAL_SCALE_5) {
+		active_ltr_scale = THC_LTR_SCALE_5;
+		active_ltr_us = active_ltr_us >> 15;
+	} else {
+		active_ltr_scale = THC_LTR_SCALE_2;
+	}
+
+	if (lp_ltr_us >= THC_LTR_MIN_VAL_SCALE_3 &&
+	    lp_ltr_us < THC_LTR_MAX_VAL_SCALE_3) {
+		lp_ltr_scale = THC_LTR_SCALE_3;
+		lp_ltr_us = lp_ltr_us >> 5;
+	} else if (lp_ltr_us >= THC_LTR_MIN_VAL_SCALE_4 &&
+		   lp_ltr_us < THC_LTR_MAX_VAL_SCALE_4) {
+		lp_ltr_scale = THC_LTR_SCALE_4;
+		lp_ltr_us = lp_ltr_us >> 10;
+	} else if (lp_ltr_us >= THC_LTR_MIN_VAL_SCALE_5 &&
+		   lp_ltr_us < THC_LTR_MAX_VAL_SCALE_5) {
+		lp_ltr_scale = THC_LTR_SCALE_5;
+		lp_ltr_us = lp_ltr_us >> 15;
+	} else {
+		lp_ltr_scale = THC_LTR_SCALE_2;
+	}
+
+	regmap_read(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET, &orig);
+	ltr_ctrl = FIELD_PREP(THC_M_CMN_LTR_CTRL_ACT_LTR_VAL, active_ltr_us) |
+		   FIELD_PREP(THC_M_CMN_LTR_CTRL_ACT_LTR_SCALE, active_ltr_scale) |
+		   THC_M_CMN_LTR_CTRL_ACTIVE_LTR_REQ |
+		   THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN |
+		   FIELD_PREP(THC_M_CMN_LTR_CTRL_LP_LTR_VAL, lp_ltr_us) |
+		   FIELD_PREP(THC_M_CMN_LTR_CTRL_LP_LTR_SCALE, lp_ltr_scale) |
+		   THC_M_CMN_LTR_CTRL_LP_LTR_REQ;
+
+	ltr_mask = THC_M_CMN_LTR_CTRL_ACT_LTR_VAL |
+		   THC_M_CMN_LTR_CTRL_ACT_LTR_SCALE |
+		   THC_M_CMN_LTR_CTRL_ACTIVE_LTR_REQ |
+		   THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN |
+		   THC_M_CMN_LTR_CTRL_LP_LTR_VAL |
+		   THC_M_CMN_LTR_CTRL_LP_LTR_SCALE |
+		   THC_M_CMN_LTR_CTRL_LP_LTR_REQ |
+		   THC_M_CMN_LTR_CTRL_LP_LTR_EN;
+
+	tmp = orig & ~ltr_mask;
+	tmp |= ltr_ctrl & ltr_mask;
+
+	regmap_write(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET, tmp);
+}
+EXPORT_SYMBOL_NS_GPL(thc_ltr_config, "INTEL_THC");
+
+/**
+ * thc_change_ltr_mode - Change THC LTR mode
+ *
+ * @dev: The pointer of THC private device context
+ * @ltr_mode: LTR mode(active or low power)
+ */
+void thc_change_ltr_mode(struct thc_device *dev, u32 ltr_mode)
+{
+	if (ltr_mode == THC_LTR_MODE_ACTIVE) {
+		regmap_write_bits(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET,
+				  THC_M_CMN_LTR_CTRL_LP_LTR_EN, 0);
+		regmap_write_bits(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET,
+				  THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN,
+				  THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN);
+		return;
+	}
+
+	regmap_write_bits(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET,
+			  THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN, 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET,
+			  THC_M_CMN_LTR_CTRL_LP_LTR_EN,
+			  THC_M_CMN_LTR_CTRL_LP_LTR_EN);
+}
+EXPORT_SYMBOL_NS_GPL(thc_change_ltr_mode, "INTEL_THC");
+
+/**
+ * thc_ltr_unconfig - Unconfigure THC Latency Tolerance Reporting(LTR) settings
+ *
+ * @dev: The pointer of THC private device context
+ */
+void thc_ltr_unconfig(struct thc_device *dev)
+{
+	u32 ltr_ctrl, bits_clear;
+
+	regmap_read(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET, &ltr_ctrl);
+	bits_clear = THC_M_CMN_LTR_CTRL_LP_LTR_EN |
+			THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN |
+			THC_M_CMN_LTR_CTRL_LP_LTR_REQ |
+			THC_M_CMN_LTR_CTRL_ACTIVE_LTR_REQ;
+
+	ltr_ctrl &= ~bits_clear;
+
+	regmap_write(dev->thc_regmap, THC_M_CMN_LTR_CTRL_OFFSET, ltr_ctrl);
+}
+EXPORT_SYMBOL_NS_GPL(thc_ltr_unconfig, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index f775b972b4f5..c25f2fd57c76 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -68,5 +68,8 @@ void thc_int_trigger_type_select(struct thc_device *dev, bool edge_trigger);
 void thc_interrupt_enable(struct thc_device *dev, bool int_enable);
 void thc_set_pio_interrupt_support(struct thc_device *dev, bool supported);
 int thc_interrupt_quiesce(const struct thc_device *dev, bool int_quiesce);
+void thc_ltr_config(struct thc_device *dev, u32 active_ltr_us, u32 lp_ltr_us);
+void thc_change_ltr_mode(struct thc_device *dev, u32 ltr_mode);
+void thc_ltr_unconfig(struct thc_device *dev);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index 093c36fb5e1f..b646bd3f36b2 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -656,6 +656,27 @@
 /* Interrupt Quiesce default timeout value */
 #define THC_QUIESCE_EN_TIMEOUT_US		USEC_PER_SEC /* 1s */
 
+/* LTR definition */
+/*
+ * THC uses scale to calcualte final LTR value.
+ * Scale is geometric progression of 2^5 step, starting from 2^0.
+ * For example, THC_LTR_SCALE_2(2) means 2^(5 * 2) = 1024, unit is ns.
+ */
+#define THC_LTR_SCALE_0				0
+#define THC_LTR_SCALE_1				1
+#define THC_LTR_SCALE_2				2
+#define THC_LTR_SCALE_3				3
+#define THC_LTR_SCALE_4				4
+#define THC_LTR_SCALE_5				5
+#define THC_LTR_MODE_ACTIVE			0
+#define THC_LTR_MODE_LP				1
+#define THC_LTR_MIN_VAL_SCALE_3			BIT(10)
+#define THC_LTR_MAX_VAL_SCALE_3			BIT(15)
+#define THC_LTR_MIN_VAL_SCALE_4			BIT(15)
+#define THC_LTR_MAX_VAL_SCALE_4			BIT(20)
+#define THC_LTR_MIN_VAL_SCALE_5			BIT(20)
+#define THC_LTR_MAX_VAL_SCALE_5			BIT(25)
+
 /*
  * THC PIO opcode default value
  * @THC_PIO_OP_SPI_TIC_READ: THC opcode for SPI PIO read
-- 
2.40.1


