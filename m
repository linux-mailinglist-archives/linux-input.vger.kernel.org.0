Return-Path: <linux-input+bounces-8922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF05A01D72
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647041630D0
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E2118A6B2;
	Mon,  6 Jan 2025 02:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AV3pU9hn"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C3156C5E;
	Mon,  6 Jan 2025 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130735; cv=none; b=r8XykN2DEbrPFS/zIyPsPGMXkrsAvtZ4QgpmKgQ/K3jO+VUEbvb23dDw6Pk+rQraI1PDfvStFSnlpZDbSEIXVZti0Wo7S26o0RQ4CqBVl0ROtWdd0e4YnLIVpne+ooBbHaaY3Gp0+4C3d/PSUWtL+1wXbNkppIoupFh0viCJGvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130735; c=relaxed/simple;
	bh=cKm1F571EGNvkUXP4KmYC8HweM9aziQ/iJ7tPm2Tz34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EXY7O//gMOGSRRFDQKzoUhokSJ5S5fvYJXJBE8XkE1nbb7Kt+XDn/7gwxZxOiUnEjlA1K9lEyoUtWfSwRSouvLRtRrE8H/qfYwIqYb8HeE5UTCrso9YdZEhyDkS7DY23SCjH51qxgH9L5T6GD0e4wfOvYPQQIzmj/zvCZXzF+QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AV3pU9hn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130733; x=1767666733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cKm1F571EGNvkUXP4KmYC8HweM9aziQ/iJ7tPm2Tz34=;
  b=AV3pU9hn4XtBrIYQ6BcZkJbuwLSELlWTfka+ZSPUASelQvqLQcPweubc
   sZLqRFkPVUrKLJ3vT4h5Idvl6WgL0ItBg7SYZNNk7p7GChD1LQrsulNvO
   TyRLn6FAAqRuLjx5Q6qXU5qoaD8PZHpNd7/cnC9xpvaJZuvCznq0xeqdV
   wXYxSfvkkdk0RM7tLfTJHgsrLy8Uo7jBJK6PSaytv09YBflg5EEpnCZeu
   cbJlGlXCDG2tdJybuBiqm/sXJ3LjcIqK6N/XRPtE4/MjTbhghW9cOE/al
   c703L5EVZAh1uJ3m3pJIaqvwz9nwsYKx8eQo38aVpOXZSVgoYSzeK33q6
   g==;
X-CSE-ConnectionGUID: PI7p93TGS8qpOz2rc38Mlg==
X-CSE-MsgGUID: 95ZulpYtSMy6cbLS8zdLIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171418"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:12 -0800
X-CSE-ConnectionGUID: 0t47RjhTRfGLlKLknjardQ==
X-CSE-MsgGUID: prPYjskmRJabvHNFKzoYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125595903"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:09 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org,
	mpearson-lenovo@squebb.ca
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 02/22] HID: intel-thc-hid: Add basic THC driver skeleton
Date: Mon,  6 Jan 2025 10:31:31 +0800
Message-Id: <20250106023151.3011329-3-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xinpeng Sun <xinpeng.sun@intel.com>

Create intel-thc-hid folder and add Kconfig and Makefile for THC drivers.
Add basic THC device context structure, definitions and related
initialization APIs for THC Hardware layer driver. Also initialize
regmap struct for future THC registers access.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 MAINTAINERS                                   |   6 +
 drivers/hid/Kconfig                           |   2 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/intel-thc-hid/Kconfig             |  20 ++
 drivers/hid/intel-thc-hid/Makefile            |  11 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 219 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  25 ++
 7 files changed, 285 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/Kconfig
 create mode 100644 drivers/hid/intel-thc-hid/Makefile
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 17daa9ee9384..9465f2e89691 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11875,6 +11875,12 @@ S:	Maintained
 F:	arch/x86/include/asm/intel_telemetry.h
 F:	drivers/platform/x86/intel/telemetry/
 
+INTEL TOUCH HOST CONTROLLER (THC) DRIVER
+M:	Even Xu <even.xu@intel.com>
+M:	Xinpeng Sun <xinpeng.sun@intel.com>
+S:	Maintained
+F:	drivers/hid/intel-thc-hid/
+
 INTEL TPMI DRIVER
 M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4d2a89d65b65..c57927529f8a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1386,4 +1386,6 @@ source "drivers/hid/amd-sfh-hid/Kconfig"
 
 source "drivers/hid/surface-hid/Kconfig"
 
