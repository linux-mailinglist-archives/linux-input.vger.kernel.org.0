Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1715742E61B
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 03:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhJOBWs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 21:22:48 -0400
Received: from smtpbguseast2.qq.com ([54.204.34.130]:51204 "EHLO
        smtpbguseast2.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhJOBWr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 21:22:47 -0400
X-QQ-mid: bizesmtp49t1634260832t5d6580v
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Fri, 15 Oct 2021 09:20:26 +0800 (CST)
X-QQ-SSF: 01400000002000B0D000B00A0000000
X-QQ-FEAT: ZY5GfQDnGLrptK9Jp+SvzSzvwZqjl2N5tiqmDI76LimlFQ4/g1xbkGwLhPVGL
        ZOKtLtUgra1cGv7qnELjfRjNe0w0VbjxDeKwhh5NZP8ng4jNq0KQ64aRXPil0pgfF9iGWRl
        xZN07+fY2FWFC/F77pcCPLkrD5BN8xk/UBsjhBQ2g0Z1iYHSKkxyeWwnOdwouHQFqATV8Ya
        xMGoCjZRe4eWIovIw0xK3JxR6GKIY/B612z10CdiWTAWg6HwnM4BIaXvOxDPG+D2wFsJlFs
        58eDRPFoj9D7EuyPhyEvGEGvWuxctcx+1Lk6MRL0VHI3j3STGfHiBvRXH1nl49e6JhwY2IQ
        FZfWdNAhDs2EKOvMDPgLdqrbOW1vg+Gv3VZYjwu5NAiRmXYpqQ=
X-QQ-GoodBg: 2
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] input&tty: Fix the keyboard led light display problem
Date:   Fri, 15 Oct 2021 09:20:23 +0800
Message-Id: <20211015012023.10751-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index c7fbbcdcc346..0240915cdfef 100644
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
+		ledstate &= ~BIT(bit);
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

Dear friends, because the email I send to linux-kernel@vger.kernel.org 
will always fail many times, in order not to harass you, the latest 
information may not be synchronized with you. For the previous problem, 
I will resend it again. And respond to the previous questions:

@Jiri Slaby <jirislaby@kernel.org>
(1)
> +            if (type == EV_LED && code < 3)
>
> 3 is a magic constant. In fact, you mean "code <= LED_SCROLLL", right?

> > Yes， that's it.I have corrected it.
(2)
>   +void update_value_ledstate(int flag, int value)
>
> Why is the int signed?

> >I will correct it, it's my mistake

(3)
> +{
> +    if (ledstate == -1U)
> +        ledstate = 0;
> +
> +    if (flag == LED_NUML) {
> +        ledstate &= ~(1 << 1);

> ledstate &= ~BIT(VC_NUMLOCK);
>
> +        ledstate |= value << 1;
>
>What ensures that value is 0 or 1 here?

> >The original code here is like this, there is no guarantee that the
> >value passed down is 0 or 1, I need to think about how to do it!

(4)
> What about something like this (maybe ifs would be shorter, dunno, try
> it):
> unsigned int bit;
>
> switch (flag) {
> case LED_NUML:
>   bit = VC_NUMLOCK;
>   break;
> case LED_CAPSL:
>   bit = VC_CAPSLOCK;
>   break;
> case LED_SCROLLL:
>   bit = VC_SCROLLOCK;
>   break;
> default:
>   WARN_ON_ONCE(1);
>   return;
> }
>
> if (value)
>   ledstate |= BIT(bit);
> else
>   ledstate &= ~BIT(BIT);

>>This way the intention is clearer, I also considered how to optimize
>>here, your code is better than mine!

(5)
> Can you explain why (not to me, to the commit log)?
>
>       spin_lock_irqsave(&led_lock, flags);
>       leds = getleds();
> @@ -1257,7 +1278,6 @@ static void kbd_bh(struct tasklet_struct *unused)
>         if (leds != ledstate) {
>           kbd_propagate_led_state(ledstate, leds);
> -        ledstate = leds;
>
> The same here. Why this doesn't break the current behaviour.

>>Assuming that the desktop environment (xorg) occupies tty1,
>> kb->kbdmode of tty1 will be set to VC_OFF. According to the code logic
>> before modification, problems will occur:
>>1) The ledstate and kb->ledflagstate in the tty1 environment are
>always 0 and will not be modified.
>>2) At this time, if ledstate is not 0 in the tty2 environment,
>>switch from tty2 to tty1 (desktop environment). According to the code
>> logic of kbd_event (tasklet_schedule(&keyboard_tasklet), the code
>> execution enters the kbd_bh() function, at this time tty1 Will go to
>> set the keyboard state to 0. At this time, the keyboard setting state
>> of xorg may not be like this.


@Andy Shevchenko<andriy.shevchenko@linux.intel.com>
(1)
> + if (value)
> + ledstate |= BIT(bit);
> + else
> + ledstate &= ~BIT(BIT);

>NIH assign_bit().

>On top of that, what is BIT as parameter does in the else branch? Have you
>compiled this?

>>This is an error and has been corrected.
(2)
>  extern void setledstate(struct kbd_struct *kbd, unsigned int led);

>

>Not sure if wee need this blank line, since both functions are from the same
>(functional) group.

> +extern void update_value_ledstate(int flag, int value);

>>I don't understand what you mean here. Isn't there a blank line between all function declarations?

(3)
> + unsigned int bit;
unsigned long bit;
(see below why)
>>Why is unsigned long bit？？

@Dmitry Torokhov <dmitry.torokhov@gmail.com> 
>No, we should not be putting hooks for tty/vt directly into input core.
>The code in drivers/tty/vt/keyboard.c is getting all relevant input
>events and should be able to keep the led state synchronized. Please
>keep all the changes localized there.

>>Although driver/tty/vt/keyboard.c is acquiring all related input events, 
>>the related operations of the input_inject_event function should be passed to 
>>the keyboard driver, right? After input_inject_event is completed, can 
>>kbd_event still get the corresponding change event?

>>I think it is possible to put the ledstate variable and the update_value_ledstate function into the input module, and add a new function for keyboard.c to call (for example: get_kbd_ledstate), so that keyboard.c can get the value of ledstate. Is this okay?

---
Thank you very much for your hard work!!
lianzhi chang


