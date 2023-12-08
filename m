Return-Path: <linux-input+bounces-609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EBE809DCD
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 09:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40F028160C
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 08:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5E510946;
	Fri,  8 Dec 2023 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug3adxAf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E8C3854
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 23:59:45 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d045097b4cso13841945ad.0
        for <linux-input@vger.kernel.org>; Thu, 07 Dec 2023 23:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702022385; x=1702627185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5xqh18YaxLIRiRDwEYdV0oMi2TRc/nVV9ErNJB/2AY=;
        b=Ug3adxAfry/dsDRedr5xsEn5obtaZ+YUJLKbwmCxfE7co1wgTGUPmL5yGxozcYLl7a
         Z6cDka6bBUoRDThuEhuVhdJmKp+UjaGD+a79bu4MZ1RhyWH29rDQiRc6KnzpbFCWok99
         lTI46uljezCaHkEiksluuG77LpZvuTqub+5UYrmsDUUZTYO7++Wno5nGSs+2NOVZbT2A
         rWGpNwSTIIs6HI4cs70x00MOp02Emhj/hSIdGuGR2mn0YUfn8MfPf9Rt01+TSnmEWQnv
         YfQTYMzRcNcXAiIO+6WysU62qoVeI5l3U27ei5avjY9eOprmRme1H6gq7svTFjerkGLL
         h9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702022385; x=1702627185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5xqh18YaxLIRiRDwEYdV0oMi2TRc/nVV9ErNJB/2AY=;
        b=pX2rbmVeoDfncc5awgx5v8bzQSdXJPvx6NGciZz5ut2Pp/s+Kgc5YqU8t8/sMtm/qe
         kWzn5ceJ27TVQ3NYg7C5vjjYuaHEN7GAdch2k/jqwVt7ZtXG/Y7z3MP3HecHT6tLlb3O
         D8nnSDmrjuwPcbYh92aPc8xVy/3nZ35gdLDqNmqppSgOYozMzEBL+d4aT1SzScmePTDu
         UIT5pPp/3nwpSwWAUMZ0/hdEoas4K+ELZ6XQinMOSIshn86lQN3h0H35vWJgBdnnunzW
         ixKAdi0C59RNvcZJ3KbK5xcxBFeNYMOFukN9AlBxMcBLhTpZDegxwdApsQ7EszSuU2mL
         QBuA==
X-Gm-Message-State: AOJu0Yyv+D+fteOs3fLU5ATyMdchZBeUrZw0JaT31HosN8Kimc2E4ulU
	f8AKRtqv8AXBu6uxvmNLAFGIsF4WWT1Oc80c
X-Google-Smtp-Source: AGHT+IFzYKWVDiK78ikuCWkqeT1RR5lvFFbPBZfBDlj/PqpjhklAngJFBEv/lLGrbwl37F7s+ZcTGA==
X-Received: by 2002:a17:902:e80a:b0:1cf:fe32:632f with SMTP id u10-20020a170902e80a00b001cffe32632fmr3971736plg.22.1702022384957;
        Thu, 07 Dec 2023 23:59:44 -0800 (PST)
Received: from localhost.localdomain ([50.47.187.252])
        by smtp.gmail.com with ESMTPSA id jg6-20020a17090326c600b001cc50146b43sm1047689plb.202.2023.12.07.23.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:59:44 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] HID: nintendo: use slots for led patterns
Date: Thu,  7 Dec 2023 23:59:28 -0800
Message-Id: <20231208075928.4293-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the leds pattern would just increment with every controller
connected. This wouldn't take into consideration when controllers are
disconnected. The same controller could be connected and disconnected
with the pattern increasing player count each time.

This changes it so now a bitmask is used defining the free controller
slots for each "player". When a controller is connected, it searches
for the first bit in the bitmask that is available and acquires that
"slot" for it's led pattern.

When a controller is disconnected, it sets the position back to 'free'
allowing for a new controller that is to be connected to obtain that
slot.

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 138f154fecef..cfe43a6b5a46 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -410,7 +410,8 @@ static const char * const joycon_player_led_names[] = {
 	LED_FUNCTION_PLAYER4,
 };
 #define JC_NUM_LEDS		ARRAY_SIZE(joycon_player_led_names)
