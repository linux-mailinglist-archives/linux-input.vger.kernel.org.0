Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06BC19861C
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 22:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbfHUU7s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 16:59:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45212 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfHUU7s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 16:59:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 03449300CB24;
        Wed, 21 Aug 2019 20:59:48 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DDC0B5DA32;
        Wed, 21 Aug 2019 20:59:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 4/7] HID: lg-g15: Add support for the M1-M3 and MR LEDs
Date:   Wed, 21 Aug 2019 22:59:34 +0200
Message-Id: <20190821205937.4929-5-hdegoede@redhat.com>
In-Reply-To: <20190821205937.4929-1-hdegoede@redhat.com>
References: <20190821205937.4929-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 21 Aug 2019 20:59:48 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for controlling the LEDs below the M1-M3 and MR keys.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 54 ++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index e6a5d66e1412..dc37c34dc8fb 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -28,6 +28,11 @@ enum lg_g15_led_type {
 	LG_G15_KBD_BRIGHTNESS,
 	LG_G15_LCD_BRIGHTNESS,
 	LG_G15_BRIGHTNESS_MAX,
+	LG_G15_MACRO_PRESET1 = 2,
+	LG_G15_MACRO_PRESET2,
+	LG_G15_MACRO_PRESET3,
+	LG_G15_MACRO_RECORD,
+	LG_G15_LED_MAX
 };
 
 struct lg_g15_led {
@@ -45,7 +50,7 @@ struct lg_g15_data {
 	struct input_dev *input;
 	struct hid_device *hdev;
 	enum lg_g15_model model;
-	struct lg_g15_led leds[LG_G15_BRIGHTNESS_MAX];
+	struct lg_g15_led leds[LG_G15_LED_MAX];
 };
 
 static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
@@ -62,6 +67,16 @@ static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
 
 	g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = g15->transfer_buf[1];
 	g15->leds[LG_G15_LCD_BRIGHTNESS].brightness = g15->transfer_buf[2];
+
+	g15->leds[LG_G15_MACRO_PRESET1].brightness =
+		!(g15->transfer_buf[3] & 0x01);
+	g15->leds[LG_G15_MACRO_PRESET2].brightness =
+		!(g15->transfer_buf[3] & 0x02);
+	g15->leds[LG_G15_MACRO_PRESET3].brightness =
+		!(g15->transfer_buf[3] & 0x04);
+	g15->leds[LG_G15_MACRO_RECORD].brightness =
+		!(g15->transfer_buf[3] & 0x08);
+
 	return 0;
 }
 
@@ -86,7 +101,8 @@ static int lg_g15_led_set(struct led_classdev *led_cdev,
 	struct lg_g15_led *g15_led =
 		container_of(led_cdev, struct lg_g15_led, cdev);
 	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
-	int ret;
+	u8 val, mask = 0;
+	int i, ret;
 
 	/* Ignore LED off on unregister / keyboard unplug */
 	if (led_cdev->flags & LED_UNREGISTERING)
@@ -95,10 +111,26 @@ static int lg_g15_led_set(struct led_classdev *led_cdev,
 	mutex_lock(&g15->mutex);
 
 	g15->transfer_buf[0] = LG_G15_FEATURE_REPORT;
-	g15->transfer_buf[1] = g15_led->led + 1;
-	g15->transfer_buf[2] = brightness << (g15_led->led * 4);
 	g15->transfer_buf[3] = 0;
 
+	if (g15_led->led < LG_G15_BRIGHTNESS_MAX) {
+		g15->transfer_buf[1] = g15_led->led + 1;
+		g15->transfer_buf[2] = brightness << (g15_led->led * 4);
+	} else {
+		for (i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; i++) {
+			if (i == g15_led->led)
+				val = brightness;
+			else
+				val = g15->leds[i].brightness;
+
+			if (val)
+				mask |= 1 << (i - LG_G15_MACRO_PRESET1);
+		}
+
+		g15->transfer_buf[1] = 0x04;
+		g15->transfer_buf[2] = ~mask;
+	}
+
 	ret = hid_hw_raw_request(g15->hdev, LG_G15_FEATURE_REPORT,
 				 g15->transfer_buf, 4,
 				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
@@ -257,14 +289,22 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 	const char * const led_names[] = {
 		"g15::kbd_backlight",
 		"g15::lcd_backlight",
+		"g15::macro_preset1",
+		"g15::macro_preset2",
+		"g15::macro_preset3",
+		"g15::macro_record",
 	};
 
 	g15->leds[i].led = i;
 	g15->leds[i].cdev.name = led_names[i];
 	g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
 	g15->leds[i].cdev.brightness_get = lg_g15_led_get;
-	g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
-	g15->leds[i].cdev.max_brightness = 2;
+	if (i < LG_G15_BRIGHTNESS_MAX) {
+		g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
+		g15->leds[i].cdev.max_brightness = 2;
+	} else {
+		g15->leds[i].cdev.max_brightness = 1;
+	}
 
 	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
 }
@@ -377,7 +417,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto error_hw_stop;
 
 	/* Register LED devices */
-	for (i = 0; i < LG_G15_BRIGHTNESS_MAX; i++) {
+	for (i = 0; i < LG_G15_LED_MAX; i++) {
 		ret = lg_g15_register_led(g15, i);
 		if (ret)
 			goto error_hw_stop;
-- 
2.23.0.rc2

