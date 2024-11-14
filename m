Return-Path: <linux-input+bounces-8073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136D9C8273
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B673E283F90
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB391EB9ED;
	Thu, 14 Nov 2024 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8p7JqGw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D91EABCF;
	Thu, 14 Nov 2024 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562471; cv=none; b=efH593uTFvE5T7Z3Eg62P3uzkcYCiEUtlpJ2jymxsqv+A/TKv+gUuWeUd4o1bGKX0zbSmcjuQuMyZDuxZ897G1nC82Yhlsx+lwfQ+rHvmCDNF39smhxqs9PoWpbqRDpnPEj4lkPdHeiuX18YRjceCunQt8hNkVkc7Iw5F838vSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562471; c=relaxed/simple;
	bh=3FLKq+RX4sFgvKHrVb2rJzGoRuSMBDAsjsN/GR6gelE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hVKOq63eQtOU0XKQCuA+Po/ejYlvd6lO2mTWOcqXW4QvLYWU7YtForCfHlwHp0MOZhlFxKWqtD/b/huK4v/nCm4wXdD9VPX55sBOb7t7EcJ408iGXQa+ssNGx3ORvH50HARDgPi+sBBtR3s5zFmq9xdTHkJ6+mxXWitMsv6wXSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8p7JqGw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562469; x=1763098469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3FLKq+RX4sFgvKHrVb2rJzGoRuSMBDAsjsN/GR6gelE=;
  b=D8p7JqGwsgSjLch/Pl1Binylc9PSjnIlEmUIXY8gMMY0vE1iCfXHAx/V
   qXor6rvUbKUuDzM84gycFGX1En9T9Le5suHNHhNDTdhhTdKRWmYWGz9ES
   cscAT78QZD/z7Z0ehkn4GoNVH7qMv6LMzlQpAU5CchLd4yc+34ptzoaHk
   +4/nq4H7CYk2xY6b829N9Tls9d53I3bJK0yXrh4PUV4ynhxkZ44nKorgy
   IvbwCaTscXwHOHYVt7KmCGrr8DOeuBWTRG+fbzfUt/QF4pd0BAWYtnuf5
   ryfL1Xa2280sw5+vgLYn2peJxM/9GHCWelMe5058aXVw0GkzGROV8DWnX
   A==;
X-CSE-ConnectionGUID: LREOzdQzQQap1eKYf5YjTw==
X-CSE-MsgGUID: ClwcVoaaTZ6cAOafbo4EsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30869011"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30869011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:34:28 -0800
X-CSE-ConnectionGUID: sUGSUknTReC6Pifwl7gM2Q==
X-CSE-MsgGUID: 14G8NDNGSY6p4uIhoLo5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92891439"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 21:34:25 -0800
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
Subject: [PATCH v2 02/22] HID: intel-thc-hid: Add basic THC driver skeleton
Date: Thu, 14 Nov 2024 13:33:56 +0800
Message-Id: <20241114053416.4085715-3-even.xu@intel.com>
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

Create intel-thc-hid folder and add Kconfig and Makefile for THC drivers.
Add basic THC device context structure, definitions and related
initialization APIs for THC Hardware layer driver. Also initialize
regmap struct for future THC registers access.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 MAINTAINERS                                   |  6 ++
 drivers/hid/Kconfig                           |  2 +
 drivers/hid/Makefile                          |  2 +
 drivers/hid/intel-thc-hid/Kconfig             | 20 +++++
 drivers/hid/intel-thc-hid/Makefile            | 11 +++
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 87 +++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   | 25 ++++++
 7 files changed, 153 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/Kconfig
 create mode 100644 drivers/hid/intel-thc-hid/Makefile
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd..48cb8b0c8acb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11597,6 +11597,12 @@ S:	Maintained
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
index 08446c89eff6..ebe3fe349cad 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1367,4 +1367,6 @@ source "drivers/hid/amd-sfh-hid/Kconfig"
 
 source "drivers/hid/surface-hid/Kconfig"
 
+source "drivers/hid/intel-thc-hid/Kconfig"
+
 endif # HID_SUPPORT
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e40f1ddebbb7..fae42e2f75cf 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -169,3 +169,5 @@ obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+= intel-ish-hid/
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
 
 obj-$(CONFIG_SURFACE_HID_CORE)  += surface-hid/
+
+obj-$(CONFIG_INTEL_THC_HID)     += intel-thc-hid/
diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
new file mode 100644
index 000000000000..e7e8201287f8
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
+	  interface with Touch Devices (ex: touchscreen, touchpad etc.). It
+	  is comprised of 3 key functional blocks: A natively half-duplex
+	  Quad I/O capable SPI master; A low latency I2C interface to support
+	  HIDI2C compliant devices; A HW sequencer with RW DMA capability to
+	  system memory.
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
index 000000000000..d77603e4c01e
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -0,0 +1,87 @@
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
+	return thc_dev;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dev_init, INTEL_THC);
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


