Return-Path: <linux-input+bounces-12358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2EAB62ED
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A22467433
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26913204F73;
	Wed, 14 May 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgZYNdk8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C01F9F7C;
	Wed, 14 May 2025 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203651; cv=none; b=nrOrfQtFvheeUQ5a4KyrJKJ4i8FVQjojhHRXlgcepo5mT4xpnrlFAXNvLlqyphPSqO6HOi1i1s0C79MExfq0oQegHPHaTWYtirL+g6gc3Nfuuod6g6VyPuRmYaBXvN1BPtLzRPPIO+82wOl0Q9mJquXokZKBGwccqtkunBoYRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203651; c=relaxed/simple;
	bh=m4Ma78o22pbOirTexfxTbQAIQ3En4uuLWqUK8Q3sRHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNyuGxk69lsVv+6562x5eYG/EAI0DdqL1zDLXu8TXFnKLYojdABnpti1z7JKfykgnN3NmKx2GCX6ROQh2RuWBK+KxrzmAeKKCE3ZU62OkEgAyhzlutdaNyVf9CMY7RE7wJCaEXz+oO0NI3uvMZWj50j6Eh39LgZD+eZ9eTkz/eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgZYNdk8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203649; x=1778739649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m4Ma78o22pbOirTexfxTbQAIQ3En4uuLWqUK8Q3sRHg=;
  b=EgZYNdk8468zkCg/QPU1boKnLhSCBgsYip4X49dtEE9tFRxLdgrHXBZr
   +7/P2vcDnNwCNj8bPI0UzVVt9aCsANXRXznSu3qgOZP+8ajqd0lIZUz/H
   V6YgtsXM6opNhBsOb581kNADYkqnJRUqE886hZ+T6wWW2yZhXoxSPZ4iJ
   fME8/6ZbltJ0mFtsVQdQ6bOpdn3zsRyK18c2Ll5BTKN2XUOL74F+72c/Z
   Gk611q5ao3OqDiIFBBITlK7iurPZXk62x08PmoswFrUo15wPUNlbbP8PF
   bT72qTqAX70ieX7wnLepjbbZxtO4fI9vK+6U7lV+Wee3i7KMc4s/F9CY7
   Q==;
X-CSE-ConnectionGUID: KJ6+0Hz1THOCtggqIKZ/7A==
X-CSE-MsgGUID: QrjG82VMTJKR3vnIdioicg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192372"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:48 -0700
X-CSE-ConnectionGUID: ndb/fKN6SnKf2dVlNrPU7Q==
X-CSE-MsgGUID: 4MsL1Q70RMG3WZw+4s03nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138867016"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:47 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/7] HID: Intel-thc-hid: Intel-quicki2c: Refine code comments
Date: Wed, 14 May 2025 14:19:42 +0800
Message-Id: <20250514061944.125857-6-even.xu@intel.com>
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

Align capitalization of the first characters for all code comments and
refine some descriptions.

Signed-off-by: Even Xu <even.xu@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 125 ++++++++----------
 .../intel-quicki2c/quicki2c-dev.h             |  25 ++--
 2 files changed, 69 insertions(+), 81 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index fa51155ebe39..af7282e998c7 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -29,17 +29,16 @@ static guid_t thc_platform_guid =
 
 /**
  * quicki2c_acpi_get_dsm_property - Query device ACPI DSM parameter
- *
- * @adev: point to ACPI device
+ * @adev: Point to ACPI device
  * @guid: ACPI method's guid
  * @rev: ACPI method's revision
  * @func: ACPI method's function number
  * @type: ACPI parameter's data type
- * @prop_buf: point to return buffer
+ * @prop_buf: Point to return buffer
  *
  * This is a helper function for device to query its ACPI DSM parameters.
  *
- * Return: 0 if success or ENODEV on failed.
+ * Return: 0 if success or ENODEV on failure.
  */
 static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t *guid,
 					  u64 rev, u64 func, acpi_object_type type, void *prop_buf)
@@ -67,11 +66,10 @@ static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t
 
 /**
  * quicki2c_acpi_get_dsd_property - Query device ACPI DSD parameter
- *
- * @adev: point to ACPI device
+ * @adev: Point to ACPI device
  * @dsd_method_name: ACPI method's property name
  * @type: ACPI parameter's data type
- * @prop_buf: point to return buffer
+ * @prop_buf: Point to return buffer
  *
  * This is a helper function for device to query its ACPI DSD parameters.
  *
@@ -105,13 +103,12 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 }
 
 /**
- * quicki2c_get_acpi_resources - Query all quicki2c devices' ACPI parameters
- *
- * @qcdev: point to quicki2c device
+ * quicki2c_get_acpi_resources - Query all QuickI2C devices' ACPI parameters
+ * @qcdev: Point to quicki2c_device structure
  *
- * This function gets all quicki2c devices' ACPI resource.
+ * This function gets all QuickI2C devices' ACPI resource.
  *
- * Return: 0 if success or error code on failed.
+ * Return: 0 if success or error code on failure.
  */
 static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 {
@@ -197,10 +194,9 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 }
 
 /**
- * quicki2c_irq_quick_handler - The ISR of the quicki2c driver
- *
+ * quicki2c_irq_quick_handler - The ISR of the QuickI2C driver
  * @irq: The irq number
- * @dev_id: pointer to the device structure
+ * @dev_id: Pointer to the quicki2c_device structure
  *
  * Return: IRQ_WAKE_THREAD if further process needed.
  */
