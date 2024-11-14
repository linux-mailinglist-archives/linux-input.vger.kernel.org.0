Return-Path: <linux-input+bounces-8078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37C9C8282
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A91B1F21788
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D510C1F5855;
	Thu, 14 Nov 2024 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaEo2NEO"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC21F584C;
	Thu, 14 Nov 2024 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562487; cv=none; b=SjT00Sq0H9+fkJX2HfdlI890mgYJUT7Qtm8lndoTg+MowiI2w890NgrUxKJInzUTeUIMKNANM+dcF/RO1Lk0dwKhpdMm0on7tv3YjrmwL2AlYpRqtmgZn/Luz2RWa4gYcn/D6Z260MJjv1j0dFLOIK4hz1j1DoYX02hPu9NVZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562487; c=relaxed/simple;
	bh=EevvnwGzwpUUegoCXMt6TpRxYOVenG4sbJ5c9EXGPmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D96gE5T1RD68CBR58QiR/R/nVByg0STtZ3Zn2HUKp6n+KqyIGCZu7wGqxtpAS/iqlcrK0Rf6e+gIi52nqCSbnHBwLQkZJU+tH5PbgADgV4e4LnWIDm618KmrSGBJNnxfA/giy8wFZkVQ4Y9Xj6qdgdkIEoKsHXBa+cFqwKqBgkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaEo2NEO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562486; x=1763098486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EevvnwGzwpUUegoCXMt6TpRxYOVenG4sbJ5c9EXGPmI=;
  b=HaEo2NEO24LUsd58cnogwA6cMCd8D2Q6/JBaVCoLYHjuta1tAjy66nTd
   X9qFGldLQNHSGYbsLYPUfHRsqWceMM9EvUTi9Wv5FPX135glL1DJxtIDF
   LO4GrHt1AbPD7s41/sk06PRi636kpBQ095eA4LaAn2V1XKnJf5rF/KY3d
   uraJvX5RqqHx9wewGTT6DoDApP9cg/8L5RQYvc6tUFvdAD96XWW/eCgJn
   MC/Pv5mVCizyhvIrx2kpBoMSmjnGXfdj+waDqtCitx1D8FFnhYi+E6SAp
   zSExJFCZ3XtFhERjNn/X4u34b9b8X0VsA9h5Sz+s87FFIeDC3EKI39yKP
   A==;
X-CSE-ConnectionGUID: Dt+okxiFRyCZ5Y3sGNwSAA==
X-CSE-MsgGUID: 4si/IEl/TmStmbi0IQr5ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30869048"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30869048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:34:45 -0800
X-CSE-ConnectionGUID: MZjI6M87TDGGU60h3ohPCA==
X-CSE-MsgGUID: E51ks0mNRb+FPIjO+yEimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92891534"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 21:34:42 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 07/22] HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
Date: Thu, 14 Nov 2024 13:34:01 +0800
Message-Id: <20241114053416.4085715-8-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241114053416.4085715-1-even.xu@intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
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
index 06ca0e5ba7f0..f2fb07f4092d 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -556,6 +556,120 @@ void thc_set_pio_interrupt_support(struct thc_device *dev, bool supported)
 }
 EXPORT_SYMBOL_NS_GPL(thc_set_pio_interrupt_support, INTEL_THC);
 
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
+EXPORT_SYMBOL_NS_GPL(thc_ltr_config, INTEL_THC);
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
+EXPORT_SYMBOL_NS_GPL(thc_change_ltr_mode, INTEL_THC);
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
+EXPORT_SYMBOL_NS_GPL(thc_ltr_unconfig, INTEL_THC);
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
index d4b67b81e954..4a1153022605 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -653,6 +653,27 @@
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


