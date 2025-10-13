Return-Path: <linux-input+bounces-15426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B849BD60BE
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FE7188FC14
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1395289E17;
	Mon, 13 Oct 2025 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RJ/rOLjJ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A632153D2;
	Mon, 13 Oct 2025 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386671; cv=none; b=WeBTjy5t3xAqDm1AHd8FkcD+mOGdwipIlE0ooY4ZXDwEXa/OqAgiiCR4tKlE/meMLD7m9YU62DGY5ClFAWQcbg86FDuFeYbsY+I7V4JGIzp0b+oza5eoBoxLtpsR8uM/dlQt6+DthPZrENi6eStrIbTIwGDDbvOrD8KHZL2GTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386671; c=relaxed/simple;
	bh=rlpDLaaREwfzK6sYx7OycZ3LKmEvwI0ygD0+uGbc7hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLYcsVj5Ixis/wxjhPWOZ2yxt1AhhJMMo4dJYT7U2MGSQ5rCbRMIUzQclaVTIzzQbivWEj/9PtTi6fuKzGJOJjsqgY/Vl0kem/pmTHWV0CxTQlx4SRFiYSRDn+9Pe+sbw95lQ+3xSXU7aMpeLjvyJb8RECXZjxobeAjvLkb2Uiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RJ/rOLjJ; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 7DFA8BDA52;
	Mon, 13 Oct 2025 23:17:42 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id BCFB8BD71C;
	Mon, 13 Oct 2025 23:17:41 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7FD731FDC0B;
	Mon, 13 Oct 2025 23:17:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386661;
	bh=qc+3LsItBV+z9wxTS44elVxHa73zsGTlYy1E2ZNNEr8=; h=From:To:Subject;
	b=RJ/rOLjJaJT1A5NSGrhFEc/R2POqrlcTfRCclng2SzvAce4ds913Xf900NkZP7g32
	 evdA5VXrrKMC4TMS7WL7/xEBN0ahi2NqJXs8ywFesLrNLXn/1bg+uHawt7H5Vr1vRy
	 e3g6mr0lBdIeq8NwvT28UswO7PGEuGxk9UlVC+zkJ8DCAv43ldk5uTWoe5oVHM1QTN
	 /3mY6NkGnVAx1HKvpL2oabeY2+6jkIfsSVs4ADuXomz7BjiXyrjF3pIipjlnRty+7x
	 Z48FNBgOFQ1eBvOfubF2IcMcTzceVRbEmpe8Zi63lWwU6ZD29gz6ZfBL8BK5qGDU4C
	 q5LKfyIcu66ag==
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
Subject: [PATCH v6 1/7] HID: asus: refactor init sequence per spec
Date: Mon, 13 Oct 2025 22:15:29 +0200
Message-ID: <20251013201535.6737-2-lkml@antheas.dev>
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
 <176038666140.3397346.12049812251057801568@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_init() uses a reverse engineered init sequence
from Windows, which contains the handshakes from multiple programs.
Keep the main one, which is 0x5a (meant for brightness drivers).

In addition, perform a get_response and check if the response is the
same. To avoid regressions, print an error if the response does not
match instead of rejecting device.

Then, refactor asus_kbd_get_functions() to use the same ID it is called
with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
in the future.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 91 ++++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 43 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a444d41e53b6..d0c783df99bc 100644
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
 
@@ -393,14 +393,37 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
 
 static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
 {
-	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
-		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	/*
+	 * The handshake is first sent as a set_report, then retrieved
+	 * from a get_report. They should be equal.
+	 */
+	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
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
+
+	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
+	if (!readbuf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
+				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0) {
+		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
+	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
+		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
+			FEATURE_KBD_REPORT_SIZE, readbuf);
+		// Do not return error if handshake is wrong to avoid regressions
+	}
 
+	kfree(readbuf);
 	return ret;
 }
 
@@ -422,7 +445,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	if (!readbuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
 				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret < 0) {
@@ -638,50 +661,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
-
-		if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
-			ret = asus_kbd_disable_oobe(hdev);
-			if (ret < 0)
-				return ret;
-		}
-
-		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
-			intf = to_usb_interface(hdev->dev.parent);
-			udev = interface_to_usbdev(intf);
-			validate_mcu_fw_version(hdev,
-				le16_to_cpu(udev->descriptor.idProduct));
-		}
+	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
+	if (ret < 0)
+		return ret;
 
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
+	}
 
-		/* Check for backlight support */
-		if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
-			return -ENODEV;
+	if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
+		intf = to_usb_interface(hdev->dev.parent);
+		udev = interface_to_usbdev(intf);
+		validate_mcu_fw_version(
+			hdev, le16_to_cpu(udev->descriptor.idProduct));
 	}
 
+	/* Check for backlight support */
+	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+		return -ENODEV;
+
 	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
 					      sizeof(struct asus_kbd_leds),
 					      GFP_KERNEL);
-- 
2.51.0



