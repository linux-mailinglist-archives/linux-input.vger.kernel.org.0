Return-Path: <linux-input+bounces-8593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E99F2825
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C802C167767
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619661D5ABF;
	Mon, 16 Dec 2024 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp+hZzmz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437E1CEE8A;
	Mon, 16 Dec 2024 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313371; cv=none; b=QcJ3AL031d0oHr7GkfJ8e9bu4LjMk7vgMQRWbzxtGuzIt0AlsXYbqgLUs4KBZnOTHsw4STTCivwr5hL1Z4+PB7vLrOhnY5cZ1ZjGecqvpZIDtflTDyiNWldWGlwClc7hsnnTKX7Jv4rYMEj44B4lq95BDizZ+oTbS46N2M+srXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313371; c=relaxed/simple;
	bh=bKp/0fwGGGoM8Omj5SQhW4rHR2g7TAuijByxCFAXtbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cTJ5oIcC6DCv8naD3p+0RRSx5EGughzJ3puXWjZkQxsvnn/ARkLVMAllFkB3Br0m5MgXJMc3kqYuZLohs6cZHxXGmqZMZOJWZ8njU4t1oxk2mSXw0AtLleNBS5F3b/crPE+rT4iczrnvQurdrPkaWgdcSRdgsFob3RYszYSHSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp+hZzmz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313368; x=1765849368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bKp/0fwGGGoM8Omj5SQhW4rHR2g7TAuijByxCFAXtbs=;
  b=Jp+hZzmzcsWzYAfREPi7SdE3xFhckHRrciXBhdoKKF0Awro6Eqb3iWMg
   qtLnhKSEiCRHFuEQ1jCZ/t2qBMalsRJARdWHgQjmgH5X8TnC6Kh3nq2SR
   O1F8xYS7za0Lvku/ypJTuJVbQPakzGPQBg+wS+eAG9nRo13wDCE9FHuzj
   ZykNFyE5Ibyov7nxHpsQKvgzx3YoqnuI5AKKyaIZAveg+g+CGacOKD6+V
   POzXkNGNU1KF33T8mcku4yatvO5+sb3HzwrMtlxnSksgycTAjN+oZwLc1
   1BKo7qRBstZTengKv2EPra6NuqkhcCvEcIM3rk4AXpRDjRPkRQ7r6rr0J
   g==;
X-CSE-ConnectionGUID: H4D99PamQq2lCfqrAOxC0g==
X-CSE-MsgGUID: kIrF0LiiRrmHVtnqmEyiEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013106"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013106"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:48 -0800
X-CSE-ConnectionGUID: puOqPSPsRyS5CG3VKQHK5A==
X-CSE-MsgGUID: 3Db/MuuiS/Kd24ADYWUFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084262"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:45 -0800
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
Subject: [PATCH v3 17/22] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
Date: Mon, 16 Dec 2024 09:41:22 +0800
Message-Id: <20241216014127.3722172-18-even.xu@intel.com>
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

Create intel-quicki2c folder and add Kconfig and Makefile for THC
QuickI2C driver. Add basic device structure, definitions and probe/remove
functions for QuickI2C driver.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Kconfig             |  11 +
 drivers/hid/intel-thc-hid/Makefile            |   3 +
 .../intel-quicki2c/pci-quicki2c.c             | 270 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |  48 ++++
 4 files changed, 332 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index 25a3729df92a..84c2db881bf4 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -28,4 +28,15 @@ config INTEL_QUICKSPI
 
 	  Say Y/M here if you want to support Intel QuickSPI. If unsure, say N.
 
+config INTEL_QUICKI2C
+	tristate "Intel QuickI2C driver based on Intel Touch Host Controller"
+	depends on INTEL_THC_HID
+	help
+	  Intel QuickI2C, uses Touch Host Controller (THC) hardware, implements
+	  HIDI2C (HID over I2C) protocol. It configures THC to work in I2C
+	  mode, and controls THC hardware sequencer to accelerate HIDI2C
+	  transaction flow.
+
+	  Say Y/M here if you want to support Intel QuickI2C. If unsure, say N.
+
 endmenu
diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 2dba4db70c33..4d4f02e1c415 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -14,4 +14,7 @@ intel-quickspi-objs += intel-quickspi/pci-quickspi.o
 intel-quickspi-objs += intel-quickspi/quickspi-hid.o
 intel-quickspi-objs += intel-quickspi/quickspi-protocol.o
 
