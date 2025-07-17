Return-Path: <linux-input+bounces-13580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111DB08BC3
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 13:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86C86178A3C
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E86628A1FB;
	Thu, 17 Jul 2025 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8Y660q+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1128A72A;
	Thu, 17 Jul 2025 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751818; cv=none; b=KLwWU8TblJfelz6bv3gvd6sdZ6nYLHLn2esGldNw0Eru/D3lr9RCLU7w4sbJfnF6ZoN/gZ2fYgTNRmyj7TYo3NdWGCSnQ/3u+mWXtaMN/KxpNsOi1b2goPde6v5p0fQe6Yhkl8x1tYeYp28f6VgzCkUQPtxk5suf7rze3JleGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751818; c=relaxed/simple;
	bh=EJy3Zvt5yLPjLg2fFwXOwF7+ndUgkYuhJm9BJnISMKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aKLGbagykIhsVxTfYKvSHpS6w/Yho9VPVEWmwvbxFm4IHq0YgfGqmwzCYe/gb/VKekKC4ZmHxPbwzLmU3IOnH2qMJ3i6GuA36O+JxiSUMb8UpbqswQqxNJ6j+OPcZ0A0O386Gw3n4L29si8k6wPH/8aGNpWNqD2WIW7zGrcifbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8Y660q+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b34ab678931so595997a12.0;
        Thu, 17 Jul 2025 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752751816; x=1753356616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tarMCPEgQUfhUrhse/oyfU/4k8xUqzVR/2XeCxNejcU=;
        b=f8Y660q+EiJIpG7g4qagHdJNWw4nWmttU8OGwNFrIL29oof0WBoRvC9YoiVjx6kkvW
         pjrvNOnYEMQMS9ZVR1cnG+MdmAr4wVvNDDufshbJMmkmIpTOv7dO8Tbo8ou6MLtJmOX4
         9i+M2PW3D3XK0Ezt/l1om100zo+6DovOR+8rR1iujlLSD5TaIYIXG7Kwu5XzOeWxmlgp
         qr/ouPq65QReidWFa7MmugjSpXH72RYluye0U44pW86Mph6tequ2v9+84HIQe4NhcXUD
         zF8kztjDqcCWRIbzYv0LtJPvKar6IhwRNv3yh59vIEJlytGz1crh4jTIzGFfoaMXTZSl
         1IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752751816; x=1753356616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tarMCPEgQUfhUrhse/oyfU/4k8xUqzVR/2XeCxNejcU=;
        b=rSjrp4OH9f68QMszO7T83z6xvyxVB+fLRuSMNHOSSuEwNg+JpWOhhOlnWVa6Pgwg5G
         0Tu0hzpKE1AcmHnvp9cWqFL2+N4IdZGq3dJamUI7gzJpO1LqcmaqJZ/v57dpK72Wsar0
         KH+ZZ1ZD+Fh6BoBNvarLw8BNpsgZ4LC8GtwGK3ZjyZwv+q9kyS80gVngB4WLTsVpJlTu
         nMLnq6NrCr1zgNfNKTA6K2lAY4KW3TpFCHLOTou/UVVz7zDxIeh1jsb4bf+qnFwhtYpa
         yaywWrKgZyEb3ijwJCKYb7FGWz59x0B4QzT0jMpBGqFXxJVFxOMJkoFlAfVQq4DtrOPE
         sFgw==
X-Forwarded-Encrypted: i=1; AJvYcCUMQSV82qdD1s0/+P0HAt6k10dBI/RAHabHkK51JCKHzKADiBaWEdNvVrx9548/2vWtskl4krfCR5akMuzy@vger.kernel.org, AJvYcCV3m0p1CppY8XMRWt3sf8KGme3bvWFvbMvrdBrFHwvcoffj83kZEBkeR2Zmo8gfdrlbI5M2MhfXmjen4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywry6RuhF4Kl7jV5l9UsLvX+KKOEWxW1hiHseh7pb/hhHDIWPfL
	fxznyiJ5224pzwNVF369tI16M0bYjccuLVI2yrX6FKOUCmLDmfMebU+O
