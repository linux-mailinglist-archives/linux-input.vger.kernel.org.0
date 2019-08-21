Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584FB9861B
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 22:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730440AbfHUU7r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 16:59:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44722 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfHUU7r (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 16:59:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 97A05307D928;
        Wed, 21 Aug 2019 20:59:46 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B90017D29;
        Wed, 21 Aug 2019 20:59:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/7] HID: lg-g15: Add keyboard and LCD backlight control
Date:   Wed, 21 Aug 2019 22:59:33 +0200
Message-Id: <20190821205937.4929-4-hdegoede@redhat.com>
In-Reply-To: <20190821205937.4929-1-hdegoede@redhat.com>
References: <20190821205937.4929-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 21 Aug 2019 20:59:46 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Register a led_classdev for the keyboard backlight and another one for
the LCD backlight.

This commit also includes LED_BRIGHT_HW_CHANGED support, which together
with a desktop-environment which supports this, such as GNOME3 leads to
the kbd-backlight OSD being show with the new level when changing the
backlight setting through the hotkey on the keyboard.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add missing mutex_init call
---
 drivers/hid/hid-lg-g15.c | 156 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 1e35739a461b..e6a5d66e1412 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -17,19 +17,134 @@
 
 #define LG_G15_TRANSFER_BUF_SIZE	20
 
+#define LG_G15_FEATURE_REPORT		0x02
+
 enum lg_g15_model {
 	LG_G15,
 	LG_G15_V2,
 };
 
+enum lg_g15_led_type {
+	LG_G15_KBD_BRIGHTNESS,
+	LG_G15_LCD_BRIGHTNESS,
+	LG_G15_BRIGHTNESS_MAX,
+};
+
+struct lg_g15_led {
+	struct led_classdev cdev;
+	enum led_brightness brightness;
+	enum lg_g15_led_type led;
+};
+
 struct lg_g15_data {
 	/* Must be first for proper dma alignment */
 	u8 transfer_buf[LG_G15_TRANSFER_BUF_SIZE];
+	/* Protects the transfer_buf and led brightness */
+	struct mutex mutex;
+	struct work_struct work;
 	struct input_dev *input;
 	struct hid_device *hdev;
 	enum lg_g15_model model;
+	struct lg_g15_led leds[LG_G15_BRIGHTNESS_MAX];
 };
 
+static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
+{
+	int ret;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G15_FEATURE_REPORT,
+				 g15->transfer_buf, 4,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 4) {
+		hid_err(g15->hdev, "Error getting LED brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	g15->leds[LG_G15_KBD_BRIGHTNESS].brightness = g15->transfer_buf[1];
+	g15->leds[LG_G15_LCD_BRIGHTNESS].brightness = g15->transfer_buf[2];
+	return 0;
+}
+
+static enum led_brightness lg_g15_led_get(struct led_classdev *led_cdev)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	enum led_brightness brightness;
+
+	mutex_lock(&g15->mutex);
+	lg_g15_update_led_brightness(g15);
+	brightness = g15->leds[g15_led->led].brightness;
+	mutex_unlock(&g15->mutex);
+
+	return brightness;
+}
+
+static int lg_g15_led_set(struct led_classdev *led_cdev,
+			  enum led_brightness brightness)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	int ret;
+
+	/* Ignore LED off on unregister / keyboard unplug */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return 0;
+
+	mutex_lock(&g15->mutex);
+
+	g15->transfer_buf[0] = LG_G15_FEATURE_REPORT;
+	g15->transfer_buf[1] = g15_led->led + 1;
+	g15->transfer_buf[2] = brightness << (g15_led->led * 4);
+	g15->transfer_buf[3] = 0;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G15_FEATURE_REPORT,
+				 g15->transfer_buf, 4,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret == 4) {
+		/* Success */
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
+static void lg_g15_leds_changed_work(struct work_struct *work)
+{
+	struct lg_g15_data *g15 = container_of(work, struct lg_g15_data, work);
+	enum led_brightness old_brightness[LG_G15_BRIGHTNESS_MAX];
+	enum led_brightness brightness[LG_G15_BRIGHTNESS_MAX];
+	int i, ret;
+
+	mutex_lock(&g15->mutex);
+	for (i = 0; i < LG_G15_BRIGHTNESS_MAX; i++)
+		old_brightness[i] = g15->leds[i].brightness;
+
+	ret = lg_g15_update_led_brightness(g15);
+
+	for (i = 0; i < LG_G15_BRIGHTNESS_MAX; i++)
+		brightness[i] = g15->leds[i].brightness;
+	mutex_unlock(&g15->mutex);
+
+	if (ret)
+		return;
+
+	for (i = 0; i < LG_G15_BRIGHTNESS_MAX; i++) {
+		if (brightness[i] == old_brightness[i])
+			continue;
+
+		led_classdev_notify_brightness_hw_changed(&g15->leds[i].cdev,
+							  brightness[i]);
+	}
+}
+
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
 static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
 {
@@ -69,6 +184,10 @@ static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
 		input_report_key(g15->input, KEY_LCD_MENU2 + i, val);
 	}
 
+	/* Backlight cycle button pressed? */
+	if (data[1] & 0x80)
+		schedule_work(&g15->work);
+
 	input_sync(g15->input);
 	return 0;
 }
@@ -97,6 +216,10 @@ static int lg_g15_v2_event(struct lg_g15_data *g15, u8 *data, int size)
 		input_report_key(g15->input, KEY_LCD_MENU2 + i, val);
 	}
 
+	/* Backlight cycle button pressed? */
+	if (data[2] & 0x01)
+		schedule_work(&g15->work);
+
 	input_sync(g15->input);
 	return 0;
 }
@@ -129,6 +252,23 @@ static void lg_g15_input_close(struct input_dev *dev)
 	hid_hw_close(hdev);
 }
 
+static int lg_g15_register_led(struct lg_g15_data *g15, int i)
+{
+	const char * const led_names[] = {
+		"g15::kbd_backlight",
+		"g15::lcd_backlight",
+	};
+
+	g15->leds[i].led = i;
+	g15->leds[i].cdev.name = led_names[i];
+	g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
+	g15->leds[i].cdev.brightness_get = lg_g15_led_get;
+	g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
+	g15->leds[i].cdev.max_brightness = 2;
+
+	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
+}
+
 static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	u8 gkeys_settings_output_report = 0;
@@ -145,12 +285,15 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (!g15)
 		return -ENOMEM;
 
+	mutex_init(&g15->mutex);
+
 	input = devm_input_allocate_device(&hdev->dev);
 	if (!input)
 		return -ENOMEM;
 
 	g15->hdev = hdev;
 	g15->model = id->driver_data;
+	INIT_WORK(&g15->work, lg_g15_leds_changed_work);
 	hid_set_drvdata(hdev, (void *)g15);
 
 	switch (g15->model) {
@@ -196,6 +339,12 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto error_hw_stop;
 	}
 
+	/* Get initial brightness levels */
+	ret = lg_g15_update_led_brightness(g15);
+	if (ret)
+		goto error_hw_stop;
+
+	/* Setup and register input device */
 	input->name = "Logitech Gaming Keyboard Gaming Keys";
 	input->phys = hdev->phys;
 	input->uniq = hdev->uniq;
@@ -227,6 +376,13 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto error_hw_stop;
 
+	/* Register LED devices */
+	for (i = 0; i < LG_G15_BRIGHTNESS_MAX; i++) {
+		ret = lg_g15_register_led(g15, i);
+		if (ret)
+			goto error_hw_stop;
+	}
+
 	return 0;
 
 error_hw_stop:
-- 
2.23.0.rc2