@@ -219,13 +215,13 @@ static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
 
 /**
  * try_recover - Try to recovery THC and Device
- * @qcdev: pointer to quicki2c device
+ * @qcdev: Pointer to quicki2c_device structure
  *
- * This function is a error handler, called when fatal error happens.
- * It try to reset Touch Device and re-configure THC to recovery
- * transferring between Device and THC.
+ * This function is an error handler, called when fatal error happens.
+ * It try to reset touch device and re-configure THC to recovery
+ * communication between touch device and THC.
  *
- * Return: 0 if successful or error code on failed
+ * Return: 0 if successful or error code on failure
  */
 static int try_recover(struct quicki2c_device *qcdev)
 {
@@ -269,7 +265,7 @@ static int handle_input_report(struct quicki2c_device *qcdev)
 			continue;
 		}
 
-		/* discard samples before driver probe complete */
+		/* Discard samples before driver probe complete */
 		if (qcdev->state != QUICKI2C_ENABLED)
 			continue;
 
@@ -281,10 +277,9 @@ static int handle_input_report(struct quicki2c_device *qcdev)
 }
 
 /**
- * quicki2c_irq_thread_handler - IRQ thread handler of quicki2c driver
- *
+ * quicki2c_irq_thread_handler - IRQ thread handler of QuickI2C driver
  * @irq: The IRQ number
- * @dev_id: pointer to the quicki2c device structure
+ * @dev_id: Pointer to the quicki2c_device structure
  *
  * Return: IRQ_HANDLED to finish this handler.
  */
