Return-Path: <linux-input+bounces-11270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A1A709A3
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F179171FF2
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8622A1F5859;
	Tue, 25 Mar 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="00FXXKjy"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A271F542E;
	Tue, 25 Mar 2025 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928387; cv=none; b=e6I/2Z8OeMUJhwJjVbQSVwocfTJoMm1czrp+2Hg252kqatoUTNvqIZOmWonrxMmoXCiTr8lW6rUL/1HozTlrWpOkVSgRnAzsKLm15FNOVgvemJpf9mm9EVZqnAdp0fF8B6UZz0YCA4MAr2aVYwA1FcZLfqLxbQQ7PGNau88Ue2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928387; c=relaxed/simple;
	bh=iMSkhTtPBXoIq2xdGrx/ZZsbsHDbuvf9GWKyLdEZY4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kw1WzHPdvFxdwJZ8u2yll2+xqzTvFnLh4n04kJkgUlRpCPzdsWZVPnFxiqgABraaeK7LYGA6GvuCY8xVYF6LCol2aCf7/vMmZnFapJrZ/XX63X0rEiSRunfL0U8iGlY5F8wk8wWK7XUgpcV9VueFhduLCjRTeCdFTv1guS6zsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=00FXXKjy; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id ECFE82E098BB;
	Tue, 25 Mar 2025 20:46:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928383;
	bh=FGURjm1GvbiH64dTQupkFgl8O8EzilafoRnmodC0lZc=; h=From:To:Subject;
	b=00FXXKjyoxhaQQ1oYSDRkOgoMJ0u2mOEAPlAMme4DgnDq5DM40bhkYo8Q1UgwADO1
	 yToapxelgrSG/frPR4Rcdn+0QkMf612oUU/zQTSQL8xKh+ZXVWul7JdvQ1CNtaYmWI
	 3qiB6Tm83fJ2cwcLsbmmSclaFonARKWtxxIGif+I=
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
Subject: [PATCH v5 09/11] HID: asus: add basic RGB support
Date: Tue, 25 Mar 2025 19:45:58 +0100
Message-ID: <20250325184601.10990-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292838327.8265.11195129856759877496@linux1587.grserver.gr>
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
 drivers/hid/Kconfig    |   1 +
 drivers/hid/hid-asus.c | 171 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 156 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index dfc245867a46a..d324c6ab997de 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -151,6 +151,7 @@ config HID_APPLEIR
 config HID_ASUS
 	tristate "Asus"
 	depends on USB_HID
+	depends on LEDS_CLASS_MULTICOLOR
 	depends on LEDS_CLASS
 	depends on ASUS_WMI || ASUS_WMI=n
 	select POWER_SUPPLY
diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a4d1160460935..c135c9ff87b74 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -23,6 +23,7 @@
 /*
  */
 
+#include <linux/array_size.h>
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
@@ -30,6 +31,7 @@
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/leds.h>
 
 #include "hid-ids.h"
@@ -52,6 +54,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
+#define FEATURE_KBD_LED_REPORT_SIZE 7
 
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
@@ -86,6 +89,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_HANDLE_GENERIC		BIT(13)
+#define QUIRK_ROG_NKEY_RGB		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -98,9 +102,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 
 struct asus_kbd_leds {
 	struct asus_hid_listener listener;
+	struct led_classdev_mc mc_led;
+	struct mc_subled subled_info[3];
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
+	u8 rgb_colors[3];
+	bool rgb_init;
+	bool rgb_set;
+	bool rgb_registered;
 	spinlock_t lock;
 	bool removed;
 };
@@ -501,23 +511,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
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
@@ -531,10 +585,68 @@ static void asus_kbd_backlight_work(struct work_struct *work)
 		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
 }
 
+static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
+{
+	u8 rgb_buf[][FEATURE_KBD_LED_REPORT_SIZE] = {
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
 	int ret;
 
 	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
@@ -562,20 +674,47 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!drvdata->kbd_backlight)
 		return -ENOMEM;
 
-	drvdata->kbd_backlight->removed = false;
-	drvdata->kbd_backlight->brightness = 0;
-	drvdata->kbd_backlight->hdev = hdev;
-	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
-	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
+	leds = drvdata->kbd_backlight;
+	leds->removed = false;
+	leds->brightness = ASUS_EV_MAX_BRIGHTNESS;
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
+	leds->mc_led.led_cdev.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
+	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set;
+	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get;
+	leds->mc_led.subled_info = leds->subled_info;
+	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info);
+	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
+	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+
+	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
 	spin_lock_init(&drvdata->kbd_backlight->lock);
 
 	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
-	if (ret < 0) {
-		/* No need to have this still around */
-		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
+	/* Asus-wmi might not be accessible so this is not fatal. */
+	if (!ret)
+		hid_warn(hdev, "Asus-wmi brightness listener not registered\n");
+
+	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
+		ret = devm_led_classdev_multicolor_register(&hdev->dev, &leds->mc_led);
+		if (!ret)
+			leds->rgb_registered = true;
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 /*
@@ -1282,7 +1421,7 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
@@ -1311,7 +1450,7 @@ static const struct hid_device_id asus_devices[] = {
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


