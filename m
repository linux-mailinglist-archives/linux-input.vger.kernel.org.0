Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5399F9861D
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 22:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbfHUU7u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 16:59:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52766 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfHUU7u (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 16:59:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 637DD7EB8A;
        Wed, 21 Aug 2019 20:59:49 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 48C7A17D29;
        Wed, 21 Aug 2019 20:59:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 5/7] HID: lg-g15: Add support for the G510 keyboards' gaming keys
Date:   Wed, 21 Aug 2019 22:59:35 +0200
Message-Id: <20190821205937.4929-6-hdegoede@redhat.com>
In-Reply-To: <20190821205937.4929-1-hdegoede@redhat.com>
References: <20190821205937.4929-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Wed, 21 Aug 2019 20:59:49 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the gaming and LCD menu keys on the G510 keyboard.

Note this commit does not add support for the keyboard and LCD backlight
and the status LEDs, this is done in a follow up commit.

Note the G510 generates 4 different input reports on its second
(Consumer Keys) interface:

-input report 1 is standard bootclass keyboard input report, mirroring
 normal keyboard interface
-input report 2 is consumer page keys
-input report 3 is gkeys, etc.
-input report 4 is LED status, single byte, bits:
 bit 2: kbd and LCD backlight is *off* when set, toggled by the light key
 bit 3: headphone mute LED
 bit 4: mic mute LED

Input-report 1 we ignore since this is a duplicate report from the first
interface, report 2 is handled by the regular hid-input code. In this
commit we add handling for input report 3.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note the 2 added:

	if (g15->model == LG_G510 || g15->model == LG_G510_USB_AUDIO)
		return 0;

Code-blocks are because of the lack of led-class support, which is
temporary, these will be removed again in a follow-up commit.
---
 drivers/hid/hid-ids.h    |   2 +
 drivers/hid/hid-lg-g15.c | 126 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 912c1f9bb957..7360cf2838bb 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -747,6 +747,8 @@
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
 #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
 #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
+#define USB_DEVICE_ID_LOGITECH_G510		0xc22d
+#define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
 #define USB_DEVICE_ID_LOGITECH_G29_WHEEL	0xc24f
 #define USB_DEVICE_ID_LOGITECH_G920_WHEEL	0xc262
 #define USB_DEVICE_ID_LOGITECH_WINGMAN_F3D	0xc283
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index dc37c34dc8fb..62b3ae8a59a6 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -22,6 +22,8 @@
 enum lg_g15_model {
 	LG_G15,
 	LG_G15_V2,
+	LG_G510,
+	LG_G510_USB_AUDIO,
 };
 
 enum lg_g15_led_type {
@@ -51,12 +53,16 @@ struct lg_g15_data {
 	struct hid_device *hdev;
 	enum lg_g15_model model;
 	struct lg_g15_led leds[LG_G15_LED_MAX];
+	bool game_mode_enabled;
 };
 
 static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
 {
 	int ret;
 
+	if (g15->model == LG_G510 || g15->model == LG_G510_USB_AUDIO)
+		return 0;
+
 	ret = hid_hw_raw_request(g15->hdev, LG_G15_FEATURE_REPORT,
 				 g15->transfer_buf, 4,
 				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
@@ -256,16 +262,73 @@ static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data, int size)
 	return 0;
 }
 
+static int lg_g510_event(struct lg_g15_data *g15, u8 *data, int size)
+{
+	bool game_mode_enabled;
+	int i, val;
+
+	/* G1 - G18 */
+	for (i = 0; i < 18; i++) {
+		val = data[i / 8 + 1] & (1 << (i % 8));
+		input_report_key(g15->input, KEY_MACRO1 + i, val);
+	}
+
+	/* Game mode on/off slider */
+	game_mode_enabled = data[3] & 0x04;
+	if (game_mode_enabled != g15->game_mode_enabled) {
+		if (game_mode_enabled)
+			hid_info(g15->hdev, "Game Mode enabled, Windows (super) key is disabled\n");
+		else
+			hid_info(g15->hdev, "Game Mode disabled\n");
+		g15->game_mode_enabled = game_mode_enabled;
+	}
+
+	/* M1 - M3 */
+	for (i = 0; i < 3; i++) {
+		val = data[3] & (0x10 << i);
+		input_report_key(g15->input, KEY_MACRO_PRESET1 + i, val);
+	}
+	/* MR */
+	input_report_key(g15->input, KEY_MACRO_RECORD_START, data[3] & 0x80);
+
+	/* LCD menu keys */
+	for (i = 0; i < 5; i++) {
+		val = data[4] & (1 << i);
+		input_report_key(g15->input, KEY_LCD_MENU1 + i, val);
+	}
+
+	/* Headphone Mute */
+	input_report_key(g15->input, KEY_MUTE, data[4] & 0x20);
+	/* Microphone Mute */
+	input_report_key(g15->input, KEY_F20, data[4] & 0x40);
+
+	input_sync(g15->input);
+	return 0;
+}
+
 static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 			    u8 *data, int size)
 {
 	struct lg_g15_data *g15 = hid_get_drvdata(hdev);
 
-	if (g15->model == LG_G15 && data[0] == 0x02 && size == 9)
-		return lg_g15_event(g15, data, size);
+	if (!g15)
+		return 0;
 
-	if (g15->model == LG_G15_V2 && data[0] == 0x02 && size == 5)
-		return lg_g15_v2_event(g15, data, size);
+	switch (g15->model) {
+	case LG_G15:
+		if (data[0] == 0x02 && size == 9)
+			return lg_g15_event(g15, data, size);
+		break;
+	case LG_G15_V2:
+		if (data[0] == 0x02 && size == 5)
+			return lg_g15_v2_event(g15, data, size);
+		break;
+	case LG_G510:
+	case LG_G510_USB_AUDIO:
+		if (data[0] == 0x03 && size == 5)
+			return lg_g510_event(g15, data, size);
+		break;
+	}
 
 	return 0;
 }
