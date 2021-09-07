Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA6F402379
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhIGGep (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhIGGeo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:34:44 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F4AC061575;
        Mon,  6 Sep 2021 23:33:39 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id k20-20020a4ad114000000b0029133123994so2621629oor.4;
        Mon, 06 Sep 2021 23:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LB2U8NEBFUD3pp0aKX8ymX9XGGu9141PkuAhyzknf4=;
        b=P/7Qn/LmhaD/Md3GvxZAK492CAEz7cIZvfvT3RaW8nC4oJ7y0480W1oc8ZvkCjxTIY
         ZKLS8Pl4ZE+CxEIXLzHO46wXKmvFswN81h4o71LhPhMjnRQGAvBZZ6cS3S0pDLB9PngA
         FZzplllrK4eHX2x0etV0oaDWs0QRsZWRgUl/KO6WF+YfhkTMrpMEg4oV43UAn8/nhoFe
         cZvNWMUMtXpCRcP/jUkQOmWHwk5PjTvBUY6zPQGUnuSXaBkFxQecEgmB7y3ENBM0yEQp
         QQccBGvD/W3xUrt76u8r3Q4cDp5gM0dWFpabnfZSUSUkzq50s/RAKahmOJdpm5miroBi
         e/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/LB2U8NEBFUD3pp0aKX8ymX9XGGu9141PkuAhyzknf4=;
        b=kBpN+1axjq2PKU3nlvCzlCeG7gd+53zJjZNc5c7+B+1Cma7ClzJXYDp+eVOAFDIptL
         HBY24NBbBga2OsrrXDPe2svhgN2xXfvGjJ8Jmp8BLpyELn/xLpP5xMtqKaKbRdtIBUSO
         yaiF5S7w6QZuKvpnmzgsB8l+WUllyj6ymWzH8wUCCbuPBbNhb3MNr7Lw4fZjjaWZZ1wE
         PpVY7+agQkP3ui6sSwU5JN4g7DidrxYYKcP1T1/6HUFD2I0985f1h7LmfwbEojEqy6Db
         IImYSzGpi/mx51tpUOyDOtlbXAj7jIcfn+Gf+HBinss6upN+cUcqz2IlHmBPWrnAM9Cp
         fdlg==
X-Gm-Message-State: AOAM530ENexCvEh70ohXeHrO0jDd7rDFRhVfycKbD642EcHG3PJiVk09
        lWd73LIEkt2sd6r0b+Vr4a4=
X-Google-Smtp-Source: ABdhPJzw7uF8GiW9oNcQj3tWdqrgX76SLd9blR0LJDfZe3X01nprjW0cYYlh+Ui3YH4RdRV/Z5qJJQ==
X-Received: by 2002:a4a:e60e:: with SMTP id f14mr16443219oot.84.1630996418588;
        Mon, 06 Sep 2021 23:33:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8sm2262268otk.34.2021.09.06.23.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 23:33:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] Input: analog: Always use ktime functions
Date:   Mon,  6 Sep 2021 23:33:35 -0700
Message-Id: <20210907063335.2837366-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

m68k, mips, s390, and sparc allmodconfig images fail to build with the
following error.

drivers/input/joystick/analog.c:160:2: error:
	#warning Precise timer not defined for this architecture.

Remove architecture specific time handling code and always use ktime
functions to determine time deltas. Also remove the now useless use_ktime
kernel parameter.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Drop helper functions and use ktime_get() and ktime_sub() directly
    Drop 'speed' variable and use NSEC_PER_MSEC directly

 drivers/input/joystick/analog.c | 103 ++++----------------------------
 1 file changed, 11 insertions(+), 92 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index f798922a4598..a9ec41f48068 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -28,10 +28,6 @@ MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
-static bool use_ktime = true;
-module_param(use_ktime, bool, 0400);
-MODULE_PARM_DESC(use_ktime, "Use ktime for measuring I/O speed");
-
 /*
  * Option parsing.
  */
