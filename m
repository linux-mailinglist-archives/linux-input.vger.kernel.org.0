Return-Path: <linux-input+bounces-15193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606DBB1CB1
	for <lists+linux-input@lfdr.de>; Wed, 01 Oct 2025 23:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEB2F4A4183
	for <lists+linux-input@lfdr.de>; Wed,  1 Oct 2025 21:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2A530F935;
	Wed,  1 Oct 2025 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUD3aWr4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491502EA493
	for <linux-input@vger.kernel.org>; Wed,  1 Oct 2025 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759353585; cv=none; b=n7muCLKXl2dHjWvdRARODrXghIlF4yy7b+VzUy3yMZFKzKX3YiHiH7XnggrRmHNGkIlLkMc0bC9fFrg+Q5UokN8eeaz3yV2SGSjoyKgCeGHRQI5ZR4doW6eVZmWU6gBSS6gE62e24efdofPsHDkh2ctFnETdu0soDaUknJErHnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759353585; c=relaxed/simple;
	bh=Cb85tSYYOte444/yd9BxfWzZRGzSiI8VhbDuZ2mOgas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUEXXA3Gy38/x9iB4f7hxMQ0gyThKFTvYEsj8r1R0ilJBs9FMj97TxZtarge93/O+hfZNrdFy/F1mnmZoxXgEtwjhhc+80CgL0ZdtRNZjQht+pmENp8sUE0cvBUDsJMMOu14xGewgskYklNyPyggqPLCMKFXKoE3MWiSzYrfkjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUD3aWr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D7C4CEF1;
	Wed,  1 Oct 2025 21:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759353584;
	bh=Cb85tSYYOte444/yd9BxfWzZRGzSiI8VhbDuZ2mOgas=;
	h=From:To:Cc:Subject:Date:From;
	b=LUD3aWr4+JP/yqkFxmPclL9jQRgzoovqMVf9EhaXOYq4cXRl/WHTgx5+drnehDLUp
	 yJwdO2vs1QBu0PdISt1DTze8577xzaPE4lRR83jBgZcqmDkQwFHgAilGQnVOY9lFMM
	 KLYoMb8y0Q1EwcYX5UlRlePTCASDdP3nuASCO1Zw5cLzw6ZCZm5toF06QyvW/lR5BE
	 DoZGdidQUvwXlD4yJGWqKkPgOKXt+iGeToj+rtrOJuJr0Hxvw8ukgvIp/Lqoedn8/3
	 yLcYH98nfCvw//dLFH/eoMHMhg6CMrO5Oe+SLUE7s2PXeUbQ53g07zEt60eJP7yVda
	 52Fp3+lf94eOg==
From: Hans de Goede <hansg@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: hid-lg-g15: Add hw_brightness_changed support for the G510 keyboard
Date: Wed,  1 Oct 2025 23:19:41 +0200
Message-ID: <20251001211941.4415-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hw_brightness_changed support for the G510 keyboard, so that e.g.
GNOME will show an OSD notification when toggling the backlight on/off
with the button the keyboard.

Note that it is not possible to turn the backlight back on by writing
/sys/class/leds/.../brightness it can only be turned on by pressing
the button on the keyboard. To reflect this /sys/class/leds/.../brightness
will always report the last brightness value independent of the on/off
toggle built into the keyboard.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
This patch applies on top of "HID: lg-g15 - Add support for Logitech G13."
---
 drivers/hid/hid-lg-g15.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 7b8df2d5b57f..1a88bc44ada4 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -26,6 +26,9 @@
 #define LG_G510_FEATURE_BACKLIGHT_RGB	0x05
 #define LG_G510_FEATURE_POWER_ON_RGB	0x06
 
+#define LG_G510_INPUT_MACRO_KEYS	0x03
+#define LG_G510_INPUT_KBD_BACKLIGHT	0x04
+
 #define LG_G13_INPUT_REPORT		0x01
 #define LG_G13_FEATURE_M_KEYS_LEDS	0x05
 #define LG_G13_FEATURE_BACKLIGHT_RGB	0x07
@@ -423,6 +426,20 @@ static int lg_g510_get_initial_led_brightness(struct lg_g15_data *g15, int i)
 		g15->leds[i].brightness = 0;
 	}
 
+	if (i)
+		return 0;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G510_INPUT_KBD_BACKLIGHT,
+				 g15->transfer_buf, 2,
+				 HID_INPUT_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 2) {
+		/* This can happen when a KVM switch is used, so only warn. */
+		hid_warn(g15->hdev, "Error getting backlight state: %d\n", ret);
+		return 0;
+	}
+
+	g15->backlight_disabled = g15->transfer_buf[1] & 0x04;
+
 	return 0;
 }
 
@@ -849,14 +866,24 @@ static int lg_g510_event(struct lg_g15_data *g15, u8 *data)
 
 static int lg_g510_leds_event(struct lg_g15_data *g15, u8 *data)
 {
+	struct lg_g15_led *g15_led = &g15->leds[LG_G15_KBD_BRIGHTNESS];
 	bool backlight_disabled;
 
+	backlight_disabled = data[1] & 0x04;
+	if (backlight_disabled == g15->backlight_disabled)
+		return 0;
+
+	led_classdev_notify_brightness_hw_changed(
+		&g15_led->mcdev.led_cdev,
+		backlight_disabled ? 0 : g15_led->brightness);
+
+	g15->backlight_disabled = backlight_disabled;
+
 	/*
 	 * The G510 ignores backlight updates when the backlight is turned off
 	 * through the light toggle button on the keyboard, to work around this
 	 * we queue a workitem to sync values when the backlight is turned on.
 	 */
-	backlight_disabled = data[1] & 0x04;
 	if (!backlight_disabled)
 		schedule_work(&g15->work);
 
@@ -892,9 +919,9 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
-		if (data[0] == 0x03 && size == 5)
+		if (data[0] == LG_G510_INPUT_MACRO_KEYS && size == 5)
 			return lg_g510_event(g15, data);
-		if (data[0] == 0x04 && size == 2)
+		if (data[0] == LG_G510_INPUT_KBD_BACKLIGHT && size == 2)
 			return lg_g510_leds_event(g15, data);
 		break;
 	}
@@ -933,6 +960,8 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
 			lg_g510_kbd_led_set;
 		gled->mcdev.led_cdev.brightness_get =
 			lg_g510_kbd_led_get;
+		if (index == LG_G15_KBD_BRIGHTNESS)
+			g15->leds[index].mcdev.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
 	}
 	gled->mcdev.led_cdev.max_brightness = 255;
 	gled->mcdev.num_colors = 3;
-- 
2.51.0