@@ -312,15 +375,33 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	u8 gkeys_settings_output_report = 0;
+	u8 gkeys_settings_feature_report = 0;
+	struct hid_report_enum *rep_enum;
 	unsigned int connect_mask = 0;
+	bool has_ff000000 = false;
 	struct lg_g15_data *g15;
 	struct input_dev *input;
+	struct hid_report *rep;
 	int ret, i, gkeys = 0;
 
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
 	ret = hid_parse(hdev);
 	if (ret)
 		return ret;
 
+	/*
+	 * Some models have multiple interfaces, we want the interface with
+	 * with the f000.0000 application input report.
+	 */
+	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if (rep->application == 0xff000000)
+			has_ff000000 = true;
+	}
+	if (!has_ff000000)
+		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+
 	g15 = devm_kzalloc(&hdev->dev, sizeof(*g15), GFP_KERNEL);
 	if (!g15)
 		return -ENOMEM;
@@ -353,6 +434,12 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		gkeys_settings_output_report = 0x02;
 		gkeys = 6;
 		break;
+	case LG_G510:
+	case LG_G510_USB_AUDIO:
+		connect_mask = HID_CONNECT_HIDINPUT | HID_CONNECT_HIDRAW;
+		gkeys_settings_feature_report = 0x01;
+		gkeys = 18;
+		break;
 	}
 
 	ret = hid_hw_start(hdev, connect_mask);
@@ -374,6 +461,15 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hid_hw_close(hdev);
 	}
 
+	if (gkeys_settings_feature_report) {
+		g15->transfer_buf[0] = gkeys_settings_feature_report;
+		memset(g15->transfer_buf + 1, 0, gkeys);
+		ret = hid_hw_raw_request(g15->hdev,
+				gkeys_settings_feature_report,
+				g15->transfer_buf, gkeys + 1,
+				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	}
+
 	if (ret < 0) {
 		hid_err(hdev, "Error disabling keyboard emulation for the G-keys\n");
 		goto error_hw_stop;
@@ -409,6 +505,17 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	for (i = 0; i < 5; i++)
 		input_set_capability(input, EV_KEY, KEY_LCD_MENU1 + i);
 
+	/*
+	 * On the G510 only report headphone and mic mute keys when *not* using
+	 * the builtin USB audio device. When the builtin audio is used these
+	 * keys directly toggle mute (and the LEDs) on/off.
+	 */
+	if (g15->model == LG_G510) {
+		input_set_capability(input, EV_KEY, KEY_MUTE);
+		/* Userspace expects F20 for micmute */
+		input_set_capability(input, EV_KEY, KEY_F20);
+	}
+
 	g15->input = input;
 	input_set_drvdata(input, hdev);
 
@@ -416,6 +523,9 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto error_hw_stop;
 
+	if (g15->model == LG_G510 || g15->model == LG_G510_USB_AUDIO)
+		return 0;
+
 	/* Register LED devices */
 	for (i = 0; i < LG_G15_LED_MAX; i++) {
 		ret = lg_g15_register_led(g15, i);
@@ -437,6 +547,14 @@ static const struct hid_device_id lg_g15_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_G15_V2_LCD),
 		.driver_data = LG_G15_V2 },
+	/* G510 without a headset plugged in */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_G510),
+		.driver_data = LG_G510 },
+	/* G510 with headset plugged in / with extra USB audio interface */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO),
+		.driver_data = LG_G510_USB_AUDIO },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, lg_g15_devices);
-- 
2.23.0.rc2