@@ -110,7 +106,6 @@ struct analog_port {
 	char cooked;
 	int bads;
 	int reads;
-	int speed;
 	int loop;
 	int fuzz;
 	int axes[4];
@@ -119,66 +114,6 @@ struct analog_port {
 	int axtime;
 };
 
-/*
- * Time macros.
- */
-
-#ifdef __i386__
-
-#include <linux/i8253.h>
-
-#define GET_TIME(x)	do { if (boot_cpu_has(X86_FEATURE_TSC)) x = (unsigned int)rdtsc(); else x = get_time_pit(); } while (0)
-#define DELTA(x,y)	(boot_cpu_has(X86_FEATURE_TSC) ? ((y) - (x)) : ((x) - (y) + ((x) < (y) ? PIT_TICK_RATE / HZ : 0)))
-#define TIME_NAME	(boot_cpu_has(X86_FEATURE_TSC)?"TSC":"PIT")
-static unsigned int get_time_pit(void)
-{
-        unsigned long flags;
-        unsigned int count;
-
-        raw_spin_lock_irqsave(&i8253_lock, flags);
-        outb_p(0x00, 0x43);
-        count = inb_p(0x40);
-        count |= inb_p(0x40) << 8;
-        raw_spin_unlock_irqrestore(&i8253_lock, flags);
-
-        return count;
-}
-#elif defined(__x86_64__)
-#define GET_TIME(x)	do { x = (unsigned int)rdtsc(); } while (0)
-#define DELTA(x,y)	((y)-(x))
-#define TIME_NAME	"TSC"
-#elif defined(__alpha__) || defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_PPC) || defined(CONFIG_RISCV)
-#define GET_TIME(x)	do { x = get_cycles(); } while (0)
-#define DELTA(x,y)	((y)-(x))
-#define TIME_NAME	"get_cycles"
-#else
-#define FAKE_TIME
-static unsigned long analog_faketime = 0;
-#define GET_TIME(x)     do { x = analog_faketime++; } while(0)
-#define DELTA(x,y)	((y)-(x))
-#define TIME_NAME	"Unreliable"
-#warning Precise timer not defined for this architecture.
-#endif
-
-static inline u64 get_time(void)
-{
-	if (use_ktime) {
-		return ktime_get_ns();
-	} else {
-		unsigned int x;
-		GET_TIME(x);
-		return x;
-	}
-}
-
-static inline unsigned int delta(u64 x, u64 y)
-{
-	if (use_ktime)
-		return y - x;
-	else
-		return DELTA((unsigned int)x, (unsigned int)y);
-}
-
 /*
  * analog_decode() decodes analog joystick data and reports input events.
  */
@@ -241,11 +176,11 @@ static int analog_cooked_read(struct analog_port *port)
 	int i, j;
 
 	loopout = (ANALOG_LOOP_TIME * port->loop) / 1000;
-	timeout = ANALOG_MAX_TIME * port->speed;
+	timeout = ANALOG_MAX_TIME * NSEC_PER_MSEC;
 
 	local_irq_save(flags);
 	gameport_trigger(gameport);
-	now = get_time();
+	now = ktime_get();
 	local_irq_restore(flags);
 
 	start = now;
@@ -258,16 +193,16 @@ static int analog_cooked_read(struct analog_port *port)
 
 		local_irq_disable();
 		this = gameport_read(gameport) & port->mask;
-		now = get_time();
+		now = ktime_get();
 		local_irq_restore(flags);
 
-		if ((last ^ this) && (delta(loop, now) < loopout)) {
+		if ((last ^ this) && (ktime_sub(now, loop) < loopout)) {
 			data[i] = last ^ this;
 			time[i] = now;
 			i++;
 		}
 
-	} while (this && (i < 4) && (delta(start, now) < timeout));
+	} while (this && (i < 4) && (ktime_sub(now, start) < timeout));
 
 	this <<= 4;
 
@@ -275,7 +210,7 @@ static int analog_cooked_read(struct analog_port *port)
 		this |= data[i];
 		for (j = 0; j < 4; j++)
 			if (data[i] & (1 << j))
-				port->axes[j] = (delta(start, time[i]) << ANALOG_FUZZ_BITS) / port->loop;
+				port->axes[j] = (ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
 	}
 
 	return -(this != port->mask);
@@ -378,35 +313,19 @@ static void analog_calibrate_timer(struct analog_port *port)
 	u64 t1, t2, t3;
 	unsigned long flags;
 
-	if (use_ktime) {
-		port->speed = 1000000;
-	} else {
-		local_irq_save(flags);
-		t1 = get_time();
-#ifdef FAKE_TIME
-		analog_faketime += 830;
-#endif
-		mdelay(1);
-		t2 = get_time();
-		t3 = get_time();
-		local_irq_restore(flags);
-
-		port->speed = delta(t1, t2) - delta(t2, t3);
-	}
-
 	tx = ~0;
 
 	for (i = 0; i < 50; i++) {
 		local_irq_save(flags);
-		t1 = get_time();
+		t1 = ktime_get();
 		for (t = 0; t < 50; t++) {
 			gameport_read(gameport);
-			t2 = get_time();
+			t2 = ktime_get();
 		}
-		t3 = get_time();
+		t3 = ktime_get();
 		local_irq_restore(flags);
 		udelay(i);
-		t = delta(t1, t2) - delta(t2, t3);
+		t = ktime_sub(t2, t1) - ktime_sub(t3, t2);
 		if (t < tx) tx = t;
 	}
 
@@ -611,7 +530,7 @@ static int analog_init_port(struct gameport *gameport, struct gameport_driver *d
 		t = gameport_read(gameport);
 		msleep(ANALOG_MAX_TIME);
 		port->mask = (gameport_read(gameport) ^ t) & t & 0xf;
-		port->fuzz = (port->speed * ANALOG_FUZZ_MAGIC) / port->loop / 1000 + ANALOG_FUZZ_BITS;
+		port->fuzz = (NSEC_PER_MSEC * ANALOG_FUZZ_MAGIC) / port->loop / 1000 + ANALOG_FUZZ_BITS;
 
 		for (i = 0; i < ANALOG_INIT_RETRIES; i++) {
 			if (!analog_cooked_read(port))
-- 
2.33.0

