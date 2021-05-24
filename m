Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446E938E426
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 12:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhEXKiG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 06:38:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39688 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbhEXKiF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 06:38:05 -0400
Received: from [123.112.66.152] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <hui.wang@canonical.com>)
        id 1ll7wq-00028Q-8H; Mon, 24 May 2021 10:36:37 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     hui.wang@canonical.com
Subject: [PATCH] Input: i8042 - disable non-wakeup port during suspend
Date:   Mon, 24 May 2021 18:36:27 +0800
Message-Id: <20210524103627.4235-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We found an suspend/resume issue on many Lenovo and Dell laptops,
those machines support s2idle and have i8042 kbd, i8042 trackpoint and
i8042 touchpad, the current driver will enable the wakeup on kbd if
the s2idle is the current mode. If we suspend the system, then press
any key on the keyboard, the system will be resumed as expected. But
if we press trackpoint or touchpad ahead of kbd, the kbd can't wakeup
the system anymore, need to press PWR_BUTTON to resume the system.

Similarly, if we enable wakeup on i8042 trackpoint and disable wakeup
on i8042 kbd via sysfs interface, and after suspend, we press the kbd
ahead of trackpoint, the trackpoint can't wakeup the system too.

It is highly possible that this is a defect in the EC firmware, but
this issue exists on most of the laptops (maybe all laptops with i8042
kbd, i8042 trackpoint and i8042 touchpad), it is not practical to
fix this issue by upgrading the firmware.

Let's workaround this issue in the kernel driver. So far, this
issue is only reproduced on KBD port + AUX port, there is no issue
reported on MUX port yet, we only handle these 2 ports here. If
one of them is enabled for wakeup, we temporarily disable the port
which is not enabled for wakeup. If both of them are enabled or
disabled for wakeup, do nothing.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/input/serio/i8042.c | 66 +++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index abae23af0791..90a7f042628f 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -605,6 +605,25 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id)
 	return IRQ_RETVAL(ret);
 }
 
+/*
+ * i8042_disable_kbd_port disables keyboard port on chip
+ */
+
+static int i8042_disable_kbd_port(void)
+{
+	i8042_ctr |= I8042_CTR_KBDDIS;
+	i8042_ctr &= ~I8042_CTR_KBDINT;
+
+	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR)) {
+		i8042_ctr |= I8042_CTR_KBDINT;
+		i8042_ctr &= ~I8042_CTR_KBDDIS;
+		pr_err("Failed to disable KBD port\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /*
  * i8042_enable_kbd_port enables keyboard port on chip
  */
@@ -624,6 +643,25 @@ static int i8042_enable_kbd_port(void)
 	return 0;
 }
 
+/*
+ * i8042_disable_aux_port disables AUX (mouse) port on chip
+ */
+
+static int i8042_disable_aux_port(void)
+{
+	i8042_ctr |= I8042_CTR_AUXDIS;
+	i8042_ctr &= ~I8042_CTR_AUXINT;
+
+	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR)) {
+		i8042_ctr |= I8042_CTR_AUXINT;
+		i8042_ctr &= ~I8042_CTR_AUXDIS;
+		pr_err("Failed to disable AUX port\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /*
  * i8042_enable_aux_port enables AUX (mouse) port on chip
  */
@@ -1227,6 +1265,7 @@ static int i8042_controller_resume(bool s2r_wants_reset)
 static int i8042_pm_suspend(struct device *dev)
 {
 	int i;
+	bool wakeup_enabled[I8042_NUM_PORTS] = { false };
 
 	if (pm_suspend_via_firmware())
 		i8042_controller_reset(true);
@@ -1235,8 +1274,21 @@ static int i8042_pm_suspend(struct device *dev)
 	for (i = 0; i < I8042_NUM_PORTS; i++) {
 		struct serio *serio = i8042_ports[i].serio;
 
-		if (serio && device_may_wakeup(&serio->dev))
+		if (serio && device_may_wakeup(&serio->dev)) {
 			enable_irq_wake(i8042_ports[i].irq);
+			wakeup_enabled[i] = true;
+		}
+	}
+
+	/* For KBD and AUX ports, if at least one of them is enabled for wakeup
+	 * the system, we need to disable the one which isn't enabled for
+	 * wakeup, otherwise this port could impact the wakeup of the other port
+	 */
+	if (wakeup_enabled[I8042_KBD_PORT_NO] || wakeup_enabled[I8042_AUX_PORT_NO]) {
+		if (i8042_ports[I8042_KBD_PORT_NO].serio && !wakeup_enabled[I8042_KBD_PORT_NO])
+			i8042_disable_kbd_port();
+		else if (i8042_ports[I8042_AUX_PORT_NO].serio && !wakeup_enabled[I8042_AUX_PORT_NO])
+			i8042_disable_aux_port();
 	}
 
 	return 0;
@@ -1254,12 +1306,22 @@ static int i8042_pm_resume(struct device *dev)
 {
 	bool want_reset;
 	int i;
+	bool wakeup_enabled[I8042_NUM_PORTS] = { false };
 
 	for (i = 0; i < I8042_NUM_PORTS; i++) {
 		struct serio *serio = i8042_ports[i].serio;
 
-		if (serio && device_may_wakeup(&serio->dev))
+		if (serio && device_may_wakeup(&serio->dev)) {
 			disable_irq_wake(i8042_ports[i].irq);
+			wakeup_enabled[i] = true;
+		}
+	}
+
+	if (wakeup_enabled[I8042_KBD_PORT_NO] || wakeup_enabled[I8042_AUX_PORT_NO]) {
+		if (i8042_ports[I8042_KBD_PORT_NO].serio && !wakeup_enabled[I8042_KBD_PORT_NO])
+			i8042_enable_kbd_port();
+		else if (i8042_ports[I8042_AUX_PORT_NO].serio && !wakeup_enabled[I8042_AUX_PORT_NO])
+			i8042_enable_aux_port();
 	}
 
 	/*
-- 
2.25.1

