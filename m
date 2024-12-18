Return-Path: <linux-input+bounces-8655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CEB9F6095
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 10:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10BA1884C10
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2024 09:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2820B1953A9;
	Wed, 18 Dec 2024 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AxYQMvey"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94F166F16
	for <linux-input@vger.kernel.org>; Wed, 18 Dec 2024 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512429; cv=none; b=WpqnFCnHliBkC8q15p6zwcnODs0yUXxamCfUtbLxWCrcGEBbWqPeDmV1OY3nQ3EYvGpcGBivrs4OGxq1bKCcWTipbW+egCxO7laM8X9CtGF/BmKqRrr9gM1yetrqJPhCK8qjBWTpizJMYKqk75OOIsQMQvbup8Co7uHWpyRAqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512429; c=relaxed/simple;
	bh=eD1hMwHPvNOu3WUlGXkOLkHN+z0fbQjvPwH8Ieot0Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYj1tkoL6r7+aOUev4MIeZ62S8mkzfR2AZz5ulvsRrM81xaf1+uKWbXsT7bFlGO62FpBBYU6nRgybLAtqKro/4tdyD1R0ZD35hd3NatemXZqXHLDA86ZCYKmjy74nslYfIurw+WO1wZgK1giabWBEmJF2bWgxuenqBHzHSFA99s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AxYQMvey; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734512424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b/+oMeCME1YJ9QPF8Tc+PURK1zEpTKvNjKtL+pwpGW0=;
	b=AxYQMveyHjLyNwqX1W0HGY5v8wDHgNaARPhjjD3w84k9Xb14fJI7hVyeksJzp9P+pUVro/
	yFsFkYjGmCixdj34LU1D6wNlHt1zW8xFIaDSx7cYBmhW0MJFWGJ2LiWqnOlvaqpA5bakg5
	b+j/5bKyv8Wg6RR3PTDlsZ3h2dJz/Ak=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-1DjxZvoDPZG_BwR4_uCfCA-1; Wed,
 18 Dec 2024 04:00:21 -0500
X-MC-Unique: 1DjxZvoDPZG_BwR4_uCfCA-1
X-Mimecast-MFC-AGG-ID: 1DjxZvoDPZG_BwR4_uCfCA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0B2819560AE;
	Wed, 18 Dec 2024 09:00:19 +0000 (UTC)
Received: from kate-fedora.redhat.com (unknown [10.39.193.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30B1219560AD;
	Wed, 18 Dec 2024 09:00:14 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] hid: hid-lg-g15: Use standard multicolor LED API
Date: Wed, 18 Dec 2024 16:59:55 +0800
Message-ID: <20241218085955.555316-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This work migrated the multicolor LED control to the standard multicolor
LED API. Moreover, the codes related to the "color" attribute used to
set up the color previously were removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 145 ++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 77 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 53e7b90f9cc3..52159cecca27 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -8,11 +8,13 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/module.h>
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
+#include <dt-bindings/leds/common.h>
 
 #include "hid-ids.h"
 
@@ -44,7 +46,10 @@ enum lg_g15_led_type {
 };
 
 struct lg_g15_led {
-	struct led_classdev cdev;
+	union {
+		struct led_classdev cdev;
+		struct led_classdev_mc mcdev;
+	};
 	enum led_brightness brightness;
 	enum lg_g15_led_type led;
 	u8 red, green, blue;
@@ -227,17 +232,18 @@ static int lg_g510_get_initial_led_brightness(struct lg_g15_data *g15, int i)
 /* Must be called with g15->mutex locked */
 static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
 				 struct lg_g15_led *g15_led,
+				 struct mc_subled *subleds,
 				 enum led_brightness brightness)
 {
 	int ret;
 
 	g15->transfer_buf[0] = 5 + g15_led->led;
 	g15->transfer_buf[1] =
-		DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
+		DIV_ROUND_CLOSEST(subleds[0].intensity * brightness, 255);
 	g15->transfer_buf[2] =
-		DIV_ROUND_CLOSEST(g15_led->green * brightness, 255);
+		DIV_ROUND_CLOSEST(subleds[1].intensity * brightness, 255);
 	g15->transfer_buf[3] =
-		DIV_ROUND_CLOSEST(g15_led->blue * brightness, 255);
+		DIV_ROUND_CLOSEST(subleds[2].intensity * brightness, 255);
 
 	ret = hid_hw_raw_request(g15->hdev,
 				 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
@@ -258,9 +264,11 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
 static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
 			       enum led_brightness brightness)
 {
+	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
 	struct lg_g15_led *g15_led =
 		container_of(led_cdev, struct lg_g15_led, cdev);
 	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	struct mc_subled *subleds;
 	int ret;
 
 	/* Ignore LED off on unregister / keyboard unplug */
@@ -268,7 +276,11 @@ static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
 		return 0;
 
 	mutex_lock(&g15->mutex);
-	ret = lg_g510_kbd_led_write(g15, g15_led, brightness);
+
+	led_mc_calc_color_components(mc, brightness);
+	subleds = mc->subled_info;
+
+	ret = lg_g510_kbd_led_write(g15, g15_led, subleds, brightness);
 	mutex_unlock(&g15->mutex);
 
 	return ret;
@@ -282,76 +294,15 @@ static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
 	return g15_led->brightness;
 }
 
-static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct lg_g15_led *g15_led =
-		container_of(led_cdev, struct lg_g15_led, cdev);
-	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
-	unsigned long value;
-	int ret;
-
-	if (count < 7 || (count == 8 && buf[7] != '\n') || count > 8)
-		return -EINVAL;
-
-	if (buf[0] != '#')
-		return -EINVAL;
-
-	ret = kstrtoul(buf + 1, 16, &value);
-	if (ret)
-		return ret;
-
-	mutex_lock(&g15->mutex);
-	g15_led->red   = (value & 0xff0000) >> 16;
-	g15_led->green = (value & 0x00ff00) >> 8;
-	g15_led->blue  = (value & 0x0000ff);
-	ret = lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
-	mutex_unlock(&g15->mutex);
-
-	return (ret < 0) ? ret : count;
-}
-
-static ssize_t color_show(struct device *dev, struct device_attribute *attr,
-			  char *buf)
-{
-	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	struct lg_g15_led *g15_led =
-		container_of(led_cdev, struct lg_g15_led, cdev);
-	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
-	ssize_t ret;
-
-	mutex_lock(&g15->mutex);
-	ret = sprintf(buf, "#%02x%02x%02x\n",
-		      g15_led->red, g15_led->green, g15_led->blue);
-	mutex_unlock(&g15->mutex);
-
-	return ret;
-}
-
-static DEVICE_ATTR_RW(color);
-
-static struct attribute *lg_g510_kbd_led_attrs[] = {
-	&dev_attr_color.attr,
-	NULL,
-};
-
-static const struct attribute_group lg_g510_kbd_led_group = {
-	.attrs = lg_g510_kbd_led_attrs,
-};
-
-static const struct attribute_group *lg_g510_kbd_led_groups[] = {
-	&lg_g510_kbd_led_group,
-	NULL,
-};
-
 static void lg_g510_leds_sync_work(struct work_struct *work)
 {
 	struct lg_g15_data *g15 = container_of(work, struct lg_g15_data, work);
+	struct led_classdev_mc *mc = &g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev;
+	struct lg_g15_led *g15_led = &g15->leds[LG_G15_KBD_BRIGHTNESS];
+	struct mc_subled *subleds = mc->subled_info;
 
 	mutex_lock(&g15->mutex);
-	lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
-			      g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
+	lg_g510_kbd_led_write(g15, g15_led, subleds, g15_led->brightness);
 	mutex_unlock(&g15->mutex);
 }
 
@@ -667,8 +618,47 @@ static void lg_g15_input_close(struct input_dev *dev)
 	hid_hw_close(hdev);
 }
 
