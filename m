Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1132685818
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 04:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbfHHCW1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Aug 2019 22:22:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:53450 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728000AbfHHCW1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Aug 2019 22:22:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 19:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; 
   d="scan'208";a="168832623"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.20])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2019 19:21:53 -0700
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     srinivas.pandruvada@linux.intel.com, linux-kernel@vger.kernel.org,
        lixu.zhang@intel.com
Subject: [PATCH v2 1/3] HID: intel-ish-hid: ipc: set NO_D3 flag only when needed
Date:   Thu,  8 Aug 2019 18:21:11 +0800
Message-Id: <20190808102113.27802-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808102113.27802-1-lixu.zhang@intel.com>
References: <20190808102113.27802-1-lixu.zhang@intel.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, the NO_D3 flag is set in ish_probe(), and cleared in
ish_remove(). So even if the system goes into S3, ISH is still
in D0i3 state. It makes more sense that put ISH into D3 as system
goes into S3 and put ISH into D0i3 as system goes into suspend-to-idle.
I remove the NO_D3 setting in ish_probe(), so that ISH can enter
D3 state when system enters S3. Only set N0_D3 flag when system
enters the suspend-to-idle or platform specified, and clear it
when system resume.

When the ISH enters D3, the FW will check the DMA bit status.
If the DMA bit is set, the FW will reset automatically. So the
DMA bit need be clear before putting ISH into D3 state.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c     |  2 +-
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 21 +++++++++++++++++++--
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 1065692f90e2..ddd8e8e87cfa 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -77,5 +77,6 @@ irqreturn_t ish_irq_handler(int irq, void *dev_id);
 struct ishtp_device *ish_dev_init(struct pci_dev *pdev);
 int ish_hw_start(struct ishtp_device *dev);
 void ish_device_disable(struct ishtp_device *dev);
+int ish_disable_dma(struct ishtp_device *dev);
 
 #endif /* _ISHTP_HW_ISH_H_ */
diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 18fe8af89aad..8f8dfdf64833 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -672,7 +672,7 @@ irqreturn_t ish_irq_handler(int irq, void *dev_id)
  *
  * Return: 0 for success else error code.
  */
-static int ish_disable_dma(struct ishtp_device *dev)
+int ish_disable_dma(struct ishtp_device *dev)
 {
 	unsigned int	dma_delay;
 
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index aa80b4d3b740..89b14d2edd0b 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
+#include <linux/suspend.h>
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
 #define CREATE_TRACE_POINTS
@@ -97,6 +98,11 @@ static const struct pci_device_id ish_invalid_pci_ids[] = {
 	{}
 };
 
+static inline bool ish_should_enter_d0i3(struct pci_dev *pdev)
+{
+	return !pm_suspend_via_firmware() || pdev->device == CHV_DEVICE_ID;
+}
+
 /**
  * ish_probe() - PCI driver probe callback
  * @pdev:	pci device
@@ -147,7 +153,6 @@ static int ish_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* mapping IO device memory */
 	hw->mem_addr = pcim_iomap_table(pdev)[0];
 	ishtp->pdev = pdev;
-	pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
 
 	/* request and enable interrupt */
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
@@ -184,7 +189,6 @@ static void ish_remove(struct pci_dev *pdev)
 	struct ishtp_device *ishtp_dev = pci_get_drvdata(pdev);
 
 	ishtp_bus_remove_all_clients(ishtp_dev, false);
-	pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
 	ish_device_disable(ishtp_dev);
 }
 
@@ -209,6 +213,8 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 	uint32_t fwsts;
 	int ret;
 
+	pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
+
 	/* Get ISH FW status */
 	fwsts = IPC_GET_ISH_FWSTS(dev->ops->get_fw_status(dev));
 
@@ -267,6 +273,17 @@ static int __maybe_unused ish_suspend(struct device *device)
 						 !dev->suspend_flag,
 						  msecs_to_jiffies(25));
 
+	if (ish_should_enter_d0i3(pdev)) {
+		/* Set the NO_D3 flag, the ISH would enter D0i3 */
+		pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
+	} else {
+		/*
+		 * Clear the DMA bit before putting ISH into D3,
+		 * or ISH FW would reset automatically.
+		 */
+		ish_disable_dma(dev);
+	}
+
 	return 0;
 }
 
-- 
2.17.1

