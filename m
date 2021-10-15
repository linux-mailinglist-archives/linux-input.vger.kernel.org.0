Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6813342E93A
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 08:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbhJOGsK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 02:48:10 -0400
Received: from smtpbg703.qq.com ([203.205.195.89]:46116 "EHLO
        smtpproxy21.qq.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S235645AbhJOGsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 02:48:09 -0400
X-QQ-mid: bizesmtp47t1634280347twvqe95z
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 15 Oct 2021 14:45:40 +0800 (CST)
X-QQ-SSF: B1400000002000B0D000000B0000000
X-QQ-FEAT: vsfsx1ezZ8QUhBPnLmbYfusF+NWsNPdBnJK3FS7ph9LrqwdBiVti3RIiVna8X
        TIJwUq9W3K8Usw6fvV87MCjkAHGhbdXIo/Cm8Ctd246jv5Z47IEXDzbnKse0WLV0XoZK97R
        kmG25RyWERSPq9cBSycB/YkugV3WddxKN0e/p38xc/tk4OsmKbXDH/80A25HBcT3d60DvAh
        0ATkhxWfUoMGyCtvkATlyegc0Y2ixCvmmDAsUsYnA5pXMy/tVheeBVKT97dw79HY04nxTyY
        KiCw559JZVrTOC74JesxPZg+1hvWZuu9y9g2C34B+kHae5uUJCNMH5hQXVzJlngb0S3rBrH
        VZKH5XMRuqXZb1bJoRiBXVJgpruGe+CeGivyYkp0pT7LNY+zgs=
X-QQ-GoodBg: 1
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] input&tty: Fix the keyboard led light display problem
Date:   Fri, 15 Oct 2021 14:45:34 +0800
Message-Id: <20211015064534.26260-1-changlianzhi@uniontech.com>
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



