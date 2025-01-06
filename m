Return-Path: <linux-input+bounces-8941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9EA01DB0
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E994C7A191B
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0FF1DAC89;
	Mon,  6 Jan 2025 02:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N24MwNyl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94111940A2;
	Mon,  6 Jan 2025 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130801; cv=none; b=h39KoLHXiWxj9fYhoRLEWKJEoAJdOpAkzsWLndJjHp5zRWQ/ok2depD4S3Ex5aXQCTwuPROaPeCgvY6RzcD1ynzDEIX+KHpCHh3qt+2l3wEo+1bumbAa7+8jskv3krjrYqX1fflgno0J8FVSALCj22v5f9OaKkfPVAXzM3gCM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130801; c=relaxed/simple;
	bh=9kaMB2ZemdyJbbgHzc4TiAUe4BchodLyLjiYVHReBH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tvyy+rb7hMNoNpWEgpqXp49sLT/hAuoGbj7ZU6S4dAsv9ATynvYBk5e1/jrhuzjE1WQ2jsESSmEyFKtxHFzGcnvPJ9VhfKawh8LJfj0SKYn7ytuKhXLRC8zzTTIgY/yPYufrwUdrU7o5ohsCkBelGMQk3Sopkv5vNKQDX9zBsZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N24MwNyl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130799; x=1767666799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9kaMB2ZemdyJbbgHzc4TiAUe4BchodLyLjiYVHReBH4=;
  b=N24MwNyld8eDYeGcqTT3o3ecD0qGUoUR5kPIitvf73cXHbxRAskCHjnS
   oMjkhQ4QNOFgr23QTC2Yr9WogCKZdxDN7rhCfKey8moxPO5H13oKZGmnJ
   yyiGJUAx0tJl+pvQbm0cW8xdzyd4ZHx99owq7k++HzEPUpjArJyrOk2VI
   yFbhcGmdQFRE34Qy6dbHmihW38CkNgt1TLPU5jgoVw+BH5aBQHnvvfeVx
   aFQc+hQZ8zmymqZXToobE5bijlVoioe4N+vhzNnVsH0AwNREtXOtKY/wj
   QdbFi5zsDhQUPHUBarl0X+5ZDLhcrI0zttEL7POI06FgXGnaIxIcx8LEa
   w==;
X-CSE-ConnectionGUID: wxjYxnsxTMucE0v+A1a83Q==
X-CSE-MsgGUID: tEXNmZWQT+i3o4bd7KJFbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171647"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:33:19 -0800
X-CSE-ConnectionGUID: hqLGtFJwRtmpI2R2MXW1IQ==
X-CSE-MsgGUID: uN7Mi5FeS4yGk0YRaz5gmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596137"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:33:16 -0800
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
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 21/22] HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
Date: Mon,  6 Jan 2025 10:31:50 +0800
Message-Id: <20250106023151.3011329-22-even.xu@intel.com>
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

Fully implement QuickI2C driver probe/remove callbacks, interrupt
handler, integrate HIDI2C protocol, enumerate HID device and register
HID device.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-quicki2c/pci-quicki2c.c             | 273 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |   6 +
 .../intel-quicki2c/quicki2c-protocol.c        |  27 ++
 .../intel-quicki2c/quicki2c-protocol.h        |   1 +
 4 files changed, 307 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index a8b35d40f3b9..d417972ae9b0 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -8,11 +8,14 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
 
 #include "quicki2c-dev.h"
+#include "quicki2c-hid.h"
+#include "quicki2c-protocol.h"
 
 /* THC QuickI2C ACPI method to get device properties */
 /* HIDI2C device method */
