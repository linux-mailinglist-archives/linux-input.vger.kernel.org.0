Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C6542EC8C
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 10:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbhJOIj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 04:39:57 -0400
Received: from smtpbg506.qq.com ([203.205.250.33]:52964 "EHLO smtpbg506.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235784AbhJOIjy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 04:39:54 -0400
X-QQ-mid: bizesmtp40t1634287059t21lhum5
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 15 Oct 2021 16:37:34 +0800 (CST)
X-QQ-SSF: 01400000002000B0D000B00B0000000
X-QQ-FEAT: Nl5n8N+tNRHNcBZCplKORxUHxUqP9LhxmCOG246XWsRT5s/HGA8FiNUuCP6OS
        MnUt42H7QNlIUSHqG5Oz9B9UlIBe74tnmQs/n9e3L/6pHB2rQ7Gna0cLEfwZ32XHl5Og2mp
        hIuvDyxYKhyyesBu5ul0gaCoL8z7FCupk+9+jydzIZc7og8u8n28/zM0hGRdrs5KIX6lWnI
        yzW55zLqX+79Iv2WEmZ60M9AgHMzONRzfa4m9mRD5vokOkAX4Fz4cl5FmM01aW94LYUmaRU
        FWVLb1yiIKB9zesTyuwnUFtJMyiirxJhiV9aXo16HhQ5pfpJ1o4m1B8ilwjH4ZcEjyp/KyS
        2IA+TilpVYcr41zPMx7bvf2A/F94VTiEgFdI0VcuIkxhM66RSA=
X-QQ-GoodBg: 2
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] input&tty: Fix the keyboard led light display problem
Date:   Fri, 15 Oct 2021 16:37:31 +0800
Message-Id: <20211015083731.7643-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
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
The latest changes:
(1) Move the definition of ledstate to the input module (/drivers/input/input.c), 
and set or get its value through the input_update_ledstate and input_get_ledstate 
functions.
(2) To update the ledstate reference in keyboard.c, you must first get the value 
through input_get_ledstate.
(3) Other necessary changes

 drivers/input/input.c     | 46 ++++++++++++++++++++++++++++++++++++++-
 drivers/tty/vt/keyboard.c | 19 ++++++++++++++--
 include/linux/input.h     |  3 +++
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ccaeb2426385..8c0ef947ac34 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -37,6 +37,11 @@ static DEFINE_IDA(input_ida);
 static LIST_HEAD(input_dev_list);
 static LIST_HEAD(input_handler_list);
 
+#define VC_SCROLLOCK	0	/* scroll-lock mode */
+#define VC_NUMLOCK	1	/* numeric lock mode */
+#define VC_CAPSLOCK	2	/* capslock mode */
+static unsigned int ledstate = -1U;			/* undefined */
+
 /*
  * input_mutex protects access to both input_dev_list and input_handler_list.
  * This also causes input_[un]register_device and input_[un]register_handler
@@ -472,8 +477,12 @@ void input_inject_event(struct input_handle *handle,
 
 		rcu_read_lock();
 		grab = rcu_dereference(dev->grab);
-		if (!grab || grab == handle)
+		if (!grab || grab == handle) {
 			input_handle_event(dev, type, code, value);
+
+			if (type == EV_LED && code <= LED_SCROLLL)
+				input_update_ledstate(code, value);
+		}
 		rcu_read_unlock();
 
 		spin_unlock_irqrestore(&dev->event_lock, flags);
@@ -481,6 +490,41 @@ void input_inject_event(struct input_handle *handle,
 }
 EXPORT_SYMBOL(input_inject_event);
 
+void input_update_ledstate(unsigned int flag, unsigned int value)
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
+	if (ledstate == -1U)
+		ledstate = 0;
+
+	if (value)
+		ledstate |= BIT(bit);
+	else
+		ledstate &= ~BIT(bit);
+}
+EXPORT_SYMBOL(input_update_ledstate);
+
+unsigned int input_get_ledstate(void)
+{
+	return ledstate;
+}
+EXPORT_SYMBOL(input_get_ledstate);
+
 /**
  * input_alloc_absinfo - allocates array of input_absinfo structs
  * @dev: the input device emitting absolute events
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index c7fbbcdcc346..0cfccb1d7992 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -151,7 +151,6 @@ static bool rep;			/* flag telling character repeat */
 
 static int shift_state = 0;
 
-static unsigned int ledstate = -1U;			/* undefined */
 static unsigned char ledioctl;
 
 /*
@@ -1021,10 +1020,14 @@ struct kbd_led_trigger {
 
 static int kbd_led_trigger_activate(struct led_classdev *cdev)
 {
+	unsigned int ledstate;
+
 	struct kbd_led_trigger *trigger =
 		container_of(cdev->trigger, struct kbd_led_trigger, trigger);
 
 	tasklet_disable(&keyboard_tasklet);
+
+	ledstate = input_get_ledstate();
 	if (ledstate != -1U)
 		led_trigger_event(&trigger->trigger,
 				  ledstate & trigger->mask ?
@@ -1137,6 +1140,10 @@ static void kbd_init_leds(void)
  */
 static unsigned char getledstate(void)
 {
+	unsigned int ledstate;
+
+	ledstate = input_get_ledstate();
+
 	return ledstate & 0xff;
 }
 
@@ -1248,16 +1255,21 @@ void vt_kbd_con_stop(unsigned int console)
 static void kbd_bh(struct tasklet_struct *unused)
 {
 	unsigned int leds;
+	unsigned int ledstate;
 	unsigned long flags;
+	struct kbd_struct *kb = kbd_table + fg_console;
+
+	if (kb->kbdmode == VC_OFF)
+		return;
 
 	spin_lock_irqsave(&led_lock, flags);
 	leds = getleds();
+	ledstate = input_get_ledstate();
 	leds |= (unsigned int)kbd->lockstate << 8;
 	spin_unlock_irqrestore(&led_lock, flags);
 
 	if (leds != ledstate) {
 		kbd_propagate_led_state(ledstate, leds);
-		ledstate = leds;
 	}
 }
 
@@ -1604,8 +1616,11 @@ static void kbd_disconnect(struct input_handle *handle)
  */
 static void kbd_start(struct input_handle *handle)
 {
+	unsigned int ledstate;
+
 	tasklet_disable(&keyboard_tasklet);
 
+	ledstate = input_get_ledstate();
 	if (ledstate != -1U)
 		kbd_update_leds_helper(handle, &ledstate);
 
diff --git a/include/linux/input.h b/include/linux/input.h
index 0354b298d874..0e0ba53a9cc7 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -420,6 +420,9 @@ ktime_t *input_get_timestamp(struct input_dev *dev);
 void input_event(struct input_dev *dev, unsigned int type, unsigned int code, int value);
 void input_inject_event(struct input_handle *handle, unsigned int type, unsigned int code, int value);
 
+void input_update_ledstate(unsigned int flag, unsigned int value);
+unsigned int input_get_ledstate(void);
+
 static inline void input_report_key(struct input_dev *dev, unsigned int code, int value)
 {
 	input_event(dev, EV_KEY, code, !!value);
-- 
2.20.1



