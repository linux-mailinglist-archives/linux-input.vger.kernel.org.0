Return-Path: <linux-input+bounces-12363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F5AB634A
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7FD11B44BDE
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4235B20297F;
	Wed, 14 May 2025 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfTtY5yb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C571FF7DC;
	Wed, 14 May 2025 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204695; cv=none; b=frSMCyms1nHuZjKl9fH+llr4IznnwxDQqRibuiEUDklNCTP1gYtZiVpGsUHkiTeH0yVIYKl3txviiDQ3ye9BRJFm9bwS/HpB5KNEaiqbrmk548sMIcp6PgC6LjD9iKWjfDjV7EDZKcePwJ6hJhNfSE34VNmRoUMYzxnTNqG7NKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204695; c=relaxed/simple;
	bh=0oKYL6mFwfcZEDDCrci73jWbiusUT6MphLFr198uVbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJtUJzdTHkl9k7WaYpjnToF4rgh/kdgBkCgYupH6MrlYEwlTPNIhE+ZnzP///ePMzx61etgthyr3PlBKa1bA99uxX/FvzwOLFiUZEWzPpTXK5SbUGvZORi4Ht79xouJJpVTyNs1Cz6ySsqJj219yX6NoM7uw5mHEv/PR4wn571U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfTtY5yb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204694; x=1778740694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0oKYL6mFwfcZEDDCrci73jWbiusUT6MphLFr198uVbc=;
  b=UfTtY5yb/SzDH+UVM/1VF/mWad49G38ElzKbpyKaMLZcpNUaZDPkMF8M
   63N+YRBr/MaAzD9PRSvJSAvUcIMFJQOnf+VTayXT1axO0YYQs8JowfDgR
   WkcEqhNxqXLdEjukqWnUpTU3Xqbya/S7PU3D+zyiLd5IC7OwY8W1B4uce
   zQCBH3GhBtyh5SWILvhi5toXXiI19I1oMAdHVTMNBueev0TzmHS+Pnwwm
   EwcPfA6u6Obvfy2AW5Y83nh0jgiL2FCQ2OWn+rnhHg1Piuqxvm2aHaAAA
   JpQ+uytaQACnruOUwUA8FkKxSAVGnFmig2cJfB2d3D2EqqDLZ+tLTxWnk
   w==;
X-CSE-ConnectionGUID: qO3O+lBbSY2uAH+n6La/7A==
X-CSE-MsgGUID: sXiMpzw+TXui4NAw3dXgdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49247414"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49247414"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:38:13 -0700
X-CSE-ConnectionGUID: jz/F6dDYTSyMywaZPjKPUw==
X-CSE-MsgGUID: C6bKtHOdR9uObgliNv03jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138933952"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 23:38:11 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: [PATCH v1 1/3] HID: Intel-thc-hid: Intel-thc: Add Wake-on-Touch support
Date: Wed, 14 May 2025 14:37:33 +0800
Message-Id: <20250514063735.141950-2-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250514063735.141950-1-even.xu@intel.com>
References: <20250514063735.141950-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wake-on-Touch (WoT) feature gives system the capability to wake from
sleep state by user touch event, it requires platform providing wake
GPIO through ACPI resource.

Intel UEFI provides a user setting to enable or disable THC device WoT
feature. If it's enabled, UEFI assigns an additional wake GPIO resource
to THC device ACPI configuration, facilitating system wakeup.

This patch provides helper APIs for THC device driver to query wake
GPIO resource, enable WoT feature and unconfigure WoT.

APIs added:
- thc_wot_config(): Query and configure wake-on-touch feature.
- thc_wot_unconfig(): Unconfig wake-on-touch feature.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
---
 drivers/hid/intel-thc-hid/Makefile            |  1 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  4 +
 .../intel-thc-hid/intel-thc/intel-thc-wot.c   | 94 +++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-wot.h   | 26 +++++
 4 files changed, 125 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 6f762d87af07..f1182253b5b7 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -8,6 +8,7 @@
 obj-$(CONFIG_INTEL_THC_HID) += intel-thc.o
 intel-thc-objs += intel-thc/intel-thc-dev.o
 intel-thc-objs += intel-thc/intel-thc-dma.o
+intel-thc-objs += intel-thc/intel-thc-wot.o
 
 obj-$(CONFIG_INTEL_QUICKSPI) += intel-quickspi.o
 intel-quickspi-objs += intel-quickspi/pci-quickspi.o
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index 8666e2362e32..0db435335e24 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -9,6 +9,7 @@
 #include <linux/workqueue.h>
 
 #include "intel-thc-dma.h"
+#include "intel-thc-wot.h"
 
 #define THC_REGMAP_COMMON_OFFSET  0x10
 #define THC_REGMAP_MMIO_OFFSET    0x1000