@@ -210,6 +213,69 @@ static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
+/**
+ * try_recover - Try to recovery THC and Device
+ * @qcdev: pointer to quicki2c device
+ *
+ * This function is a error handler, called when fatal error happens.
+ * It try to reset Touch Device and re-configure THC to recovery
+ * transferring between Device and THC.
+ *
+ * Return: 0 if successful or error code on failed
+ */
+static int try_recover(struct quicki2c_device *qcdev)
+{
+	int ret;
+
+	thc_dma_unconfigure(qcdev->thc_hw);
+
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Reconfig DMA failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int handle_input_report(struct quicki2c_device *qcdev)
+{
+	struct hidi2c_report_packet *pkt = (struct hidi2c_report_packet *)qcdev->input_buf;
+	int rx_dma_finished = 0;
+	size_t report_len;
+	int ret;
+
+	while (!rx_dma_finished) {
+		ret = thc_rxdma_read(qcdev->thc_hw, THC_RXDMA2,
+				     (u8 *)pkt, &report_len,
+				     &rx_dma_finished);
+		if (ret)
+			return ret;
+
+		if (!pkt->len) {
+			if (qcdev->state == QUICKI2C_RESETING) {
+				qcdev->reset_ack = true;
+				wake_up(&qcdev->reset_ack_wq);
+
+				qcdev->state = QUICKI2C_RESETED;
+			} else {
+				dev_warn(qcdev->dev, "unexpected DIR happen\n");
+			}
+
+			continue;
+		}
+
+		/* discard samples before driver probe complete */
+		if (qcdev->state != QUICKI2C_ENABLED)
+			continue;
+
+		quicki2c_hid_send_report(qcdev, pkt->data,
+					 HIDI2C_DATA_LEN(le16_to_cpu(pkt->len)));
+	}
+
+	return 0;
+}
+
 /**
  * quicki2c_irq_thread_handler - IRQ thread handler of quicki2c driver
  *
@@ -221,6 +287,7 @@ static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
 static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 {
 	struct quicki2c_device *qcdev = dev_id;
+	int err_recover = 0;
 	int int_mask;
 
 	if (qcdev->state == QUICKI2C_DISABLED)
@@ -228,8 +295,25 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 
 	int_mask = thc_interrupt_handler(qcdev->thc_hw);
 
+	if (int_mask & BIT(THC_FATAL_ERR_INT) || int_mask & BIT(THC_TXN_ERR_INT) ||
+	    int_mask & BIT(THC_UNKNOWN_INT)) {
+		err_recover = 1;
+		goto exit;
+	}
+
+	if (int_mask & BIT(THC_RXDMA2_INT)) {
+		err_recover = handle_input_report(qcdev);
+		if (err_recover)
+			goto exit;
+	}
+
+exit:
 	thc_interrupt_enable(qcdev->thc_hw, true);
 
+	if (err_recover)
+		if (try_recover(qcdev))
+			qcdev->state = QUICKI2C_DISABLED;
+
 	return IRQ_HANDLED;
 }
 
@@ -260,6 +344,9 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 	qcdev->pdev = pdev;
 	qcdev->dev = dev;
 	qcdev->mem_addr = mem_addr;
+	qcdev->state = QUICKI2C_DISABLED;
+
+	init_waitqueue_head(&qcdev->reset_ack_wq);
 
 	/* thc hw init */
 	qcdev->thc_hw = thc_dev_init(qcdev->dev, qcdev->mem_addr);
@@ -275,6 +362,10 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = thc_port_select(qcdev->thc_hw, THC_PORT_TYPE_I2C);
 	if (ret) {
 		dev_err_once(dev, "Failed to select THC port, ret = %d.\n", ret);
@@ -288,10 +379,14 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 	if (ret)
 		return ERR_PTR(ret);
 
+	thc_int_trigger_type_select(qcdev->thc_hw, false);
+
 	thc_interrupt_config(qcdev->thc_hw);
 
 	thc_interrupt_enable(qcdev->thc_hw, true);
 
+	qcdev->state = QUICKI2C_INITED;
+
 	return qcdev;
 }
 
@@ -305,6 +400,114 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 {
 	thc_interrupt_enable(qcdev->thc_hw, false);
+	thc_ltr_unconfig(qcdev->thc_hw);
+
+	qcdev->state = QUICKI2C_DISABLED;
+}
+
+/**
+ * quicki2c_dma_init - Configure THC DMA for quicki2c device
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * This function uses TIC's parameters(such as max input length, max output
+ * length) to allocate THC DMA buffers and configure THC DMA engines.
+ *
+ * Return: 0 if success or error code on failed.
+ */
+static int quicki2c_dma_init(struct quicki2c_device *qcdev)
+{
+	size_t swdma_max_len;
+	int ret;
+
+	swdma_max_len = max(le16_to_cpu(qcdev->dev_desc.max_input_len),
+			    le16_to_cpu(qcdev->dev_desc.report_desc_len));
+
+	ret = thc_dma_set_max_packet_sizes(qcdev->thc_hw, 0,
+					   le16_to_cpu(qcdev->dev_desc.max_input_len),
+					   le16_to_cpu(qcdev->dev_desc.max_output_len),
+					   swdma_max_len);
+	if (ret)
+		return ret;
+
+	ret = thc_dma_allocate(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Allocate THC DMA buffer failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	/* Enable RxDMA */
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Configure THC DMA failed, ret = %d\n", ret);
+		thc_dma_unconfigure(qcdev->thc_hw);
+		thc_dma_release(qcdev->thc_hw);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * quicki2c_dma_deinit - Release THC DMA for quicki2c device
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * Stop THC DMA engines and release all DMA buffers.
+ *
+ */
+static void quicki2c_dma_deinit(struct quicki2c_device *qcdev)
+{
+	thc_dma_unconfigure(qcdev->thc_hw);
+	thc_dma_release(qcdev->thc_hw);
+}
+
+/**
+ * quicki2c_alloc_report_buf - Alloc report buffers
+ * @qcdev: pointer to the quicki2c device structure
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
+ * Return: 0 if success or error code on failed.
+ */
+static int quicki2c_alloc_report_buf(struct quicki2c_device *qcdev)
+{
+	size_t max_report_len;
+
+	qcdev->report_descriptor = devm_kzalloc(qcdev->dev,
+						le16_to_cpu(qcdev->dev_desc.report_desc_len),
+						GFP_KERNEL);
+	if (!qcdev->report_descriptor)
+		return -ENOMEM;
+
+	/*
+	 * Some HIDI2C devices don't declare input/output max length correctly,
+	 * give default 4K buffer to avoid DMA buffer overrun.
+	 */
+	max_report_len = max(le16_to_cpu(qcdev->dev_desc.max_input_len), SZ_4K);
+
+	qcdev->input_buf = devm_kzalloc(qcdev->dev, max_report_len, GFP_KERNEL);
+	if (!qcdev->input_buf)
+		return -ENOMEM;
+
+	if (!le16_to_cpu(qcdev->dev_desc.max_output_len))
+		qcdev->dev_desc.max_output_len = cpu_to_le16(SZ_4K);
+
+	max_report_len = max(le16_to_cpu(qcdev->dev_desc.max_output_len),
+			     max_report_len);
+
+	qcdev->report_buf = devm_kzalloc(qcdev->dev, max_report_len, GFP_KERNEL);
+	if (!qcdev->report_buf)
+		return -ENOMEM;
+
+	qcdev->report_len = max_report_len;
+
+	return 0;
 }
 
 /*
@@ -313,6 +516,18 @@ static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
  * @pdev: point to pci device
  * @id: point to pci_device_id structure
  *
+ * This function initializes THC and HIDI2C device, the flow is:
+ * - do THC pci device initialization
+ * - query HIDI2C ACPI parameters
+ * - configure THC to HIDI2C mode
+ * - go through HIDI2C enumeration flow
+ *   |- read device descriptor
+ *   |- reset HIDI2C device
+ * - enable THC interrupt and DMA
+ * - read report descriptor
+ * - register HID device
+ * - enable runtime power management
+ *
  * Return 0 if success or error code on failed.
  */
 static int quicki2c_probe(struct pci_dev *pdev,
@@ -376,8 +591,60 @@ static int quicki2c_probe(struct pci_dev *pdev,
 		goto dev_deinit;
 	}
 
+	ret = quicki2c_get_device_descriptor(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Get device descriptor failed, ret = %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_alloc_report_buf(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Alloc report buffers failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_dma_init(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
+	if (ret)
+		goto dev_deinit;
+
+	ret = quicki2c_set_power(qcdev, HIDI2C_ON);
+	if (ret) {
+		dev_err(&pdev->dev, "Set Power On command failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_reset(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Reset HIDI2C device failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_get_report_descriptor(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Get report descriptor failed, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	ret = quicki2c_hid_probe(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register HID device, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	qcdev->state = QUICKI2C_ENABLED;
+
+	dev_dbg(&pdev->dev, "QuickI2C probe success\n");
+
 	return 0;
 
+dma_deinit:
+	quicki2c_dma_deinit(qcdev);
 dev_deinit:
 	quicki2c_dev_deinit(qcdev);
 unmap_io_region:
@@ -404,6 +671,9 @@ static void quicki2c_remove(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	quicki2c_hid_remove(qcdev);
+	quicki2c_dma_deinit(qcdev);
+
 	quicki2c_dev_deinit(qcdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -427,6 +697,9 @@ static void quicki2c_shutdown(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
+	quicki2c_dma_deinit(qcdev);
+
 	quicki2c_dev_deinit(qcdev);
 }
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index d6ad731120ce..0fdac6ba1b04 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -5,6 +5,7 @@
 #define _QUICKI2C_DEV_H_
 
 #include <linux/hid-over-i2c.h>
+#include <linux/workqueue.h>
 
 #define THC_LNL_DEVICE_ID_I2C_PORT1	0xA848
 #define THC_LNL_DEVICE_ID_I2C_PORT2	0xA84A
@@ -141,6 +142,8 @@ struct acpi_device;
  * @input_buf: store a copy of latest input report data
  * @report_buf: store a copy of latest input/output report packet from set/get feature
  * @report_len: the length of input/output report packet
+ * @reset_ack_wq: workqueue for waiting reset response from device
+ * @reset_ack: indicate reset response received or not
  */
 struct quicki2c_device {
 	struct device *dev;
@@ -167,6 +170,9 @@ struct quicki2c_device {
 	u8 *input_buf;
 	u8 *report_buf;
 	u32 report_len;
+
+	wait_queue_head_t reset_ack_wq;
+	bool reset_ack;
 };
 
 #endif /* _QUICKI2C_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index 0540003c221e..f493df0d5dc4 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -195,3 +195,30 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 
 	return buf_len;
 }
+
+#define HIDI2C_RESET_TIMEOUT		5
+
+int quicki2c_reset(struct quicki2c_device *qcdev)
+{
+	int ret;
+
+	qcdev->reset_ack = false;
+	qcdev->state = QUICKI2C_RESETING;
+
+	ret = write_cmd_to_txdma(qcdev, HIDI2C_RESET, HIDI2C_RESERVED, 0, NULL, 0);
+	if (ret) {
+		dev_err_once(qcdev->dev, "Send reset command failed, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qcdev->reset_ack_wq, qcdev->reset_ack,
+					       HIDI2C_RESET_TIMEOUT * HZ);
+	if (ret <= 0 || !qcdev->reset_ack) {
+		dev_err_once(qcdev->dev,
+			     "Wait reset response timed out ret:%d timeout:%ds\n",
+			     ret, HIDI2C_RESET_TIMEOUT);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
index 3a0d66c7d9ef..bf4908cce59c 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -15,5 +15,6 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, u32 buf_len);
 int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
+int quicki2c_reset(struct quicki2c_device *qcdev);
 
 #endif /* _QUICKI2C_PROTOCOL_H_ */
-- 
2.40.1


