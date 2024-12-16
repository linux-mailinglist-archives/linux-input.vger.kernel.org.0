Return-Path: <linux-input+bounces-8598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 071269F2834
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA988167B51
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F1E1DA612;
	Mon, 16 Dec 2024 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+YIElSB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B031DA113;
	Mon, 16 Dec 2024 01:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313388; cv=none; b=H873gBcEdrFyl6kqelVyv+Sgm0zCOnvnmLQidWJJ1aIma198/3CUIfAu969PjSDM+y/60DR1gx7Ra+nVVLABE7Ny3Wq6IPEJLE88pDmVeiBIXAbirb6Qlkc0cc1gHDKl0KPRxqgJHc/p083ee8RkHUqElJAL0pAGxVk2HSFJsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313388; c=relaxed/simple;
	bh=kKhATw60F0AAON1wh6e9TEJPfHDjMdlJ6wHfDxyYXGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttld7aa/gah6iOF9JMrcKJINifxNuF0ppYbgJnkTaWkSuZ0/ddKGanmJtgRQ5NO2uZmzrVYqAbqzIwoYDQ1GaPUFG/TXPWLcfrqAL3mJVUQPKxqLkOq3uwycNbFZcW9wckfoNH4DVMscw2vYkgpuyvPIp3ld4y+RvJOlj5nfjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+YIElSB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313387; x=1765849387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kKhATw60F0AAON1wh6e9TEJPfHDjMdlJ6wHfDxyYXGM=;
  b=H+YIElSBMhKXsCVZji7zKj9hCmu5/GFtNmBB6UojsuvdOLhKmtwgJGJL
   lq3TSM0Sn9NJKCcRWyV7uX0KB1d4eh+/6K1UMEWQ64Ii6eqVnb04gPfeV
   mYJUpYjjKhehDUOADvnBX6IspimnsXDznpNKTBX6t2MXs1XpR1fqN1IEV
   y0gDvn3y2zAl1BZxZNiA/K0OI95OwjA1Jt7yuvFI8lqZE9ncA8+ZSJTVH
   ZDadyazRf6lSrVvhLV+ieiuhxoqiF/zpioQ5HHFXQrASZ6+jJo27WLz4c
   IR5N0y2xbBjXJYbzVC9Rg7d6H8ZcMF93ufWaCXZQZI7OICoMVGv+uNYQo
   A==;
X-CSE-ConnectionGUID: hpf0UphKRcGBjCtftuKo7Q==
X-CSE-MsgGUID: jIgKphSsR0yj870eKwDmgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013185"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:43:06 -0800
X-CSE-ConnectionGUID: 9C8xrrWfSxqfmSI2IjuAiQ==
X-CSE-MsgGUID: jgWatJ4ZQW2muniJVKCErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084296"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:43:03 -0800
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
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 22/22] HID: intel-thc-hid: intel-quicki2c: Add PM implementation
Date: Mon, 16 Dec 2024 09:41:27 +0800
Message-Id: <20241216014127.3722172-23-even.xu@intel.com>
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

Implement THC QuickI2C driver power management callbacks.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 233 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |   8 +
 .../intel-quicki2c/quicki2c-hid.c             |   8 +
 3 files changed, 249 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index d417972ae9b0..b56c72124821 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -9,6 +9,7 @@
 #include <linux/irqreturn.h>
 #include <linux/pci.h>
 #include <linux/sizes.h>
+#include <linux/pm_runtime.h>
 
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
@@ -289,10 +290,15 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 	struct quicki2c_device *qcdev = dev_id;
 	int err_recover = 0;
 	int int_mask;
+	int ret;
 
 	if (qcdev->state == QUICKI2C_DISABLED)
 		return IRQ_HANDLED;
 
+	ret = pm_runtime_resume_and_get(qcdev->dev);
+	if (ret)
+		return IRQ_HANDLED;
+
 	int_mask = thc_interrupt_handler(qcdev->thc_hw);
 
 	if (int_mask & BIT(THC_FATAL_ERR_INT) || int_mask & BIT(THC_TXN_ERR_INT) ||
@@ -314,6 +320,9 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qcdev))
 			qcdev->state = QUICKI2C_DISABLED;
 
