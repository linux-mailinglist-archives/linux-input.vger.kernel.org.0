Return-Path: <linux-input+bounces-11266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDCA70987
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 087C73B3673
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCB51F4284;
	Tue, 25 Mar 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ICOIW9jQ"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6D1F4176;
	Tue, 25 Mar 2025 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928380; cv=none; b=i2wLg8gNSwXFiSLyIAwG7nOyGgh+Y7nyJ6peK863OS1fLeXLdu2nkn+d9uJqf9X4UJfQCkW6qPXpHtfCa9P917XvRpuvLJ3ESbL/V2/ZA0TfiAd+Im48ItIMV66l4I4lFXl4816xCoC+vwr45dqsXdJgZBHOV1B0GpX9BUKmjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928380; c=relaxed/simple;
	bh=USvcqkAXXrbkecSZaf6Z8XwIVsRjFqhJqsX/QEOmjPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJnqSJb7suG3HwdCScfLUZlTiTcNC3ticWDCii8e5YonTfqQ8clSsAvxX31UzprzjgiY4S0eZSFnwkApvkdLnVtE6lnfXanAAoiBJ0rqzuFWrkyziDtpzgkn3SgDtz+69b0v5iWFm49Eh0/jaoZsJ7YfoEekoCtgqocZ0VKm/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ICOIW9jQ; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 5590F2E098B7;
	Tue, 25 Mar 2025 20:46:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928376;
	bh=lRk6fReF1JKeZIlU6Lg/usYtqP8UZJvPLull7cMgH6c=; h=From:To:Subject;
	b=ICOIW9jQ+Z3Q41k8+xRYmSxYw4du6SC7AYE1ypU5Y3JlHFnfNcScUMWkrSAGiktcX
	 pj70WfaTTbrdWeysMqCrm9rpl3HpZzY5i6s5rccLXL408T98ZltrCIAFXSDOBsG0AS
	 3yvWlNIU818f50yNTV1kZhzenfTph+lyUq0Ef62A=
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
Subject: [PATCH v5 05/11] HID: asus: listen to the asus-wmi brightness device
 instead of creating one
Date: Tue, 25 Mar 2025 19:45:54 +0100
Message-ID: <20250325184601.10990-6-lkml@antheas.dev>
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
 <174292837554.7963.17538415204232690349@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Some ROG laptops expose multiple interfaces for controlling the
keyboard/RGB brightness. This creates a name conflict under
asus::kbd_brightness, where the second device ends up being
named asus::kbd_brightness_1 and they are both broken.

Therefore, register a listener to the asus-wmi brightness device
instead of creating a new one.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 64 +++++++-----------------------------------
 1 file changed, 10 insertions(+), 54 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 7f070474ef8b4..9497e11577f93 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -97,7 +97,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
 
 struct asus_kbd_leds {
-	struct led_classdev cdev;
+	struct asus_hid_listener listener;
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
@@ -490,11 +490,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
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
@@ -504,20 +504,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
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
@@ -534,34 +520,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
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
@@ -596,14 +554,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
 	if (ret < 0) {
 		/* No need to have this still around */
 		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
@@ -997,7 +952,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
 
 	if (drvdata->kbd_backlight) {
 		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
-				drvdata->kbd_backlight->cdev.brightness };
+				drvdata->kbd_backlight->brightness };
 		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
 		if (ret < 0) {
 			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
@@ -1133,7 +1088,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
@@ -1174,6 +1128,8 @@ static void asus_remove(struct hid_device *hdev)
 	unsigned long flags;
 
 	if (drvdata->kbd_backlight) {
+		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
+
 		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
 		drvdata->kbd_backlight->removed = true;
 		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
-- 
2.49.0


