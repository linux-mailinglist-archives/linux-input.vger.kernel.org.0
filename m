Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E203542D15D
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 06:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbhJNEJo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 00:09:44 -0400
Received: from smtpbguseast2.qq.com ([54.204.34.130]:41576 "EHLO
        smtpbguseast2.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNEJo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 00:09:44 -0400
X-QQ-mid: bizesmtp40t1634184415t4qd8fp8
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Thu, 14 Oct 2021 12:06:51 +0800 (CST)
X-QQ-SSF: B140000000200080D000B00A0000000
X-QQ-FEAT: jfdGVjI73+QGvQfwriiO1rLsROdxZjZeSkBKMihEPTwJvZXM8UjObwJBi7rlR
        xBJ4uFasmzxo0/2GalYYH8Fey2CSlUjKTWphyFbf/AemHGqBUZoadz5B4dYl0E1hFqyhnOQ
        5sEJOdadcdP/fDnhNVEyj+snKP73HQruHMmiy1yQk4qbENKD4tlFdQXm0K+YcTlFRcqqM3D
        36/DowYm6p7FKscUg8PTs+Lx3TBPKnshOuKuPBOhOdo608xnlKuR+HkLSB5tjf+igZOnd6F
        NW26UOhfCdvfpJxdj03qi5B05Mt73qNaGAMqsfwsLopvv+alzVU7uzls4ywmOcgGIGm3QW8
        f2i8NThu2zSL9CgoVR8GbEF9tzQ5W58MENyv+T6HRP01UuhA2ZJ44yzCZSdDg==
X-QQ-GoodBg: 2
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, 282827961@qq.com,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] input&tty: Fix the keyboard led light display problem
Date:   Thu, 14 Oct 2021 12:06:48 +0800
Message-Id: <20211014040648.8989-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
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
 drivers/input/input.c     |  7 ++++++-
 drivers/tty/vt/keyboard.c | 22 +++++++++++++++++++++-
 include/linux/kbd_kern.h  |  2 ++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ccaeb2426385..41f6186a9cc4 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -25,6 +25,7 @@
 #include <linux/rcupdate.h>
 #include "input-compat.h"
 #include "input-poller.h"
+#include <linux/kbd_kern.h>
 
 MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
 MODULE_DESCRIPTION("Input core");
@@ -472,8 +473,12 @@ void input_inject_event(struct input_handle *handle,
 
 		rcu_read_lock();
 		grab = rcu_dereference(dev->grab);
-		if (!grab || grab == handle)
+		if (!grab || grab == handle) {
 			input_handle_event(dev, type, code, value);
+
+			if (type == EV_LED && code < 3)
+				update_value_ledstate(code, value);
+		}
 		rcu_read_unlock();
 
 		spin_unlock_irqrestore(&dev->event_lock, flags);
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index c7fbbcdcc346..005fa5cf2a67 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -1140,6 +1140,23 @@ static unsigned char getledstate(void)
 	return ledstate & 0xff;
 }
 
+void update_value_ledstate(int flag, int value)
+{
+	if (ledstate == -1U)
+		ledstate = 0;
+
+	if (flag == LED_NUML) {
+		ledstate &= ~(1 << 1);
+		ledstate |= value << 1;
+	} else if (flag == LED_CAPSL) {
+		ledstate &= ~(1 << 2);
+		ledstate |= value << 2;
+	} else if (flag == LED_SCROLLL) {
+		ledstate &= ~(1 << 0);
+		ledstate |= value << 0;
+	}
+}
+
 void setledstate(struct kbd_struct *kb, unsigned int led)
 {
         unsigned long flags;
@@ -1249,6 +1266,10 @@ static void kbd_bh(struct tasklet_struct *unused)
 {
 	unsigned int leds;
 	unsigned long flags;
+	struct kbd_struct *kb = kbd_table + fg_console;
+
+	if (kb->kbdmode == VC_OFF)
+		return;
 
 	spin_lock_irqsave(&led_lock, flags);
 	leds = getleds();
@@ -1257,7 +1278,6 @@ static void kbd_bh(struct tasklet_struct *unused)
 
 	if (leds != ledstate) {
 		kbd_propagate_led_state(ledstate, leds);
-		ledstate = leds;
 	}
 }
 
diff --git a/include/linux/kbd_kern.h b/include/linux/kbd_kern.h
index c40811d79769..36a3402658e6 100644
--- a/include/linux/kbd_kern.h
+++ b/include/linux/kbd_kern.h
@@ -62,6 +62,8 @@ extern int kbd_init(void);
 
 extern void setledstate(struct kbd_struct *kbd, unsigned int led);
 
+extern void update_value_ledstate(int flag, int value);
+
 extern int do_poke_blanked_console;
 
 extern void (*kbd_ledfunc)(unsigned int led);
-- 
2.20.1


¸
