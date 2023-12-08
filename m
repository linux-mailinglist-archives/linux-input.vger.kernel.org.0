Return-Path: <linux-input+bounces-623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471C80A89D
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 17:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7A11F21080
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 16:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EA33528F;
	Fri,  8 Dec 2023 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlOjFO/q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3830E171C
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 08:18:38 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54cbabf4bceso591991a12.0
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702052316; x=1702657116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6+LkPH66gOhphotxMNoCChEKQE36aIMtQNHFW8fx5U=;
        b=LlOjFO/qJjj3+eSQvLkWUO733/EjCaogQYo5v1hn1O8tUXo/P6ojMZtozwnJSEb7j1
         Pp/NAqlZ36FtnBXcKLxvTdhfc1ByaDKb/LJFl7VjUY4wzEwfZgRARzFTH2yglRe3kk8R
         34e2023U5pZ9CcI2oB+lVeRk5QxUhIZKx++AbdvMRrGQvTv1spzkEYDez7sowBCZblm2
         ecL6HzHxCR7Uy8N6yaffJGH2hikfCXjFWffSdf8V1bnG19bNM07wYFvrTlfVM9imJ9Hy
         h74DcFfqLomgPNvDQqpgdsUq4+qoZEPnVfTOsRMcGZ3pT/OkyGo820sMJuHGvDVmlIcN
         oTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702052316; x=1702657116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6+LkPH66gOhphotxMNoCChEKQE36aIMtQNHFW8fx5U=;
        b=SlOLqZFpAlNBFduZPVuCRsWy8Mhn37fwvzIwA4j68wRXlAiG08mC2fyL50uQ4rEQKn
         o3A/2eQcOeOH/kZUS0wF3yCLq3QH30OAzZctf2mrM9Tg9gF4CubdwWLBJDaK9eN3dslw
         qSn8v5/K3pMUBr0+qrZ4LXcXZRUsnNLS/Bxg11+bt8RMlFdL71Q/WphsEawUIbpI8Q+X
         VedFhETo4/6n6uGNL9wTTSVJER1c5MMcHHHdQpkdJ1zWAUwkqShpWe1TKLS4GP1EX8qC
         ig5p0MAX8wVPmg25HxK/ec+OxkvkgAPst3OkkWkAcJCtBrZnYSY/2awifR0vSWrBSKms
         t+TA==
X-Gm-Message-State: AOJu0YyUR13PnOHJp/H43wVS3315i9ausHWBKZoxAVZaMadkNANlSktN
	pnrdkSC4NPCIwrklrSjQVH0=
X-Google-Smtp-Source: AGHT+IGtPjhnbd4VNG1aCWe5yAJh+BAYv1pVwGIS+gCnXAX8GTpjhEobJRpN9XThWd3v5GzzG8VUww==
X-Received: by 2002:a17:907:c317:b0:a1d:5c72:3be2 with SMTP id tl23-20020a170907c31700b00a1d5c723be2mr264936ejc.7.1702052316418;
        Fri, 08 Dec 2023 08:18:36 -0800 (PST)
Received: from desktop-nixos-martino.. ([2a01:e11:5004:180::bd5a:12c2])
        by smtp.gmail.com with ESMTPSA id tg3-20020a1709078dc300b00a195a52cd0fsm1175833ejc.111.2023.12.08.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:18:35 -0800 (PST)
From: Martino Fontana <tinozzo123@gmail.com>
To: rymcclel@gmail.com
Cc: benjamin.tissoires@redhat.com,
	djogorchock@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	Martino Fontana <tinozzo123@gmail.com>
Subject: [PATCH] HID: nintendo: use ida for LED player id
Date: Fri,  8 Dec 2023 17:15:02 +0100
Message-ID: <20231208161501.15818-2-tinozzo123@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208075928.4293-1-rymcclel@gmail.com>
References: <20231208075928.4293-1-rymcclel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
---
 drivers/hid/hid-nintendo.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 138f154fe..22a3c97a0 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -28,6 +28,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/hid.h>
+#include <linux/idr.h>
 #include <linux/input.h>
 #include <linux/jiffies.h>
 #include <linux/leds.h>
@@ -427,6 +428,7 @@ static const enum led_brightness joycon_player_led_patterns[JC_NUM_LED_PATTERNS]
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	u32 player_id;
 	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
 	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
@@ -1917,7 +1919,8 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 	return ret;
 }
 
-static DEFINE_SPINLOCK(joycon_input_num_spinlock);
+static DEFINE_IDA(nintendo_player_id_allocator);
+
 static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
@@ -1928,20 +1931,15 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	char *name;
 	int ret;
 	int i;
-	unsigned long flags;
-	int player_led_pattern;
-	static int input_num;
-
-	/*
-	 * Set the player leds based on controller number
-	 * Because there is no standard concept of "player number", the pattern
-	 * number will simply increase by 1 every time a controller is connected.
-	 */
-	spin_lock_irqsave(&joycon_input_num_spinlock, flags);
-	player_led_pattern = input_num++ % JC_NUM_LED_PATTERNS;
-	spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
 
 	/* configure the player LEDs */
+	ret = ida_alloc(&nintendo_player_id_allocator, GFP_KERNEL);
+	if (ret < 0) {
+		hid_warn(hdev, "Failed to allocate player ID, skipping; ret=%d\n", ret);
+		goto home_led;
+	}
+	ctlr->player_id = ret % JC_NUM_LED_PATTERNS;
+
 	for (i = 0; i < JC_NUM_LEDS; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
 				      d_name,
@@ -1952,13 +1950,13 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 
 		led = &ctlr->leds[i];
 		led->name = name;
-		led->brightness = joycon_player_led_patterns[player_led_pattern][i];
+		led->brightness = joycon_player_led_patterns[ctlr->player_id][i];
 		led->max_brightness = 1;
 		led->brightness_set_blocking =
 					joycon_player_led_brightness_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
 
-		led_val |= joycon_player_led_patterns[player_led_pattern][i] << i;
+		led_val |= joycon_player_led_patterns[ctlr->player_id][i] << i;
 	}
 	mutex_lock(&ctlr->output_mutex);
 	ret = joycon_set_player_leds(ctlr, 0, led_val);
@@ -2410,6 +2408,7 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 	spin_unlock_irqrestore(&ctlr->lock, flags);
 
 	destroy_workqueue(ctlr->rumble_queue);
+	ida_free(&nintendo_player_id_allocator, ctlr->player_id);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.42.0


