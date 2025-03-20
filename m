Return-Path: <linux-input+bounces-11034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D86A6B067
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 23:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E663C189C6FE
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E345122A7E3;
	Thu, 20 Mar 2025 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JqchCFet"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B32236E9;
	Thu, 20 Mar 2025 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508578; cv=none; b=nEpdPnpXL8D1BuZpP2C96BHChDHGVFQ3cjVBHCG6vHCMCoPth0THKFJAn8UIpfNXccFzTbHEtHD6VsrUtxe2qBTvlcOXgTD5sl31cjk63R8lxT0NTEpGpJfgzK+iUqs4N7wwMQqtPBtNy2RfhfIA9p2mDI1Kq12vkvAfwKmoC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508578; c=relaxed/simple;
	bh=iIHoh5NvM0jCdDQeDIYtH6VxQ0KghwvIsqCoZIgjww8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIwbSZ3sBfUflGa0LlNu0uVB6C2oC07mAUmLCmSt+GMlEk6yN+50MCmam14IzF1n84CYENOYDbqhAderFxCqokGz1RqPgQCwiUbp/rZCBRwYcipZrdiHExdwlSJ8s3Sgj57DI9UcDpaNJXJ8fGqfySx1MLpVScJVRlMhhoiYghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JqchCFet; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 1C2D32E07D36;
	Fri, 21 Mar 2025 00:09:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742508574;
	bh=q94LAMqEtqpT/hkWYDyzo4LztR3eU274qbhBbDAHoeI=; h=From:To:Subject;
	b=JqchCFet9OkJp5OvZVJC0AQr44EHfHutp7hYWVsVxw/VLDRcDF++He56YV53ZGO1c
	 drvPYa9Ofzs1Gfj3TgeNFS4YbvbDh3+4oRr26T9ehuO2GjkE349d3jdqATwPJIsLSJ
	 s3jo3PSypFRmrTzC18tZHqKY6QavF3G958zkqD5U=
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
Subject: [PATCH 02/11] HID: asus: prevent binding to all HID devices on ROG
Date: Thu, 20 Mar 2025 23:09:15 +0100
Message-ID: <20250320220924.5023-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320220924.5023-1-lkml@antheas.dev>
References: <20250320220924.5023-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174250857429.25514.1148817056117707276@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

ROG keyboards are HID compliant. We only care about the endpoint that
produces vendor events (e.g., fan mode) and has the keyboard backlight.
If we attach to all the endpoints, we end up generating errors during
probe for two of them because they are missing the ->input attribute
and risk side effects during input fixups.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 54 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 8d4df1b6f143b..5eb70716702ef 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -84,6 +84,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_MEDION_E1239T		BIT(10)
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
+#define QUIRK_HANDLE_GENERIC		BIT(13)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -326,6 +327,10 @@ static int asus_raw_event(struct hid_device *hdev,
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		/* NOOP on generic HID devices to avoid side effects. */
+		return 0;
+
 	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
 		return asus_report_battery(drvdata, data, size);
 
@@ -774,6 +779,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct input_dev *input = hi->input;
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		/* NOOP on generic HID devices to avoid side effects. */
+		return 0;
+
 	/* T100CHI uses MULTI_INPUT, bind the touchpad to the mouse hid_input */
 	if (drvdata->quirks & QUIRK_T100CHI &&
 	    hi->report->id != T100CHI_MOUSE_REPORT_ID)
@@ -851,6 +860,10 @@ static int asus_input_mapping(struct hid_device *hdev,
 		return -1;
 	}
 
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		/* NOOP on generic HID devices to avoid side effects. */
+		return 0;
+
 	/*
 	 * Ignore a bunch of bogus collections in the T100CHI descriptor.
 	 * This avoids a bunch of non-functional hid_input devices getting
@@ -1026,8 +1039,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
 
 static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
-	int ret;
+	struct hid_report_enum *rep_enum;
 	struct asus_drvdata *drvdata;
+	struct hid_report *rep;
+	int ret, found = 0;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (drvdata == NULL) {
@@ -1111,6 +1126,39 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * The only application we care about on ROG NKEY keyboards is
+		 * 0xff310076. This is meant Asus drivers and uses report 0x54.
+		 */
+		rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
+		list_for_each_entry(rep, &rep_enum->report_list, list) {
+			if (rep->application == 0xff310076)
+				found = true;
+		}
+
+		/*
+		 * If we didn't find the application, block hid-asus fixups
+		 * to prevent side effects on generic endpoints.
+		 *
+		 * We cannot -ENODEV here, as hid-generic checked our id_table
+		 * on its match and bailed so it will not take over the device.
+		 * We have to handle it transparently as part of this driver.
+		 */
+		if (!found) {
+			drvdata->quirks |= QUIRK_HANDLE_GENERIC;
+			hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+		}
+
+		/*
+		 * Start all endpoints normally. Include the RGB endpoint
+		 * as it being the only one renamed looks out of place.
+		 * The ->input bail causes regressions in endpoints without
+		 * an input dev and is a NOOP on the RGB endpoint.
+		 */
+		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
@@ -1167,6 +1215,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
+	if (drvdata->quirks & QUIRK_HANDLE_GENERIC)
+		/* NOOP on generic HID devices to avoid side effects. */
+		return rdesc;
+
 	if (drvdata->quirks & QUIRK_FIX_NOTEBOOK_REPORT &&
 			*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x65) {
 		hid_info(hdev, "Fixing up Asus notebook report descriptor\n");
-- 
2.48.1


