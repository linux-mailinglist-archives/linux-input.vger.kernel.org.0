Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB3D434609
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 09:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhJTHrD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 03:47:03 -0400
Received: from smtpbgsg1.qq.com ([54.254.200.92]:50745 "EHLO smtpbgsg1.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229555AbhJTHrD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 03:47:03 -0400
X-QQ-mid: bizesmtp54t1634715878tkoj8klv
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 20 Oct 2021 15:44:32 +0800 (CST)
X-QQ-SSF: B1400000002000B0E000000C0000000
X-QQ-FEAT: WPY/GJVrW4SLP6hkpQtppHXyFGi+scMkXVGUswTMxF6S8wZ+eUr7OBu75qu5T
        wJ23R4TkdonQXhp2NXc5BQL/upDqvPb81rLxASinvq85gpTwTDpNfXdXias5Y2zX51vSLE3
        xFqINF2xGPMGYrErw4gbo819qFwhPD4/SJ91cxd/4Rco8cbvHMPv0Gj5++4EFGQwwxlrbAf
        7FajO+RqJXIxAaffScWhZDhtgRcskIFvsuFJA5HSs/2erejh/P1Ac4bHcfg/NEZRKmUwk3D
        CA0A290psUiJTuXl8UGJydjCX+WpfEZC+qCc6a5ZNDBVuKq3WQAhg35MHja3jx/OzBucv+G
        CsEJ5RBpz9aPnPG9Ssv9xoU+5uQMRyZGmztTZ3102kd6QelfiA=
X-QQ-GoodBg: 1
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [[PATCH v4]] tty: Fix the keyboard led light display problem
Date:   Wed, 20 Oct 2021 15:44:23 +0800
Message-Id: <20211020074423.11932-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switching from the desktop environment to the tty environment,
the state of the keyboard led lights and the state of the keyboard
lock are inconsistent. This is because the attribute kb->kbdmode
of the tty bound in the desktop environment (xorg) is set to
VC_OFF, which causes the ledstate and kb->ledflagstate
values of the bound tty to always be 0, which causes the switch
from the desktop When to the tty environment, the LED light
status is inconsistent with the keyboard lock status.

Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
---
 v2-->v3:
 (1) Abandon the previous modification plan.
 (2) Added the kbd_update_ledstate function, this function gets the 
 latest state of the led from the input device, and then synchronizes
 it to the ledstate. The kbd_event function calls it.
 (3) When the tty's kbdmode==VC_OFF, the tty does not set the keyboard light (modify the kbd_bh function).
 v3-->v4:
 Correct the subject
 
 drivers/tty/vt/keyboard.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index c7fbbcdcc346..5fcdd1805b4d 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -1130,6 +1130,22 @@ static void kbd_init_leds(void)
 
 #endif
 
+static void kbd_update_ledstate(struct input_dev *dev)
+{
+	unsigned long leds = (unsigned long)ledstate;
+	
+	if (test_bit(EV_LED, dev->evbit)) {
+		if (ledstate == -1U)
+			ledstate = 0;
+		if (!!test_bit(LED_NUML, dev->led) != !!test_bit(VC_NUMLOCK, &leds))
+			ledstate ^= BIT(VC_NUMLOCK);
+		if (!!test_bit(LED_CAPSL, dev->led) != !!test_bit(VC_CAPSLOCK, &leds))
+			ledstate ^= BIT(VC_CAPSLOCK);
+		if (!!test_bit(LED_SCROLLL, dev->led) != !!test_bit(VC_SCROLLOCK, &leds))
+			ledstate ^= BIT(VC_SCROLLOCK); 
+	}
+}
+
 /*
  * The leds display either (i) the status of NumLock, CapsLock, ScrollLock,
  * or (ii) whatever pattern of lights people want to show using KDSETLED,
@@ -1249,6 +1265,10 @@ static void kbd_bh(struct tasklet_struct *unused)
 {
 	unsigned int leds;
 	unsigned long flags;
+	struct kbd_struct *kb = kbd_table + fg_console;
+
+	if (kb->kbdmode == VC_OFF)
+		return;
 
 	spin_lock_irqsave(&led_lock, flags);
 	leds = getleds();
@@ -1524,6 +1544,8 @@ static void kbd_event(struct input_handle *handle, unsigned int event_type,
 	/* We are called with interrupts disabled, just take the lock */
 	spin_lock(&kbd_event_lock);
 
+	kbd_update_ledstate(handle->dev);
+
 	if (event_type == EV_MSC && event_code == MSC_RAW &&
 			kbd_is_hw_raw(handle->dev))
 		kbd_rawcode(value);
-- 
2.20.1




