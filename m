Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28693A020C
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 14:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfH1Mlp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 08:41:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43468 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfH1Mlp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 08:41:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C4EE4301E12B;
        Wed, 28 Aug 2019 12:41:44 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-147.ams2.redhat.com [10.36.116.147])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A96975C1D6;
        Wed, 28 Aug 2019 12:41:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 6/7] HID: lg-g15: Add support for controlling the G510's RGB backlight
Date:   Wed, 28 Aug 2019 14:41:29 +0200
Message-Id: <20190828124130.26752-6-hdegoede@redhat.com>
In-Reply-To: <20190828124130.26752-1-hdegoede@redhat.com>
References: <20190828124130.26752-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 28 Aug 2019 12:41:44 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Note that the keyboard has a backlight on/off toggle button. If the
backlight is turned off through that button, then any changes we make
will be ignored and we cannot turn it back on again from the host.

To workaround this we write the last set RGB values when we receive an
event indicating that the backlight has been turned on again.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Make lg_g15_get_initial_led_brightness static
---
 drivers/hid/hid-lg-g15.c | 272 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 257 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index b0891503fbcf..b8ea059c46f3 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -19,6 +19,10 @@
 
 #define LG_G15_FEATURE_REPORT		0x02
 
+#define LG_G510_FEATURE_M_KEYS_LEDS	0x04
+#define LG_G510_FEATURE_BACKLIGHT_RGB	0x05
+#define LG_G510_FEATURE_POWER_ON_RGB	0x06
+
 enum lg_g15_model {
 	LG_G15,
 	LG_G15_V2,
@@ -41,6 +45,7 @@ struct lg_g15_led {
 	struct led_classdev cdev;
 	enum led_brightness brightness;
 	enum lg_g15_led_type led;
+	u8 red, green, blue;
 };
 
 struct lg_g15_data {
@@ -56,13 +61,12 @@ struct lg_g15_data {
 	bool game_mode_enabled;
 };
 
+/******** G15 and G15 v2 LED functions ********/
+
 static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
 {
 	int ret;
 
-	if (g15->model == LG_G510 || g15->model == LG_G510_USB_AUDIO)
-		return 0;
-
 	ret = hid_hw_raw_request(g15->hdev, LG_G15_FEATURE_REPORT,
 				 g15->transfer_buf, 4,
 				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
@@ -183,6 +187,198 @@ static void lg_g15_leds_changed_work(struct work_struct *work)
 	}
 }
 
+/******** G510 LED functions ********/
+
+static int lg_g510_get_initial_led_brightness(struct lg_g15_data *g15, int i)
+{
+	int ret, high;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G510_FEATURE_BACKLIGHT_RGB + i,
+				 g15->transfer_buf, 4,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 4) {
+		hid_err(g15->hdev, "Error getting LED brightness: %d\n", ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	high = max3(g15->transfer_buf[1], g15->transfer_buf[2],
+		    g15->transfer_buf[3]);
+
+	if (high) {
+		g15->leds[i].red =
+			DIV_ROUND_CLOSEST(g15->transfer_buf[1] * 255, high);
+		g15->leds[i].green =
+			DIV_ROUND_CLOSEST(g15->transfer_buf[2] * 255, high);
+		g15->leds[i].blue =
+			DIV_ROUND_CLOSEST(g15->transfer_buf[3] * 255, high);
+		g15->leds[i].brightness = high;
+	} else {
+		g15->leds[i].red   = 255;
+		g15->leds[i].green = 255;
+		g15->leds[i].blue  = 255;
+		g15->leds[i].brightness = 0;
+	}
+
+	return 0;
+}
+
+/* Must be called with g15->mutex locked */
+static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
+				 struct lg_g15_led *g15_led,
+				 enum led_brightness brightness)
+{
+	int ret;
+
+	g15->transfer_buf[0] = 5 + g15_led->led;
+	g15->transfer_buf[1] =
+		DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
+	g15->transfer_buf[2] =
+		DIV_ROUND_CLOSEST(g15_led->green * brightness, 255);
+	g15->transfer_buf[3] =
+		DIV_ROUND_CLOSEST(g15_led->blue * brightness, 255);
+
+	ret = hid_hw_raw_request(g15->hdev,
+				 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
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
+	return ret;
+}
+
+static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
+			       enum led_brightness brightness)
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
+	ret = lg_g510_kbd_led_write(g15, g15_led, brightness);
+	mutex_unlock(&g15->mutex);
+
+	return ret;
+}
+
+static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+
+	return g15_led->brightness;
+}
+
+static ssize_t color_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	unsigned long value;
+	int ret;
+
+	if (count < 7 || (count == 8 && buf[7] != '\n') || count > 8)
+		return -EINVAL;
+
+	if (buf[0] != '#')
+		return -EINVAL;
+
+	ret = kstrtoul(buf + 1, 16, &value);
+	if (ret)
+		return ret;
+
+	mutex_lock(&g15->mutex);
+	g15_led->red   = (value & 0xff0000) >> 16;
+	g15_led->green = (value & 0x00ff00) >> 8;
+	g15_led->blue  = (value & 0x0000ff);
+	ret = lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
+	mutex_unlock(&g15->mutex);
+
+	return (ret < 0) ? ret : count;
+}
+
+static ssize_t color_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	ssize_t ret;
+
+	mutex_lock(&g15->mutex);
+	ret = sprintf(buf, "#%02x%02x%02x\n",
+		      g15_led->red, g15_led->green, g15_led->blue);
+	mutex_unlock(&g15->mutex);
+
+	return ret;
+}
+
+static DEVICE_ATTR_RW(color);
+
+static struct attribute *lg_g510_kbd_led_attrs[] = {
+	&dev_attr_color.attr,
+	NULL,
+};
+
+static const struct attribute_group lg_g510_kbd_led_group = {
+	.attrs = lg_g510_kbd_led_attrs,
+};
+
+static const struct attribute_group *lg_g510_kbd_led_groups[] = {
+	&lg_g510_kbd_led_group,
+	NULL,
+};
+
+static void lg_g510_leds_sync_work(struct work_struct *work)
+{
+	struct lg_g15_data *g15 = container_of(work, struct lg_g15_data, work);
+
+	mutex_lock(&g15->mutex);
+	lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
+			      g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
+	mutex_unlock(&g15->mutex);
+}
+
+/******** Generic LED functions ********/
+static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
+{
+	int ret;
+
+	switch (g15->model) {
+	case LG_G15:
+	case LG_G15_V2:
+		return lg_g15_update_led_brightness(g15);
+	case LG_G510:
+	case LG_G510_USB_AUDIO:
+		ret = lg_g510_get_initial_led_brightness(g15, 0);
+		if (ret)
+			return ret;
+
+		ret = lg_g510_get_initial_led_brightness(g15, 1);
+		if (ret)
+			return ret;
+
+		return 0;
+	}
+	return -EINVAL; /* Never reached */
+}
+
+/******** Input functions ********/
+
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
 static int lg_g15_event(struct lg_g15_data *g15, u8 *data, int size)
 {
@@ -306,6 +502,22 @@ static int lg_g510_event(struct lg_g15_data *g15, u8 *data, int size)
 	return 0;
 }
 
