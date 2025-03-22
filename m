Return-Path: <linux-input+bounces-11093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B902DA6C94B
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 11:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A7A3BD83F
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4B9210F53;
	Sat, 22 Mar 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GBZG5N3U"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D51FDE22;
	Sat, 22 Mar 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639329; cv=none; b=UCwG4gttFp4W7St1DvOVRACPzd7CMyOO0LFGQjWovk0mI2lSDjsHCXAdNHBnX4RY0ggD3pLhiI55EO+dy0gMuma82kSlXM/D1df8ys24ZRp1rMAzlsbU6JAt1q6PPdhhQrmnriOJAJ6OnH/9WcnwQwzYSjajD0XbjDuvrprOp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639329; c=relaxed/simple;
	bh=rGGq4MU+r1QYIoDQcm5Wfv9sp2ZYWAihf9dCOG+0IMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVFF0gq9AtPcn+eWEvTre8vl/dfgCt1jT6ngEFL0ZvcLY+GFze48NTe4ntW+k/v60XhHRwg68zqwNBFxMg59IBx80aJbUAovYFj9ezXPzHJyl5gXqZ0ArE/LZVgqH7yFAJDpXO1MUFt7jZTPvGig1oj+pbGDKuh4KAyc/WwAs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GBZG5N3U; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 10E462E0873A;
	Sat, 22 Mar 2025 12:28:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639325;
	bh=OmpVe5TA/jlhsvjxekk8zfgHa5dFwPXskLN5r0uh+Qw=; h=From:To:Subject;
	b=GBZG5N3UAxTv2ZINfNsVDann7wWzwix5i0aZNs7qkC+LaP3yxpjmN9coq0ZDDuxMy
	 KdtEStYELClGaXin/zv9C0BfH8Tvl4ehndjIoif1vGtK8Hin6ML8O9wfgDmP+WrKrh
	 NYzoGoKF0BqfZK8MOiNWvcIs/aRJU5t82460Exkw=
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
Subject: [PATCH v3 05/10] HID: asus: listen to the asus-wmi brightness device
 instead of creating one
Date: Sat, 22 Mar 2025 11:27:59 +0100
Message-ID: <20250322102804.418000-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250322102804.418000-1-lkml@antheas.dev>
References: <20250322102804.418000-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174263932524.19088.11740729890903135633@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Some ROG laptops expose multiple interfaces for controlling the
keyboard/RGB brightness. This creates a name conflict under
asus::kbd_brightness, where the second device ends up being
named asus::kbd_brightness_1 and they are both broken.

Therefore, register a listener to the asus-wmi brightness device
instead of creating a new one.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 65 +++++++-----------------------------------
 1 file changed, 11 insertions(+), 54 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index e97fb76eda619..c40b5c14c797f 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -96,7 +96,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
 
 struct asus_kbd_leds {
-	struct led_classdev cdev;
+	struct asus_hid_listener listener;
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
@@ -493,11 +493,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
 	spin_unlock_irqrestore(&led->lock, flags);
 }
 
-static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
-				   enum led_brightness brightness)
+static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
+				   int brightness)
 {
-	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
-						 cdev);
+	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
+						 listener);
 	unsigned long flags;
 
 	spin_lock_irqsave(&led->lock, flags);
@@ -507,20 +507,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 	asus_schedule_work(led);
 }
 
-static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
-{
-	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
-						 cdev);
-	enum led_brightness brightness;
-	unsigned long flags;
-
-	spin_lock_irqsave(&led->lock, flags);
-	brightness = led->brightness;
-	spin_unlock_irqrestore(&led->lock, flags);
-
-	return brightness;
-}
-
 static void asus_kbd_backlight_work(struct work_struct *work)
 {
 	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
@@ -537,34 +523,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
 		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
 }
 
-/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
- * precedence. We only activate HID-based backlight control when the
- * WMI control is not available.
- */
-static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
-{
-	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
-	u32 value;
-	int ret;
-
-	if (!IS_ENABLED(CONFIG_ASUS_WMI))
-		return false;
-
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
-			dmi_check_system(asus_use_hid_led_dmi_ids)) {
-		hid_info(hdev, "using HID for asus::kbd_backlight\n");
-		return false;
-	}
-
-	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
-				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
-	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
-	if (ret)
-		return false;
-
-	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
-}
-
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
@@ -599,14 +557,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	drvdata->kbd_backlight->removed = false;
 	drvdata->kbd_backlight->brightness = 0;
 	drvdata->kbd_backlight->hdev = hdev;
-	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
-	drvdata->kbd_backlight->cdev.max_brightness = 3;
-	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
-	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
+	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
 	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
 	spin_lock_init(&drvdata->kbd_backlight->lock);
 
-	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
+	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
+
 	if (ret < 0) {
 		/* No need to have this still around */
 		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
@@ -1000,7 +956,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
 
 	if (drvdata->kbd_backlight) {
 		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
-				drvdata->kbd_backlight->cdev.brightness };
+				drvdata->kbd_backlight->brightness };
 		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
 		if (ret < 0) {
 			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
@@ -1139,7 +1095,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
@@ -1180,6 +1135,8 @@ static void asus_remove(struct hid_device *hdev)
 	unsigned long flags;
 
 	if (drvdata->kbd_backlight) {
+		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
+
 		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
 		drvdata->kbd_backlight->removed = true;
 		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
-- 
2.48.1


