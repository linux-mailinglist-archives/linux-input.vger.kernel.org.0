Return-Path: <linux-input+bounces-11152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9496A6E514
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 22:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD0B173DBE
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 21:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562491FBC8A;
	Mon, 24 Mar 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="H/Xy0wHR"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9131F12FD;
	Mon, 24 Mar 2025 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742850142; cv=none; b=Myk1KkXbWfjqDc812+9lQOwlMjxEDDkjiyteJE9kgLqWKbmxWnIo40jb3USUMPbP9nI8+LKcl+9sY5WR00j80QX6dO9h5kwns1q7MJU6XqAwg5Oo0YWrgzr5GdX5aSLh01BWGH8/UJRcpmi+H6U/1g3zJtUiPYjXLNidMSr4uQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742850142; c=relaxed/simple;
	bh=i/otUM2UgCtLSxKZWXeHNDDDYiURXoZPAOBDFZrV+qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDHIZWJz6MR5hSSRZa85bvwr+pQh4wVcTuCk8cajGMuqlXt8OpQR+I5TtwIgjj5+uqP4VkOscimHAdsr4RNC1jsK59+9Y4TCZQhZMGRU1czudI2klaJVrc47KoDNPwNnzY6yWAjzW4M6837BcNM5no5F51F2+P5D0B+iq6ec5XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=H/Xy0wHR; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A40D02E09DB1;
	Mon, 24 Mar 2025 23:02:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742850137;
	bh=ummHEbIrhNycgj4f9a3Q2pQW54+wgvUH1fx/ORqrGGw=; h=From:To:Subject;
	b=H/Xy0wHRIAAQy7dfA3Nl3I1WfP58AwIc/hLGbYuvxwjFg3+g6R8JIvp6IuET0GKAp
	 91Jt5Ia8TRa+dtE7p/W9ojoOmgYlV1MXGUYXj3Rx5kOMlFRPPCWp4WVrx1Sc7YeldZ
	 ow6+QQfQ9n6awHafwDfmR+4/g4GUnQh2sDvSrBGk=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v4 09/11] HID: asus: add basic RGB support
Date: Mon, 24 Mar 2025 22:01:49 +0100
Message-ID: <20250324210151.6042-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324210151.6042-1-lkml@antheas.dev>
References: <20250324210151.6042-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174285013771.23700.6495232460889166844@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Adds basic RGB support to hid-asus through multi-index. The interface
works quite well, but has not gone through much stability testing.
Applied on demand, if userspace does not touch the RGB sysfs, not
even initialization is done. Ensuring compatibility with existing
userspace programs.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 155 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 905453a4eb5b7..3ac1e2dea45bb 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -30,6 +30,7 @@
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/leds.h>
 
 #include "hid-ids.h"
@@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_HANDLE_GENERIC		BIT(13)
+#define QUIRK_ROG_NKEY_RGB		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 
 struct asus_kbd_leds {
 	struct asus_hid_listener listener;
+	struct led_classdev_mc mc_led;
+	struct mc_subled subled_info[3];
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
+	uint8_t rgb_colors[3];
+	bool rgb_init;
+	bool rgb_set;
+	bool rgb_registered;
 	spinlock_t lock;
 	bool removed;
 };
@@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
 	spin_unlock_irqrestore(&led->lock, flags);
 }
 
-static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
+static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	led->brightness = brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	asus_schedule_work(led);
+}
+
+static void asus_kbd_listener_set(struct asus_hid_listener *listener,
 				   int brightness)
 {
 	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
 						 listener);
+	do_asus_kbd_backlight_set(led, brightness);
+	if (led->rgb_registered) {
+		led->mc_led.led_cdev.brightness = brightness;
+		led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
+							  brightness);
+	}
+}
+
+static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
+						 mc_led);
 	unsigned long flags;
 
 	spin_lock_irqsave(&led->lock, flags);
-	led->brightness = brightness;
+	led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
+	led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
+	led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
+	led->rgb_set = true;
 	spin_unlock_irqrestore(&led->lock, flags);
 
