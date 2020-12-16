Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362E12DBB55
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 07:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgLPGmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 01:42:15 -0500
Received: from mga12.intel.com ([192.55.52.136]:30715 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgLPGmP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 01:42:15 -0500
IronPort-SDR: Ux/yX/UlXCzGddQjp5OXyVZwz0/5TuH6Snob/lB3k4XhbZSvfl+KHdHE2B9EfkIrJytkg89wnh
 06LvOhrBD+Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154246312"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="154246312"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 22:41:32 -0800
IronPort-SDR: PZKTPx44T+gIJI8xi60aSMSZs2L78OmUvaI1sqZ1EtZUJ16KUOuvW1NMZlr9qOmwqttM3PXtNl
 SJxN3rr3IEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="412333927"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.22])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 22:41:27 -0800
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com,
        benjamin.tissoires@redhat.com, Zhang Lixu <lixu.zhang@intel.com>,
        Najumon Ba <najumon.ba@intel.com>, Even Xu <even.xu@intel.com>
Subject: [PATCH 1/2] hid: intel-ish-hid: ipc: finish power flow for EHL OOB
Date:   Wed, 16 Dec 2020 14:36:39 +0800
Message-Id: <20201216063640.4086068-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216063640.4086068-1-lixu.zhang@intel.com>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
service, which allows wakup device when the system is in S5 (Soft-Off
state). This OOB service can be enabled/disabled from BIOS settings. When
enabled, the ISH device gets PME wake capability. To enable PME wakeup,
driver also needs to enable ACPI GPE bit.

Once wakeup, BIOS will clear the wakeup bit to identify wakeup is
successful. So driver need to re-enable it in resume function to
keep the next wakeup capability.

Since this feature is only present on EHL, we use EHL PCI device id to
enable this feature.

Co-developed-by: Najumon Ba <najumon.ba@intel.com>
Signed-off-by: Najumon Ba <najumon.ba@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index c6d48a8648b7..c9c5488e44cb 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2014-2016, Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -111,6 +112,42 @@ static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
 	return !pm_resume_via_firmware() || pdev->device == CHV_DEVICE_ID;
 }
 
+static int enable_gpe(struct device *dev)
+{
+#ifdef CONFIG_ACPI
+	acpi_status acpi_sts;
+	struct acpi_device *adev;
+	struct acpi_device_wakeup *wakeup;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev) {
+		dev_err(dev, "get acpi handle failed\n");
+		return -ENODEV;
+	}
+	wakeup = &adev->wakeup;
+
+	acpi_sts = acpi_enable_gpe(wakeup->gpe_device, wakeup->gpe_number);
+	if (ACPI_FAILURE(acpi_sts)) {
+		dev_err(dev, "enable ose_gpe failed\n");
+		return -EIO;
+	}
+
+	return 0;
+#else
+	return -ENODEV;
+#endif
+}
+
+static void enable_pme_wake(struct pci_dev *pdev)
+{
+	if ((pci_pme_capable(pdev, PCI_D0) ||
+	     pci_pme_capable(pdev, PCI_D3hot) ||
+	     pci_pme_capable(pdev, PCI_D3cold)) && !enable_gpe(&pdev->dev)) {
+		pci_pme_active(pdev, true);
+		dev_dbg(&pdev->dev, "ish ipc driver pme wake enabled\n");
+	}
+}
+
 /**
  * ish_probe() - PCI driver probe callback
  * @pdev:	pci device
@@ -179,6 +216,10 @@ static int ish_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	init_waitqueue_head(&ishtp->suspend_wait);
 	init_waitqueue_head(&ishtp->resume_wait);
 
+	/* Enable PME for EHL */
+	if (pdev->device == EHL_Ax_DEVICE_ID)
+		enable_pme_wake(pdev);
+
 	ret = ish_init(ishtp);
 	if (ret)
 		return ret;
@@ -317,6 +358,13 @@ static int __maybe_unused ish_resume(struct device *device)
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
 
+	/* add this to finish power flow for EHL */
+	if (dev->pdev->device == EHL_Ax_DEVICE_ID) {
+		pci_set_power_state(pdev, PCI_D0);
+		enable_pme_wake(pdev);
+		dev_dbg(dev->devc, "set power state to D0 for ehl\n");
+	}
+
 	ish_resume_device = device;
 	dev->resume_flag = 1;
 
-- 
2.25.1

