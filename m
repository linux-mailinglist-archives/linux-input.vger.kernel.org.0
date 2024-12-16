Return-Path: <linux-input+bounces-8587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E59C9F27F2
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A51E164FA6
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B911494D4;
	Mon, 16 Dec 2024 01:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GX4BQEhI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11981494A3;
	Mon, 16 Dec 2024 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313348; cv=none; b=kftB7PV4Yu4Ld6eUhqze+eydRt4KfTr+9oVTO89AlLeMqrYLrnpU62mXuzN8F1b2ISaLT4lwuVDhXegeboW0eXD8qMZsowAPEu/teE7DEsuXDJGB2iZHHu2jaVw2n0VGxCqj0s9VRbDH5lgU5Lt5DUr2nkxAu8K3ZJffcruIuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313348; c=relaxed/simple;
	bh=iHJdamAnrpQ+H7wwOnYxSgdjMoZ1XJyQc7bG4fkrrHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s16BL1x44psj1gyvxDfqJ2tGMABak30uw2I9CIzu1eLmfaXLD+Zn4lm9r7fMpx9BNTaIc2oXHK0OFNu6HoFCXVlKMffPyTsLSUuCtSrVCU8uTDVzzVMX4wfFE/VtwTiTc0GIciduDYOVLbUzvYQ3mlF01+VE/NJIP5F4WUxCV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GX4BQEhI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313347; x=1765849347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iHJdamAnrpQ+H7wwOnYxSgdjMoZ1XJyQc7bG4fkrrHI=;
  b=GX4BQEhILQC5zXsUFRjwfpAWY6RwWdf1fQffOSNgItf5VVduXA0wnX4V
   61oHv4NGUIimVYWWsc7kBhsKBw4vMHXwyKl65JcJGiAj85jyNBbJbwRTq
   8KEj0wMqEGDZHY9/IH+irUBz1ca3oT9VkpaDJdG4LuPUZWg1ONDmj/6l7
   IVNNMpszH8jqdN++Y1XWXAu9uSI6pwIH+cokTX6DhwKIk4HRb7QeUGosT
   At3PcULr2rcbe35YZRINor8QXI5EhbQFs4tVoobM3P+oRFi5zFM9s0/ZL
   ChiaxpBtVDohZTvwicVwIkkyxU0DaxRaEjwUyo+Gx43VTM5fFzPLQBo55
   w==;
X-CSE-ConnectionGUID: IsT5Yj1NRtigmzyUGpU58w==
X-CSE-MsgGUID: xfihLOuRR8S4D8Njkb5Rog==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013018"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:26 -0800
X-CSE-ConnectionGUID: nNxn33lcRwm4/S2RNNCFig==
X-CSE-MsgGUID: oRF9a0hlQdSTZAVzPQH7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084223"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:23 -0800
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
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 11/22] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
Date: Mon, 16 Dec 2024 09:41:16 +0800
Message-Id: <20241216014127.3722172-12-even.xu@intel.com>
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

From: Xinpeng Sun <xinpeng.sun@intel.com>

Create intel-quickspi folder and add Kconfig and Makefile for THC
QuickSPI driver. Add basic device structure, definitions and probe/remove
functions for QuickSPI driver.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Kconfig             |  11 +
 drivers/hid/intel-thc-hid/Makefile            |   3 +
 .../intel-quickspi/pci-quickspi.c             | 287 ++++++++++++++++++
 .../intel-quickspi/quickspi-dev.h             |  61 ++++
 4 files changed, 362 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index dc7c5a23f0ad..25a3729df92a 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -17,4 +17,15 @@ config INTEL_THC_HID
 
 	  Say Y/M here if you want to support Intel THC. If unsure, say N.
 
+config INTEL_QUICKSPI
+	tristate "Intel QuickSPI driver based on Intel Touch Host Controller"
+	depends on INTEL_THC_HID
+	help
+	  Intel QuickSPI, based on Touch Host Controller (THC), implements
+	  HIDSPI (HID over SPI) protocol. It configures THC to work at SPI
+	  mode, and controls THC hardware sequencer to accelerate HIDSPI
+	  transaction flow.
+
+	  Say Y/M here if you want to support Intel QuickSPI. If unsure, say N.
+
 endmenu
diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index b9709cc5e9eb..7669739a39b7 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -9,4 +9,7 @@ obj-$(CONFIG_INTEL_THC_HID) += intel-thc.o
 intel-thc-objs += intel-thc/intel-thc-dev.o
 intel-thc-objs += intel-thc/intel-thc-dma.o
 