+static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
+{
+	int i;
+	struct mc_subled *subled_info;
+
+	g15->leds[index].mcdev.led_cdev.brightness_set_blocking =
+		lg_g510_kbd_led_set;
+	g15->leds[index].mcdev.led_cdev.brightness_get =
+		lg_g510_kbd_led_get;
+	g15->leds[index].mcdev.led_cdev.max_brightness = g15->leds[index].brightness;
+	g15->leds[index].mcdev.num_colors = 3;
+
+	subled_info = devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_info), GFP_KERNEL);
+	if (!subled_info)
+		return;
+
+	for (i = 0; i < 3; i++) {
+		switch (i + 1) {
+		case LED_COLOR_ID_RED:
+			subled_info[i].color_index = LED_COLOR_ID_RED;
+			subled_info[i].intensity = g15->leds[index].red;
+			break;
+		case LED_COLOR_ID_GREEN:
+			subled_info[i].color_index = LED_COLOR_ID_GREEN;
+			subled_info[i].intensity = g15->leds[index].green;
+			break;
+		case LED_COLOR_ID_BLUE:
+			subled_info[i].color_index = LED_COLOR_ID_BLUE;
+			subled_info[i].intensity = g15->leds[index].blue;
+			break;
+		}
+		subled_info[i].channel = i;
+		subled_info[i].intensity = 255;
+	}
+	g15->leds[index].mcdev.subled_info = subled_info;
+}
+
 static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 {
+	int ret;
+
 	g15->leds[i].led = i;
 	g15->leds[i].cdev.name = name;
 
@@ -685,6 +675,7 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 		} else {
 			g15->leds[i].cdev.max_brightness = 1;
 		}
+		ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
 		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
@@ -697,12 +688,11 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 			g15->leds[i].cdev.name = "g15::power_on_backlight_val";
 			fallthrough;
 		case LG_G15_KBD_BRIGHTNESS:
-			g15->leds[i].cdev.brightness_set_blocking =
-				lg_g510_kbd_led_set;
-			g15->leds[i].cdev.brightness_get =
-				lg_g510_kbd_led_get;
-			g15->leds[i].cdev.max_brightness = 255;
-			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
+			/* register multicolor */
+			lg_g15_setup_led_rgb(g15, i);
+			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
+									&g15->leds[i].mcdev,
+									NULL);
 			break;
 		default:
 			g15->leds[i].cdev.brightness_set_blocking =
@@ -710,11 +700,12 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 			g15->leds[i].cdev.brightness_get =
 				lg_g510_mkey_led_get;
 			g15->leds[i].cdev.max_brightness = 1;
+			ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
 		}
 		break;
 	}
 
-	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
+	return ret;
 }
 
 /* Common input device init code shared between keyboards and Z-10 speaker handling */
-- 
2.47.1