-#define JC_NUM_LED_PATTERNS 8
+#define JC_NUM_LED_PATTERNS	9
+#define JC_LED_DEF_PATTERN	8
 /* Taken from https://www.nintendo.com/my/support/qa/detail/33822 */
 static const enum led_brightness joycon_player_led_patterns[JC_NUM_LED_PATTERNS][JC_NUM_LEDS] = {
 	{ 1, 0, 0, 0 },
@@ -421,8 +422,13 @@ static const enum led_brightness joycon_player_led_patterns[JC_NUM_LED_PATTERNS]
 	{ 1, 0, 1, 0 },
 	{ 1, 0, 1, 1 },
 	{ 0, 1, 1, 0 },
+	{ 1, 1, 1, 1 }, /* >8 players */
 };
 
+/* Used to set the number of leds on each controller */
+static DEFINE_SPINLOCK(joycon_input_bm_spinlock);
+static int jc_input_free_bm = GENMASK(7, 0);
+
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
@@ -491,6 +497,9 @@ struct joycon_ctlr {
 	unsigned int imu_delta_samples_count;
 	unsigned int imu_delta_samples_sum;
 	unsigned int imu_avg_delta_ms;
+
+	/* led */
+	int player_led_pattern;
 };
 
 /* Helper macros for checking controller type */
@@ -1917,7 +1926,6 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 	return ret;
 }
 
-static DEFINE_SPINLOCK(joycon_input_num_spinlock);
 static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
@@ -1929,17 +1937,24 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	int ret;
 	int i;
 	unsigned long flags;
-	int player_led_pattern;
-	static int input_num;
 
 	/*
-	 * Set the player leds based on controller number
-	 * Because there is no standard concept of "player number", the pattern
-	 * number will simply increase by 1 every time a controller is connected.
+	 * Set the player leds based on a free slot. If there
+	 * are more than 8 controllers. Then load the default
+	 * pattern.
 	 */
-	spin_lock_irqsave(&joycon_input_num_spinlock, flags);
-	player_led_pattern = input_num++ % JC_NUM_LED_PATTERNS;
-	spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
+	spin_lock_irqsave(&joycon_input_bm_spinlock, flags);
+	if (!jc_input_free_bm) {
+		ctlr->player_led_pattern = JC_LED_DEF_PATTERN;
+	} else {
+		ctlr->player_led_pattern = ffs(jc_input_free_bm) - 1;
+		jc_input_free_bm &= ~(BIT(ctlr->player_led_pattern));
+	}
+	spin_unlock_irqrestore(&joycon_input_bm_spinlock, flags);
+	if (ctlr->player_led_pattern == JC_LED_DEF_PATTERN)
+		hid_info(ctlr->hdev, "more than 8 controllers connected, assigning default led pattern");
+	else
+		hid_info(ctlr->hdev, "assigned player %d led pattern", ctlr->player_led_pattern + 1);
 
 	/* configure the player LEDs */
 	for (i = 0; i < JC_NUM_LEDS; i++) {
@@ -1952,13 +1967,13 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 
 		led = &ctlr->leds[i];
 		led->name = name;
-		led->brightness = joycon_player_led_patterns[player_led_pattern][i];
+		led->brightness = joycon_player_led_patterns[ctlr->player_led_pattern][i];
 		led->max_brightness = 1;
 		led->brightness_set_blocking =
 					joycon_player_led_brightness_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
 
-		led_val |= joycon_player_led_patterns[player_led_pattern][i] << i;
+		led_val |= joycon_player_led_patterns[ctlr->player_led_pattern][i] << i;
 	}
 	mutex_lock(&ctlr->output_mutex);
 	ret = joycon_set_player_leds(ctlr, 0, led_val);
@@ -2409,6 +2424,12 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_REMOVED;
 	spin_unlock_irqrestore(&ctlr->lock, flags);
 
+	/* Controller removed, so free the slot */
+	spin_lock_irqsave(&joycon_input_bm_spinlock, flags);
+	if (ctlr->player_led_pattern != JC_LED_DEF_PATTERN)
+		jc_input_free_bm |= BIT(ctlr->player_led_pattern);
+	spin_unlock_irqrestore(&joycon_input_bm_spinlock, flags);
+
 	destroy_workqueue(ctlr->rumble_queue);
 
 	hid_hw_close(hdev);
-- 
2.34.1