+obj-$(CONFIG_INTEL_QUICKSPI) += intel-quickspi.o
+intel-quickspi-objs += intel-quickspi/pci-quickspi.o
+
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
new file mode 100644
index 000000000000..a997c9a570d4
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -0,0 +1,287 @@
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
+#include "quickspi-dev.h"
+
+struct quickspi_driver_data mtl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_MTL,
+};
+
+struct quickspi_driver_data lnl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
+};
+
+struct quickspi_driver_data ptl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
+};
+
+/**
+ * quickspi_irq_quick_handler - The ISR of the quickspi driver
+ *
+ * @irq: The irq number
+ * @dev_id: pointer to the device structure
+ *
+ * Return: IRQ_WAKE_THREAD if further process needed.
+ */
+static irqreturn_t quickspi_irq_quick_handler(int irq, void *dev_id)
+{
+	struct quickspi_device *qsdev = dev_id;
+
+	if (qsdev->state == QUICKSPI_DISABLED)
+		return IRQ_HANDLED;
+
+	/* Disable THC interrupt before current interrupt be handled */
+	thc_interrupt_enable(qsdev->thc_hw, false);
+
+	return IRQ_WAKE_THREAD;
+}
+
+/**
+ * quickspi_irq_thread_handler - IRQ thread handler of quickspi driver
+ *
+ * @irq: The IRQ number
+ * @dev_id: pointer to the quickspi device structure
+ *
+ * Return: IRQ_HANDLED to finish this handler.
+ */
+static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
+{
+	struct quickspi_device *qsdev = dev_id;
+	int int_mask;
+
+	if (qsdev->state == QUICKSPI_DISABLED)
+		return IRQ_HANDLED;
+
+	int_mask = thc_interrupt_handler(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * quickspi_dev_init - Initialize quickspi device
+ *
+ * @pdev: pointer to the thc pci device
+ * @mem_addr: The pointer of MMIO memory address
+ * @id: point to pci_device_id structure
+ *
+ * Alloc quickspi device structure and initialized THC device,
+ * then configure THC to HIDSPI mode.
+ *
+ * If success, enable THC hardware interrupt.
+ *
+ * Return: pointer to the quickspi device structure if success
+ * or NULL on failed.
+ */
+static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __iomem *mem_addr,
+						 const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = devm_kzalloc(dev, sizeof(struct quickspi_device), GFP_KERNEL);
+	if (!qsdev)
+		return ERR_PTR(-ENOMEM);
+
+	qsdev->pdev = pdev;
+	qsdev->dev = dev;
+	qsdev->mem_addr = mem_addr;
+	qsdev->driver_data = (struct quickspi_driver_data *)id->driver_data;
+
+	/* thc hw init */
+	qsdev->thc_hw = thc_dev_init(qsdev->dev, qsdev->mem_addr);
+	if (IS_ERR(qsdev->thc_hw)) {
+		ret = PTR_ERR(qsdev->thc_hw);
+		dev_err(dev, "Failed to initialize THC device context, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = thc_port_select(qsdev->thc_hw, THC_PORT_TYPE_SPI);
+	if (ret) {
+		dev_err(dev, "Failed to select THC port, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	thc_interrupt_config(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	return qsdev;
+}
+
+/**
+ * quickspi_dev_deinit - De-initialize quickspi device
+ *
+ * @qsdev: pointer to the quickspi device structure
+ *
+ * Disable THC interrupt and deinitilize THC.
+ */
+static void quickspi_dev_deinit(struct quickspi_device *qsdev)
+{
+	thc_interrupt_enable(qsdev->thc_hw, false);
+}
+
+/*
+ * quickspi_probe: Quickspi driver probe function
+ *
+ * @pdev: point to pci device
+ * @id: point to pci_device_id structure
+ *
+ * Return 0 if success or error code on failure.
+ */
+static int quickspi_probe(struct pci_dev *pdev,
+			  const struct pci_device_id *id)
+{
+	struct quickspi_device *qsdev;
+	void __iomem *mem_addr;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable PCI device, ret = %d.\n", ret);
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	ret = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get PCI regions, ret = %d.\n", ret);
+		goto disable_pci_device;
+	}
+
+	mem_addr = pcim_iomap_table(pdev)[0];
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "No usable DMA configuration %d\n", ret);
+			goto unmap_io_region;
+		}
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to allocate IRQ vectors. ret = %d\n", ret);
+		goto unmap_io_region;
+	}
+
+	pdev->irq = pci_irq_vector(pdev, 0);
+
+	qsdev = quickspi_dev_init(pdev, mem_addr, id);
+	if (IS_ERR(qsdev)) {
+		dev_err(&pdev->dev, "QuickSPI device init failed\n");
+		ret = PTR_ERR(qsdev);
+		goto unmap_io_region;
+	}
+
+	pci_set_drvdata(pdev, qsdev);
+
+	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
+					quickspi_irq_quick_handler,
+					quickspi_irq_thread_handler,
+					IRQF_ONESHOT, KBUILD_MODNAME,
+					qsdev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to request threaded IRQ, irq = %d.\n", pdev->irq);
+		goto dev_deinit;
+	}
+
+	return 0;
+
+dev_deinit:
+	quickspi_dev_deinit(qsdev);
+unmap_io_region:
+	pcim_iounmap_regions(pdev, BIT(0));
+disable_pci_device:
+	pci_clear_master(pdev);
+
+	return ret;
+}
+
+/**
+ * quickspi_remove - Device Removal Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called by the PCI subsystem to alert the driver
+ * that it should release a PCI device.
+ */
+static void quickspi_remove(struct pci_dev *pdev)
+{
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return;
+
+	quickspi_dev_deinit(qsdev);
+
+	pcim_iounmap_regions(pdev, BIT(0));
+	pci_clear_master(pdev);
+}
+
+/**
+ * quickspi_shutdown - Device Shutdown Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called from the reboot notifier
+ * it's a simplified version of remove so we go down
+ * faster.
+ */
+static void quickspi_shutdown(struct pci_dev *pdev)
+{
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return;
+
+	quickspi_dev_deinit(qsdev);
+}
+
+static const struct pci_device_id quickspi_pci_tbl[] = {
+	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT1, &mtl), },
+	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT2, &mtl), },
+	{PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_SPI_PORT1, &lnl), },
+	{PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_SPI_PORT2, &lnl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT1, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT2, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT1, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl);
+
+static struct pci_driver quickspi_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = quickspi_pci_tbl,
+	.probe = quickspi_probe,
+	.remove = quickspi_remove,
+	.shutdown = quickspi_shutdown,
+	.driver.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+};
+
+module_pci_driver(quickspi_driver);
+
+MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
+MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
+
+MODULE_DESCRIPTION("Intel(R) QuickSPI Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("INTEL_THC");
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
new file mode 100644
index 000000000000..cffc859efa19
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKSPI_DEV_H_
+#define _QUICKSPI_DEV_H_
+
+#define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT1		0x7E49
+#define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT2		0x7E4B
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT1		0xA849
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT2		0xA84B
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT1	0xE349
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT2	0xE34B
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT1	0xE449
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
+
+/* Packet size value, the unit is 16 bytes */
+#define DEFAULT_MIN_PACKET_SIZE_VALUE			4
+#define MAX_PACKET_SIZE_VALUE_MTL			128
+#define MAX_PACKET_SIZE_VALUE_LNL			256
+
+enum quickspi_dev_state {
+	QUICKSPI_NONE,
+	QUICKSPI_RESETING,
+	QUICKSPI_RESETED,
+	QUICKSPI_INITED,
+	QUICKSPI_ENABLED,
+	QUICKSPI_DISABLED,
+};
+
+/**
+ * struct quickspi_driver_data - Driver specific data for quickspi device
+ * @max_packet_size_value: identify max packet size, unit is 16 bytes
+ */
+struct quickspi_driver_data {
+	u32 max_packet_size_value;
+};
+
+struct device;
+struct pci_dev;
+struct thc_device;
+
+/**
+ * struct quickspi_device -  THC QuickSpi device struct
+ * @dev: point to kernel device
+ * @pdev: point to PCI device
+ * @thc_hw: point to THC device
+ * @driver_data: point to quickspi specific driver data
+ * @state: THC SPI device state
+ * @mem_addr: MMIO memory address
+ */
+struct quickspi_device {
+	struct device *dev;
+	struct pci_dev *pdev;
+	struct thc_device *thc_hw;
+	struct quickspi_driver_data *driver_data;
+	enum quickspi_dev_state state;
+
+	void __iomem *mem_addr;
+};
+
+#endif /* _QUICKSPI_DEV_H_ */
-- 
2.40.1