+static int lg_g510_leds_event(struct lg_g15_data *g15, u8 *data, int size)
+{
+	bool backlight_disabled;
+
+	/*
+	 * The G510 ignores backlight updates when the backlight is turned off
+	 * through the light toggle button on the keyboard, to work around this
+	 * we queue a workitem to sync values when the backlight is turned on.
+	 */
+	backlight_disabled = data[1] & 0x04;
+	if (!backlight_disabled)
+		schedule_work(&g15->work);
+
+	return 0;
+}
+
 static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 			    u8 *data, int size)
 {
@@ -327,6 +539,8 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case LG_G510_USB_AUDIO:
 		if (data[0] == 0x03 && size == 5)
 			return lg_g510_event(g15, data, size);
+		if (data[0] == 0x04 && size == 2)
+			return lg_g510_leds_event(g15, data, size);
 		break;
 	}
 
@@ -360,13 +574,42 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 
 	g15->leds[i].led = i;
 	g15->leds[i].cdev.name = led_names[i];
-	g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
-	g15->leds[i].cdev.brightness_get = lg_g15_led_get;
-	if (i < LG_G15_BRIGHTNESS_MAX) {
-		g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
-		g15->leds[i].cdev.max_brightness = 2;
-	} else {
-		g15->leds[i].cdev.max_brightness = 1;
+
+	switch (g15->model) {
+	case LG_G15:
+	case LG_G15_V2:
+		g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
+		g15->leds[i].cdev.brightness_get = lg_g15_led_get;
+		if (i < LG_G15_BRIGHTNESS_MAX) {
+			g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
+			g15->leds[i].cdev.max_brightness = 2;
+		} else {
+			g15->leds[i].cdev.max_brightness = 1;
+		}
+		break;
+	case LG_G510:
+	case LG_G510_USB_AUDIO:
+		switch (i) {
+		case LG_G15_LCD_BRIGHTNESS:
+			/*
+			 * The G510 does not have a separate LCD brightness,
+			 * but it does have a separate power-on (reset) value.
+			 */
+			g15->leds[i].cdev.name = "g15::power_on_backlight_val";
+			/* fall through */
+		case LG_G15_KBD_BRIGHTNESS:
+			g15->leds[i].cdev.brightness_set_blocking =
+				lg_g510_kbd_led_set;
+			g15->leds[i].cdev.brightness_get =
+				lg_g510_kbd_led_get;
+			g15->leds[i].cdev.max_brightness = 255;
+			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
+			break;
+		default:
+			/* TODO: Add support for M1 - M3 and MR leds */
+			return 0;
+		}
+		break;
 	}
 
 	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
@@ -414,11 +657,11 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	g15->hdev = hdev;
 	g15->model = id->driver_data;
-	INIT_WORK(&g15->work, lg_g15_leds_changed_work);
 	hid_set_drvdata(hdev, (void *)g15);
 
 	switch (g15->model) {
 	case LG_G15:
+		INIT_WORK(&g15->work, lg_g15_leds_changed_work);
 		/*
 		 * The G15 and G15 v2 use a separate usb-device (on a builtin
 		 * hub) which emulates a keyboard for the F1 - F12 emulation
@@ -430,12 +673,14 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		gkeys = 18;
 		break;
 	case LG_G15_V2:
+		INIT_WORK(&g15->work, lg_g15_leds_changed_work);
 		connect_mask = HID_CONNECT_HIDRAW;
 		gkeys_settings_output_report = 0x02;
 		gkeys = 6;
 		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
+		INIT_WORK(&g15->work, lg_g510_leds_sync_work);
 		connect_mask = HID_CONNECT_HIDINPUT | HID_CONNECT_HIDRAW;
 		gkeys_settings_feature_report = 0x01;
 		gkeys = 18;
@@ -476,7 +721,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	/* Get initial brightness levels */
-	ret = lg_g15_update_led_brightness(g15);
+	ret = lg_g15_get_initial_led_brightness(g15);
 	if (ret)
 		goto error_hw_stop;
 
@@ -523,9 +768,6 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto error_hw_stop;
 
-	if (g15->model == LG_G510 || g15->model == LG_G510_USB_AUDIO)
-		return 0;
-
 	/* Register LED devices */
 	for (i = 0; i < LG_G15_LED_MAX; i++) {
 		ret = lg_g15_register_led(g15, i);
-- 
2.23.0

