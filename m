Return-Path: <linux-input+bounces-15848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E062C27BEE
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC6D3A285A
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4FD2C21F1;
	Sat,  1 Nov 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="S7netvRH"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF5202976;
	Sat,  1 Nov 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994040; cv=none; b=soLjB6HGttMY6FjARoFJtAAp0rf70wflTZsgF5A5WPrz3BgV9aIh6ivj1enwhA1si9y5zYLpbW9a5nZs9AU3UxaP5Gkxq/dCXi77/LHdRYAmOr/Ev4Ou23+hevcTQqhFc6GxnkrLAdQc6SEyjHckyrYB7TbPS+9eekarrW9xJvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994040; c=relaxed/simple;
	bh=UjOuX9/BbnJ9RsEIAnt1Ieid0/6suaQQrzhkfQxv8cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Am6HnrOnAAtTLVCnTE8Ab/XVFan8CEefhrN0+1mlsZ7K2ZTxaZHVpVrGuOvrjUTafAsNBKoOWAopNONLut3y8qPwBhNu5rTLEgfOOYf2rMB/A3ZSJh9zdkIyqJVNdPLhEKmBL/H3xBZI7l4mTJjJpik5CwFql1E2Qd6OXCUnXOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=S7netvRH; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 673FAC113D;
	Sat,  1 Nov 2025 12:47:16 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id EB6CFC10FB;
	Sat,  1 Nov 2025 12:47:15 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 16B3F2007D3;
	Sat,  1 Nov 2025 12:47:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994035;
	bh=f4GerbM+Sf2qFfTt4Gnn+zyb5DwLrfXW+1y82PL91aQ=; h=From:To:Subject;
	b=S7netvRHMHutfVWQTB/XTr75wjfAaKIjcgJb552SUskji6ibes/azwBZ/+tJKG/xe
	 xS2n1k9roPmzEWgTwY+MXKISnd+8X5ORe8v9Y8sgjC7YVMkGGl6exOi3BvLfUchadn
	 2ksy/u75Vg2rz9zFj4XCIFPgYz7MOBltq/tzuwP8DFCjEv6CMP7HBBux4lz74BkZAC
	 VZBkPNS7+0ezMflarUp7GLfapZAX1EvSZM7q0rzrmMHZv0rlAqwObrnm/AD5b+xFXj
	 SM6YQoV4WQsZQNutBsqCSfTJ8sHW1LsoNruFLuDaXYgf/CeSB9TWRrqtyF6NmCqaqO
	 1v40POmfYQsdw==
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
Subject: [PATCH v8 01/10] HID: asus: simplify RGB init sequence
Date: Sat,  1 Nov 2025 11:47:03 +0100
Message-ID: <20251101104712.8011-2-lkml@antheas.dev>
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
 <176199403562.3745545.346681419463454916@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, RGB initialization forks depending on whether a device is
NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
endpoints, and non-NKEY devices with 0x5a and then a
backlight check, which is omitted for NKEY devices.

Remove the fork, using a common initialization sequence for both,
where they are both only initialized with 0x5a, then checked for
backlight support. This patch should not affect existing functionality.

0x5d and 0x5e endpoint initializations are performed by Windows
userspace programs associated with different usages that reside under
the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
controls RGB and 0x5e by an animation program for certain Asus laptops.
Neither is used currently in the driver.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a444d41e53b6..7ea1037c3979 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
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
2.51.2



