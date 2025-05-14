Return-Path: <linux-input+bounces-12360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0037AB62F0
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E48B24671AC
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472B120B81E;
	Wed, 14 May 2025 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4FkQ37d"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A11FBC8C;
	Wed, 14 May 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203656; cv=none; b=KbUK7Dobe2KOHmO0qrnVTF88TgzkqGe9tsoF0bN/AfzC6IfDHOL4uAuXx8FTxm/ryt1lOqPvlUo3CArP9dUY1rY7BTxDN4BRojeH/1rtWV8POhc527BPDVszNTUQEcB+syX4Q4gBHLirXTkMncnUcldJrob1G8ee+X+qtl1dlRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203656; c=relaxed/simple;
	bh=KrSfCGjyZrny1Ondd1B+23Fo2z1scVAOk9YRyaUWKZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W3PWM1oHuiFk0oOHtxHXTHoHco46SdmgPQQ9Ys3iCKojmrDLTrVcDZtTwHNpQREOEFzTInS/+rsHJcU+ImtzE83dTJjLB7wE+UNNdsPwh+w5uXr7/vkekd+FFn0uOqQa/ScxmygnmAF027eXsydraXQLY4CRtPVNHdizoBdymdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4FkQ37d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203651; x=1778739651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KrSfCGjyZrny1Ondd1B+23Fo2z1scVAOk9YRyaUWKZo=;
  b=R4FkQ37diARJJ0i5qw7J71Hf1SyiudsCHKO2ZUjqoo2gtgfde0e6Qkwi
   SNY2zEj7ExhjAV6kuZ8Ttj/lNU2Z05bdrb5tW3i8x5C16+w3mVsgsXIMb
   FrMkV7+DPDSHIv4enFO4QxFDlcgDM+DTRAroFJaiGo6HMVvHJ4+D09gfI
   70LAE1mLykT7fTqK1OfrbGSlF6GnADiXggc6gS/Hin0qYvP2qr2Rrnu1k
   4nbzISjBnqfhjX9E84VHVPAplR0ceUYaFuJqqlg+kGPdaw4h4UYXEDbnV
   gE+pmlC+4V+LpUrzLFtnO+G/qU1/PS3D+IT91tLgd6AigKJ5/AgSZL6dB
   A==;
X-CSE-ConnectionGUID: zUFxGjKcR/y+Dco2UByhQQ==
X-CSE-MsgGUID: 1eFGpu0iT+eWJMtjDxiJTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192374"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:50 -0700
X-CSE-ConnectionGUID: 0MOdMOb9RM6yx8EKdwVrtA==
X-CSE-MsgGUID: aYlE5Ic1SEG3XhTxUMY2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138867025"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:50 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 6/7] HID: Intel-thc-hid: Intel-quicki2c: Add driver data support
Date: Wed, 14 May 2025 14:19:43 +0800
Message-Id: <20250514061944.125857-7-even.xu@intel.com>
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

This patch defines driver data structure and adds it into QuickI2C
device structure. Changes PCI ID table to use PCI_DEVICE_DATA() to
pass platform specific driver data into driver, let driver has
capability to enable different hardware features according to
different platform driver data.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 25 +++++++++++--------
 .../intel-quicki2c/quicki2c-dev.h             | 24 +++++++++++++-----
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index af7282e998c7..918cb9eb6b50 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -328,6 +328,7 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
  * quicki2c_dev_init - Initialize QuickI2C device
  * @pdev: Pointer to the THC PCI device
  * @mem_addr: The Pointer of MMIO memory address
+ * @ddata: Point to quicki2c_ddata structure
  *
  * Alloc quicki2c_device structure and initialized THC device,
  * then configure THC to HIDI2C mode.
@@ -337,7 +338,8 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
  * Return: Pointer to the quicki2c_device structure if success
  * or NULL on failure.
  */
