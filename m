Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07390200ADF
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 16:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgFSOCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 10:02:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37118 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732641AbgFSOC2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 10:02:28 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jmHb2-0002Jv-FJ; Fri, 19 Jun 2020 14:02:20 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        Song Hongyan <hongyan.song@intel.com>,
        linux-input@vger.kernel.org (open list:INTEL INTEGRATED SENSOR HUB
        DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with pci_save_state
Date:   Fri, 19 Jun 2020 22:02:13 +0800
Message-Id: <20200619140215.11779-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.

Instead, we can use pci_save_state() to hint PCI core that the device
should stay at D0 during suspend. By doing so, PCI core will let the
upstream bridges also stays at D0 so the entire hierachy is in the
correct power state as PCI spec mandates.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Wording change.

 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index f491d8b4e24c..ab588b9c8d09 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -106,6 +106,11 @@ static inline bool ish_should_enter_d0i3(struct pci_dev *pdev)
 	return !pm_suspend_via_firmware() || pdev->device == CHV_DEVICE_ID;
 }
 
+static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
+{
+	return !pm_resume_via_firmware() || pdev->device == CHV_DEVICE_ID;
+}
+
 /**
  * ish_probe() - PCI driver probe callback
  * @pdev:	pci device
@@ -215,9 +220,7 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
 	int ret;
 
-	/* Check the NO_D3 flag to distinguish the resume paths */
-	if (pdev->dev_flags & PCI_DEV_FLAGS_NO_D3) {
-		pdev->dev_flags &= ~PCI_DEV_FLAGS_NO_D3;
+	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag) {
 		disable_irq_wake(pdev->irq);
 
 		ishtp_send_resume(dev);
@@ -281,8 +284,10 @@ static int __maybe_unused ish_suspend(struct device *device)
 			 */
 			ish_disable_dma(dev);
 		} else {
-			/* Set the NO_D3 flag, the ISH would enter D0i3 */
-			pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
+			/* Save state so PCI core will keep the device at D0,
+			 * the ISH would enter D0i3
+			 */
+			pci_save_state(pdev);
 
 			enable_irq_wake(pdev->irq);
 		}
-- 
2.17.1

