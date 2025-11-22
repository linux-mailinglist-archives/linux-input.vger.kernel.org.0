Return-Path: <linux-input+bounces-16290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EDC7CD5B
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 187FB4E5E18
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8D42FDC43;
	Sat, 22 Nov 2025 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="PGtiVMwR"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401E27B34C;
	Sat, 22 Nov 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809278; cv=none; b=d7nLgnDWi0vVWe4mQy5JVNvgmd7a4K0fFpX2gOfmG+wdTRVD6skn8hrapFUdAcMrC04Tq/tzBKdUAVHucPDkQZ8lMvv0c4k/8heto8tbyKzn/i+KM3kDIqSy3oKLzYOJpjEj0R0mR3VHr4lvG9ixjvIHj9GPGpnEAg/Cd3hW0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809278; c=relaxed/simple;
	bh=vrVVMn6SKqdQwAgK9mb9UAgLyKijxFGrEIX+0pGQ29w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvw1zIrK9/RtCiWoOoMLvOZMVuF3NYRq2lznbmycoh7oZsZfUg2DZcNrkaSOOqqOYHQaI1BYTIaxPB+dVT+Ed02Yp7Q59hslkySP/D/uUfNaVrruTLOYMom4I4KzMs5E4AXwORORpD5UdLVn6Kx5IkfQtBpynnb1N40IN/P5yuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=PGtiVMwR; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 829413F209;
	Sat, 22 Nov 2025 13:01:09 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id DB9393F192;
	Sat, 22 Nov 2025 13:01:08 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CE45D200CCE;
	Sat, 22 Nov 2025 13:01:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809268;
	bh=tEa5Sb614xgdgXlyJ0ZDX5doFZhpKa6OYtJfQ0+he8g=; h=From:To:Subject;
	b=PGtiVMwRpuq9Uy3QRHRon+JBo/E8SVBVC5FrsEWzJ5dgTe4ZhO/SuIfSeZR/eAbFP
	 t7NQuW9tRv8c8HGjBq4gApCsHqsdZqqhtiAm6AV2T07AWafoXayO/L0cloXloVTchl
	 Zst85zizUV0VjrCJxiNtCHz4iP4y4cZJDHaUOx1erNnK15o2RFLTK4NnnK6Uejah2l
	 aZWrAcrne2kpPrP0oRrLRCy9Jw1iaXPlKIXXwK2BPAqzHsIDO4Uex5zZTJhqbfOl2W
	 V4r+d7uJbvptpHnETIv357VPInIJvFsFPAsK+27jl/ub7oCVxJc+hFtmSBzzSNL3U/
	 ehdK2p2+lr9Nw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v10 08/11] HID: asus: listen to the asus-wmi brightness device
 instead of creating one
Date: Sat, 22 Nov 2025 12:00:29 +0100
Message-ID: <20251122110032.4274-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926838.360513.10482885573087796138@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
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
 drivers/hid/hid-asus.c | 65 +++++++-----------------------------------
 1 file changed, 10 insertions(+), 55 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 461b0f8efdfb..475e34187326 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -27,7 +27,6 @@
 #include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/platform_data/x86/asus-wmi.h>
-#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
@@ -103,7 +102,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
 
 struct asus_kbd_leds {
-	struct led_classdev cdev;
+	struct asus_hid_listener listener;
 	struct hid_device *hdev;
 	struct work_struct work;
 	unsigned int brightness;
@@ -493,11 +492,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
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
@@ -507,20 +506,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
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
@@ -537,34 +522,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
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
 /*
  * We don't care about any other part of the string except the version section.
  * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
@@ -709,14 +666,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
@@ -1105,7 +1059,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
 
 	if (drvdata->kbd_backlight) {
 		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
-				drvdata->kbd_backlight->cdev.brightness };
+				drvdata->kbd_backlight->brightness };
 		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
 		if (ret < 0) {
 			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
@@ -1231,7 +1185,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
@@ -1278,6 +1231,8 @@ static void asus_remove(struct hid_device *hdev)
 	unsigned long flags;
 
 	if (drvdata->kbd_backlight) {
+		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
+
 		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
 		drvdata->kbd_backlight->removed = true;
 		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
-- 
2.52.0



