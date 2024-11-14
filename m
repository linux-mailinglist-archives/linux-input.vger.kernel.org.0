Return-Path: <linux-input+bounces-8086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB79C829B
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FCD9B24C15
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FD91F80AD;
	Thu, 14 Nov 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4I+2Bqx"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177021F76CE;
	Thu, 14 Nov 2024 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562513; cv=none; b=D3FJPlJ3kjfIvxjcOavHbro3ienbGElhLhhQxKgKYJro1w3la5UXBVZojsAAq1Se2NLWHsxy41hVIHLuvajJ82HRbnAUouDRaRGbEx1JHT6x98dw55l+T1CanhpbIx059sBcg0/Ucgltl0hvy20Ij5055yjqJOMr5Ew8Rw6Qdtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562513; c=relaxed/simple;
	bh=dQjFGq4iXCFAKxJQVqRpUCmKZ+i6B1tsuJRrZ0MKCCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=moOimlDDKGBm5bSQhGVhOoLFJa6166aay466ibTWxSotCIs1T07dP9N0zOLV+gcYMnaf5sjfTwccAf70+OsWabDZESsINbvL9wrLb3hGsau4hrfJkn+bEmSIW8yovYnVcJVQcBtzXdoLnhyHS3MymOV6qbZ7oF+4SCC8rQE33Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4I+2Bqx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562512; x=1763098512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQjFGq4iXCFAKxJQVqRpUCmKZ+i6B1tsuJRrZ0MKCCE=;
  b=Q4I+2BqxsWjCdC6WnnR1MrqdPAQd+CuhHWxTyWfoqrH36y36daS53S9i
   3lEyoUaQaQV3u/2s5ROwwyeWB39hg59RBqknSqoEgfFLye+T26C5m5S4I
   muZ2+01/f0gDSzaUl1W9w+gW4jLpEWvRI90Z/baFxLzYRu4C7N3teDLxV
   i98ug4VD6lxTqMfWvAf/u464VXqII/o/2UDjBrp3Bz7ceoP+bnFET39v+
   b4/+Cl6LaIZrUOzMRV0ePoFSHLe2VycA05LFj26AgtaxbHOZDFKiVpeoq
   cmGxgG9Ku2ucgbKtP4VtAaKdocGz9KjaQq2B+8hfzaM8syONS8Q/KviCB
   A==;
X-CSE-ConnectionGUID: E88ubjSvSBqWIVaP73HlIw==
X-CSE-MsgGUID: p01Z++W0R8aAmsHMw3o4oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30869120"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30869120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:35:11 -0800
X-CSE-ConnectionGUID: eot2EVuFQXyhn26lw1YS+g==
X-CSE-MsgGUID: Qd+VVjG+TBOa2TpybUpN7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92891668"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 21:35:08 -0800
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
Subject: [PATCH v2 15/22] HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
Date: Thu, 14 Nov 2024 13:34:09 +0800
Message-Id: <20241114053416.4085715-16-even.xu@intel.com>
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

Fully implement QuickSPI driver probe/remove callbacks, interrupt
handler, integrate HIDSPI protocol, enumerate HID device and register
HID device.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quickspi/pci-quickspi.c             | 261 ++++++++++++++++++
 .../intel-quickspi/quickspi-protocol.c        |   3 +
 2 files changed, 264 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 707068b5dc4d..73be89933f1e 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -14,6 +14,8 @@
 #include "intel-thc-hw.h"
 
 #include "quickspi-dev.h"
