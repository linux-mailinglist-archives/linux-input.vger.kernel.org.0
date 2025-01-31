Return-Path: <linux-input+bounces-9629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C36A23EE5
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 15:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04396164403
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757E21C8FCE;
	Fri, 31 Jan 2025 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IcJI3ySe"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4B1C2309
	for <linux-input@vger.kernel.org>; Fri, 31 Jan 2025 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332194; cv=none; b=R9WwoD1jeECwM5vqLt4wRcisIC3upDs8EQkjTlTieFF4Rpfawx7keSjDNLBYwTU4wepjHKOvGvcHkF0sUbRrWqUuGdnirGj+iM9PuniPeIJrw6q2CtntfjiFPmLAH5KgmCqolXfzjFLKpYTIQnOQSPn5xL42vgrLSydjkt2rFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332194; c=relaxed/simple;
	bh=zvCOX9NLbi0xw7tvv3EEbiwHUfczTXqsmN/u/SDYwOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3F1Agko8giSorse084QvryOWxJZTojJvpEbmoNml885CXQOqkX8wYlyGTE+4ZwSweexGXKKkx6ossXnVQk9Yyv0BZIrit4XpiGzgyj0hnWt5g/3n9+TvN+Xd0l4Lm05A/kMIOOeGJt2HWsN5SW98k7gwKbSfQdxGKAGHGURhXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IcJI3ySe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738332190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDUAaLmRMl/FdxGf1RGZpcbl4GkR2B14ibUAg91EfFk=;
	b=IcJI3ySeydhl//8dj/llSe0PEgnMmPJxT2q+wCgr4IlD3FOiaQQt+xC82pQLtXsmOwG7kT
	xkFPpIO8tdo5qdBPgKDd4jge+l2bUyGK4wXu+ZfEYCdIFQF6FXaUQ00OvmqeyaoOp/22oa
	ah/tscoCE8TWy474rshKCS87UGPyiAM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-2EHSiSb7NJaE028xM01YZA-1; Fri,
 31 Jan 2025 09:03:06 -0500
X-MC-Unique: 2EHSiSb7NJaE028xM01YZA-1
X-Mimecast-MFC-AGG-ID: 2EHSiSb7NJaE028xM01YZA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF3BB1801F10;
	Fri, 31 Jan 2025 14:03:03 +0000 (UTC)
Received: from kate-fedora.redhat.com (unknown [10.39.194.228])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5BDEB180035E;
	Fri, 31 Jan 2025 14:02:58 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2] hid: hid-lg-g15: Use standard multicolor LED API
Date: Fri, 31 Jan 2025 22:02:41 +0800
Message-ID: <20250131140241.586305-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Replace the custom "color" sysfs attribute with the standard multicolor
LED API.

This also removes the code for the custom "color" sysfs attribute,
the "color" sysfs attribute was never documented so hopefully, it is not
used by anyone.

If we get complaints, we can re-add the "color" sysfs attribute as
a compatibility wrapper setting the subleds intensity.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
Changes in v2:
1. The commit message was revised with the reviewer's suggestions.
2. The incorrect parameters for container_of() were fixed.
3. The brightness values were converted by led_mc_calc_color_components().

---
 drivers/hid/hid-lg-g15.c | 146 +++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 81 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 53e7b90f9cc3..f8605656257b 100644
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
 
@@ -44,9 +46,13 @@ enum lg_g15_led_type {
 };
 
 struct lg_g15_led {
-	struct led_classdev cdev;
+	union {
+		struct led_classdev cdev;
+		struct led_classdev_mc mcdev;
+	};
 	enum led_brightness brightness;
 	enum lg_g15_led_type led;
+	/* Used to store initial color intensities before subled_info is allocated */
 	u8 red, green, blue;
 };
 
@@ -229,15 +235,15 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
 				 struct lg_g15_led *g15_led,
 				 enum led_brightness brightness)
 {
+	struct mc_subled *subleds = g15_led->mcdev.subled_info;
 	int ret;
 
+	led_mc_calc_color_components(&g15_led->mcdev, brightness);
+
 	g15->transfer_buf[0] = 5 + g15_led->led;
-	g15->transfer_buf[1] =
-		DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
-	g15->transfer_buf[2] =
-		DIV_ROUND_CLOSEST(g15_led->green * brightness, 255);
-	g15->transfer_buf[3] =
-		DIV_ROUND_CLOSEST(g15_led->blue * brightness, 255);
+	g15->transfer_buf[1] = subleds[0].brightness;
+	g15->transfer_buf[2] = subleds[1].brightness;
+	g15->transfer_buf[3] = subleds[2].brightness;
 
 	ret = hid_hw_raw_request(g15->hdev,
 				 LG_G510_FEATURE_BACKLIGHT_RGB + g15_led->led,
@@ -258,8 +264,9 @@ static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
 static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
 			       enum led_brightness brightness)
 {
+	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
 	struct lg_g15_led *g15_led =
-		container_of(led_cdev, struct lg_g15_led, cdev);
+		container_of(mc, struct lg_g15_led, mcdev);
 	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
 	int ret;
 
@@ -276,82 +283,20 @@ static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
 
 static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_cdev)
 {
+	struct led_classdev_mc *mc = lcdev_to_mccdev(led_cdev);
 	struct lg_g15_led *g15_led =
-		container_of(led_cdev, struct lg_g15_led, cdev);
+		container_of(mc, struct lg_g15_led, mcdev);
 
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
+	struct lg_g15_led *g15_led = &g15->leds[LG_G15_KBD_BRIGHTNESS];
 
 	mutex_lock(&g15->mutex);
-	lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
-			      g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
+	lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
 	mutex_unlock(&g15->mutex);
 }
 
@@ -667,8 +612,46 @@ static void lg_g15_input_close(struct input_dev *dev)
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
+	g15->leds[index].mcdev.led_cdev.max_brightness = 255;
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
 
@@ -685,6 +668,7 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 		} else {
 			g15->leds[i].cdev.max_brightness = 1;
 		}
+		ret = devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
 		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
@@ -697,12 +681,11 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 			g15->leds[i].cdev.name = "g15::power_on_backlight_val";
 			fallthrough;
 		case LG_G15_KBD_BRIGHTNESS:
-			g15->leds[i].cdev.brightness_set_blocking =
-				lg_g510_kbd_led_set;
-			g15->leds[i].cdev.brightness_get =
-				lg_g510_kbd_led_get;
-			g15->leds[i].cdev.max_brightness = 255;
-			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
+			/* register multicolor LED */
+			lg_g15_setup_led_rgb(g15, i);
+			ret = devm_led_classdev_multicolor_register_ext(&g15->hdev->dev,
+									&g15->leds[i].mcdev,
+									NULL);
 			break;
 		default:
 			g15->leds[i].cdev.brightness_set_blocking =
@@ -710,11 +693,12 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
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
2.48.1


