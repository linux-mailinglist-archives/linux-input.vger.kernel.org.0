Return-Path: <linux-input+bounces-15852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75383C27BE8
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64FB61A23BAB
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804652D47F1;
	Sat,  1 Nov 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="leYpaqVD"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739612D238C;
	Sat,  1 Nov 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994043; cv=none; b=dVg/JWK4HiOYXBlIqe8vN9Wy8C+VP34+Zs34D3o6MD1AaGfXZk0qpxndUdeOnQNbGPLad8Uum/nZmPzg6pQKM6mfbDeRPtaci4vMmW7uf//NY1SckGwu/Bcr4WRWUOuBtbSnJJGu7CLhSBi25W4cgUKhITBL3LBZTt/l+XRA/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994043; c=relaxed/simple;
	bh=hC6070P6CTkCEkuDUQ3WZyS79ctkJ0MKf3eGXomcsns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMEpGVSypl1JXO/dmg33iGYh+/91Tfsrlfua7W01Njrp7JLmHq5TuEqCGYPTnFbCkW2T1mXNnxMCRnJN55k70jCERJYEaRkIvQ050XfWCkkaU+Sb7Tk1SMda1eQs/gW1U66P9G9SOmVrP2wO6agL6q98fss8nm49OwJNtFB+Ig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=leYpaqVD; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 17DB55E505;
	Sat,  1 Nov 2025 12:47:20 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 6561C5E5C8;
	Sat,  1 Nov 2025 12:47:19 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0C3891FF536;
	Sat,  1 Nov 2025 12:47:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994038;
	bh=KuiLqBBQ1pCEtSyAjKMrxQAViAd0saKWzZB6a/YWhCM=; h=From:To:Subject;
	b=leYpaqVD7U0UDCUvXJVTffbYK8MZ4eDK6mvxmu7KjKnMTCoGg+DF/IalIb27HtFZJ
	 BepkTxZA4HH6nrjs3wZDk9/QoeolV+9fqWdlnTi5H12vVrFhyr40tVUmEZ4HwIHHZn
	 GAzvLcUdHUNnhZztF9CaFQ5E0FQYhYWnlipCzizabPPB24VJyDpSCZvHHdSiYjTIKE
	 EooYcyGybBJ3WPPLjK2aGFvEgO7KzfgAcfK6lHvh+F2zo/+Fb44qqVhsXZgNOyizWF
	 3gSEQ21e4F+cwG8ugIy0NDpK+xNmz98D6ryw9fqSyPZbR7xDJWKgywpXvDkH+L5PTH
	 o4Hov4Fd7ZJrw==
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
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices on ROG
Date: Sat,  1 Nov 2025 11:47:06 +0100
Message-ID: <20251101104712.8011-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176199403856.3745682.5183610210093536438@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
event devices with a pretty ASUSTEK name. When it loads, it concatenates
all applications per HID endpoint, renames them, and prints errors
when some of them do not have an input device.

Therefore, change probe so that this is no longer the case. Stop
renaming the devices, omit the check for .input which causes errors
on e.g., the Z13 for some hiddev only devices, and move RGB checks
into probe.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 52 ++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 03f0d86936fc..726f5d8e22d1 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define T100CHI_MOUSE_REPORT_ID 0x06
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
+#define HID_USAGE_PAGE_VENDOR 0xff310000
 #define FEATURE_KBD_REPORT_ID 0x5a
 #define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
@@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
+#define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -125,7 +127,6 @@ struct asus_drvdata {
 	struct input_dev *tp_kbd_input;
 	struct asus_kbd_leds *kbd_backlight;
 	const struct asus_touchpad_info *tp;
-	bool enable_backlight;
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
 	int battery_capacity;
@@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 
 	drvdata->input = input;
 
-	if (drvdata->enable_backlight &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
-	    asus_kbd_register_leds(hdev))
-		hid_warn(hdev, "Failed to initialize backlight.\n");
-
 	return 0;
 }
 
@@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
 			return -1;
 		}
 
-		/*
-		 * Check and enable backlight only on devices with UsagePage ==
-		 * 0xff31 to avoid initializing the keyboard firmware multiple
-		 * times on devices with multiple HID descriptors but same
-		 * PID/VID.
-		 */
-		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
-			drvdata->enable_backlight = true;
-
 		set_bit(EV_REP, hi->input->evbit);
 		return 1;
 	}
@@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	int ret;
+	struct hid_report_enum *rep_enum;
 	struct asus_drvdata *drvdata;
+	struct hid_report *rep;
+	int ret, is_vendor = 0;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (drvdata == NULL) {
@@ -1218,12 +1207,37 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	/* Check for vendor for RGB init and handle generic devices properly. */
+	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
+	list_for_each_entry(rep, &rep_enum->report_list, list) {
+		if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
+			is_vendor = true;
+	}
+
+	/*
+	 * For ROG keyboards, disable fixups except vendor devices.
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
+		drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
 		return ret;
 	}
 
+	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
+	    !asus_kbd_wmi_led_control_present(hdev) &&
+	    asus_kbd_register_leds(hdev))
+		hid_warn(hdev, "Failed to initialize backlight.\n");
+
+	/*
+	 * For ROG keyboards, skip rename for consistency and ->input check as
+	 * some devices do not have inputs.
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
+		return 0;
+
 	/*
 	 * Check that input registration succeeded. Checking that
 	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
@@ -1352,6 +1366,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		rdesc = new_rdesc;
 	}
 
+	/* Vendor fixups should only apply to NKEY vendor devices. */
+	if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
+		return rdesc;
+
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
 			*rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
 			rdesc[204] == 0x95 && rdesc[205] == 0x05) {
-- 
2.51.2



