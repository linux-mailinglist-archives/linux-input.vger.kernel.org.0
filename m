Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5F52DBB57
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 07:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgLPGmT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 01:42:19 -0500
Received: from mga09.intel.com ([134.134.136.24]:45939 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgLPGmT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 01:42:19 -0500
IronPort-SDR: kT5yhFgpi3AFoylWmRqPMMJeFBHZUCPPqaUDgcWZfxUZ9e8nZW2Yp6xlH/wUh9J6EdhDtgg0XV
 7MNRmpQ/UOtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="175161937"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="175161937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 22:41:37 -0800
IronPort-SDR: 32UK3iTs3RAweF3HuMC+nE8+yi4Kko0oCnzInVsklJhB9ETr7rsI1SmZTvWFXCTEYaCO6L9T6Y
 bkw80XDkR7nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="412333987"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.22])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 22:41:35 -0800
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com,
        benjamin.tissoires@redhat.com, Zhang Lixu <lixu.zhang@intel.com>,
        Wei Jiang <wei.w.jiang@intel.com>, Even Xu <even.xu@intel.com>
Subject: [PATCH 2/2] hid: intel-ish-hid: ipc: Address EHL Sx resume issues
Date:   Wed, 16 Dec 2020 14:36:40 +0800
Message-Id: <20201216063640.4086068-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216063640.4086068-1-lixu.zhang@intel.com>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When OOB is disabled, FW will be power gated when system is in S3/S4/S5
which is the same behavior with legacy ISH FW.
When OOB is enabled, FW will always power on which is totally different
comparing to legacy ISH FW.

So NO_D3 flag is not enough to check FW's status after resume.
Here we can use IPC FW status register to check host link status.
If it is false, it means FW get reset after power gated, need go through
the whole initialization flow; If it is true, it means FW is alive, just
set host ready bit to let fw know host is up.

Co-developed-by: Wei Jiang <wei.w.jiang@intel.com>
Signed-off-by: Wei Jiang <wei.w.jiang@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++++++++++++++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c |  6 +++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 1fb294ca463e..111ad259ba74 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -81,5 +81,6 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev);
 int ish_hw_start(struct ishtp_device *dev);
 void ish_device_disable(struct ishtp_device *dev);
 int ish_disable_dma(struct ishtp_device *dev);
+void ish_set_host_ready(struct ishtp_device *dev);
 
 #endif /* _ISHTP_HW_ISH_H_ */
diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index a45ac7fa417b..47bbeb8b492b 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -193,6 +193,33 @@ static void ish_clr_host_rdy(struct ishtp_device *dev)
 	ish_reg_write(dev, IPC_REG_HOST_COMM, host_status);
 }
 
+static bool ish_chk_host_rdy(struct ishtp_device *dev)
+{
+	uint32_t host_status = ish_reg_read(dev, IPC_REG_HOST_COMM);
+
+	return (host_status & IPC_HOSTCOMM_READY_BIT);
+}
+
+/**
+ * ish_set_host_ready() - reconfig ipc host registers
+ * @dev: ishtp device pointer
+ *
+ * Set host to ready state
+ * This API is called in some case:
+ *    fw is still on, but ipc is powered down.
+ *    such as OOB case.
+ *
+ * Return: 0 for success else error fault code
+ */
+void ish_set_host_ready(struct ishtp_device *dev)
+{
+	if (ish_chk_host_rdy(dev))
+		return;
+
+	ish_set_host_rdy(dev);
+	set_host_ready(dev);
+}
+
 /**
  * _ishtp_read_hdr() - Read message header
  * @dev: ISHTP device pointer
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index c9c5488e44cb..8cb40696984a 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -259,11 +259,15 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 {
 	struct pci_dev *pdev = to_pci_dev(ish_resume_device);
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
+	uint32_t fwsts = dev->ops->get_fw_status(dev);
 	int ret;
 
-	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
+	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag
+			&& IPC_IS_ISH_ILUP(fwsts)) {
 		disable_irq_wake(pdev->irq);
 
+		ish_set_host_ready(dev);
+
 		ishtp_send_resume(dev);
 
 		/* Waiting to get resume response */
-- 
2.25.1

