Return-Path: <linux-input+bounces-9508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139DA1BF7E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 01:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53D541621FC
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 00:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFAE1372;
	Sat, 25 Jan 2025 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R87CXsKJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749B3C2F;
	Sat, 25 Jan 2025 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737763345; cv=none; b=m4sioDbzb2ZqaMkksN/k0CC0Arvuh32o3SCDkFIeZui1TshA0a9z9L2J4MPwR5VfF+CqWMrXnyejvhJSrsNO1UdtmKLhCIJK7xYmP3bqTJ1X1l0PomZJ82HR6OvQm32GpVz2BL6JRdete2fco+/kQh4HK+Dh1OYHZhLS/7W4xVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737763345; c=relaxed/simple;
	bh=bD0AvvLo8N+WI/sHt8TJnqZnkgXxeeECdA+YbvZS700=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNf08XEpHrrHMGW6V6z22+O5iy56Jty2d2ShdXJbgZiFK97tm1c4Kr4yY+WTFz78Y4/7hsnggSg25KATj+ta7j6fgIy4z84G6owA/Adsog+BEHlmEIXzWrz5dUcQlpAF0HuZ8ccckqzi61Dldf8Cd5/RI8C1iFXQCdQKnylq3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R87CXsKJ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-851c4f1fb18so76056139f.2;
        Fri, 24 Jan 2025 16:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737763342; x=1738368142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqN2VlArpbqxuloIfjaBJEy7d7kR3rKiEU6pl7Kw2mE=;
        b=R87CXsKJ3G/D9H2IOM4RjBJ5kMkhXcqRG5Cf0asdc2QvPWP+eyXTzztXcnimMm/8uY
         DST98fUlVnLp52GfdeNTu/8q86dn4OmFWZLXgE/iTZBcCsn8qjcMy/vHBeyPczvJnr+a
         IPBFIUees/ebqLyxHqKq/+ZG/TjOuo0qlq9UK02cixX9jWoPe+08XFds19/JkT9647oS
         XPtB0Il16MmSosj3k0f70TXXrj3uGyAMnfKUKospaExB5L4GxzYT7SWES6Oo/QHTig+s
         0gx8bKf+hkKh5+DaeJg3L5kwLx4+ShdjH2+KFWhzaPqfCRurdLgSKj+Iz0sZPJaG+yv3
         HBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737763342; x=1738368142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqN2VlArpbqxuloIfjaBJEy7d7kR3rKiEU6pl7Kw2mE=;
        b=NY1JKpGfdfI3kuxeKg93IrZlGahz3m+E0f1jQiBbyqohGqeauhcT8WlqgbcHCHs5BN
         /P23RcQJvP40Jpd+x2SKPC5jdt8Y6bBXt2EfxA+IGGqK9BhrG5+CL6TAsedMFbCMdOsa
         EcJh1d7eGFEvizkCL32d4VCp1J9XJ/PQUWYrSsw//fOSlGr4Ac57E0F+2TtCFR/4+0kg
         JfEgkoDEnkgwmHXZ/aAdnkj8btd8hVkq6MSBOXTzEJU2oJO9JAZGXtR958X3idwQ848j
         +/5U4HqpMWBKvSCLau0x80ENeJolAV35iv6IxUsvuN6YtXinHns2LSx2Ef5koa+BwrXR
         xkKw==
X-Gm-Message-State: AOJu0YygEjlzK3n9/1NAp2y4suiJBPz+ygXjQMQINw2R0iBrwLKPcnaK
	RLmhPUpBP4m+xKI0pKYQsyx1R8IJM//QbgHxSAaaynEV/eCoQy2XNbrH0hRr
X-Gm-Gg: ASbGncvG6AyuShqqQpIZBgk/1Od6k+aYvD/D7dSArq/GomALMFf8c8csIsUjXCU2r0L
	shS/2OjiElidfKcmNs8NWyt2qf+y/Rt9w1PQP7VJUARmw5nopGfgdKsV8oSuE0VmmZvYhcqMFl/
	phIU302GVoBxJjbsygEKXz1nsLwvIzFlxHO20fI5RyY65e8j7dbyck9XMXYEWZIhDoxgzGcYTQs
	D9ij/oChTFlsUrg9lUR7uonN3Ad1Ho2qp4HyCUok4yfNUf+HHw8CaWRF+nE5wFdRuB/FUr+/OTs
	vHe76UU7LrL7/ak7enZCpQ==
