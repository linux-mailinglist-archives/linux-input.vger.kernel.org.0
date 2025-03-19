Return-Path: <linux-input+bounces-10987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DACA698DA
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26DF1B67237
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC3C21ABB9;
	Wed, 19 Mar 2025 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NDl/i/Vs"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF821A449;
	Wed, 19 Mar 2025 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411621; cv=none; b=rJ4SH1UM46BITOTYIUkXXzzP6L1lkddX6TK6zSygPO2Q9//R0JCsTaJQxQWW00UWaegvsZim90oQ5cF++Qq6kANfojP5LDnfSz9z5xe597vRoatJ/xhihKnY0qrq7boIgsaCA6uvVNSgZAxlgYgP4XZ/egDp5QsBRJ7d1K9UaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411621; c=relaxed/simple;
	bh=d0AWn6n0HU3aKqHBukaitOUT7z5hC8eUSVoitZg2KAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXywsv6XpJcsnHRI2w6MAlAcMrAHWRBKDnCRkim1dWyMJLvnARac6aChD49jLusv/69tmSQLaFae8eM8zmEfIzSEEuZvUUTfoBTUlDz7HbWBKteMyxIa549Bm3fRY1Ax7190qrqawliLbEPPtwMI9uaqccU/uwJcS1hSxgntdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NDl/i/Vs; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A82FF2E095E6;
	Wed, 19 Mar 2025 21:13:35 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411617;
	bh=7SgQNJ88U4jOkXwiLB8JOmfVZKR3hRI/97RSjhIE8XE=; h=From:To:Subject;
	b=NDl/i/VsU6tKGqsutRGkZThloPvICGA8H+ZxTuhDGMpMcxnm0xeukhsBuycLSK0sv
	 Ws/ZLEkkTjmgYHCRsU2shhC7H1ZLY0WRvQZWAlLM6nYXOU/quD5/9iQDhd3DebSwPd
	 ajnltyBDypoiWUe0QaStcrCxJ5AR/UR/sP7Ek9Xc=
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
Subject: [PATCH 08/11] HID: asus: listen to the asus-wmi brightness device
 instead of creating one
Date: Wed, 19 Mar 2025 20:13:16 +0100
Message-ID: <20250319191320.10092-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241161696.8350.18216879873061530623@linux1587.grserver.gr>
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
index 5b75ee83ae290..5aae4466c0d63 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -96,7 +96,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
 
 struct asus_kbd_leds {
-	struct led_classdev cdev;
+	struct asus_brt_listener listener;
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
@@ -493,11 +493,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
 	spin_unlock_irqrestore(&led->lock, flags);
 }
 
-static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
-				   enum led_brightness brightness)
+static void asus_kbd_backlight_set(struct asus_brt_listener *listener,
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
@@ -603,14 +561,12 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	drvdata->kbd_backlight->removed = false;
 	drvdata->kbd_backlight->brightness = 0;
 	drvdata->kbd_backlight->hdev = hdev;
-	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
-	drvdata->kbd_backlight->cdev.max_brightness = 3;
-	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
-	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
+	drvdata->kbd_backlight->listener.notify = asus_kbd_backlight_set;
 	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
 	spin_lock_init(&drvdata->kbd_backlight->lock);
 
-	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
+	ret = asus_brt_register_listener(&drvdata->kbd_backlight->listener);
+
 	if (ret < 0) {
 		/* No need to have this still around */
 		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
@@ -840,7 +796,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	drvdata->input = input;
 
 	if (drvdata->enable_backlight &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
@@ -1019,7 +974,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
 
 	if (drvdata->kbd_backlight) {
 		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
-				drvdata->kbd_backlight->cdev.brightness };
+				drvdata->kbd_backlight->brightness };
 		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
 		if (ret < 0) {
 			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
@@ -1202,6 +1157,8 @@ static void asus_remove(struct hid_device *hdev)
 		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
 
 		cancel_work_sync(&drvdata->kbd_backlight->work);
+
+		asus_brt_unregister_listener(&drvdata->kbd_backlight->listener);
 	}
 
 	hid_hw_stop(hdev);
-- 
2.48.1


