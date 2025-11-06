Return-Path: <linux-input+bounces-15915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C566EC3D533
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 21:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1ADAF4E37F7
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AF534846A;
	Thu,  6 Nov 2025 20:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="b+nKE73g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2EA2727E0;
	Thu,  6 Nov 2025 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459682; cv=none; b=qKYXr9mvIRL2jb+N2JgI2vS6AjPhSZjOKFhBwJoqyPjjYUGqKAMFbR8cYcKc8A5npjmtXZVa6wIqSvVkSbCJAQxFZpZhO7PY/3uwXyYCgWuaVfx80BCCxn0wKhMWKXTiuBZw34/Jjn8febby7IseH7EgV0PSh+nN1498+uQGIC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459682; c=relaxed/simple;
	bh=KxB+63k4fM/J4OVDe9WCNOji+9JfZTtssEwVtG2MB60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYHwSfygfdgwU97Z6rVsyO6+2LPxfA/EGJ1sdTxOmazH6Fwyihh+zq+WuinyYVcVz8CpYxxbnMI2kdkH7d+SdVrOr+81GVrjP4OGvitjHA2VFuCyrH5u/2jURIS1n9FBUeMxCF75zqLVnrJUU5pVRHIc2AEamtTSWZAGKxGUtqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=b+nKE73g; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (p50878061.dip0.t-ipconnect.de [80.135.128.97])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 52D8A2FC0057;
	Thu,  6 Nov 2025 21:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762459676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s5K6G8eO8hwGCWN+eU1ibbTVp/+XevQMvA2PtAxJbBI=;
	b=b+nKE73gZYroIjKaLqoxQrz/34sqz3bJ0vcoD9f+7bdwgHoAVo0miWqJLSxTpjHggmnK1b
	Af+szUw6m6pg8tG+OBKveuocZbInKukVbFoekLjvPzCte+XUbv/YSuIPGlvcAsg1mB8HyF
	anWwVWV0OthOVAk5X4gFcoja5wyL1Ec=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hid/hid-multitouch: Keep latency normal on deactivate for reactivation gesture
Date: Thu,  6 Nov 2025 20:59:55 +0100
Message-ID: <20251106200752.1523111-1-wse@tuxedocomputers.com>
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

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
V1->V2: Use a quirk to narrow down the devices this is applied to.

I have three Uniwill devices at hand right now that have at least two
physically different touchpads, but same Vendor + Product ID combination.
Maybe the vendor uses this product ID for all i2c connected touchpads, or
it is used as some kind of subvendor ID to indicate Uniwill?

To be able to really narrow it down to Uniwill only devices I would need to
check DMI strings, but then I will probably narrow it down to much as I
only know what we at TUXEDO use there.

 drivers/hid/hid-multitouch.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b51..470f199148057 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
 #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
+#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(24)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -229,6 +230,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
 #define MT_CLS_APPLE_TOUCHBAR			0x0114
+#define MT_CLS_UNIWILL_TOUCHPAD			0x0115
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -420,6 +422,9 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_APPLE_TOUCHBAR,
 		.maxcontacts = 11,
 	},
+	{ .name = MT_CLS_UNIWILL_TOUCHPAD,
+		.quirks = MT_QUIRK_KEEP_LATENCY_ON_CLOSE,
+	},
 	{ .name = MT_CLS_SIS,
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1998,7 +2003,12 @@ static void mt_on_hid_hw_open(struct hid_device *hdev)
 
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
@@ -2375,6 +2385,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_UNITEC,
 			USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19) },
 
+	/* Uniwill touchpads */
+	{ .driver_data = MT_CLS_UNIWILL_TOUCHPAD,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_PIXART, 0x0255) },
+
 	/* VTL panels */
 	{ .driver_data = MT_CLS_VTL,
 		MT_USB_DEVICE(USB_VENDOR_ID_VTL,
-- 
2.43.0