+obj-$(CONFIG_INTEL_QUICKI2C) += intel-quicki2c.o
+intel-quicki2c-objs += intel-quicki2c/pci-quicki2c.o
+
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
new file mode 100644
index 000000000000..3919ae3e1400
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -0,0 +1,270 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/pci.h>
+
+#include "intel-thc-dev.h"
+
+#include "quicki2c-dev.h"
+
+/**
+ * quicki2c_irq_quick_handler - The ISR of the quicki2c driver
+ *
+ * @irq: The irq number
+ * @dev_id: pointer to the device structure
+ *
+ * Return: IRQ_WAKE_THREAD if further process needed.
+ */
+static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
+{
+	struct quicki2c_device *qcdev = dev_id;
+
+	if (qcdev->state == QUICKI2C_DISABLED)
+		return IRQ_HANDLED;
+
+	/* Disable THC interrupt before current interrupt be handled */
+	thc_interrupt_enable(qcdev->thc_hw, false);
+
+	return IRQ_WAKE_THREAD;
+}
+
+/**
+ * quicki2c_irq_thread_handler - IRQ thread handler of quicki2c driver
+ *
+ * @irq: The IRQ number
+ * @dev_id: pointer to the quicki2c device structure
+ *
+ * Return: IRQ_HANDLED to finish this handler.
+ */
+static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
+{
+	struct quicki2c_device *qcdev = dev_id;
+	int int_mask;
+
+	if (qcdev->state == QUICKI2C_DISABLED)
+		return IRQ_HANDLED;
+
+	int_mask = thc_interrupt_handler(qcdev->thc_hw);
+
+	thc_interrupt_enable(qcdev->thc_hw, true);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * quicki2c_dev_init - Initialize quicki2c device
+ *
+ * @pdev: pointer to the thc pci device
+ * @mem_addr: The pointer of MMIO memory address
+ *
+ * Alloc quicki2c device structure and initialized THC device,
+ * then configure THC to HIDI2C mode.
+ *
+ * If success, enable THC hardware interrupt.
+ *
+ * Return: pointer to the quicki2c device structure if success
+ * or NULL on failed.
+ */
+static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __iomem *mem_addr)
+{
+	struct device *dev = &pdev->dev;
+	struct quicki2c_device *qcdev;
+	int ret;
+
+	qcdev = devm_kzalloc(dev, sizeof(struct quicki2c_device), GFP_KERNEL);
+	if (!qcdev)
+		return ERR_PTR(-ENOMEM);
+
+	qcdev->pdev = pdev;
+	qcdev->dev = dev;
+	qcdev->mem_addr = mem_addr;
+
+	/* thc hw init */
+	qcdev->thc_hw = thc_dev_init(qcdev->dev, qcdev->mem_addr);
+	if (IS_ERR(qcdev->thc_hw)) {
+		ret = PTR_ERR(qcdev->thc_hw);
+		dev_err_once(dev, "Failed to initialize THC device context, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = thc_port_select(qcdev->thc_hw, THC_PORT_TYPE_I2C);
+	if (ret) {
+		dev_err_once(dev, "Failed to select THC port, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	thc_interrupt_config(qcdev->thc_hw);
+
+	thc_interrupt_enable(qcdev->thc_hw, true);
+
+	return qcdev;
+}
+
+/**
+ * quicki2c_dev_deinit - De-initialize quicki2c device
+ *
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * Disable THC interrupt and deinitilize THC.
+ */
+static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
+{
+	thc_interrupt_enable(qcdev->thc_hw, false);
+}
+
+/*
+ * quicki2c_probe: Quicki2c driver probe function
+ *
+ * @pdev: point to pci device
+ * @id: point to pci_device_id structure
+ *
+ * Return 0 if success or error code on failed.
+ */
+static int quicki2c_probe(struct pci_dev *pdev,
+			  const struct pci_device_id *id)
+{
+	struct quicki2c_device *qcdev;
+	void __iomem *mem_addr;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err_once(&pdev->dev, "Failed to enable PCI device, ret = %d.\n", ret);
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	ret = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
+	if (ret) {
+		dev_err_once(&pdev->dev, "Failed to get PCI regions, ret = %d.\n", ret);
+		goto disable_pci_device;
+	}
+
+	mem_addr = pcim_iomap_table(pdev)[0];
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err_once(&pdev->dev, "No usable DMA configuration %d\n", ret);
+			goto unmap_io_region;
+		}
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0) {
+		dev_err_once(&pdev->dev,
+			     "Failed to allocate IRQ vectors. ret = %d\n", ret);
+		goto unmap_io_region;
+	}
+
+	pdev->irq = pci_irq_vector(pdev, 0);
+
+	qcdev = quicki2c_dev_init(pdev, mem_addr);
+	if (IS_ERR(qcdev)) {
+		dev_err_once(&pdev->dev, "QuickI2C device init failed\n");
+		ret = PTR_ERR(qcdev);
+		goto unmap_io_region;
+	}
+
+	pci_set_drvdata(pdev, qcdev);
+
+	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
+					quicki2c_irq_quick_handler,
+					quicki2c_irq_thread_handler,
+					IRQF_ONESHOT, KBUILD_MODNAME,
+					qcdev);
+	if (ret) {
+		dev_err_once(&pdev->dev,
+			     "Failed to request threaded IRQ, irq = %d.\n", pdev->irq);
+		goto dev_deinit;
+	}
+
+	return 0;
+
+dev_deinit:
+	quicki2c_dev_deinit(qcdev);
+unmap_io_region:
+	pcim_iounmap_regions(pdev, BIT(0));
+disable_pci_device:
+	pci_clear_master(pdev);
+
+	return ret;
+}
+
+/**
+ * quicki2c_remove - Device Removal Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called by the PCI subsystem to alert the driver
+ * that it should release a PCI device.
+ */
+static void quicki2c_remove(struct pci_dev *pdev)
+{
+	struct quicki2c_device *qcdev;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return;
+
+	quicki2c_dev_deinit(qcdev);
+
+	pcim_iounmap_regions(pdev, BIT(0));
+	pci_clear_master(pdev);
+}
+
+/**
+ * quicki2c_shutdown - Device Shutdown Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called from the reboot notifier
+ * it's a simplified version of remove so we go down
+ * faster.
+ */
+static void quicki2c_shutdown(struct pci_dev *pdev)
+{
+	struct quicki2c_device *qcdev;
+
+	qcdev = pci_get_drvdata(pdev);
+	if (!qcdev)
+		return;
+
+	quicki2c_dev_deinit(qcdev);
+}
+
+static const struct pci_device_id quicki2c_pci_tbl[] = {
+	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT1), },
+	{PCI_VDEVICE(INTEL, THC_LNL_DEVICE_ID_I2C_PORT2), },
+	{PCI_VDEVICE(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT1), },
+	{PCI_VDEVICE(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2), },
+	{PCI_VDEVICE(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1), },
+	{PCI_VDEVICE(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2), },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
+
+static struct pci_driver quicki2c_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = quicki2c_pci_tbl,
+	.probe = quicki2c_probe,
+	.remove = quicki2c_remove,
+	.shutdown = quicki2c_shutdown,
+	.driver.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+};
+
+module_pci_driver(quicki2c_driver);
+
+MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
+MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
+
+MODULE_DESCRIPTION("Intel(R) QuickI2C Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("INTEL_THC");
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
new file mode 100644
index 000000000000..90c4ffe5ccfa
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKI2C_DEV_H_
+#define _QUICKI2C_DEV_H_
+
+#define THC_LNL_DEVICE_ID_I2C_PORT1	0xA848
+#define THC_LNL_DEVICE_ID_I2C_PORT2	0xA84A
+#define THC_PTL_H_DEVICE_ID_I2C_PORT1	0xE348
+#define THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
+#define THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
+#define THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
+
+/* Packet size value, the unit is 16 bytes */
+#define MAX_PACKET_SIZE_VALUE_LNL			256
+
+enum quicki2c_dev_state {
+	QUICKI2C_NONE,
+	QUICKI2C_RESETING,
+	QUICKI2C_RESETED,
+	QUICKI2C_INITED,
+	QUICKI2C_ENABLED,
+	QUICKI2C_DISABLED,
+};
+
+struct device;
+struct pci_dev;
+struct thc_device;
+
+/**
+ * struct quicki2c_device -  THC QuickI2C device struct
+ * @dev: point to kernel device
+ * @pdev: point to PCI device
+ * @thc_hw: point to THC device
+ * @driver_data: point to quicki2c specific driver data
+ * @state: THC I2C device state
+ * @mem_addr: MMIO memory address
+ */
+struct quicki2c_device {
+	struct device *dev;
+	struct pci_dev *pdev;
+	struct thc_device *thc_hw;
+	enum quicki2c_dev_state state;
+
+	void __iomem *mem_addr;
+};
+
+#endif /* _QUICKI2C_DEV_H_ */
-- 
2.40.1


