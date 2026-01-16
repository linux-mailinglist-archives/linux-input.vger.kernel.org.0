Return-Path: <linux-input+bounces-17127-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86070D31EAE
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 14:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3B230FDEFA
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 13:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DCD284B3E;
	Fri, 16 Jan 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QYPPBgc/"
X-Original-To: linux-input@vger.kernel.org
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5933277CA5;
	Fri, 16 Jan 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570330; cv=none; b=KH9EP/FISnZCc/fOoLHnExdIgjmxVMXzikQPfMouWnOYVF3GeZnQEwYCO8xO7APR6NFtaMXK7rRoAB/FsGuHjXpZE62bihg16XcrjIWwLX8x4t8pbykX0MzPWdgNpMZQSe8Dt36/73dF6ROHLteobpxubPzy4lFavQ+MnZ+dI54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570330; c=relaxed/simple;
	bh=xvCg7zOYdy9FyIIo4uzv80svRawVDeDbsraVxgub+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLcOwys7bLw5sDyMsLuwSUFV14VOHScr9VCFtrYm+rU/bcBdkaWGw/o331sy1R0l9gxdYynxOjs0+mv65lD6l5jbiNgqJWrj33JqUfxJrsBZlQVq+1CDEWJWoACvTgQRc7YDixxCmLL80hJomKRBfArhdO5Xgsb4JxwYSHoqqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QYPPBgc/; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id B9341409BF;
	Fri, 16 Jan 2026 13:32:00 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id EF4634094D;
	Fri, 16 Jan 2026 13:31:59 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c3:fefd:0:42c:a43d:2848:c282])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7E9B91FD57F;
	Fri, 16 Jan 2026 15:31:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768570319;
	bh=D08pQAfWzA5LBVvxbPafmANS5uUpsxec2CIzT0lSssM=; h=From:To:Subject;
	b=QYPPBgc/2l/JF11PHrczaiUTt3rDwE+eRday9yKUQC57CPE6Hp5GPq5Q/IRhKD/XH
	 ouZ5onuezFd7LcmvTvmYOjfIBygcAtFI9n+Z3BnCH5textq9I2HnnKgyJ8zRVJLYr8
	 Ot2iKfjyDOEff90VaS1ezh+lBq7r/6vJ24hwQAs5WCIMiEdG6wz+B6FXb8dtWVsm32
	 vuRFgXi0AaihKboZHRHDfIKbRyfSA6IE0Q6W/sNiP3Mto2V0k2zPqjkpyIHcp6bFwY
	 f6B2WYWc8ApgB9/MEinydyvaKxRgACnzwN2RmaAesOPBGvxacKiswlY9H906qpLpBd
	 SCert2sPQFS3Q==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c3:fefd:0:42c:a43d:2848:c282) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
	Denis Benato <denis.benato@linux.dev>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v11 01/11] HID: asus: simplify RGB init sequence
Date: Fri, 16 Jan 2026 14:31:40 +0100
Message-ID: <20260116133150.5606-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116133150.5606-1-lkml@antheas.dev>
References: <20260116133150.5606-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176857031947.3550173.4253814440876741287@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, RGB initialization forks depending on whether a device is
NKEY. However, in reality both initialization forks are the same, other
than the NKEY initialization initializing the LED_REPORT_ID1,
LED_REPORT_ID2 endpoints, and the non-NKEY initialization having a
functionality check which is skipped for the NKEY path.

Therefore, merge the if blocks, gate the ID1/ID2 initializations
behind the NKEY quirk instead, and introduce the functionality check
for NKEY devices (it is supported by them).

There should be no functional change with this patch.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 52 ++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 472bca54642b..323e6302bac5 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -639,13 +639,20 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	unsigned char kbd_func;
 	int ret;
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		/* Initialize keyboard */
-		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
-		if (ret < 0)
-			return ret;
+	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
+	if (ret < 0)
+		return ret;
 
-		/* The LED endpoint is initialised in two HID */
+	/* Get keyboard functions */
+	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
+	if (ret < 0)
+		return ret;
+
+	/* Check for backlight support */
+	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
+		return -ENODEV;
+
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
 		if (ret < 0)
 			return ret;
@@ -653,34 +660,19 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
 		if (ret < 0)
 			return ret;
+	}
 
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
-
-	} else {
-		/* Initialize keyboard */
-		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
-		if (ret < 0)
-			return ret;
-
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
+		validate_mcu_fw_version(hdev,
+			le16_to_cpu(udev->descriptor.idProduct));
 	}
 
 	drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
-- 
2.52.0



