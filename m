Return-Path: <linux-input+bounces-8935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88AA01D9E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22483A4238
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA141D8DFB;
	Mon,  6 Jan 2025 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABU1HKix"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288F1D89EF;
	Mon,  6 Jan 2025 02:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130781; cv=none; b=FN9Z0mgMPFE57Dzs6z0iGo1x11/R9JmCRNUc2m6ThGaSOeOegFJMBEfRt69XcRZy2L8l6h5MBfAzDS7wAsxF/AktGuH2fNxhs63LROVpBmfXoBRV4xaqs9bb1jROJ9uKhx7+7Xw++Z7BOtqKEMH5aJG4OUu/NLcXPdkxHMU8Iuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130781; c=relaxed/simple;
	bh=2WVlpdS5rMvj0Y6cuCXpKtRoebwNek1ra0IHv9ViFzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YkwlMaYTZSsCuPJMxS7KZUXqPak3PxiLdC7VYuV/duUxtNflu7M1lV/0LrL2QtJ+bY5TsMZuOUoLzYg0/lk/lSKnUJjueRC80/wv9iAyzmWsuJyPbM9+qiIw9nO8PuPtPlrHJ4Rk+CuZR9FIsnbRKl+GvqPZIbW51YIAyY0Ahh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABU1HKix; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130779; x=1767666779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2WVlpdS5rMvj0Y6cuCXpKtRoebwNek1ra0IHv9ViFzA=;
  b=ABU1HKixlNsA9ti2O5xDD6dJZt1/7DOrzFnzBPcZxrPEUeeT/WeYqmCO
   QxY2f0CVhjlMnarlQzs22Ac96jszTuwxqnPcxqQmBFsBbh3MA9mGTTArJ
   iNwA7xhc4Oe143J0odV3tkl/Ecx1AYXAiPkGUl44evK+An1IQIBk/9bDK
   /rH3hTbFC/xZu9cCeMf8eYpWah88M3oWFD5WJjDJLG7tyHnZ+du9bMVYw
   /PC8iHgX37OAGPp54l+VBxfyF5L8HCJw7KQBiib8RupUhjL/CCCMDmiGO
   Fav5Jh2iXV0Tgjq6XPf8Vq4PWBVgk9vWPqe4roBPXRtzB+p+eFiTAz/XZ
   Q==;
X-CSE-ConnectionGUID: Xk9FQPjVRiipekXqoXFGYw==
X-CSE-MsgGUID: WmO7XdkwTZ6WB0kjtMsmaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171576"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:58 -0800
X-CSE-ConnectionGUID: an0fq6WXT12b2MdDSNUIsg==
X-CSE-MsgGUID: lC5dlaZYQPK6w69c1NQcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596080"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:55 -0800
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
Subject: [PATCH v4 15/22] HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
Date: Mon,  6 Jan 2025 10:31:44 +0800
Message-Id: <20250106023151.3011329-16-even.xu@intel.com>
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

Fully implement QuickSPI driver probe/remove callbacks, interrupt
handler, integrate HIDSPI protocol, enumerate HID device and register
HID device.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-quickspi/pci-quickspi.c             | 265 ++++++++++++++++++
 .../intel-quickspi/quickspi-protocol.c        |   3 +
 2 files changed, 268 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 7df2d00c3b22..cc92e1a30411 100644
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
@@ -290,6 +367,10 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, true);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = thc_port_select(qsdev->thc_hw, THC_PORT_TYPE_SPI);
 	if (ret) {
 		dev_err(dev, "Failed to select THC port, ret = %d.\n", ret);
@@ -302,10 +383,43 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
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
 
@@ -319,6 +433,103 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
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
+ * Allocate report descriptor buffer, it will be used for restore TIC HID
+ * report descriptor.
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
@@ -327,6 +538,18 @@ static void quickspi_dev_deinit(struct quickspi_device *qsdev)
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
@@ -390,8 +613,44 @@ static int quickspi_probe(struct pci_dev *pdev,
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
@@ -418,6 +677,9 @@ static void quickspi_remove(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	quickspi_hid_remove(qsdev);
+	quickspi_dma_deinit(qsdev);
+
 	quickspi_dev_deinit(qsdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -441,6 +703,9 @@ static void quickspi_shutdown(struct pci_dev *pdev)
 	if (!qsdev)
 		return;
 
+	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
+	quickspi_dma_deinit(qsdev);
+
 	quickspi_dev_deinit(qsdev);
 }
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
index ba28b82da385..7373238ceb18 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -225,6 +225,9 @@ void quickspi_handle_input_data(struct quickspi_device *qsdev, u32 buf_len)
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