@@ -330,18 +325,17 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 }
 
 /**
- * quicki2c_dev_init - Initialize quicki2c device
- *
- * @pdev: pointer to the thc pci device
- * @mem_addr: The pointer of MMIO memory address
+ * quicki2c_dev_init - Initialize QuickI2C device
+ * @pdev: Pointer to the THC PCI device
+ * @mem_addr: The Pointer of MMIO memory address
  *
- * Alloc quicki2c device structure and initialized THC device,
+ * Alloc quicki2c_device structure and initialized THC device,
  * then configure THC to HIDI2C mode.
  *
  * If success, enable THC hardware interrupt.
  *
- * Return: pointer to the quicki2c device structure if success
- * or NULL on failed.
+ * Return: Pointer to the quicki2c_device structure if success
+ * or NULL on failure.
  */
 static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __iomem *mem_addr)
 {
@@ -360,7 +354,7 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 
 	init_waitqueue_head(&qcdev->reset_ack_wq);
 
-	/* thc hw init */
+	/* THC hardware init */
 	qcdev->thc_hw = thc_dev_init(qcdev->dev, qcdev->mem_addr);
 	if (IS_ERR(qcdev->thc_hw)) {
 		ret = PTR_ERR(qcdev->thc_hw);
@@ -403,9 +397,8 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 }
 
 /**
- * quicki2c_dev_deinit - De-initialize quicki2c device
- *
- * @qcdev: pointer to the quicki2c device structure
+ * quicki2c_dev_deinit - De-initialize QuickI2C device
+ * @qcdev: Pointer to the quicki2c_device structure
  *
  * Disable THC interrupt and deinitilize THC.
  */
@@ -418,13 +411,13 @@ static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 }
 
 /**
- * quicki2c_dma_init - Configure THC DMA for quicki2c device
- * @qcdev: pointer to the quicki2c device structure
+ * quicki2c_dma_init - Configure THC DMA for QuickI2C device
+ * @qcdev: Pointer to the quicki2c_device structure
  *
  * This function uses TIC's parameters(such as max input length, max output
  * length) to allocate THC DMA buffers and configure THC DMA engines.
  *
- * Return: 0 if success or error code on failed.
+ * Return: 0 if success or error code on failure.
  */
 static int quicki2c_dma_init(struct quicki2c_device *qcdev)
 {
@@ -456,12 +449,12 @@ static int quicki2c_dma_init(struct quicki2c_device *qcdev)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 /**
- * quicki2c_dma_deinit - Release THC DMA for quicki2c device
- * @qcdev: pointer to the quicki2c device structure
+ * quicki2c_dma_deinit - Release THC DMA for QuickI2C device
+ * @qcdev: Pointer to the quicki2c_device structure
  *
  * Stop THC DMA engines and release all DMA buffers.
  *
@@ -474,7 +467,7 @@ static void quicki2c_dma_deinit(struct quicki2c_device *qcdev)
 
 /**
  * quicki2c_alloc_report_buf - Alloc report buffers
- * @qcdev: pointer to the quicki2c device structure
+ * @qcdev: Pointer to the quicki2c_device structure
  *
  * Allocate report descriptor buffer, it will be used for restore TIC HID
  * report descriptor.
@@ -485,7 +478,7 @@ static void quicki2c_dma_deinit(struct quicki2c_device *qcdev)
  * Allocate output report buffer, it will be used for store HID output report,
  * such as set feature.
  *
- * Return: 0 if success or error code on failed.
+ * Return: 0 if success or error code on failure.
  */
 static int quicki2c_alloc_report_buf(struct quicki2c_device *qcdev)
 {
@@ -523,24 +516,23 @@ static int quicki2c_alloc_report_buf(struct quicki2c_device *qcdev)
 }
 
 /*
- * quicki2c_probe: Quicki2c driver probe function
- *
- * @pdev: point to pci device
- * @id: point to pci_device_id structure
+ * quicki2c_probe: QuickI2C driver probe function
+ * @pdev: Point to PCI device
+ * @id: Point to pci_device_id structure
  *
  * This function initializes THC and HIDI2C device, the flow is:
- * - do THC pci device initialization
- * - query HIDI2C ACPI parameters
- * - configure THC to HIDI2C mode
- * - go through HIDI2C enumeration flow
- *   |- read device descriptor
- *   |- reset HIDI2C device
- * - enable THC interrupt and DMA
- * - read report descriptor
- * - register HID device
- * - enable runtime power management
- *
- * Return 0 if success or error code on failed.
+ * - Do THC pci device initialization
+ * - Query HIDI2C ACPI parameters
+ * - Configure THC to HIDI2C mode
+ * - Go through HIDI2C enumeration flow
+ *   |- Read device descriptor
+ *   |- Reset HIDI2C device
+ * - Enable THC interrupt and DMA
+ * - Read report descriptor
+ * - Register HID device
+ * - Enable runtime power management
+ *
+ * Return 0 if success or error code on failure.
  */
 static int quicki2c_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
@@ -673,11 +665,10 @@ static int quicki2c_probe(struct pci_dev *pdev,
 
 /**
  * quicki2c_remove - Device Removal Routine
+ * @pdev: Point to PCI device structure
  *
- * @pdev: PCI device structure
- *
- * This is called by the PCI subsystem to alert the driver
- * that it should release a PCI device.
+ * This is called by the PCI subsystem to alert the driver that it should
+ * release a PCI device.
  */
 static void quicki2c_remove(struct pci_dev *pdev)
 {
@@ -699,12 +690,10 @@ static void quicki2c_remove(struct pci_dev *pdev)
 
 /**
  * quicki2c_shutdown - Device Shutdown Routine
+ * @pdev: Point to PCI device structure
  *
- * @pdev: PCI device structure
- *
- * This is called from the reboot notifier
- * it's a simplified version of remove so we go down
- * faster.
+ * This is called from the reboot notifier, it's a simplified version of remove
+ * so we go down faster.
  */
 static void quicki2c_shutdown(struct pci_dev *pdev)
 {
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 6ddb584bd611..43372253ba9c 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -130,15 +130,14 @@ struct acpi_device;
 
 /**
  * struct quicki2c_device -  THC QuickI2C device struct
- * @dev: point to kernel device
- * @pdev: point to PCI device
- * @thc_hw: point to THC device
- * @hid_dev: point to hid device
- * @acpi_dev: point to ACPI device
- * @driver_data: point to quicki2c specific driver data
+ * @dev: Point to kernel device
+ * @pdev: Point to PCI device
+ * @thc_hw: Point to THC device
+ * @hid_dev: Point to HID device
+ * @acpi_dev: Point to ACPI device
  * @state: THC I2C device state
  * @mem_addr: MMIO memory address
- * @dev_desc: device descriptor for HIDI2C protocol
+ * @dev_desc: Device descriptor for HIDI2C protocol
  * @i2c_slave_addr: HIDI2C device slave address
  * @hid_desc_addr: Register address for retrieve HID device descriptor
  * @active_ltr_val: THC active LTR value
@@ -146,12 +145,12 @@ struct acpi_device;
  * @i2c_speed_mode: 0 - standard mode, 1 - fast mode, 2 - fast mode plus
  * @i2c_clock_hcnt: I2C CLK high period time (unit in cycle count)
  * @i2c_clock_lcnt: I2C CLK low period time (unit in cycle count)
- * @report_descriptor: store a copy of device report descriptor
- * @input_buf: store a copy of latest input report data
- * @report_buf: store a copy of latest input/output report packet from set/get feature
- * @report_len: the length of input/output report packet
- * @reset_ack_wq: workqueue for waiting reset response from device
- * @reset_ack: indicate reset response received or not
+ * @report_descriptor: Store a copy of device report descriptor
+ * @input_buf: Store a copy of latest input report data
+ * @report_buf: Store a copy of latest input/output report packet from set/get feature
+ * @report_len: The length of input/output report packet
+ * @reset_ack_wq: Workqueue for waiting reset response from device
+ * @reset_ack: Indicate reset response received or not
  */
 struct quicki2c_device {
 	struct device *dev;
-- 
2.40.1


