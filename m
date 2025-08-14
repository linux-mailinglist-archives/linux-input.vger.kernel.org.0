Return-Path: <linux-input+bounces-14036-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C3B270DA
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 23:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA60F7A76F9
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 21:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C3626D4C4;
	Thu, 14 Aug 2025 21:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="SgxNu5eO"
X-Original-To: linux-input@vger.kernel.org
Received: from heron.birch.relay.mailchannels.net (heron.birch.relay.mailchannels.net [23.83.209.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252211F1302;
	Thu, 14 Aug 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755207066; cv=pass; b=YwX6B/o313atO261twuQlYP5LPbejH6LVyk0flhqVsuLRs43C0YH7GdVdqRKETPHdEnvXR/Fop31NKLpAoR6Q4rltTk0rE4ndWE94JNJqq2fapFtj0C6Ah176xO7pBqCjoZiaL/CLUXtOOnmLz4k6JpCBtn93cyjEXpvMD1QjnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755207066; c=relaxed/simple;
	bh=oBnzHw1KSIpluyzaqNTAhs39RVkq36EP37ww60JV+x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhgGR2H9ncGUmWDuvCEAPqAdSFlp+gNSnuRuqoW2fauF9kKNgWkubhkjtpzSeOhUlUjGnrGNEL3Bki+C5u3ciRwa76SYZk4PbkW8gzApYMINLmYeXfuXVdWFk6k5AQqBWIy0NgTu7Qj+g7YoRFz8RfMTihx+g9aefgWy4QVYncM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=SgxNu5eO; arc=pass smtp.client-ip=23.83.209.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 181FE8A48EB;
	Thu, 14 Aug 2025 21:30:55 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (trex-blue-3.trex.outbound.svc.cluster.local [100.96.37.13])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 976D28A6209;
	Thu, 14 Aug 2025 21:30:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755207054; a=rsa-sha256;
	cv=none;
	b=H71ci0FpaQVOTTFlIWTVdAqlaO8IJfMhlWciGgl9ChSSBqyV/Gck6m7hGj4j2XLwJ/BAE1
	ZVSE3eVW0SfDDjllBg+0y1b1y1l+m7XLwjjkdDYRiAq9WDDvBlcFppepWUXviEBLgsir6W
	RAroWmgGBkmYJp69tqgMOs/vuY/YwAIsQA3duTD8vaZRqUcOZrMEj1/Sy/Cwg7J14fKN36
	OQOZVcO3Dik/L2Qs1TGtGDX3f0Io4LgvMhsikFNRQL6kGeUVm/umpljn8xCBD4GP6fjgpy
	3f9LGFBqfucfQQyg0lcCK4bgcg7IxLYoW4iFxD6tzTbY/iW9tskLB1Q5YNXVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755207054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=X7I4QwA41/Em9uWU9iix0cLIgOSe+nGhTKLBrCIpOkU=;
	b=fZm7s8vfJXqJFbib+5GxVITfcvSGKNajJNe4+AX8MnDjWfum8oBHS/bWB5N+SSCTSRL4lQ
	2UC/yyA+B7LQuspXR/dN1h4c4mVlkO8bH6S+ip5zankb/V2u04iFFiIEOsqQAKX5YBtdjE
	EFvAO7bJ+bpJSi/FJbGPfIXRnMNaBvlJqVXagCVc974v8ksy8k5ALOPQsuhUJbCQMDzZBZ
	Wubrr2kivF5TlBJI5OLSiu6fLUaabtYELbVCFDxx4l93sQMxQ0l2b6OKIa0cGYaaGd8/8H
	w/rT9Ln5MNp8SzbS1y2yBmehHU7TW00YMDKPbWVZ6G4manlqK+HL2PmPNWHclA==
ARC-Authentication-Results: i=1;
	rspamd-865b9ccc6c-pzxc5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Trade-Suffer: 7a70a9fe6cfcb0d9_1755207054909_2762201824
X-MC-Loop-Signature: 1755207054909:2424842791
X-MC-Ingress-Time: 1755207054909
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.37.13 (trex/7.1.3);
	Thu, 14 Aug 2025 21:30:54 +0000
Received: from exiguous.ewhac.net (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4c2z1p1MmNz49;
	Thu, 14 Aug 2025 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1755207054;
	bh=X7I4QwA41/Em9uWU9iix0cLIgOSe+nGhTKLBrCIpOkU=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=SgxNu5eOp+b0zWduMxs2vsBI8zf37olUa+tkuc/dNli72rr+OmxNNK4MgscwhHLbO
	 qKBbcl9LKVJzWE7pfKyJuhlqsCuALUKtloBx1zK79oNCfsZmtvFZftjBKAUI33H0pV
	 JkT1FMX8qqkn7/Lyrg49jlPvUDfVBmlh/7dFW930Mv8/SB8l8shKPyqOFe2SW8/MFM
	 d9iOzwgATHq2ol5TJthYhT6ii0V+JNpVdCg9RyNOb1UrnxDeXcMgEymDguNSd4xy9h
	 DenLKsYFryaUC9g5tzfVRW3l3l9V90OdTWdI42c8iVraNmRgOEeisy9hJW7YYmrJH4
	 2TDjPiWXn/Eyw==
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>,
	"Leo L. Schwab" <ewhac@ewhac.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Date: Thu, 14 Aug 2025 14:26:32 -0700
Message-ID: <20250814212641.197573-2-ewhac@ewhac.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Logitech G13 is a gaming keypad with general-purpose macro keys,
four LED-backlit macro preset keys, five "menu" keys, backlight toggle
key, an analog thumbstick, RGB LED backlight, and a monochrome LCD
display.

Support input event generation for all keys and the thumbstick, and
expose all LEDs.

Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
---
 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lg-g15.c | 428 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 413 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 33cc5820f2be..7ed1e402b80a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -870,6 +870,7 @@
 #define USB_DEVICE_ID_LOGITECH_DUAL_ACTION	0xc216
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
+#define USB_DEVICE_ID_LOGITECH_G13		0xc21c
 #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
 #define USB_DEVICE_ID_LOGITECH_G11		0xc225
 #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index f8605656257b..6e1d79abfb23 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -26,7 +26,11 @@
 #define LG_G510_FEATURE_BACKLIGHT_RGB	0x05
 #define LG_G510_FEATURE_POWER_ON_RGB	0x06
 
+#define LG_G13_FEATURE_M_KEYS_LEDS	0x05
+#define LG_G13_FEATURE_BACKLIGHT_RGB	0x07
+
 enum lg_g15_model {
+	LG_G13,
 	LG_G15,
 	LG_G15_V2,
 	LG_G510,
@@ -45,6 +49,12 @@ enum lg_g15_led_type {
 	LG_G15_LED_MAX
 };
 
+struct g13_input_report {
+	u8 report_id;	/* Report ID is always set to 1. */
+	u8 joy_x, joy_y;
+	u8 keybits[5];
+};
+
 struct lg_g15_led {
 	union {
 		struct led_classdev cdev;
@@ -63,12 +73,172 @@ struct lg_g15_data {
 	struct mutex mutex;
 	struct work_struct work;
 	struct input_dev *input;
+	struct input_dev *input_js; /* Separate joystick device for G13. */
 	struct hid_device *hdev;
 	enum lg_g15_model model;
 	struct lg_g15_led leds[LG_G15_LED_MAX];
 	bool game_mode_enabled;
 };
 
+/********* G13 LED functions ***********/
+/*
+ * G13 retains no state across power cycles, and always powers up with the backlight on,
+ * color #5AFF6E, all macro key LEDs off.
+ */
+static int lg_g13_get_leds_state(struct lg_g15_data *g15)
+{
+	u8 * const tbuf = g15->transfer_buf;
+	int ret, high;
+
+	/* RGB backlight. */
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RGB,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error getting backlight brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	/* Normalize RGB intensities against the highest component. */
+	high = max3(tbuf[1], tbuf[2], tbuf[3]);
+	if (high) {
+		g15->leds[LG_G15_KBD_BRIGHTNESS].red =
+			DIV_ROUND_CLOSEST(tbuf[1] * 255, high);
+		g15->leds[LG_G15_KBD_BRIGHTNESS].green =
+			DIV_ROUND_CLOSEST(tbuf[2] * 255, high);
+		g15->leds[LG_G15_KBD_BRIGHTNESS].blue =
+			DIV_ROUND_CLOSEST(tbuf[3] * 255, high);
+		g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = high;
+	} else {
+		g15->leds[LG_G15_KBD_BRIGHTNESS].red        = 255;
+		g15->leds[LG_G15_KBD_BRIGHTNESS].green      = 255;
+		g15->leds[LG_G15_KBD_BRIGHTNESS].blue       = 255;
+		g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = 0;
+	}
+
+	/* Macro LEDs. */
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error getting macro LED brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	for (int i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i)
+		g15->leds[i].brightness = tbuf[1] & (1 << (i - LG_G15_MACRO_PRESET1));
+
+	return 0;
+}
+
+static int lg_g13_kbd_led_write(struct lg_g15_data *g15,
+				struct lg_g15_led *g15_led,
+				enum led_brightness brightness)
+{
+	struct mc_subled const * const subleds = g15_led->mcdev.subled_info;
+	u8 * const tbuf = g15->transfer_buf;
+	int ret;
+
+	guard(mutex)(&g15->mutex);
+
+	led_mc_calc_color_components(&g15_led->mcdev, brightness);
+
+	tbuf[0] = 5;
+	tbuf[1] = subleds[0].brightness;
+	tbuf[2] = subleds[1].brightness;
+	tbuf[3] = subleds[2].brightness;
+	tbuf[4] = 0;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RGB,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error setting backlight brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	g15_led->brightness = brightness;
+	return 0;
+}
+
+static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
+	struct lg_g15_led *g15_led =
+		container_of(mc, struct lg_g15_led, mcdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+
+	/* Ignore LED off on unregister / keyboard unplug */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return 0;
+
+	return lg_g13_kbd_led_write(g15, g15_led, brightness);
+}
+
+static enum led_brightness lg_g13_kbd_led_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc const * const mc = lcdev_to_mccdev(led_cdev);
+	struct lg_g15_led const *g15_led =
+		container_of(mc, struct lg_g15_led, mcdev);
+
+	return g15_led->brightness;
+}
+
+static int lg_g13_mkey_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	int i, ret;
+	u8 * const tbuf = g15->transfer_buf;
+	u8 val, mask = 0;
+
+	/* Ignore LED off on unregister / keyboard unplug */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return 0;
+
+	guard(mutex)(&g15->mutex);
+
+	for (i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i) {
+		if (i == g15_led->led)
+			val = brightness;
+		else
+			val = g15->leds[i].brightness;
+
+		if (val)
+			mask |= 1 << (i - LG_G15_MACRO_PRESET1);
+	}
+
+	tbuf[0] = 5;
+	tbuf[1] = mask;
+	tbuf[2] = 0;
+	tbuf[3] = 0;
+	tbuf[4] = 0;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error setting LED brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	g15_led->brightness = brightness;
+	return 0;
+}
+
+static enum led_brightness lg_g13_mkey_led_get(struct led_classdev *led_cdev)
+{
+	/*
+	 * G13 doesn't change macro key LEDs behind our back, so they're
+	 * whatever we last set them to.
+	 */
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+
+	return g15_led->brightness;
+}
+
 /******** G15 and G15 v2 LED functions ********/
 
 static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
@@ -390,6 +560,8 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 	int ret;
 
 	switch (g15->model) {
+	case LG_G13:
+		return lg_g13_get_leds_state(g15);
 	case LG_G15:
 	case LG_G15_V2:
 		return lg_g15_update_led_brightness(g15);
@@ -417,6 +589,116 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 
 /******** Input functions ********/
 
+/**
+ * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the bitops macros.
+ *
+ * @ary: Pointer to array of u8s
+ * @b: Bit index into ary, LSB first.  Not range checked.
+ */
+#define	TEST_BIT(ary, b)	((1 << ((b) & 7)) & (ary)[(b) >> 3])
+
+/* Table mapping keybits[] bit positions to event codes. */
+/* Note: Indices are discontinuous to aid readability. */
+static const u16 g13_keys_for_bits[] = {
+	/* Main keypad - keys G1 - G22 */
+	[0] = KEY_MACRO1,
+	[1] = KEY_MACRO2,
+	[2] = KEY_MACRO3,
+	[3] = KEY_MACRO4,
+	[4] = KEY_MACRO5,
+	[5] = KEY_MACRO6,
+	[6] = KEY_MACRO7,
+	[7] = KEY_MACRO8,
+	[8] = KEY_MACRO9,
+	[9] = KEY_MACRO10,
+	[10] = KEY_MACRO11,
+	[11] = KEY_MACRO12,
+	[12] = KEY_MACRO13,
+	[13] = KEY_MACRO14,
+	[14] = KEY_MACRO15,
+	[15] = KEY_MACRO16,
+	[16] = KEY_MACRO17,
+	[17] = KEY_MACRO18,
+	[18] = KEY_MACRO19,
+	[19] = KEY_MACRO20,
+	[20] = KEY_MACRO21,
+	[21] = KEY_MACRO22,
+
+	/* LCD menu buttons. */
+	[24] = KEY_KBD_LCD_MENU5,	/* "Next page" button */
+	[25] = KEY_KBD_LCD_MENU1,	/* Left-most */
+	[26] = KEY_KBD_LCD_MENU2,
+	[27] = KEY_KBD_LCD_MENU3,
+	[28] = KEY_KBD_LCD_MENU4,	/* Right-most */
+
+	/* Macro preset and record buttons; have red LEDs under them. */
+	[29] = KEY_MACRO_PRESET1,
+	[30] = KEY_MACRO_PRESET2,
+	[31] = KEY_MACRO_PRESET3,
+	[32] = KEY_MACRO_RECORD_START,
+
+	/* 33-35 handled by joystick device. */
+
+	/* Backlight toggle. */
+	[37] = KEY_LIGHTS_TOGGLE,
+};
+
+static const u16 g13_keys_for_bits_js[] = {
+	/* Joystick buttons */
+	/* These keybits are at bit indices 33, 34, and 35. */
+	BTN_BASE,	/* Left side */
+	BTN_BASE2,	/* Bottom side */
+	BTN_THUMB,	/* Stick depress */
+};
+
+static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
+{
+	struct g13_input_report const * const rep = (struct g13_input_report *) data;
+	int i, val;
+
+	/*
+	 * Main macropad and menu keys.
+	 * Emit key events defined for each bit position.
+	 */
+	for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
+		if (g13_keys_for_bits[i]) {
+			val = TEST_BIT(rep->keybits, i);
+			input_report_key(g15->input, g13_keys_for_bits[i], val);
+		}
+	}
+	input_sync(g15->input);
+
+	/*
+	 * Joystick.
+	 * Emit button and deflection events.
+	 */
+	for (i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
+		if (g13_keys_for_bits_js[i]) {
+			val = TEST_BIT(rep->keybits, i + 33);
+			input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
+		}
+	}
+	input_report_abs(g15->input_js, ABS_X, rep->joy_x);
+	input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
+	input_sync(g15->input_js);
+
+	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
+		/*
+		 * Bit 23 of keybits[] reports the current backlight on/off
+		 * state.  If it has changed from the last cached value, apply
+		 * an update.
+		 */
+		bool hw_brightness_changed = (!!TEST_BIT(rep->keybits, 23))
+					   ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
+		if (hw_brightness_changed)
+			led_classdev_notify_brightness_hw_changed(
+				&g15->leds[0].cdev,
+				TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
+	}
+
+	return 0;
+}
+
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
 static void lg_g15_handle_lcd_menu_keys(struct lg_g15_data *g15, u8 *data)
 {
@@ -572,6 +854,10 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 		return 0;
 
 	switch (g15->model) {
+	case LG_G13:
+		if (data[0] == 0x01 && size == sizeof(struct g13_input_report))
+			return lg_g13_event(g15, data);
+		break;
 	case LG_G15:
 		if (data[0] == 0x02 && size == 9)
 			return lg_g15_event(g15, data);
@@ -616,13 +902,22 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
 {
 	int i;
 	struct mc_subled *subled_info;
-
-	g15->leds[index].mcdev.led_cdev.brightness_set_blocking =
-		lg_g510_kbd_led_set;
-	g15->leds[index].mcdev.led_cdev.brightness_get =
-		lg_g510_kbd_led_get;
-	g15->leds[index].mcdev.led_cdev.max_brightness = 255;
-	g15->leds[index].mcdev.num_colors = 3;
+	struct lg_g15_led * const gled = &g15->leds[index];
+
+	if (g15->model == LG_G13) {
+		gled->mcdev.led_cdev.brightness_set_blocking =
+			lg_g13_kbd_led_set;
+		gled->mcdev.led_cdev.brightness_get =
+			lg_g13_kbd_led_get;
+		gled->mcdev.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
+	} else {
+		gled->mcdev.led_cdev.brightness_set_blocking =
+			lg_g510_kbd_led_set;
+		gled->mcdev.led_cdev.brightness_get =
+			lg_g510_kbd_led_get;
+	}
+	gled->mcdev.led_cdev.max_brightness = 255;
+	gled->mcdev.num_colors = 3;
 
 	subled_info = devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_info), GFP_KERNEL);
 	if (!subled_info)
@@ -632,20 +927,20 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
 		switch (i + 1) {
 		case LED_COLOR_ID_RED:
 			subled_info[i].color_index = LED_COLOR_ID_RED;
-			subled_info[i].intensity = g15->leds[index].red;
+			subled_info[i].intensity = gled->red;
 			break;
 		case LED_COLOR_ID_GREEN:
 			subled_info[i].color_index = LED_COLOR_ID_GREEN;
-			subled_info[i].intensity = g15->leds[index].green;
+			subled_info[i].intensity = gled->green;
 			break;
 		case LED_COLOR_ID_BLUE:
 			subled_info[i].color_index = LED_COLOR_ID_BLUE;
-			subled_info[i].intensity = g15->leds[index].blue;
+			subled_info[i].intensity = gled->blue;
 			break;
 		}
 		subled_info[i].channel = i;
 	}
-	g15->leds[index].mcdev.subled_info = subled_info;
+	gled->mcdev.subled_info = subled_info;
 }
 
 static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
@@ -656,6 +951,23 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 	g15->leds[i].cdev.name = name;
 
 	switch (g15->model) {
+	case LG_G13:
+		if (i < LG_G15_BRIGHTNESS_MAX) {
+			/* RGB backlight. */
+			lg_g15_setup_led_rgb(g15, i);
+			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
+									&g15->leds[i].mcdev,
+									NULL);
+		} else {
+			/* Macro keys */
+			g15->leds[i].cdev.brightness_set_blocking = lg_g13_mkey_led_set;
+			g15->leds[i].cdev.brightness_get = lg_g13_mkey_led_get;
+			g15->leds[i].cdev.max_brightness = 1;
+
+			ret = devm_led_classdev_register(&g15->hdev->dev,
+							 &g15->leds[i].cdev);
+		}
+		break;
 	case LG_G15:
 	case LG_G15_V2:
 		g15->leds[i].cdev.brightness_get = lg_g15_led_get;
@@ -702,11 +1014,9 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 }
 
 /* Common input device init code shared between keyboards and Z-10 speaker handling */
-static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
-				  const char *name)
+static void lg_g15_init_input_dev_core(struct hid_device *hdev, struct input_dev *input,
+				       char const *name)
 {
-	int i;
-
 	input->name = name;
 	input->phys = hdev->phys;
 	input->uniq = hdev->uniq;
@@ -717,12 +1027,44 @@ static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *inp
 	input->dev.parent = &hdev->dev;
 	input->open = lg_g15_input_open;
 	input->close = lg_g15_input_close;
+}
+
+static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
+				  const char *name)
+{
+	int i;
+
+	lg_g15_init_input_dev_core(hdev, input, name);
 
 	/* Keys below the LCD, intended for controlling a menu on the LCD */
 	for (i = 0; i < 5; i++)
 		input_set_capability(input, EV_KEY, KEY_KBD_LCD_MENU1 + i);
 }
 
