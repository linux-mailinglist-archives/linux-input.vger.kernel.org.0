Return-Path: <linux-input+bounces-15428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A47BD60D3
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A62B18A16CE
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33E82E2DCB;
	Mon, 13 Oct 2025 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="XRG5GWCb"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86DA2DE711;
	Mon, 13 Oct 2025 20:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386674; cv=none; b=fKkgdOnzokFxQQE+0zFMRRROknFSqYFPp3rXtSjOSSiwWR7KGx3YzG5g4gPrWgmbsu9W/lV9G+aizwsQcBp6wYSdm7iulsoty+xbwGbYKb5Muvn2AZfijSKuactiDvl/kJNbRIFDQDPr1cVUXaseNi4P28+LIoNpVVG6ng7kncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386674; c=relaxed/simple;
	bh=rpuSBiB6EgUkCx6CkZ8qNxXaWxXB0j4Lc4dTfPm+GqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOIbJ7yNxzbQ938lv+cQ50Mi7eB/tbqeJo66ZdUIt5N9K4xbtBXrPELDCyXoLp/O+rYQYGWu5uvBfdYi7k75KoDFzqtuGHXo0Caswseu9wJ+iTMXyvI/6Dqu6GKvnb78JEXSonm1NDiOBAaD1YG9OMHM/Lw+7eHRmNuNIvGlNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=XRG5GWCb; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 7649A5E4E7;
	Mon, 13 Oct 2025 23:17:46 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id CE6AE5E4F7;
	Mon, 13 Oct 2025 23:17:44 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 012C61FDBBF;
	Mon, 13 Oct 2025 23:17:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386664;
	bh=rJl097qdwBHxkGru0hRkRIXBHw7VbtWnCJsB7V1mJXk=; h=From:To:Subject;
	b=XRG5GWCbrNmwCx1C7aUjI+RtdGQiGaKUuhTmXg8OxxPk5KmeuIQwEWFgxYoGiYGFc
	 Fcqu0ohEekY9SRi/yWNI/7RjkUtCx0dKgYa6jXPUhqS2HLwiZ/Dxz3xLMP0Sfvndq1
	 S4FoqZygx5uzXw0+OB7Z+ZTLtYgryK/yNsDoM4oKGH1gYqBRF4yn/L7mJHfdcgZYRT
	 y7B3Uex0KxJ+Md23XhI1KHql2qeJ3TX8kVXAskNbpRlt6jmCzzgJl6cNhq0DOUkahx
	 vI03UOg2h+RjGnNMYv0uDXKjqicvEa5b70xRnSXEc7a2ipCgFr6Si0cW+MMblcK+Um
	 gSFQJR8GsNmQg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.222) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
Subject: [PATCH v6 2/7] HID: asus: prevent binding to all HID devices on ROG
Date: Mon, 13 Oct 2025 22:15:30 +0200
Message-ID: <20251013201535.6737-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013201535.6737-1-lkml@antheas.dev>
References: <20251013201535.6737-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176038666391.3397392.2817820166012120045@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

ROG keyboards are HID compliant and only care about the endpoint that
produces vendor events (e.g., fan mode) and has the keyboard backlight.

Therefore, handle all of the endpoints of ROG keyboards as compliant,
by adding HID_QUIRK_INPUT_PER_APP and, for devices other than the vendor
one, by adding QUIRK_HANDLE_GENERIC to stop mutating them.

Due to HID_QUIRK_INPUT_PER_APP, rgb register is moved into probe, as
the input_* functions are called multiple times (4 for the Z13).

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 71 +++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index d0c783df99bc..a62559e3e064 100644
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
+#define QUIRK_HANDLE_GENERIC		BIT(14)
 
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
@@ -331,6 +332,10 @@ static int asus_raw_event(struct hid_device *hdev,
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
 		return asus_report_battery(drvdata, data, size);
 
@@ -875,6 +880,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct input_dev *input = hi->input;
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
 	if (drvdata->quirks & QUIRK_T100CHI &&
 	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
@@ -928,11 +937,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 
 	drvdata->input = input;
 
-	if (drvdata->enable_backlight &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
-	    asus_kbd_register_leds(hdev))
-		hid_warn(hdev, "Failed to initialize backlight.\n");
-
 	return 0;
 }
 
@@ -952,6 +956,10 @@ static int asus_input_mapping(struct hid_device *hdev,
 		return -1;
 	}
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	/*
 	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
 	 * This avoids a bunch of non-functional hid_input devices getting
@@ -1005,15 +1013,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
@@ -1130,8 +1129,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	int ret;
+	struct hid_report_enum *rep_enum;
 	struct asus_drvdata *drvdata;
+	struct hid_report *rep;
+	int ret, is_vendor = 0;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (drvdata == NULL) {
@@ -1215,18 +1216,42 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
+	 * For ROG keyboards, make them hid compliant by
+	 * creating one input per application. For interfaces other than
+	 * the vendor one, disable hid-asus handlers.
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		if (!is_vendor)
+			drvdata->quirks |= QUIRK_HANDLE_GENERIC;
+		hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+	}
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
 	/*
-	 * Check that input registration succeeded. Checking that
-	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
-	 * were freed during registration due to no usages being mapped,
-	 * leaving drvdata->input pointing to freed memory.
+	 * For ROG keyboards, skip rename for consistency and ->input check as
+	 * some devices do not have inputs.
 	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
+		return 0;
+
 	if (!drvdata->input || !(hdev->claimed & HID_CLAIMED_INPUT)) {
 		hid_err(hdev, "Asus input not registered\n");
 		ret = -ENOMEM;
@@ -1277,6 +1302,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return rdesc;
+
 	if (drvdata->quirks & QUIRK_FIX_NOTEBOOK_REPORT &&
 			*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x65) {
 		hid_info(hdev, "Fixing up Asus notebook report descriptor\n");
-- 
2.51.0