+	pm_runtime_mark_last_busy(qcdev->dev);
+	pm_runtime_put_autosuspend(qcdev->dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -639,6 +648,13 @@ static int quicki2c_probe(struct pci_dev *pdev,
 
 	qcdev->state = QUICKI2C_ENABLED;
 
+	/* Enable runtime power management */
+	pm_runtime_use_autosuspend(qcdev->dev);
+	pm_runtime_set_autosuspend_delay(qcdev->dev, DEFAULT_AUTO_SUSPEND_DELAY_MS);
+	pm_runtime_mark_last_busy(qcdev->dev);
+	pm_runtime_put_noidle(qcdev->dev);
+	pm_runtime_put_autosuspend(qcdev->dev);
+
 	dev_dbg(&pdev->dev, "QuickI2C probe success\n");
 
 	return 0;
@@ -674,6 +690,8 @@ static void quicki2c_remove(struct pci_dev *pdev)
 	quicki2c_hid_remove(qcdev);
 	quicki2c_dma_deinit(qcdev);
 
+	pm_runtime_get_noresume(qcdev->dev);
+
 	quicki2c_dev_deinit(qcdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -703,6 +721,220 @@ static void quicki2c_shutdown(struct pci_dev *pdev)
 	quicki2c_dev_deinit(qcdev);
 }
 
+static int quicki2c_suspend(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	/*
+	 * As I2C is THC subsystem, no register auto save/restore support,
+	 * need driver to do that explicitly for every D3 case.
+	 */
+	ret = thc_i2c_subip_regs_save(qcdev->thc_hw);
+	if (ret)
+		return ret;
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qcdev->thc_hw, false);
+
+	thc_dma_unconfigure(qcdev->thc_hw);
+
+	return 0;
+}
+
+static int quicki2c_resume(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	ret = thc_port_select(qcdev->thc_hw, THC_PORT_TYPE_I2C);
+	if (ret)
+		return ret;
+
+	ret = thc_i2c_subip_regs_restore(qcdev->thc_hw);
+	if (ret)
+		return ret;
+
+	thc_interrupt_config(qcdev->thc_hw);
+
+	thc_interrupt_enable(qcdev->thc_hw, true);
+
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret)
+		return ret;
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int quicki2c_freeze(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qcdev->thc_hw, false);
+
+	thc_dma_unconfigure(qcdev->thc_hw);
+
+	return 0;
+}
+
+static int quicki2c_thaw(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qcdev->thc_hw, true);
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int quicki2c_poweroff(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qcdev->thc_hw, false);
+
+	thc_ltr_unconfig(qcdev->thc_hw);
+
+	quicki2c_dma_deinit(qcdev);
+
+	return 0;
+}
+
+static int quicki2c_restore(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	/* Reconfig THC HW when back from hibernate */
+	ret = thc_port_select(qcdev->thc_hw, THC_PORT_TYPE_I2C);
+	if (ret)
+		return ret;
+
+	ret = thc_i2c_subip_init(qcdev->thc_hw, qcdev->i2c_slave_addr,
+				 qcdev->i2c_speed_mode,
+				 qcdev->i2c_clock_hcnt,
+				 qcdev->i2c_clock_lcnt);
+	if (ret)
+		return ret;
+
+	thc_interrupt_config(qcdev->thc_hw);
+
+	thc_interrupt_enable(qcdev->thc_hw, true);
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret)
+		return ret;
+
+	thc_ltr_config(qcdev->thc_hw,
+		       qcdev->active_ltr_val,
+		       qcdev->low_power_ltr_val);
+
+	thc_change_ltr_mode(qcdev->thc_hw, THC_LTR_MODE_ACTIVE);
+
+	return 0;
+}
+
+static int quicki2c_runtime_suspend(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	thc_change_ltr_mode(qcdev->thc_hw, THC_LTR_MODE_LP);
+
+	pci_save_state(pdev);
+
+	return 0;
+}
+
+static int quicki2c_runtime_resume(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quicki2c_device *qcdev;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return -ENODEV;
+
+	thc_change_ltr_mode(qcdev->thc_hw, THC_LTR_MODE_ACTIVE);
+
+	return 0;
+}
+
+static const struct dev_pm_ops quicki2c_pm_ops = {
+	.suspend = quicki2c_suspend,
+	.resume = quicki2c_resume,
+	.freeze = quicki2c_freeze,
+	.thaw = quicki2c_thaw,
+	.poweroff = quicki2c_poweroff,
+	.restore = quicki2c_restore,
+	.runtime_suspend = quicki2c_runtime_suspend,
+	.runtime_resume = quicki2c_runtime_resume,
+	.runtime_idle = NULL,
+};
+
 static const struct pci_device_id quicki2c_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT1), },
 	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT2), },
@@ -720,6 +952,7 @@ static struct pci_driver quicki2c_driver = {
 	.probe = quicki2c_probe,
 	.remove = quicki2c_remove,
 	.shutdown = quicki2c_shutdown,
+	.driver.pm = &quicki2c_pm_ops,
 	.driver.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 };
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 0fdac6ba1b04..6ddb584bd611 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -36,6 +36,14 @@
 #define QUICKI2C_DEFAULT_LP_LTR_VALUE		500
 #define QUICKI2C_RPM_TIMEOUT_MS			500
 
+/*
+ * THC uses runtime auto suspend to dynamically switch between THC active LTR
+ * and low power LTR to save CPU power.
+ * Default value is 5000ms, that means if no touch event in this time, THC will
+ * change to low power LTR mode.
+ */
+#define DEFAULT_AUTO_SUSPEND_DELAY_MS			5000
+
 enum quicki2c_dev_state {
 	QUICKI2C_NONE,
 	QUICKI2C_RESETING,
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
index e8e6f10b7952..5c3ec95bb3fd 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -3,6 +3,7 @@
 
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/pm_runtime.h>
 
 #include "quicki2c-dev.h"
 #include "quicki2c-hid.h"
@@ -55,6 +56,10 @@ static int quicki2c_hid_raw_request(struct hid_device *hid,
 	struct quicki2c_device *qcdev = hid->driver_data;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(qcdev->dev);
+	if (ret)
+		return ret;
+
 	switch (reqtype) {
 	case HID_REQ_GET_REPORT:
 		ret = quicki2c_get_report(qcdev, rtype, reportnum, buf, len);
@@ -67,6 +72,9 @@ static int quicki2c_hid_raw_request(struct hid_device *hid,
 		break;
 	}
 
+	pm_runtime_mark_last_busy(qcdev->dev);
+	pm_runtime_put_autosuspend(qcdev->dev);
+
 	return ret;
 }
 
-- 
2.40.1