@@ -56,6 +57,7 @@ enum thc_int_type {
  * @port_type: Port type of THC port instance
  * @pio_int_supported: PIO interrupt supported flag
  * @dma_ctx: DMA specific data
+ * @wot: THC Wake-on-Touch data
  * @write_complete_wait: Signal event for DMA write complete
  * @swdma_complete_wait: Signal event for SWDMA sequence complete
  * @write_done: Bool value that indicates if DMA write is done
@@ -77,6 +79,8 @@ struct thc_device {
 
 	struct thc_dma_context *dma_ctx;
 
+	struct thc_wot wot;
+
 	wait_queue_head_t write_complete_wait;
 	wait_queue_head_t swdma_complete_wait;
 	bool write_done;
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c
new file mode 100644
index 000000000000..1291b4ea2cd8
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Intel Corporation */
+
+#include <linux/acpi.h>
+#include <linux/pm_wakeirq.h>
+
+#include "intel-thc-dev.h"
+#include "intel-thc-wot.h"
+
+/**
+ * thc_wot_config - Query and configure wake-on-touch feature
+ * @thc_dev: Point to thc_device structure
+ * @gpio_map: Point to ACPI GPIO resource mapping structure
+ *
+ * THC ACPI device only provides _CRS with GpioInt() resources, doesn't contain
+ * _DSD to map this GPIO resource, so this function first registers wake GPIO
+ * mapping manually, then queries wake-on-touch GPIO resource from ACPI,
+ * if it exists and is wake-able, configure driver to enable it, otherwise,
+ * return immediately.
+ * This function will not return error as it doesn't impact major function.
+ */
+void thc_wot_config(struct thc_device *thc_dev, const struct acpi_gpio_mapping *gpio_map)
+{
+	struct acpi_device *adev;
+	struct thc_wot *wot;
+	int ret;
+
+	if (!thc_dev)
+		return;
+
+	adev = ACPI_COMPANION(thc_dev->dev);
+	if (!adev)
+		return;
+
+	wot = &thc_dev->wot;
+
+	ret = acpi_dev_add_driver_gpios(adev, gpio_map);
+	if (ret) {
+		dev_warn(thc_dev->dev, "Can't add wake GPIO resource, ret = %d\n", ret);
+		return;
+	}
+
+	wot->gpio_irq = acpi_dev_gpio_irq_wake_get_by(adev, "wake-on-touch", 0,
+						      &wot->gpio_irq_wakeable);
+	if (wot->gpio_irq <= 0) {
+		dev_warn(thc_dev->dev, "Can't find wake GPIO resource\n");
+		return;
+	}
+
+	if (!wot->gpio_irq_wakeable) {
+		dev_warn(thc_dev->dev, "GPIO resource isn't wakeable\n");
+		return;
+	}
+
+	ret = device_init_wakeup(thc_dev->dev, true);
+	if (ret) {
+		dev_warn(thc_dev->dev, "Failed to init wake up.\n");
+		return;
+	}
+
+	ret = dev_pm_set_dedicated_wake_irq(thc_dev->dev, wot->gpio_irq);
+	if (ret) {
+		dev_warn(thc_dev->dev, "Failed to set wake up IRQ.\n");
+		device_init_wakeup(thc_dev->dev, false);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(thc_wot_config, "INTEL_THC");
+
+/**
+ * thc_wot_unconfig - Unconfig wake-on-touch feature
+ * @thc_dev: Point to thc_device structure
+ *
+ * Configure driver to disable wake-on-touch and release ACPI resource.
+ */
+void thc_wot_unconfig(struct thc_device *thc_dev)
+{
+	struct acpi_device *adev;
+
+	if (!thc_dev)
+		return;
+
+	adev = ACPI_COMPANION(thc_dev->dev);
+	if (!adev)
+		return;
+
+	if (thc_dev->wot.gpio_irq_wakeable)
+		device_init_wakeup(thc_dev->dev, false);
+
+	if (thc_dev->wot.gpio_irq > 0) {
+		dev_pm_clear_wake_irq(thc_dev->dev);
+		acpi_dev_remove_driver_gpios(adev);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(thc_wot_unconfig, "INTEL_THC");
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.h
new file mode 100644
index 000000000000..6c700621b242
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Intel Corporation */
+
+#ifndef _INTEL_THC_WOT_H_
+#define _INTEL_THC_WOT_H_
+
+#include <linux/types.h>
+
+#include <linux/gpio/consumer.h>
+
+/**
+ * struct thc_wot - THC Wake-on-Touch data structure
+ * @gpio_irq : GPIO interrupt IRQ number for wake-on-touch
+ * @gpio_irq_wakeable : Indicate GPIO IRQ workable or not
+ */
+struct thc_wot {
+	int gpio_irq;
+	bool gpio_irq_wakeable;
+};
+
+struct thc_device;
+
+void thc_wot_config(struct thc_device *thc_dev, const struct acpi_gpio_mapping *gpio_map);
+void thc_wot_unconfig(struct thc_device *thc_dev);
+
+#endif /* _INTEL_THC_WOT_H_ */
-- 
2.40.1