-	asus_schedule_work(led);
+	do_asus_kbd_backlight_set(led, brightness);
+}
+
+static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc *mc_led;
+	struct asus_kbd_leds *led;
+	enum led_brightness brightness;
+	unsigned long flags;
+
+	mc_led = lcdev_to_mccdev(led_cdev);
+	led = container_of(mc_led, struct asus_kbd_leds, mc_led);
+
+	spin_lock_irqsave(&led->lock, flags);
+	brightness = led->brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	return brightness;
 }
 
-static void asus_kbd_backlight_work(struct work_struct *work)
+static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
 {
-	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
 	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
 	int ret;
 	unsigned long flags;
@@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
 		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
 }
 
+static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
+{
+	u8 rgb_buf[][7] = {
+		{ FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
+		{ FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
+		{ FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
+	};
+	unsigned long flags;
+	uint8_t colors[3];
+	bool rgb_init, rgb_set;
+	int ret;
+
+	spin_lock_irqsave(&led->lock, flags);
+	rgb_init = led->rgb_init;
+	rgb_set = led->rgb_set;
+	led->rgb_set = false;
+	colors[0] = led->rgb_colors[0];
+	colors[1] = led->rgb_colors[1];
+	colors[2] = led->rgb_colors[2];
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	if (!rgb_set)
+		return;
+
+	if (rgb_init) {
+		ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
+		if (ret < 0) {
+			hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
+			return;
+		}
+		spin_lock_irqsave(&led->lock, flags);
+		led->rgb_init = false;
+		spin_unlock_irqrestore(&led->lock, flags);
+	}
+
+	/* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */
+	rgb_buf[0][4] = colors[0];
+	rgb_buf[0][5] = colors[1];
+	rgb_buf[0][6] = colors[2];
+
+	for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {
+		ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
+		if (ret < 0) {
+			hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
+			return;
+		}
+	}
+}
+
+static void asus_kbd_work(struct work_struct *work)
+{
+	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
+						 work);
+	asus_kbd_backlight_work(led);
+	asus_kbd_rgb_work(led);
+}
+
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	unsigned char kbd_func;
+	struct asus_kbd_leds *leds;
+	bool no_led;
 	int ret;
 
 	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
@@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!drvdata->kbd_backlight)
 		return -ENOMEM;
 
-	drvdata->kbd_backlight->removed = false;
-	drvdata->kbd_backlight->brightness = 0;
-	drvdata->kbd_backlight->hdev = hdev;
-	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
-	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
+	leds = drvdata->kbd_backlight;
+	leds->removed = false;
+	leds->brightness = 3;
+	leds->hdev = hdev;
+	leds->listener.brightness_set = asus_kbd_listener_set;
+
+	leds->rgb_colors[0] = 0;
+	leds->rgb_colors[1] = 0;
+	leds->rgb_colors[2] = 0;
+	leds->rgb_init = true;
+	leds->rgb_set = false;
+	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
+					"asus-%s:rgb:peripheral",
+					strlen(hdev->uniq) ?
+					hdev->uniq : dev_name(&hdev->dev));
+	leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
+	leds->mc_led.led_cdev.max_brightness = 3,
+	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
+	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
+	leds->mc_led.subled_info = leds->subled_info,
+	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
+	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
+	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+
+	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
 	spin_lock_init(&drvdata->kbd_backlight->lock);
 
 	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
+	no_led = !!ret;
+
+	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
+		ret = devm_led_classdev_multicolor_register(
+			&hdev->dev, &leds->mc_led);
+		if (!ret)
+			leds->rgb_registered = true;
+		no_led &= !!ret;
+	}
 
-	if (ret < 0) {
+	if (no_led) {
 		/* No need to have this still around */
 		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
 	}
 
-	return ret;
+	return no_led ? -ENODEV : 0;
 }
 
 /*
@@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
@@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
 	{ }
-- 
2.49.0


