Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0023F8581B
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 04:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfHHCWf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Aug 2019 22:22:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:53450 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727999AbfHHCW1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Aug 2019 22:22:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 19:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; 
   d="scan'208";a="168832644"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.20])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2019 19:21:59 -0700
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     srinivas.pandruvada@linux.intel.com, linux-kernel@vger.kernel.org,
        lixu.zhang@intel.com
Subject: [PATCH v2 2/3] HID: intel-ish-hid: ipc: make ish suspend paths clear
Date:   Thu,  8 Aug 2019 18:21:12 +0800
Message-Id: <20190808102113.27802-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808102113.27802-1-lixu.zhang@intel.com>
References: <20190808102113.27802-1-lixu.zhang@intel.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For suspend-to-idle, send suspend message and set N0_D3 flag to put
the ISH into D0i3 state.
For suspend-to-mem, disable the DMA bit before ISH entering D3, and
NO_D3 flag is cleared by default, then the ISH would enter D3.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 52 +++++++++++++++----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 89b14d2edd0b..35081f2cf781 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -223,6 +223,8 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 	 * it means ISH isn't powered off, in this case, send a resume message.
 	 */
 	if (fwsts >= FWSTS_SENSOR_APP_LOADED) {
+		disable_irq_wake(pdev->irq);
+
 		ishtp_send_resume(dev);
 
 		/* Waiting to get resume response */
@@ -255,27 +257,36 @@ static int __maybe_unused ish_suspend(struct device *device)
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
 
-	enable_irq_wake(pdev->irq);
-	/*
-	 * If previous suspend hasn't been asnwered then ISH is likely dead,
-	 * don't attempt nested notification
-	 */
-	if (dev->suspend_flag)
-		return	0;
-
-	dev->resume_flag = 0;
-	dev->suspend_flag = 1;
-	ishtp_send_suspend(dev);
-
-	/* 25 ms should be enough for live ISH to flush all IPC buf */
-	if (dev->suspend_flag)
-		wait_event_interruptible_timeout(dev->suspend_wait,
-						 !dev->suspend_flag,
-						  msecs_to_jiffies(25));
-
 	if (ish_should_enter_d0i3(pdev)) {
-		/* Set the NO_D3 flag, the ISH would enter D0i3 */
-		pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
+		/*
+		 * If previous suspend hasn't been asnwered then ISH is likely
+		 * dead, don't attempt nested notification
+		 */
+		if (dev->suspend_flag)
+			return	0;
+
+		dev->resume_flag = 0;
+		dev->suspend_flag = 1;
+		ishtp_send_suspend(dev);
+
+		/* 25 ms should be enough for live ISH to flush all IPC buf */
+		if (dev->suspend_flag)
+			wait_event_interruptible_timeout(dev->suspend_wait,
+					!dev->suspend_flag,
+					msecs_to_jiffies(25));
+
+		if (dev->suspend_flag) {
+			/*
+			 * It looks like FW halt, clear the DMA bit, and put
+			 * ISH into D3, and FW would reset on resume.
+			 */
+			ish_disable_dma(dev);
+		} else {
+			/* Set the NO_D3 flag, the ISH would enter D0i3 */
+			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
+
+			enable_irq_wake(pdev->irq);
+		}
 	} else {
 		/*
 		 * Clear the DMA bit before putting ISH into D3,
@@ -304,7 +315,6 @@ static int __maybe_unused ish_resume(struct device *device)
 	ish_resume_device = device;
 	dev->resume_flag = 1;
 
-	disable_irq_wake(pdev->irq);
 	schedule_work(&resume_work);
 
 	return 0;
-- 
2.17.1