+source "drivers/hid/intel-thc-hid/Kconfig"
+
 endif # HID_SUPPORT
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 24de45f3677d..482b096eea28 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -171,3 +171,5 @@ obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+= intel-ish-hid/
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
 
 obj-$(CONFIG_SURFACE_HID_CORE)  += surface-hid/
+
+obj-$(CONFIG_INTEL_THC_HID)     += intel-thc-hid/
diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
new file mode 100644
index 000000000000..dc7c5a23f0ad
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024, Intel Corporation.
+
+menu "Intel THC HID Support"
+	depends on X86_64 && PCI
+
+config INTEL_THC_HID
+	tristate "Intel Touch Host Controller"
+	select HID
+	help
+	  THC (Touch Host Controller) is the name of the IP block in PCH that
+	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It
+	  is comprised of 3 key functional blocks: A natively half-duplex
+	  Quad I/O capable SPI master; a low latency I2C interface to support
+	  HIDI2C compliant devices; a hardware sequencer with Read/Write DMA
+	  capability to system memory.
+
+	  Say Y/M here if you want to support Intel THC. If unsure, say N.
+
+endmenu
diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
new file mode 100644
index 000000000000..bebb60bedfeb
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile - Intel Touch Host Controller (THC) drivers
+# Copyright (c) 2024, Intel Corporation.
+#
+#
+
+obj-$(CONFIG_INTEL_THC_HID) += intel-thc.o
+intel-thc-objs += intel-thc/intel-thc-dev.o
+
+ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
new file mode 100644
index 000000000000..de7a0ed38c25
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/regmap.h>
+
+#include "intel-thc-dev.h"
+
+static int thc_regmap_read(void *context, unsigned int reg,
+			   unsigned int *val)
+{
+	struct thc_device *thc_ctx = context;
+	void __iomem *base = thc_ctx->mmio_addr;
+
+	*val = ioread32(base + reg);
+	return 0;
+}
+
+static int thc_regmap_write(void *context, unsigned int reg,
+			    unsigned int val)
+{
+	struct thc_device *thc_ctx = context;
+	void __iomem *base = thc_ctx->mmio_addr;
+
+	iowrite32(val, base + reg);
+	return 0;
+}
+
+static const struct regmap_range thc_rw_ranges[] = {
+	regmap_reg_range(0x10, 0x14),
+	regmap_reg_range(0x1000, 0x1320),
+};
+
+static const struct regmap_access_table thc_rw_table = {
+	.yes_ranges = thc_rw_ranges,
+	.n_yes_ranges = ARRAY_SIZE(thc_rw_ranges),
+};
+
+static const struct regmap_config thc_regmap_cfg = {
+	.name = "thc_regmap_common",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x1320,
+	.reg_read = thc_regmap_read,
+	.reg_write = thc_regmap_write,
+	.cache_type = REGCACHE_NONE,
+	.fast_io = true,
+	.rd_table = &thc_rw_table,
+	.wr_table = &thc_rw_table,
+	.volatile_table	= &thc_rw_table,
+};
+
+/**
+ * thc_clear_state - Clear THC hardware state
+ *
+ * @dev: The pointer of THC device structure
+ */
+static void thc_clear_state(const struct thc_device *dev)
+{
+	u32 val;
+
+	/* Clear interrupt cause register */
+	val = THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY |
+	      THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR |
+	      THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR |
+	      THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR;
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, val, val);
+
+	/* Clear interrupt error state */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			  THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS,
+			  THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			  THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS,
+			  THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS);
+
+	val = THC_M_PRT_INT_EN_TXN_ERR_INT_EN |
+	      THC_M_PRT_INT_EN_FATAL_ERR_INT_EN |
+	      THC_M_PRT_INT_EN_BUF_OVRRUN_ERR_INT_EN;
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_EN_OFFSET, val, val);
+
+	val = THC_M_PRT_SW_SEQ_STS_THC_SS_ERR |
+	      THC_M_PRT_SW_SEQ_STS_TSSDONE;
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, val, val);
+
+	/* Clear RxDMA state */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_EOF, 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_IE_EOF, 0);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
+			  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS,
+			  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_2_OFFSET,
+			  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS,
+			  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
+			  THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS,
+			  THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS);
+
+	/* Clear TxDMA state */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_DMA_CNTRL_OFFSET,
+			  THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL,
+			  THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL);
+
+	val = THC_M_PRT_WRITE_INT_STS_THC_WRDMA_ERROR_STS |
+	      THC_M_PRT_WRITE_INT_STS_THC_WRDMA_IOC_STS |
+	      THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS;
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_INT_STS_OFFSET, val, val);
+
+	/* Reset all DMAs count */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_DB_CNT_1_OFFSET,
+			  THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT_RST,
+			  THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_DEVINT_CNT_OFFSET,
+			  THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT_RST,
+			  THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT_RST);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR);
+
+	/* Reset THC hardware sequence state */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRAME_DROP_CNT_1_OFFSET,
+			  THC_M_PRT_FRAME_DROP_CNT_1_RFDC,
+			  THC_M_PRT_FRAME_DROP_CNT_1_RFDC);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRAME_DROP_CNT_2_OFFSET,
+			  THC_M_PRT_FRAME_DROP_CNT_2_RFDC,
+			  THC_M_PRT_FRAME_DROP_CNT_2_RFDC);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRM_CNT_1_OFFSET,
+			  THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT_RST,
+			  THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT_RST);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRM_CNT_2_OFFSET,
+			  THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT_RST,
+			  THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_RXDMA_PKT_CNT_1_OFFSET,
+			  THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT_RST,
+			  THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT_RST);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_RXDMA_PKT_CNT_2_OFFSET,
+			  THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT_RST,
+			  THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SWINT_CNT_1_OFFSET,
+			  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST,
+			  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SWINT_CNT_1_OFFSET,
+			  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST,
+			  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_TX_FRM_CNT_OFFSET,
+			  THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT_RST,
+			  THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_TXDMA_PKT_CNT_OFFSET,
+			  THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT_RST,
+			  THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_UFRM_CNT_1_OFFSET,
+			  THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT_RST,
+			  THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT_RST);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_UFRM_CNT_2_OFFSET,
+			  THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT_RST,
+			  THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT_RST);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_PRD_EMPTY_CNT_1_OFFSET,
+			  THC_M_PRT_PRD_EMPTY_CNT_1_RPTEC,
+			  THC_M_PRT_PRD_EMPTY_CNT_1_RPTEC);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_PRD_EMPTY_CNT_2_OFFSET,
+			  THC_M_PRT_PRD_EMPTY_CNT_2_RPTEC,
+			  THC_M_PRT_PRD_EMPTY_CNT_2_RPTEC);
+}
+
+/**
+ * thc_dev_init - Allocate and initialize the THC device structure
+ *
+ * @device: The pointer of device structure
+ * @mem_addr: The pointer of MMIO memory address
+ *
+ * Return: The thc_device pointer on success, NULL on failed.
+ */
+struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr)
+{
+	struct thc_device *thc_dev;
+	int ret;
+
+	thc_dev = devm_kzalloc(device, sizeof(*thc_dev), GFP_KERNEL);
+	if (!thc_dev)
+		return ERR_PTR(-ENOMEM);
+
+	thc_dev->dev = device;
+	thc_dev->mmio_addr = mem_addr;
+	thc_dev->thc_regmap = devm_regmap_init(device, NULL, thc_dev, &thc_regmap_cfg);
+	if (IS_ERR(thc_dev->thc_regmap)) {
+		ret = PTR_ERR(thc_dev->thc_regmap);
+		dev_err_once(device, "Failed to init thc_regmap: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	thc_clear_state(thc_dev);
+
+	return thc_dev;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dev_init, "INTEL_THC");
+
+MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
+MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
+
+MODULE_DESCRIPTION("Intel(R) Intel THC Hardware Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
new file mode 100644
index 000000000000..7060f0a36cbd
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _INTEL_THC_DEV_H_
+#define _INTEL_THC_DEV_H_
+
+#include <linux/cdev.h>
+
+#define THC_REGMAP_COMMON_OFFSET  0x10
+#define THC_REGMAP_MMIO_OFFSET    0x1000
+
+/**
+ * struct thc_device - THC private device struct
+ * @thc_regmap: MMIO regmap structure for accessing THC registers
+ * @mmio_addr: MMIO registers address
+ */
+struct thc_device {
+	struct device *dev;
+	struct regmap *thc_regmap;
+	void __iomem *mmio_addr;
+};
+
+struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
+
+#endif /* _INTEL_THC_DEV_H_ */
-- 
2.40.1


