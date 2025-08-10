Return-Path: <linux-input+bounces-13882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C807B1FD07
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 01:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1C90188A709
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 23:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A39218AC4;
	Sun, 10 Aug 2025 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="aiCF13TJ"
X-Original-To: linux-input@vger.kernel.org
Received: from eastern.birch.relay.mailchannels.net (eastern.birch.relay.mailchannels.net [23.83.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D604A19ABDE;
	Sun, 10 Aug 2025 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754867087; cv=pass; b=NsN9y6ieVYTm6HNOJOY0gjINkEMqi2s4LQvu/uviK7Si5Y4UGxj6yO6MV3zcNyvrVb2IGAcaqtrtATotg/oWzyxV5yby2SQqRvr8CLOWEw+LlFfWAm0M6wI/pE0ZgwTsHDSrMTcX+RbWGl/3BaVB33SUQyHGz0dES1NO8LyYoIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754867087; c=relaxed/simple;
	bh=lQeG4MS6DSKdbD32ayqEcmvT3LgEuzf0yteVUsfnuhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFGuCrKPEW31xedMoFpFdXMaq2l5Cn3jZhEW2MWDimuRR1I9nSNISHTcwzmjH1YKKKh9GpRRQOP4Yy8haUTpsVVy3rxCDvgDYsBjo9/lc9hUnuWSg+v+3dOOqd2GJsl4R1auyPS6TSHAZT0XAJHZKzszNN25ujOfFn0SyqaDiSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=aiCF13TJ; arc=pass smtp.client-ip=23.83.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D6AE222826;
	Sun, 10 Aug 2025 22:56:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a238.dreamhost.com (trex-blue-7.trex.outbound.svc.cluster.local [100.96.10.77])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 71C1F22A5F;
	Sun, 10 Aug 2025 22:56:44 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1754866604; a=rsa-sha256;
	cv=none;
	b=odOdNih00ZGe9iI9yPtswydpSL1EkGSvYV9025UaLHL3Ehwg22CCTGm4AoaNB75CiglKeo
	TYsG7j27Vl2JCoZqUHScPPYbXHlwM1F9LseMAUDbdMwXGCFEb33rrix49Rm3xg/RXb1IFL
	sxuts/kTuOkJ6rvu7PP7Q9hcNUt1sRkro/fJ59WcIbVR1Ej37HQZBqZXK1xJzO+Bgqnc4X
	ssXa5olC9P/cv1rzBXBvUaQv7I2zjitRhmcmlgGtDurs6MQrGksLFCgmQhFDyLgFu9uUhB
	uqh8tYXEsr9lX/8W6VJ1F12gRzoaO0r3AuICBHbNIU2cia68inr2x/P1SmaBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1754866604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=LAFmSq5dIbq9UMpunUIzD0guzxD7pZNPQs3v5sp2wFQ=;
	b=av8HAPBWXto2Nwac37IzOc6uA9e4EvRZR/okMDappnNGO9Ae3CecDkY1W7KDijqgkfpIy7
	AR5/dkRffr3GPKDeZeCsrAtyOTlJZmIgY7xKJUGB7h78I63OITEt1DgPh4/7OAqxuFz4IB
	j21c3Bk8OKYINZBzdu2QSfohZ2GgQGWgakB2uqbu3xfDfmqmSzJ5yoyKeUgAqdSf49cGSO
	WaeQKqHTvF9sfIKDWGyhldwVIz03DNU2PtyQgnWitWMZ2EUKE0X40/3FuW6NgpyoxTLRMd
	xhJn2e0kBF9Vq57JlWlg5ArK104r1xsJqMgJhK0qYGzc50N/jX1Y2EPY+F4p9Q==
ARC-Authentication-Results: i=1;
	rspamd-698857ffff-2crhk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Bored-Befitting: 1737dc956e62aff5_1754866604744_492461852
X-MC-Loop-Signature: 1754866604744:3424811984
X-MC-Ingress-Time: 1754866604744
Received: from pdx1-sub0-mail-a238.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.10.77 (trex/7.1.3);
	Sun, 10 Aug 2025 22:56:44 +0000
Received: from exiguous.ewhac.net (unknown [135.180.175.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a238.dreamhost.com (Postfix) with ESMTPSA id 4c0Y6h0khgz4B;
	Sun, 10 Aug 2025 15:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1754866604;
	bh=LAFmSq5dIbq9UMpunUIzD0guzxD7pZNPQs3v5sp2wFQ=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=aiCF13TJQpK1gEMtN3T7GPzGzK746OY9iuZXVrr82bZxlozd1YfbHdyLUerGlrKCf
	 8yGUvpB7vsnvLAwMTKeS/0Dz+3Ax7U0GVkh0XhYDvw7TjEB1t1He8i2012qa8cde0B
	 BNhT2TqurFuIoPuMQv7EOaBKby+DX5ZkC+wHBFVQIj5GnRfL+3suAGXteY+GpJLA2V
	 2ZEfu1nId8brWNOmCxZpaUEqRuL+wTowfkQ9MY9nG2Zfptzrr1JDmx/7di3bjqopK7
	 miSrZkUvXMoBPFmEqiR+mJtba5XKqpLEWepxd5KwgQVCIKwMm6X3cNfBR6MkmSD9CS
	 8yg26DTaPnBGA==
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>,
	"Leo L. Schwab" <ewhac@ewhac.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lg-g15 - Add support for Logitech G13.
Date: Sun, 10 Aug 2025 15:56:10 -0700
Message-ID: <20250810225617.1006272-2-ewhac@ewhac.org>
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

This patch supports input event generation for all keys, the thumbstick,
and exposes all LEDs.

Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
---
 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lg-g15.c | 448 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 428 insertions(+), 21 deletions(-)

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
index f8605656257b..cbbd20bc089c 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -17,6 +17,8 @@
 #include <dt-bindings/leds/common.h>
 
 #include "hid-ids.h"
+#include "linux/input-event-codes.h"
+#include "linux/input.h"
 
 #define LG_G15_TRANSFER_BUF_SIZE	20
 
@@ -26,7 +28,11 @@
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
@@ -45,6 +51,12 @@ enum lg_g15_led_type {
 	LG_G15_LED_MAX
 };
 
+struct g13_input_report {
+	u8 report_id;	// 1
+	u8 joy_x, joy_y;
+	u8 keybits[5];
+};
+
 struct lg_g15_led {
 	union {
 		struct led_classdev cdev;
@@ -63,12 +75,182 @@ struct lg_g15_data {
 	struct mutex mutex;
 	struct work_struct work;
 	struct input_dev *input;
+	struct input_dev *input_js; // joystick device for G13
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
+	/*  RGB backlight.  */
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RGB,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error getting backlight brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	/*  Normalize RGB intensities against highest component.  */
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
+	/*  Macro LEDs.  */
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 5) {
+		hid_err(g15->hdev, "Error getting macro LED brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	for (int i = LG_G15_MACRO_PRESET1;  i < LG_G15_LED_MAX;  ++i)
+		g15->leds[i].brightness = tbuf[1] & (1 << (i - LG_G15_MACRO_PRESET1));
+
+	return 0;
+}
+
+/* Must be called with g15->mutex locked */
+static int lg_g13_kbd_led_write(struct lg_g15_data *g15,
+				struct lg_g15_led *g15_led,
+				enum led_brightness brightness)
+{
+	struct mc_subled const * const subleds = g15_led->mcdev.subled_info;
+	u8 * const tbuf = g15->transfer_buf;
+	int ret;
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
+	if (ret == 5) {
+		g15_led->brightness = brightness;
+		ret = 0;
+	} else {
+		hid_err(g15->hdev, "Error setting backlight brightness: %d\n", ret);
+		ret = (ret < 0) ? ret : -EIO;
+	}
+
+	return ret;
+}
+
+static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
+	struct lg_g15_led *g15_led =
+		container_of(mc, struct lg_g15_led, mcdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	int ret;
+
+	/* Ignore LED off on unregister / keyboard unplug */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return 0;
+
+	mutex_lock(&g15->mutex);
+	ret = lg_g13_kbd_led_write(g15, g15_led, brightness);
+	mutex_unlock(&g15->mutex);
+
+	return ret;
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
+	mutex_lock(&g15->mutex);
+
+	for (i = LG_G15_MACRO_PRESET1;  i < LG_G15_LED_MAX;  ++i) {
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
+	tbuf[2] =
+	tbuf[3] =
+	tbuf[4] = 0;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
+				 tbuf, 5,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret == 5) {
+		g15_led->brightness = brightness;
+		ret = 0;
+	} else {
+		hid_err(g15->hdev, "Error setting LED brightness: %d\n", ret);
+		ret = (ret < 0) ? ret : -EIO;
+	}
+
+	mutex_unlock(&g15->mutex);
+
+	return ret;
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
@@ -390,6 +572,8 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 	int ret;
 
 	switch (g15->model) {
+	case LG_G13:
+		return lg_g13_get_leds_state(g15);
 	case LG_G15:
 	case LG_G15_V2:
 		return lg_g15_update_led_brightness(g15);
@@ -417,6 +601,115 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 
 /******** Input functions ********/
 
+/**
+ * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the bitops macros.
+ *
+ * @ary: Pointer to array of u8s
+ * @b:   Bit index into ary, LSB first.  Not range checked.
+ */
+#define	TEST_BIT(ary, b)	((1 << ((b) & 7)) & (ary)[(b) >> 3])
+
+/*  Table mapping keybits[] bit positions to event codes.  */
+/*  Note: Indices are discontinuous to aid readability.  */
+static const u16 g13_keys_for_bits[] = {
+	/*  Main keypad - keys G1 - G22  */
+	[0]	= KEY_MACRO1,
+	[1]	= KEY_MACRO2,
+	[2]	= KEY_MACRO3,
+	[3]	= KEY_MACRO4,
+	[4]	= KEY_MACRO5,
+	[5]	= KEY_MACRO6,
+	[6]	= KEY_MACRO7,
+	[7]	= KEY_MACRO8,
+	[8]	= KEY_MACRO9,
+	[9]	= KEY_MACRO10,
+	[10]	= KEY_MACRO11,
+	[11]	= KEY_MACRO12,
+	[12]	= KEY_MACRO13,
+	[13]	= KEY_MACRO14,
+	[14]	= KEY_MACRO15,
+	[15]	= KEY_MACRO16,
+	[16]	= KEY_MACRO17,
+	[17]	= KEY_MACRO18,
+	[18]	= KEY_MACRO19,
+	[19]	= KEY_MACRO20,
+	[20]	= KEY_MACRO21,
+	[21]	= KEY_MACRO22,
+
+	/*  LCD menu buttons.  */
+	[24]	= KEY_KBD_LCD_MENU5,	// "Next page" button
+	[25]	= KEY_KBD_LCD_MENU1,	// Left-most
+	[26]	= KEY_KBD_LCD_MENU2,
+	[27]	= KEY_KBD_LCD_MENU3,
+	[28]	= KEY_KBD_LCD_MENU4,	// Right-most
+
+	/*  Macro preset and record buttons; have red LEDs under them.  */
+	[29]	= KEY_MACRO_PRESET1,
+	[30]	= KEY_MACRO_PRESET2,
+	[31]	= KEY_MACRO_PRESET3,
+	[32]	= KEY_MACRO_RECORD_START,
+
+	/*  33-35 handled by joystick device.  */
+
+	/*  Backlight toggle.  */
+	[37]	= KEY_LIGHTS_TOGGLE,
+};
+
+static const u16 g13_keys_for_bits_js[] = {
+	/*  Joystick buttons  */
+	/*  These keybits are at bit indices 33, 34, and 35.  */
+	BTN_BASE,	// Left side
+	BTN_BASE2,	// Bottom side
+	BTN_THUMB,	// Stick depress
+};
+
+static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
+{
+	struct g13_input_report const * const rep = (struct g13_input_report *) data;
+	int i, val;
+	bool hw_brightness_changed;
+
+	/*
+	 * Main macropad and menu keys.
+	 * Emit key events defined for each bit position.
+	 */
+	for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits);  ++i) {
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
+	for (i = 0;  i < ARRAY_SIZE(g13_keys_for_bits_js);  ++i) {
+		if (g13_keys_for_bits_js[i]) {
+			val = TEST_BIT(rep->keybits, i + 33);
+			input_report_key(g15->input_js, g13_keys_for_bits_js[i], val);
+		}
+	}
+	input_report_abs(g15->input_js, ABS_X, rep->joy_x);
+	input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
+	input_sync(g15->input_js);
+
+	/*
+	 * Bit 23 of keybits[] reports the current backlight on/off state.  If
+	 * it has changed from the last cached value, apply an update.
+	 */
+	hw_brightness_changed =
+		(!!TEST_BIT(rep->keybits, 23)) ^ (g15->leds[0].cdev.brightness_hw_changed > 0);
+	if (hw_brightness_changed) {
+		led_classdev_notify_brightness_hw_changed(
+			&g15->leds[0].cdev,
+			TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
+	}
+
+	return 0;
+}
+
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
 static void lg_g15_handle_lcd_menu_keys(struct lg_g15_data *g15, u8 *data)
 {
@@ -572,6 +865,10 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 		return 0;
 
 	switch (g15->model) {
+	case LG_G13:
+		if (data[0] == 0x01  &&  size == sizeof(struct g13_input_report))
+			return lg_g13_event(g15, data);
+		break;
 	case LG_G15:
 		if (data[0] == 0x02 && size == 9)
 			return lg_g15_event(g15, data);
@@ -616,13 +913,22 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
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
@@ -632,20 +938,20 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
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
@@ -656,6 +962,23 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 	g15->leds[i].cdev.name = name;
 
 	switch (g15->model) {
+	case LG_G13:
+		if (i < LG_G15_BRIGHTNESS_MAX) {
+			/*  RGB backlight.  */
+			lg_g15_setup_led_rgb(g15, i);
+			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
+									&g15->leds[i].mcdev,
+									NULL);
+		} else {
+			/*  Macro keys  */
+			g15->leds[i].cdev.brightness_set_blocking = lg_g13_mkey_led_set;
+			g15->leds[i].cdev.brightness_get          = lg_g13_mkey_led_get;
+			g15->leds[i].cdev.max_brightness          = 1;
+
+			ret = devm_led_classdev_register(&g15->hdev->dev,
+							 &g15->leds[i].cdev);
+		}
+		break;
 	case LG_G15:
 	case LG_G15_V2:
 		g15->leds[i].cdev.brightness_get = lg_g15_led_get;
@@ -702,27 +1025,60 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 }
 
 /* Common input device init code shared between keyboards and Z-10 speaker handling */
-static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
-				  const char *name)
+static void lg_g15_init_input_dev_core(struct hid_device *hdev,
+				       struct input_dev *input,
+				       char const *name)
 {
-	int i;
-
-	input->name = name;
-	input->phys = hdev->phys;
-	input->uniq = hdev->uniq;
+	input->name       = name;
+	input->phys       = hdev->phys;
+	input->uniq       = hdev->uniq;
 	input->id.bustype = hdev->bus;
 	input->id.vendor  = hdev->vendor;
 	input->id.product = hdev->product;
 	input->id.version = hdev->version;
 	input->dev.parent = &hdev->dev;
-	input->open = lg_g15_input_open;
-	input->close = lg_g15_input_close;
+	input->open       = lg_g15_input_open;
+	input->close      = lg_g15_input_close;
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
+	/*  Macropad.  */
+	lg_g15_init_input_dev_core(hdev, input, name);
+	for (int i = 0;  i < ARRAY_SIZE(g13_keys_for_bits);  ++i) {
+		if (g13_keys_for_bits[i]) {
+			input_set_capability(input, EV_KEY, g13_keys_for_bits[i]);
+		}
+	}
+
+	/*  OBTW, we're a joystick, too...  */
+	lg_g15_init_input_dev_core(hdev, input_js, name_js);
+	for (int i = 0;  i < ARRAY_SIZE(g13_keys_for_bits_js);  ++i) {
+		if (g13_keys_for_bits_js[i]) {
+			input_set_capability(input_js, EV_KEY, g13_keys_for_bits_js[i]);
+		}
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
@@ -739,7 +1095,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	unsigned int connect_mask = 0;
 	bool has_ff000000 = false;
 	struct lg_g15_data *g15;
-	struct input_dev *input;
+	struct input_dev *input, *input_js;
 	struct hid_report *rep;
 	int ret, i, gkeys = 0;
 
@@ -778,6 +1134,21 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_set_drvdata(hdev, (void *)g15);
 
 	switch (g15->model) {
+	case LG_G13:
+		/*
+		 * Some usermode libraries tend to ignore devices that don't
+		 * "look like" a joystick.  Create additional input device
+		 * dedicated as joystick.
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
@@ -859,6 +1230,34 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 			goto error_hw_stop;
 
 		return 0; /* All done */
+	} else if (g15->model == LG_G13) {
+		static char const * const g13_led_names[] = {
+			/*  Backlight is shared between LCD and keys.  */
+			"g13:rgb:kbd_backlight",
+			NULL,	// Keep in sync with led_type enum
+			"g13:red:macro_preset_1",
+			"g13:red:macro_preset_2",
+			"g13:red:macro_preset_3",
+			"g13:red:macro_record",
+		};
+		lg_g13_init_input_dev(hdev,
+				      input,    "Logitech G13 Gaming Keypad",
+				      input_js, "Logitech G13 Thumbstick");
+		ret = input_register_device(input);
+		if (ret)
+			goto error_hw_stop;
+		ret = input_register_device(input_js);
+		if (ret)
+			goto error_hw_stop;
+
+		for (i = 0;  i < ARRAY_SIZE(g13_led_names);  ++i) {
+			if (g13_led_names[i]) {
+				ret = lg_g15_register_led(g15, i, g13_led_names[i]);
+				if (ret)
+					goto error_hw_stop;
+			}
+		}
+		return 0;
 	}
 
 	/* Setup and register input device */
@@ -903,6 +1302,13 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
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


