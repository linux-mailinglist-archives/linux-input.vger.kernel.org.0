Return-Path: <linux-input+bounces-10980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0BA698CB
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920A61B62D39
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702EF21420E;
	Wed, 19 Mar 2025 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ITgoLf7O"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A4211A24;
	Wed, 19 Mar 2025 19:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411610; cv=none; b=WSgQBBgRQ++igUUBHPkVAk/4F2BT678sMxZb8j17UQqewnv0ce1grmBdLG6px5trBRIPR/gfPL5YkIF959Zayk/L2kMDQkca7HQwJZlzEB61yhD7JWjzjBYQoX8eJDlj1PotMgeCGGwtMOuCvfRA/YcsYc3/sR3RVFst/UxjBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411610; c=relaxed/simple;
	bh=jjlpPxF/o4bcVU3POrsYYyHNWQPPHKAdxI1XlxzBo/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZrUz6tEqdG0lZ/liQVqczMssLP2/IbgL8cBLnuTp4QKJ6mnd48HuSSLY4/IG+4n21I6zi6ICuQmH+ZmCI9uXLXF2dWA6K7sDHHI1z1j1GZ5dB4gAb3mXjYx0D9AWWxGcVDYJwGG7nscweyvdxYB8NkqMkciuXfnFyp3VTWjvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ITgoLf7O; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id E1A682E0924F;
	Wed, 19 Mar 2025 21:13:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411605;
	bh=+2jYk8Z6h7BV4+cq0gxcvdXN9X7tzZNe0V0/p5KrIwc=; h=From:To:Subject;
	b=ITgoLf7O3nHWNQ4WssO9cRaM+NTs9nI75sGMrBNJmrkmaLx0nyVRCJ1OHWNtRGsIG
	 S+qQic8YWUHkR749RpbHpNAQEOivi/FOszzN1SjTbS+Wo2FMPOVJv7Cq7pnCRoyXJ+
	 N/XQQyyxP3Z0ke/X3ee8Zq+NWAWQ7aqw2gET04L8=
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
Subject: [PATCH 01/11] HID: asus: refactor init sequence per spec
Date: Wed, 19 Mar 2025 20:13:09 +0100
Message-ID: <20250319191320.10092-2-lkml@antheas.dev>
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
 <174241160499.7642.1538751541080314698@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_init() uses a reverse engineered init sequence
from Windows, which contains the handshakes from multiple programs.
Keep the main one, which is 0x5a (meant for drivers).

In addition, perform a get_response and check if the response is the
same. To avoid regressions, print an error if the response does not
match instead of rejecting device.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 36 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 46e3e42f9eb5f..aa4a481dc4f27 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_REPORT_ID 0x0d
 #define INPUT_REPORT_ID 0x5d
 #define FEATURE_KBD_REPORT_ID 0x5a
-#define FEATURE_KBD_REPORT_SIZE 16
+#define FEATURE_KBD_REPORT_SIZE 64
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
@@ -386,16 +386,43 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
 	return ret;
 }
 
-static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
+static int asus_kbd_init(struct hid_device *hdev)
 {
-	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
-		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	/*
+	 * Asus handshake identifying us as a driver (0x5A)
+	 * 0x5A then ASCII for "ASUS Tech.Inc."
+	 * 0x5D is for userspace Windows applications.
+	 *
+	 * The handshake is first sent as a set_report, then retrieved
+	 * from a get_report to verify the response.
+	 */
+	const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x41, 0x53, 0x55, 0x53, 0x20,
+		0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	u8 *readbuf;
 	int ret;
 
 	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
-	if (ret < 0)
-		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
+		return ret;
+	}
 
+	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
+	if (!readbuf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
+	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
+		hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
+			FEATURE_KBD_REPORT_SIZE, readbuf);
+		// Do not return error if handshake is wrong to avoid regressions
+	}
+
+	kfree(readbuf);
 	return ret;
 }
 
@@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	unsigned char kbd_func;
 	int ret;
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		/* Initialize keyboard */
-		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
-		if (ret < 0)
-			return ret;
-
-		/* The LED endpoint is initialised in two HID */
-		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
-		if (ret < 0)
-			return ret;
-
-		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
-		if (ret < 0)
-			return ret;
+	ret = asus_kbd_init(hdev);
+	if (ret < 0)
+		return ret;
 
-		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
-			ret = asus_kbd_disable_oobe(hdev);
-			if (ret < 0)
-				return ret;
-		}
-	} else {
-		/* Initialize keyboard */
-		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
-		if (ret < 0)
-			return ret;
+	/* Get keyboard functions */
+	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
+	if (ret < 0)
+		return ret;
 
-		/* Get keyboard functions */
-		ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
+	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
+		ret = asus_kbd_disable_oobe(hdev);
 		if (ret < 0)
 			return ret;
-
-		/* Check for backlight support */
-		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
-			return -ENODEV;
 	}
 
+	/* Check for backlight support */
+	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+		return -ENODEV;
+
 	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
 					      sizeof(struct asus_kbd_leds),
 					      GFP_KERNEL);
-- 
2.48.1


