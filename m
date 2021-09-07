Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4424022FF
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 07:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhIGFHQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 01:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhIGFHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 01:07:15 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081A7C061575;
        Mon,  6 Sep 2021 22:06:10 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso11352416otp.1;
        Mon, 06 Sep 2021 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2O9AWZ6fDTYlL82c7Kzz5I/06piYVWEMibYZmdBsl6w=;
        b=VTY+w4TjNJUqKDXOAURwMerhRToTckira6X4s02r6khhq3t7ID4YvGL03KM6c+D2+d
         9ohBeZbc4uXS3uCiwGfO2dWLo1OlMBGtGExglrwQ/8e7dvdhu69hRlcFVRzUSDuxTXzZ
         Gwud+75D0jZVoPD4VGO8jnCKcA8+XjtUq0jVrvR1qNE2cXoZKLghQv7q0VJ2k3o+1ZJj
         H1EPSDXCFfgO5rxZ6lkXqlc4RxvkKjrwGdN1MaD/bT3GNo1ppt/jMDpPZqdNUJOzA+Df
         HN9wTnjCaCuI2XsqZE4FNx96Vb2a47gu8e+2rucFIbacbrseWu1OmknlUEwBWQ3o6GbE
         noew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=2O9AWZ6fDTYlL82c7Kzz5I/06piYVWEMibYZmdBsl6w=;
        b=cqdK5GiIuOPmr+7jKfocryuNQHPRfE15qZ3UlI5mAxXCMSvE95ZI7grnUG5WLio/0p
         N44dHWZ9QAHiPLg8Vl6fD8Lba0S8EnWUhROxNDxRMO2GVngUwQSBaNlgxkegXqHsw4gu
         3P024y/xWk3GSpGzl/Gf+2uE6XC2u0R4WCgRDi6RAQDHLYMNoCroqOPrEKZBeluU7/1I
         KVEgF+3w6WxAtu2I299n84PH6kFvjjhe9IDacJP4AHzBO6gILa9FbDDuHJ4gzi+9bzgW
         bjqJ1OolbSLjCH1Z/5EIMN/2KT8Svt5yJqm3huR7VZpShhRyxkrrJf7E1rOvaQ27f6H9
         mgrA==
X-Gm-Message-State: AOAM530M/fcY51vq+ILOwNvFMV4Eo9oPvcLvhZEhI2tO1MAF86fZWZi/
        JN+ou/Sev6a2jJQJ0SyXEUQ2el51NVQ=
X-Google-Smtp-Source: ABdhPJyzJWDOgpw0yi30QzhoAHJ8deOFy4JIBR185vZ275cp25WdSnCMUwhtEtjCE1pmpNUAFN/IbA==
X-Received: by 2002:a05:6830:1443:: with SMTP id w3mr13738815otp.49.1630991169272;
        Mon, 06 Sep 2021 22:06:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z25sm1900657oic.24.2021.09.06.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 22:06:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] Input: analog: Always use ktime functions
Date:   Mon,  6 Sep 2021 22:06:06 -0700
Message-Id: <20210907050606.2142634-1-linux@roeck-us.net>
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
 drivers/input/joystick/analog.c | 74 ++-------------------------------
 1 file changed, 3 insertions(+), 71 deletions(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index f798922a4598..4702982182fa 100644
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
@@ -119,64 +115,14 @@ struct analog_port {
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
 static inline u64 get_time(void)
 {
-	if (use_ktime) {
-		return ktime_get_ns();
-	} else {
-		unsigned int x;
-		GET_TIME(x);
-		return x;
-	}
+	return ktime_get_ns();
 }
 
 static inline unsigned int delta(u64 x, u64 y)
 {
-	if (use_ktime)
-		return y - x;
-	else
-		return DELTA((unsigned int)x, (unsigned int)y);
+	return y - x;
 }
 
 /*
@@ -378,21 +324,7 @@ static void analog_calibrate_timer(struct analog_port *port)
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
+	port->speed = 1000000;
 
 	tx = ~0;
 
-- 
2.33.0

