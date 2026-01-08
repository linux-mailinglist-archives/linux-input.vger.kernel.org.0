Return-Path: <linux-input+bounces-16879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5724D0468A
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 17:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C6B330E9630
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 16:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D431A256E;
	Thu,  8 Jan 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TNkP2Ia6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4951D47B4;
	Thu,  8 Jan 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888706; cv=none; b=j/J4TIGPXQdWsl34v45s3/X1wAaxkyBzXufGid7FLWllzHWn4wXHxHt8d3pfVCB8agOACFL7K6iTlQW9Ew3DIRniIBM0K8JqnXoX3rWKwyTJPp0ZSu3pdKT9aYZrQYW4CrNof7joVzw+wxa1T84LQF4Oj3HrzcqaxbJjZvy74ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888706; c=relaxed/simple;
	bh=FIBOeoR3rht6Br+mUq6sa0ZYbLCHBbA0x3an6XFvSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLlabVpA5ogt5kVLOm54FvTeth855ITULtZF0qED++Y9EWz9m3YsD6ZeWwxUa2ZR1DnbKUSywkIZpud0ApoHdz4SKPVJPWI/MGlnh5hT2UD6CN0qfgpSVB/nPSDugJV/2O/dIz4PyPjhLStuxoTAMFznpsvYApjUNCuNX7n2C/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=TNkP2Ia6; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (p5087823e.dip0.t-ipconnect.de [80.135.130.62])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5D4322FC004D;
	Thu,  8 Jan 2026 17:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1767888701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dCcMYUGB8ydsfEX83JJQ0eW1z/na2h4ZUEtWKN4mDpI=;
	b=TNkP2Ia6l+QjHvg9f2vAvjclRBhD6JY0EIRcR5ZRnPT2yXRySft6Cp08eIdj0uwe1YCP4f
	e9vnxqUAcEipR0JjNk/x/h03r5Hrfj2+16HJ/OEfvEHoHJd+rcUkLM5wazjGxHWQQbTkb1
	km5K1VPQbxIHNBLrgTQa26x/PilOGhw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] hid/hid-multitouch: Keep latency normal on deactivate for reactivation gesture
Date: Thu,  8 Jan 2026 17:09:54 +0100
Message-ID: <20260108161139.32681-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniwill devices have a built in gesture in the touchpad to de- and
reactivate it by double taping the upper left corner. This gesture stops
working when latency is set to high, so this patch keeps the latency on
normal.

Cc: stable@vger.kernel.org
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
V1->V2: Use a quirk to narrow down the devices this is applied to.
V2->V3: Fix this patch breaking touchpads on some devices.
        Add another device ID.
V3->V4: Readd quirks formerly applied to the devices via the default class.
V4->V5: Fix whitespace error.

 drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b51..62e7036806549 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
 #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
+#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(24)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -211,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_WIN_8_DISABLE_WAKEUP		0x0016
 #define MT_CLS_WIN_8_NO_STICKY_FINGERS		0x0017
 #define MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU	0x0018
+#define MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE	0x0019
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -330,6 +332,15 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 		.export_all_inputs = true },
+	{ .name = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
+			MT_QUIRK_WIN8_PTP_BUTTONS |
+			MT_QUIRK_KEEP_LATENCY_ON_CLOSE,
+		.export_all_inputs = true },
 
 	/*
 	 * vendor specific classes
@@ -830,7 +841,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 			if ((cls->name == MT_CLS_WIN_8 ||
 			     cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
 			     cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU ||
-			     cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP) &&
+			     cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP ||
+			     cls->name == MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE) &&
 				(field->application == HID_DG_TOUCHPAD ||
 				 field->application == HID_DG_TOUCHSCREEN))
 				app->quirks |= MT_QUIRK_CONFIDENCE;
@@ -1709,7 +1721,8 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	int ret;
 
 	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
-	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
+	    td->mtclass.name == MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE)) {
 		if (hid_haptic_input_configured(hdev, td->haptic, hi) == 0)
 			td->is_haptic_touchpad = false;
 	} else {
@@ -1998,7 +2011,12 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
 
 static void mt_on_hid_hw_close(struct hid_device *hdev)
 {
-	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
+	struct mt_device *td = hid_get_drvdata(hdev);
+
+	if (td->mtclass.quirks & MT_QUIRK_KEEP_LATENCY_ON_CLOSE)
+		mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
+	else
+		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
 }
 
 /*
@@ -2375,6 +2393,14 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_UNITEC,
 			USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19) },
 
+	/* Uniwill touchpads */
+	{ .driver_data = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_PIXART, 0x0255) },
+	{ .driver_data = MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_PIXART, 0x0274) },
+
 	/* VTL panels */
 	{ .driver_data = MT_CLS_VTL,
 		MT_USB_DEVICE(USB_VENDOR_ID_VTL,
-- 
2.43.0