+static void lg_g13_init_input_dev(struct hid_device *hdev,
+				  struct input_dev *input, const char *name,
+				  struct input_dev *input_js, const char *name_js)
+{
+	/* Macropad. */
+	lg_g15_init_input_dev_core(hdev, input, name);
+	for (int i = 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
+		if (g13_keys_for_bits[i])
+			input_set_capability(input, EV_KEY, g13_keys_for_bits[i]);
+	}
+
+	/* OBTW, we're a joystick, too... */
+	lg_g15_init_input_dev_core(hdev, input_js, name_js);
+	for (int i = 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
+		if (g13_keys_for_bits_js[i])
+			input_set_capability(input_js, EV_KEY, g13_keys_for_bits_js[i]);
+	}
+
+	input_set_capability(input_js, EV_ABS, ABS_X);
+	input_set_abs_params(input_js, ABS_X, 0, 255, 0, 0);
+	input_set_capability(input_js, EV_ABS, ABS_Y);
+	input_set_abs_params(input_js, ABS_Y, 0, 255, 0, 0);
+}
+
 static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	static const char * const led_names[] = {
@@ -739,7 +1081,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	unsigned int connect_mask = 0;
 	bool has_ff000000 = false;
 	struct lg_g15_data *g15;
-	struct input_dev *input;
+	struct input_dev *input, *input_js;
 	struct hid_report *rep;
 	int ret, i, gkeys = 0;
 
@@ -778,6 +1120,25 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_set_drvdata(hdev, (void *)g15);
 
 	switch (g15->model) {
+	case LG_G13:
+		/*
+		 * The G13 has an analog thumbstick with nearby buttons.  Some
+		 * libraries and applications are known to ignore devices that
+		 * don't "look like" a joystick, and a device with two ABS axes
+		 * and 25+ macro keys would confuse them.
+		 *
+		 * Create an additional input device dedicated to appear as a
+		 * simplified joystick (two ABS axes, three BTN buttons).
+		 */
+		input_js = devm_input_allocate_device(&hdev->dev);
+		if (!input_js)
+			return -ENOMEM;
+		g15->input_js = input_js;
+		input_set_drvdata(input_js, hdev);
+
+		connect_mask = HID_CONNECT_HIDRAW;
+		gkeys = 25;
+		break;
 	case LG_G15:
 		INIT_WORK(&g15->work, lg_g15_leds_changed_work);
 		/*
@@ -859,6 +1220,34 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			goto error_hw_stop;
 
 		return 0; /* All done */
+	} else if (g15->model == LG_G13) {
+		static char const * const g13_led_names[] = {
+			/* Backlight is shared between LCD and keys. */
+			"g13:rgb:kbd_backlight",
+			NULL,	/* Keep in sync with led_type enum */
+			"g13:red:macro_preset_1",
+			"g13:red:macro_preset_2",
+			"g13:red:macro_preset_3",
+			"g13:red:macro_record",
+		};
+		lg_g13_init_input_dev(hdev,
+				      input, "Logitech G13 Gaming Keypad",
+				      input_js, "Logitech G13 Thumbstick");
+		ret = input_register_device(input);
+		if (ret)
+			goto error_hw_stop;
+		ret = input_register_device(input_js);
+		if (ret)
+			goto error_hw_stop;
+
+		for (i = 0; i < ARRAY_SIZE(g13_led_names); ++i) {
+			if (g13_led_names[i]) {
+				ret = lg_g15_register_led(g15, i, g13_led_names[i]);
+				if (ret)
+					goto error_hw_stop;
+			}
+		}
+		return 0;
 	}
 
 	/* Setup and register input device */
@@ -903,6 +1292,13 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 }
 
 static const struct hid_device_id lg_g15_devices[] = {
+	/*
+	 * The G13 is a macropad-only device with an LCD, LED backlighing,
+	 * and joystick.
+	 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_G13),
+		.driver_data = LG_G13 },
 	/* The G11 is a G15 without the LCD, treat it as a G15 */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_G11),
-- 
2.50.1