X-Gm-Gg: ASbGncuKr55goslH5VNvEUG1KobFBUWsLUHASikw9vvEfoOv2Vi9Q1WrDg/zK6VWir2
	WbU124R58g8cz7Pr0nuLLe19TkPLl36AZOMXeHjpPoaRx+GPc2V/KY1KFABM5Tn/p0y4JLVOTET
	5lLdIixq9t3+Ib/oV77FKq9OG/1jrj6pqSKcnnMweoP3LoOjEf1cfSwaV4vtXy/sc9LQbg8UCBR
	SZXZHvMLIjQLcUrAZMJ65uCBYohIBTEcJaLFnWXpJJ6wDqTciTA7mXQ8MzhobqArn1T1xmnhfOX
	0C8KrjhoC5lk4/1YpxYPq1zSvIk/Ds/xRiDEwTXaUMxtn6SV810DD8Dz8LHau+8kINprorj0nl3
	ECcvtKB1MPjz1BQho8P4eHHjRhbTpZIX1JT15ph1Fthmor9g+0836zkGBNwLY
X-Google-Smtp-Source: AGHT+IFEY9z3AQHpC/dTdlPikOlqkbIdC0J1XPGiqN31juk902TaLfl8KNOK8U+wbcwa2IPs9dl9Xw==
X-Received: by 2002:a17:90b:3cc6:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-31c9e6e2d84mr9801746a91.2.1752751815561;
        Thu, 17 Jul 2025 04:30:15 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f287bcasm3162576a91.32.2025.07.17.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:30:14 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: hadess@hadess.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] HID: steelseries: refactor probe() and remove()
Date: Thu, 17 Jul 2025 20:26:43 +0900
Message-Id: <20250717112643.1410093-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

steelseries_srws1_probe() still does not use devm_kzalloc() and
devm_led_classdev_register(), so there is a lot of code to safely manage
heap, which reduces readability and may cause memory leaks due to minor
patch mistakes in the future.

Therefore, it should be changed to use devm_kzalloc() and
devm_led_classdev_register() to easily and safely manage heap.

Also, the current steelseries driver mainly checks sd->quriks to determine
which product a specific HID device is, which is not the correct way.

remove(), unlike probe(), does not receive struct hid_device_id as an
argument, so it must check hdev unconditionally to know which product
it is.

However, since struct steelseries_device and struct steelseries_srws1_data
have different structures, if SRWS1 is removed in remove(), converts
hdev->dev, which is initialized to struct steelseries_srws1_data,
to struct steelseries_device and uses it. This causes various
memory-related bugs as completely unexpected values exist in member
variables of the structure.

Therefore, in order to modify probe() and remove() to work properly,
Arctis 1, 9 should be added to HID_USB_DEVICE and some functions should be
modified to check hdev->product when determining HID device product.

Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/hid/hid-ids.h         |   2 +
 drivers/hid/hid-quirks.c      |   2 +
 drivers/hid/hid-steelseries.c | 109 ++++++++++++----------------------
 3 files changed, 43 insertions(+), 70 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 33cc5820f2be..d2833cf913c5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1289,6 +1289,8 @@
 
 #define USB_VENDOR_ID_STEELSERIES	0x1038
 #define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1  0x12b6
+#define USB_DEVICE_ID_STEELSERIES_ARCTIS_9  0x12c2
 
 #define USB_VENDOR_ID_SUN		0x0430
 #define USB_DEVICE_ID_RARITAN_KVM_DONGLE	0xcdab
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 9bf9ce8dc803..d401fbdb7335 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -691,6 +691,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #endif
 #if IS_ENABLED(CONFIG_HID_STEELSERIES)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_SRWS1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_9) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SUNPLUS)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SUNPLUS, USB_DEVICE_ID_SUNPLUS_WDESKTOP) },
diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index d4bd7848b8c6..8af98d67959e 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -249,11 +249,11 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 {
 	int ret, i;
 	struct led_classdev *led;
+	struct steelseries_srws1_data *drv_data;
 	size_t name_sz;
 	char *name;
 
-	struct steelseries_srws1_data *drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
-
+	drv_data = devm_kzalloc(&hdev->dev, sizeof(*drv_data), GFP_KERNEL);
 	if (drv_data == NULL) {
 		hid_err(hdev, "can't alloc SRW-S1 memory\n");
 		return -ENOMEM;
@@ -264,18 +264,18 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-		goto err_free;
+		goto err;
 	}
 
 	if (!hid_validate_values(hdev, HID_OUTPUT_REPORT, 0, 0, 16)) {
 		ret = -ENODEV;
-		goto err_free;
+		goto err;
 	}
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto err_free;
+		goto err;
 	}
 
 	/* register led subsystem */
@@ -288,10 +288,10 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 	name_sz = strlen(hdev->uniq) + 16;
 
 	/* 'ALL', for setting all LEDs simultaneously */
-	led = kzalloc(sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
+	led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
 	if (!led) {
 		hid_err(hdev, "can't allocate memory for LED ALL\n");
-		goto err_led;
+		goto out;
 	}
 
 	name = (void *)(&led[1]);
@@ -303,16 +303,18 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 	led->brightness_set = steelseries_srws1_led_all_set_brightness;
 
 	drv_data->led[SRWS1_NUMBER_LEDS] = led;
-	ret = led_classdev_register(&hdev->dev, led);
-	if (ret)
-		goto err_led;
+	ret = devm_led_classdev_register(&hdev->dev, led);
+	if (ret) {
+		hid_err(hdev, "failed to register LED %d. Aborting.\n", SRWS1_NUMBER_LEDS);
+		goto out; /* let the driver continue without LEDs */
+	}
 
 	/* Each individual LED */
 	for (i = 0; i < SRWS1_NUMBER_LEDS; i++) {
-		led = kzalloc(sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
+		led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
 		if (!led) {
 			hid_err(hdev, "can't allocate memory for LED %d\n", i);
-			goto err_led;
+			break;
 		}
 
 		name = (void *)(&led[1]);
@@ -324,53 +326,18 @@ static int steelseries_srws1_probe(struct hid_device *hdev,
 		led->brightness_set = steelseries_srws1_led_set_brightness;
 
 		drv_data->led[i] = led;
-		ret = led_classdev_register(&hdev->dev, led);
+		ret = devm_led_classdev_register(&hdev->dev, led);
 
 		if (ret) {
 			hid_err(hdev, "failed to register LED %d. Aborting.\n", i);
-err_led:
-			/* Deregister all LEDs (if any) */
-			for (i = 0; i < SRWS1_NUMBER_LEDS + 1; i++) {
-				led = drv_data->led[i];
-				drv_data->led[i] = NULL;
-				if (!led)
-					continue;
-				led_classdev_unregister(led);
-				kfree(led);
-			}
-			goto out;	/* but let the driver continue without LEDs */
+			break;	/* but let the driver continue without LEDs */
 		}
 	}
 out:
 	return 0;
-err_free:
-	kfree(drv_data);
+err:
 	return ret;
 }
-
-static void steelseries_srws1_remove(struct hid_device *hdev)
-{
-	int i;
-	struct led_classdev *led;
-
-	struct steelseries_srws1_data *drv_data = hid_get_drvdata(hdev);
-
-	if (drv_data) {
-		/* Deregister LEDs (if any) */
-		for (i = 0; i < SRWS1_NUMBER_LEDS + 1; i++) {
-			led = drv_data->led[i];
-			drv_data->led[i] = NULL;
-			if (!led)
-				continue;
-			led_classdev_unregister(led);
-			kfree(led);
-		}
-
-	}
-
-	hid_hw_stop(hdev);
-	kfree(drv_data);
-}
 #endif
 
 #define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
@@ -405,13 +372,12 @@ static int steelseries_headset_request_battery(struct hid_device *hdev,
 
 static void steelseries_headset_fetch_battery(struct hid_device *hdev)
 {
-	struct steelseries_device *sd = hid_get_drvdata(hdev);
 	int ret = 0;
 
-	if (sd->quirks & STEELSERIES_ARCTIS_1)
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1)
 		ret = steelseries_headset_request_battery(hdev,
 			arctis_1_battery_request, sizeof(arctis_1_battery_request));
-	else if (sd->quirks & STEELSERIES_ARCTIS_9)
+	else if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9)
 		ret = steelseries_headset_request_battery(hdev,
 			arctis_9_battery_request, sizeof(arctis_9_battery_request));
 
@@ -567,14 +533,7 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
 	struct steelseries_device *sd;
 	int ret;
 
-	sd = devm_kzalloc(&hdev->dev, sizeof(*sd), GFP_KERNEL);
-	if (!sd)
-		return -ENOMEM;
-	hid_set_drvdata(hdev, sd);
-	sd->hdev = hdev;
-	sd->quirks = id->driver_data;
-
-	if (sd->quirks & STEELSERIES_SRWS1) {
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
     (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
 		return steelseries_srws1_probe(hdev, id);
@@ -583,6 +542,13 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
 #endif
 	}
 
+	sd = devm_kzalloc(&hdev->dev, sizeof(*sd), GFP_KERNEL);
+	if (!sd)
+		return -ENOMEM;
+	hid_set_drvdata(hdev, sd);
+	sd->hdev = hdev;
+	sd->quirks = id->driver_data;
+
 	ret = hid_parse(hdev);
 	if (ret)
 		return ret;
@@ -610,17 +576,19 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
 
 static void steelseries_remove(struct hid_device *hdev)
 {
-	struct steelseries_device *sd = hid_get_drvdata(hdev);
+	struct steelseries_device *sd;
 	unsigned long flags;
 
-	if (sd->quirks & STEELSERIES_SRWS1) {
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
 #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
     (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
-		steelseries_srws1_remove(hdev);
+		goto srws1_remove;
 #endif
 		return;
 	}
 
+	sd = hid_get_drvdata(hdev);
+
 	spin_lock_irqsave(&sd->lock, flags);
 	sd->removed = true;
 	spin_unlock_irqrestore(&sd->lock, flags);
@@ -628,6 +596,7 @@ static void steelseries_remove(struct hid_device *hdev)
 	cancel_delayed_work_sync(&sd->battery_work);
 
 	hid_hw_close(hdev);
+srws1_remove:
 	hid_hw_stop(hdev);
 }
 
@@ -667,10 +636,10 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 	unsigned long flags;
 
 	/* Not a headset */
-	if (sd->quirks & STEELSERIES_SRWS1)
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1)
 		return 0;
 
-	if (sd->quirks & STEELSERIES_ARCTIS_1) {
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_1) {
 		hid_dbg(sd->hdev,
 			"Parsing raw event for Arctis 1 headset (%*ph)\n", size, read_buf);
 		if (size < ARCTIS_1_BATTERY_RESPONSE_LEN ||
@@ -688,7 +657,7 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
 		}
 	}
 
-	if (sd->quirks & STEELSERIES_ARCTIS_9) {
+	if (hdev->product == USB_DEVICE_ID_STEELSERIES_ARCTIS_9) {
 		hid_dbg(sd->hdev,
 			"Parsing raw event for Arctis 9 headset (%*ph)\n", size, read_buf);
 		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
@@ -757,11 +726,11 @@ static const struct hid_device_id steelseries_devices[] = {
 	  .driver_data = STEELSERIES_SRWS1 },
 
 	{ /* SteelSeries Arctis 1 Wireless for XBox */
-	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12b6),
-	.driver_data = STEELSERIES_ARCTIS_1 },
+	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_1),
+	  .driver_data = STEELSERIES_ARCTIS_1 },
 
 	{ /* SteelSeries Arctis 9 Wireless for XBox */
-	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12c2),
+	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, USB_DEVICE_ID_STEELSERIES_ARCTIS_9),
 	  .driver_data = STEELSERIES_ARCTIS_9 },
 
 	{ }
--

