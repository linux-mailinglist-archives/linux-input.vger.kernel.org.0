Return-Path: <linux-input+bounces-11263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B457A7097F
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C3E83AA0D2
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF071F3B89;
	Tue, 25 Mar 2025 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="V28Hcl4c"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27A1ACEAF;
	Tue, 25 Mar 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928375; cv=none; b=ExWPBf1ni/y88dKJL1EKk9Q+MucxNxw6HpQ3+zjqbZLtDTbpE7e09pdepEcrhuFsEuzzxEJG5Z5HXWk21hhJHGmYpkLqgV+KGJqpFGV4LofsMOBks0edPYFMODh+cdFU9SfRjzx6FT79H+vX5J9aiLFs1wMGbTi4puD3txm5O6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928375; c=relaxed/simple;
	bh=xaUGb+diGmllD/MR/PUUhg9ZanRMgEuo/FIr//rXLF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf67uccRKkb6HiNgvLIf7793/DHTxiQT3Xg1E0aKi85HtFiWlSdaE/y/RCir9siyAqSHyuwiuWbNeR7OwP7qeCAx/F2PpgFbaF9nnbCMJxhL6W8W5cqLwxszrDehXsGsr+9sUPfQtBHNj89ZeUC23YoanPdpAdA0s13pZpfJd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=V28Hcl4c; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id E97DF2E0932D;
	Tue, 25 Mar 2025 20:46:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928370;
	bh=hChOQ20vCYiy3vvs3LCq5MPJ+0GUXF9+zvDSw0MqvLM=; h=From:To:Subject;
	b=V28Hcl4ccV9qPYczOA5uIybEpIsf5X5rJS+yRUlnxPikiroWKAEfRepS58odhW6yK
	 Sbr0h6hQTvCS7g18KAt9e33a40CktJ4knKsXf0x9lwKJvRRAVLR37+tqgzAOPMdPv1
	 m36lMDQqkm1k1tA3r/IBMqQJ+mztHzaSoyOOdR+M=
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
Subject: [PATCH v5 02/11] HID: asus: prevent binding to all HID devices on ROG
Date: Tue, 25 Mar 2025 19:45:51 +0100
Message-ID: <20250325184601.10990-3-lkml@antheas.dev>
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
 <174292836997.7747.7165150432821297937@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
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
 drivers/hid/hid-asus.c | 69 +++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 47f0a7cb46c80..7269ddc690bca 100644
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
@@ -84,6 +85,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_MEDION_E1239T		BIT(10)
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
+#define QUIRK_HANDLE_GENERIC		BIT(13)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -120,7 +122,6 @@ struct asus_drvdata {
 	struct input_dev *tp_kbd_input;
 	struct asus_kbd_leds *kbd_backlight;
 	const struct asus_touchpad_info *tp;
-	bool enable_backlight;
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
 	int battery_capacity;
@@ -311,7 +312,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -326,6 +327,10 @@ static int asus_raw_event(struct hid_device *hdev,
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
 		return asus_report_battery(drvdata, data, size);
 
@@ -770,6 +775,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct input_dev *input = hi->input;
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
 	if (drvdata->quirks & QUIRK_T100CHI &&
 	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
@@ -823,11 +832,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 
 	drvdata->input = input;
 
-	if (drvdata->enable_backlight &&
-	    !asus_kbd_wmi_led_control_present(hdev) &&
-	    asus_kbd_register_leds(hdev))
-		hid_warn(hdev, "Failed to initialize backlight.\n");
-
 	return 0;
 }
 
@@ -847,6 +851,10 @@ static int asus_input_mapping(struct hid_device *hdev,
 		return -1;
 	}
 
+	/* NOOP on generic HID devices to avoid side effects. */
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		return 0;
+
 	/*
 	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
 	 * This avoids a bunch of non-functional hid_input devices getting
@@ -897,15 +905,6 @@ static int asus_input_mapping(struct hid_device *hdev,
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
@@ -1022,8 +1021,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	int ret;
+	struct hid_report_enum *rep_enum;
 	struct asus_drvdata *drvdata;
+	struct hid_report *rep;
+	int ret, is_vendor = 0;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (drvdata == NULL) {
@@ -1107,12 +1108,42 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
+	/*
+	 * For ROG keyboards, skip rename for consistency and ->input check as
+	 * some devices do not have inputs.
+	 */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
+		return 0;
+
 	if (!drvdata->input) {
 		hid_err(hdev, "Asus input not registered\n");
 		ret = -ENOMEM;
@@ -1163,6 +1194,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
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
2.49.0


