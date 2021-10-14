Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D31D42D372
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 09:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhJNHW6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 03:22:58 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:47838 "EHLO smtpbgbr2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230082AbhJNHW5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 03:22:57 -0400
X-QQ-mid: bizesmtp52t1634196036t31inguj
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Thu, 14 Oct 2021 15:20:07 +0800 (CST)
X-QQ-SSF: 0140000000200080D000B00A0000000
X-QQ-FEAT: FXvDfBZI5O7TbD6dy38by25uU+ZquL0Q04YAUpMrodHQ359bm/Rvj1tQXwxks
        23amQxHB/u+YhKp/GnO7HKxpyVKnE+aOAvFHnwop7S83blD6Dv7AZLtxpLjLdOWOagadXrz
        vsXdPhMhxo3LE9OB0welaIKndVUAu3d1180zLdKuFbnZu1qnbWbbF0PrBo7aukuJty+Dz5W
        JtMQDRf3Q0w9zZ4MBAYB1FpCIlvDlwmWgOBe/plZbWXg4STDgMRC5Pqy98OXjStJvQD0PjK
        yG09VYQ7dwGzfrtWTrt4YjOIcqxPlfllNnix4jSSZ9fe77kK5HIXewxSi9O9evi737QhZf7
        AXRRGgkwb67gAftzmGrZ1KaNeF/HzFSXAV8XosRpNqSa9+TSGQ=
X-QQ-GoodBg: 2
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] input&tty: Fix the keyboard led light display problem
Date:   Thu, 14 Oct 2021 15:20:03 +0800
Message-Id: <20211014072003.23793-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
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
 drivers/tty/vt/keyboard.c | 30 +++++++++++++++++++++++++++++-
 include/linux/kbd_kern.h  |  2 ++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ccaeb2426385..43c09700bf68 100644
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
+			if (type == EV_LED && code < LED_SCROLLL)
+				update_value_ledstate(code, value);
+		}
 		rcu_read_unlock();
 
 		spin_unlock_irqrestore(&dev->event_lock, flags);
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index c7fbbcdcc346..f612ed5c647f 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -1140,6 +1140,31 @@ static unsigned char getledstate(void)
 	return ledstate & 0xff;
 }
 
+void update_value_ledstate(unsigned int flag, unsigned int value)
+{
+	unsigned int bit;
+
+	switch (flag) {
+	case LED_NUML:
+		bit = VC_NUMLOCK;
+		break;
+	case LED_CAPSL:
+		bit = VC_CAPSLOCK;
+		break;
+	case LED_SCROLLL:
+		bit = VC_SCROLLOCK;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+	if (value)
+		ledstate |= BIT(bit);
+	else
+		ledstate &= ~BIT(BIT);
+}
+
 void setledstate(struct kbd_struct *kb, unsigned int led)
 {
         unsigned long flags;
@@ -1249,6 +1274,10 @@ static void kbd_bh(struct tasklet_struct *unused)
 {
 	unsigned int leds;
 	unsigned long flags;
+	struct kbd_struct *kb = kbd_table + fg_console;
+
+	if (kb->kbdmode == VC_OFF)
+		return;
 
 	spin_lock_irqsave(&led_lock, flags);
 	leds = getleds();
@@ -1257,7 +1286,6 @@ static void kbd_bh(struct tasklet_struct *unused)
 
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