X-Google-Smtp-Source: AGHT+IGAtJ8ctqOnPj3E1vE2dIwCii5L9kV6F942LpbZIujKzjx9GFxejH9UBK/HEb9Oo71+5ZEEsA==
X-Received: by 2002:a05:6602:6c11:b0:842:ef83:d3b2 with SMTP id ca18e2360f4ac-851b6522640mr2604844339f.12.1737763342042;
        Fri, 24 Jan 2025 16:02:22 -0800 (PST)
Received: from localhost.localdomain ([2600:6c98:a500:7a:550d:571:19dc:c1fa])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8521e035792sm99863639f.40.2025.01.24.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 16:02:20 -0800 (PST)
From: Noa <coolreader18@gmail.com>
To: linux-input@vger.kernel.org,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Enable HW LED blinking for hid-nintendo controllers
Date: Fri, 24 Jan 2025 18:02:02 -0600
Message-ID: <20250125000202.20868-1-coolreader18@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is my first patch, so hopefully I'm doing this right. I noticed
when trying to use `ledtrig-timer` on the Joycon LEDS that it at times
would hang for a while (I assume the firmware isn't a fan of frequent
LED subcommands, or something), and I've tested with this patch and it
blinks consistently with carefree abandon.

Separately, I was also thinking about exposing the LEDs as evdev codes,
but it doesn't seem like there's any good options of the `LED_*`
constants to represent them.

Signed-off-by: Noa <coolreader18@gmail.com>
---
 drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 11ac246176ae..83dff0c4f7e1 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2183,14 +2183,13 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
-/* Because the subcommand sets all the leds at once, the brightness argument is ignored */
-static int joycon_player_led_brightness_set(struct led_classdev *led,
-					    enum led_brightness brightness)
+/* Update the on/flash status of the leds according to their led_classdev fields */
+static int joycon_update_player_leds(struct device *dev)
 {
-	struct device *dev = led->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
 	struct joycon_ctlr *ctlr;
 	int val = 0;
+	int flash = 0;
 	int i;
 	int ret;
 
@@ -2200,16 +2199,47 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 		return -ENODEV;
 	}
 
-	for (i = 0; i < JC_NUM_LEDS; i++)
-		val |= ctlr->leds[i].brightness << i;
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		if (ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_delay_off)
+			flash |= 1 << i;
+		else if (ctlr->leds[i].brightness)
+			val |= 1 << i;
+	}
 
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_set_player_leds(ctlr, 0, val);
+	ret = joycon_set_player_leds(ctlr, flash, val);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
 }
 
+static int joycon_player_led_brightness_set(struct led_classdev *led,
+					    enum led_brightness brightness)
+{
+	led->brightness = brightness;
+
+	if (!brightness)
+		led->blink_delay_on = led->blink_delay_off = 0;
+
+	return joycon_update_player_leds(led->dev->parent);
+}
+
+/* the blink period of the leds can't be changed, and is always these values */
+static const JC_LED_BLINK_DELAY_ON = 500;
+static const JC_LED_BLINK_DELAY_OFF = 200;
+/* the different leds on a joycon can't actually be set to hw blink independently
+ * of each other, since they all use the same one subcommand, so this function
+ * actually resets the cycle of all the leds */
+static int joycon_player_led_blink_set(struct led_classdev *led,
+				     unsigned long *delay_on,
+				     unsigned long *delay_off)
+{
+	led->blink_delay_on = *delay_on = JC_LED_BLINK_DELAY_ON;
+	led->blink_delay_off = *delay_off = JC_LED_BLINK_DELAY_OFF;
+
+	return joycon_update_player_leds(led->dev->parent);
+}
+
 static int joycon_home_led_brightness_set(struct led_classdev *led,
 					  enum led_brightness brightness)
 {
@@ -2268,6 +2298,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 		led->max_brightness = 1;
 		led->brightness_set_blocking =
 					joycon_player_led_brightness_set;
+		led->blink_set = joycon_player_led_blink_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
 
 		led_val |= joycon_player_led_patterns[player_led_pattern][i] << i;
-- 
2.48.1


