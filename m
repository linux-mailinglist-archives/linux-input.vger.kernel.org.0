Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD3A40290A
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 14:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344211AbhIGMis (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 08:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344559AbhIGMio (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 08:38:44 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EFAC0617AF;
        Tue,  7 Sep 2021 05:37:38 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id x10-20020a056830408a00b004f26cead745so12526381ott.10;
        Tue, 07 Sep 2021 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tT0YE0B1OXNsrJCj7Qo0plt0P2hEoe5ZLUJ8RSKEe7w=;
        b=nsndOhrmHhE9wT7Xa2+bfeVlVPNJCKT8E9BnRWP7guci8ak+CQ9CuPW4K3qLYGUm7p
         HSmkm5iB4AUVrZCljBppZLDv72RJHV4hOX/31B20QfWEz2vltEg0fBIGN/eyOlq+W4Jf
         aC/XP9knDQRd4DhtqPaDQsyJ8lYcDR5oYSe04I/kUDePbKnxUGCEmSQZNyIDSggO3mvd
         dS1qbmYfZuLK9hG0XQfvAv2vy8CzvM9daPlXROfwr0SI8+BalYTE2+hbGRDTmd6tk6d1
         y5Co2EBJIzzSPppWIdtykMQW7Z27t476PmCetNkYJZCOYKx588O+2effMs60ux/zOxhL
         bV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tT0YE0B1OXNsrJCj7Qo0plt0P2hEoe5ZLUJ8RSKEe7w=;
        b=WSFgsEXZ28ru/LKA2+R232kT11BDCUEM/f+9yUgKf5PUZudz+TEdRwfMCoFoqzSd1Y
         +37olrF68SS+dzyymT9OGh19XdBaKd35uTkHgBXaEpjwe8tgMwqMegnfSPTwHS4++8uP
         AtL/FJbA6tSKJKKtK9Qdh16lJM/MgNYN6nkjckYfGQsYWuw2KsWn93/6ToPsd8/tQ4Cn
         M4ZRaPCNPZqjfOO2KdjY8g0V83ibTgZY/pep2XRfmh8E6PT/3QCLN6ln/K5z0bY0GCv3
         QjlGzZSkfB3S8VKvpWLLv+tX/wMnhWWlv6Ubib4cYrQXXtWVsf19gHTwgg1bYsqASV7D
         OSzw==
X-Gm-Message-State: AOAM533IseTLBt41Kjuqvk0zfjUPgGLnT1rIFWTYL2lq1HyGl1tcVSz6
        bRWDaeleJ317uZtseT6UpLLSchCMxe4=
X-Google-Smtp-Source: ABdhPJwrrhQ7AaehKEVhRvoqvYbFgxLwg31nF+0QJ7F4lETL8deJVnr17vqg6ep1TQHvri2eGm1MqQ==
X-Received: by 2002:a05:6830:22f9:: with SMTP id t25mr14647703otc.344.1631018257495;
        Tue, 07 Sep 2021 05:37:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s8sm2386546otd.76.2021.09.07.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:37:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3] Input: analog: Always use ktime functions
Date:   Tue,  7 Sep 2021 05:37:34 -0700
Message-Id: <20210907123734.21520-1-linux@roeck-us.net>
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
v3: Avoid 64-bit divide operation
v2: Drop helper functions and use ktime_get() and ktime_sub() directly
    Drop 'speed' variable and use NSEC_PER_MSEC directly

 drivers/input/joystick/analog.c | 103 ++++----------------------------
 1 file changed, 11 insertions(+), 92 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index f798922a4598..824e77da67bb 100644
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
+				port->axes[j] = ((u32)ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
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