+#include "quickspi-hid.h"
+#include "quickspi-protocol.h"
 
 struct quickspi_driver_data mtl = {
 	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_MTL,
@@ -228,6 +230,37 @@ static irqreturn_t quickspi_irq_quick_handler(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
+/**
+ * try_recover - Try to recovery THC and Device
+ * @qsdev: pointer to quickspi device
+ *
+ * This function is a error handler, called when fatal error happens.
+ * It try to reset Touch Device and re-configure THC to recovery
+ * transferring between Device and THC.
+ *
+ * Return: 0 if successful or error code on failed.
+ */
+static int try_recover(struct quickspi_device *qsdev)
+{
+	int ret;
+
+	ret = reset_tic(qsdev);
+	if (ret) {
+		dev_err(qsdev->dev, "Reset touch device failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	thc_dma_unconfigure(qsdev->thc_hw);
+
+	ret = thc_dma_configure(qsdev->thc_hw);
+	if (ret) {
+		dev_err(qsdev->dev, "Re-configure THC DMA failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * quickspi_irq_thread_handler - IRQ thread handler of quickspi driver
  *
@@ -239,15 +272,52 @@ static irqreturn_t quickspi_irq_quick_handler(int irq, void *dev_id)
 static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
 {
 	struct quickspi_device *qsdev = dev_id;
+	size_t input_len;
+	int read_finished = 0;
+	int err_recover = 0;
 	int int_mask;
+	int ret;
 
 	if (qsdev->state == QUICKSPI_DISABLED)
 		return IRQ_HANDLED;
 
 	int_mask = thc_interrupt_handler(qsdev->thc_hw);
 
+	if (int_mask & BIT(THC_FATAL_ERR_INT) || int_mask & BIT(THC_TXN_ERR_INT)) {
+		err_recover = 1;
+		goto end;
+	}
+
+	if (int_mask & BIT(THC_NONDMA_INT)) {
+		if (qsdev->state == QUICKSPI_RESETING) {
+			qsdev->reset_ack = true;
+			wake_up_interruptible(&qsdev->reset_ack_wq);
+		} else {
+			qsdev->nondma_int_received = true;
+			wake_up_interruptible(&qsdev->nondma_int_received_wq);
+		}
+	}
+
+	if (int_mask & BIT(THC_RXDMA2_INT)) {
+		while (!read_finished) {
+			ret = thc_rxdma_read(qsdev->thc_hw, THC_RXDMA2, qsdev->input_buf,
+					     &input_len, &read_finished);
+			if (ret) {
+				err_recover = 1;
+				goto end;
+			}
+
+			quickspi_handle_input_data(qsdev, input_len);
+		}
+	}
+
+end:
 	thc_interrupt_enable(qsdev->thc_hw, true);
 
+	if (err_recover)
+		if (try_recover(qsdev))
+			qsdev->state = QUICKSPI_DISABLED;
+
 	return IRQ_HANDLED;
 }
 
@@ -280,8 +350,15 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 	qsdev->pdev = pdev;
 	qsdev->dev = dev;
 	qsdev->mem_addr = mem_addr;
+	qsdev->state = QUICKSPI_DISABLED;
 	qsdev->driver_data = (struct quickspi_driver_data *)id->driver_data;
 
+	init_waitqueue_head(&qsdev->reset_ack_wq);
+	init_waitqueue_head(&qsdev->nondma_int_received_wq);
+	init_waitqueue_head(&qsdev->report_desc_got_wq);
+	init_waitqueue_head(&qsdev->get_report_cmpl_wq);
+	init_waitqueue_head(&qsdev->set_report_cmpl_wq);
+
 	/* thc hw init */
 	qsdev->thc_hw = thc_dev_init(qsdev->dev, qsdev->mem_addr);
 	if (IS_ERR(qsdev->thc_hw)) {
@@ -302,10 +379,43 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	/* THC config for input/output address */
+	thc_spi_input_output_address_config(qsdev->thc_hw,
+					    qsdev->input_report_hdr_addr,
+					    qsdev->input_report_bdy_addr,
+					    qsdev->output_report_addr);
+
+	/* THC config for spi read operation */
+	ret = thc_spi_read_config(qsdev->thc_hw, qsdev->spi_freq_val,
+				  qsdev->spi_read_io_mode,
+				  qsdev->spi_read_opcode,
+				  qsdev->spi_packet_size);
+	if (ret) {
+		dev_err(dev, "thc_spi_read_config failed, ret = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* THC config for spi write operation */
+	ret = thc_spi_write_config(qsdev->thc_hw, qsdev->spi_freq_val,
+				   qsdev->spi_write_io_mode,
+				   qsdev->spi_write_opcode,
+				   qsdev->spi_packet_size,
+				   qsdev->performance_limit);
+	if (ret) {
+		dev_err(dev, "thc_spi_write_config failed, ret = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	thc_ltr_config(qsdev->thc_hw,
+		       qsdev->active_ltr_val,
+		       qsdev->low_power_ltr_val);
+
 	thc_interrupt_config(qsdev->thc_hw);
 
 	thc_interrupt_enable(qsdev->thc_hw, true);
 
+	qsdev->state = QUICKSPI_INITED;
+
 	return qsdev;
 }
 
@@ -319,6 +429,103 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 static void quickspi_dev_deinit(struct quickspi_device *qsdev)
 {
 	thc_interrupt_enable(qsdev->thc_hw, false);
+	thc_ltr_unconfig(qsdev->thc_hw);
+
+	qsdev->state = QUICKSPI_DISABLED;
+}
+
+/**
+ * quickspi_dma_init - Configure THC DMA for quickspi device
+ * @qsdev: pointer to the quickspi device structure
+ *
+ * This function uses TIC's parameters(such as max input length, max output
+ * length) to allocate THC DMA buffers and configure THC DMA engines.
+ *
+ * Return: 0 if successful or error code on failed.
+ */
+static int quickspi_dma_init(struct quickspi_device *qsdev)
+{
+	int ret;
+
+	ret = thc_dma_set_max_packet_sizes(qsdev->thc_hw, 0,
+					   le16_to_cpu(qsdev->dev_desc.max_input_len),
+					   le16_to_cpu(qsdev->dev_desc.max_output_len),
+					   0);
+	if (ret)
+		return ret;
+
+	ret = thc_dma_allocate(qsdev->thc_hw);
+	if (ret) {
+		dev_err(qsdev->dev, "Allocate THC DMA buffer failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	/* Enable RxDMA */
+	ret = thc_dma_configure(qsdev->thc_hw);
+	if (ret) {
+		dev_err(qsdev->dev, "Configure THC DMA failed, ret = %d\n", ret);
+		thc_dma_unconfigure(qsdev->thc_hw);
+		thc_dma_release(qsdev->thc_hw);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * quickspi_dma_deinit - Release THC DMA for quickspi device
+ * @qsdev: pointer to the quickspi device structure
+ *
+ * Stop THC DMA engines and release all DMA buffers.
+ *
+ */
+static void quickspi_dma_deinit(struct quickspi_device *qsdev)
+{
+	thc_dma_unconfigure(qsdev->thc_hw);
+	thc_dma_release(qsdev->thc_hw);
+}
+
+/**
+ * quickspi_alloc_report_buf - Alloc report buffers
+ * @qsdev: pointer to the quickspi device structure
+ *
+ * Allocate report descritpor buffer, it will be used for restore TIC HID
+ * report descritpor.
+ *
+ * Allocate input report buffer, it will be used for receive HID input report
+ * data from TIC.
+ *
+ * Allocate output report buffer, it will be used for store HID output report,
+ * such as set feature.
+ *
+ * Return: 0 if successful or error code on failed.
+ */
+static int quickspi_alloc_report_buf(struct quickspi_device *qsdev)
+{
+	size_t max_report_len;
+	size_t max_input_len;
+
+	qsdev->report_descriptor = devm_kzalloc(qsdev->dev,
+						le16_to_cpu(qsdev->dev_desc.rep_desc_len),
+						GFP_KERNEL);
+	if (!qsdev->report_descriptor)
+		return -ENOMEM;
+
+	max_input_len = max(le16_to_cpu(qsdev->dev_desc.rep_desc_len),
+			    le16_to_cpu(qsdev->dev_desc.max_input_len));
+
+	qsdev->input_buf = devm_kzalloc(qsdev->dev, max_input_len, GFP_KERNEL);
+	if (!qsdev->input_buf)
+		return -ENOMEM;
+
+	max_report_len = max(le16_to_cpu(qsdev->dev_desc.max_output_len),
+			     le16_to_cpu(qsdev->dev_desc.max_input_len));
+
+	qsdev->report_buf = devm_kzalloc(qsdev->dev, max_report_len, GFP_KERNEL);
+	if (!qsdev->report_buf)
+		return -ENOMEM;
+
+	return 0;
 }
 
 /*
@@ -327,6 +534,18 @@ static void quickspi_dev_deinit(struct quickspi_device *qsdev)
  * @pdev: point to pci device
  * @id: point to pci_device_id structure
  *
+ * This function initializes THC and HIDSPI device, the flow is:
+ * - do THC pci device initialization
+ * - query HIDSPI ACPI parameters
+ * - configure THC to HIDSPI mode
+ * - go through HIDSPI enumeration flow
+ *   |- reset HIDSPI device
+ *   |- read device descriptor
+ * - enable THC interrupt and DMA
+ * - read report descriptor
+ * - register HID device
+ * - enable runtime power management
+ *
  * Return 0 if success or error code on failure.
  */
 static int quickspi_probe(struct pci_dev *pdev,
@@ -390,8 +609,44 @@ static int quickspi_probe(struct pci_dev *pdev,
 		goto dev_deinit;
 	}
 
+	ret = reset_tic(qsdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Reset Touch Device failed, ret = %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quickspi_alloc_report_buf(qsdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Alloc report buffers failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quickspi_dma_init(qsdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quickspi_get_report_descriptor(qsdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Get report descriptor failed, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	ret = quickspi_hid_probe(qsdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register HID device, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	qsdev->state = QUICKSPI_ENABLED;
+
+	dev_dbg(&pdev->dev, "QuickSPI probe success\n");
+
 	return 0;
 
+dma_deinit:
+	quickspi_dma_deinit(qsdev);
 dev_deinit:
 	quickspi_dev_deinit(qsdev);
 unmap_io_region:
@@ -419,6 +674,9 @@ static void quickspi_remove(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	quickspi_hid_remove(qsdev);
+	quickspi_dma_deinit(qsdev);
+
 	quickspi_dev_deinit(qsdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -443,6 +701,9 @@ static void quickspi_shutdown(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
+	quickspi_dma_deinit(qsdev);
+
 	quickspi_dev_deinit(qsdev);
 }
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index 7d8ef603b949..81e09fcf49ce 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -220,6 +220,9 @@ void quickspi_handle_input_data(struct quickspi_device *qsdev, u32 buf_len)
 		break;
 
 	case DATA:
+		if (qsdev->state != QUICKSPI_ENABLED)
+			return;
+
 		if (input_len > le16_to_cpu(qsdev->dev_desc.max_input_len)) {
 			dev_err_once(qsdev->dev, "Unexpected too large input report length: %u\n",
 				     input_len);
-- 
2.40.1