-static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __iomem *mem_addr)
+static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __iomem *mem_addr,
+						 const struct quicki2c_ddata *ddata)
 {
 	struct device *dev = &pdev->dev;
 	struct quicki2c_device *qcdev;
@@ -351,6 +353,7 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 	qcdev->dev = dev;
 	qcdev->mem_addr = mem_addr;
 	qcdev->state = QUICKI2C_DISABLED;
+	qcdev->ddata = ddata;
 
 	init_waitqueue_head(&qcdev->reset_ack_wq);
 
@@ -534,9 +537,9 @@ static int quicki2c_alloc_report_buf(struct quicki2c_device *qcdev)
  *
  * Return 0 if success or error code on failure.
  */
-static int quicki2c_probe(struct pci_dev *pdev,
-			  const struct pci_device_id *id)
+static int quicki2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	const struct quicki2c_ddata *ddata = (const struct quicki2c_ddata *)id->driver_data;
 	struct quicki2c_device *qcdev;
 	void __iomem *mem_addr;
 	int ret;
@@ -574,7 +577,7 @@ static int quicki2c_probe(struct pci_dev *pdev,
 
 	pdev->irq = pci_irq_vector(pdev, 0);
 
-	qcdev = quicki2c_dev_init(pdev, mem_addr);
+	qcdev = quicki2c_dev_init(pdev, mem_addr, ddata);
 	if (IS_ERR(qcdev)) {
 		dev_err_once(&pdev->dev, "QuickI2C device init failed\n");
 		ret = PTR_ERR(qcdev);
@@ -924,13 +927,13 @@ static const struct dev_pm_ops quicki2c_pm_ops = {
 };
 
 static const struct pci_device_id quicki2c_pci_tbl[] = {
-	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT1), },
-	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT2), },
-	{PCI_VDEVICE(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT1), },
-	{PCI_VDEVICE(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2), },
-	{PCI_VDEVICE(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1), },
-	{PCI_VDEVICE(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2), },
-	{}
+	{ PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_I2C_PORT1, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_I2C_PORT2, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT1, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, NULL) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 43372253ba9c..e130598d13c1 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -7,12 +7,12 @@
 #include <linux/hid-over-i2c.h>
 #include <linux/workqueue.h>
 
-#define THC_LNL_DEVICE_ID_I2C_PORT1	0xA848
-#define THC_LNL_DEVICE_ID_I2C_PORT2	0xA84A
-#define THC_PTL_H_DEVICE_ID_I2C_PORT1	0xE348
-#define THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
-#define THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
-#define THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_I2C_PORT1		0xA848
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_I2C_PORT2		0xA84A
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT1	0xE348
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
 
 /* Packet size value, the unit is 16 bytes */
 #define MAX_PACKET_SIZE_VALUE_LNL			256
@@ -122,6 +122,16 @@ struct quicki2c_subip_acpi_config {
 	u64 HMSL;
 };
 
+/**
+ * struct quicki2c_ddata - Driver specific data for quicki2c device
+ * @max_detect_size: Identify max packet size detect for rx
+ * @interrupt_delay: Identify interrupt detect delay for rx
+ */
+struct quicki2c_ddata {
+	u32 max_detect_size;
+	u32 interrupt_delay;
+};
+
 struct device;
 struct pci_dev;
 struct thc_device;
@@ -135,6 +145,7 @@ struct acpi_device;
  * @thc_hw: Point to THC device
  * @hid_dev: Point to HID device
  * @acpi_dev: Point to ACPI device
+ * @ddata: Point to QuickI2C platform specific driver data
  * @state: THC I2C device state
  * @mem_addr: MMIO memory address
  * @dev_desc: Device descriptor for HIDI2C protocol
@@ -158,6 +169,7 @@ struct quicki2c_device {
 	struct thc_device *thc_hw;
 	struct hid_device *hid_dev;
 	struct acpi_device *acpi_dev;
+	const struct quicki2c_ddata *ddata;
 	enum quicki2c_dev_state state;
 
 	void __iomem *mem_addr;
-- 
2.40.1


