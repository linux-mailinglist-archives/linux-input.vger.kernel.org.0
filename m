Return-Path: <linux-input+bounces-17126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2FD31E9F
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 14:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5AEC30A0F63
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 13:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2110A283FCE;
	Fri, 16 Jan 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dgCi6n9g"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5D226CE0A;
	Fri, 16 Jan 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570330; cv=none; b=eyJmhaKh8dqXfRBN1tDhgfyLd3Lykovqh6/yvyi2QB5HSRcUH8lCyfMKNPRD7hxNOle7AxY2bx0hEgYn2gpI5puAwOvDMQNdPPK9PfTpqcIpEGkvg+ta238Bclz9mct1xX9UWId1UCoyOz68ICKCTQNbMZHNMTOUUZNaevr8W8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570330; c=relaxed/simple;
	bh=1F/gx60RajL+YvcEpME2kqm7cIo73glNT0zTGoeIwaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCUS79BTEY2XubRwdUZ7DAVFdjq7V+6uR0bXqtstg4NY/NoLH++IFjTWdgY2dYxYerL7sFDgR0CcoVUgCNG+aySUf7sQDxFx/ftoym/wsr4HK3t/mNpFSGBTRMKNMWuv6RHKY4qGk4s0r3thTrrGf3EEantWYh7gxkjC3jl4SSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dgCi6n9g; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 7DFC4BC04F;
	Fri, 16 Jan 2026 15:32:01 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id BB541BC0A7;
	Fri, 16 Jan 2026 15:32:00 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c3:fefd:0:42c:a43d:2848:c282])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id BB29820258B;
	Fri, 16 Jan 2026 15:31:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768570320;
	bh=bfujesMJBE+aRyuNxZ0Tl8U2vZgGSJ4wLaIchfYocfs=; h=From:To:Subject;
	b=dgCi6n9glcv3S9AFqXOCawoHy0w3ZzZ2RAaDvJ0eNFCxX9ADd6QgedVfMdVmejCsy
	 WXcm+Vu0SgQLy6zb2ni9s9pThbkjNzlTGoxNxUg/3Fo17mCpSKLEHUGofk4znlWh2H
	 2EHKsLDo2rVzTCl3OdfTx+LFBHu4WBWbiuTLXNK4lZY94O9OhViyHP0BoWns+Vk/J3
	 gDNiLcGn5VlASr9Rn1+IdRSiLYJZ6SiGkHxNZi0WBLUc+YxRZKvwTMvO1D9Ty9NRBa
	 xehdmmldV8/lo8fIyJF8WiVxBqai4cVW9nQbgtvrV56a8Tz+YxsWI9CBgdtupYuUDN
	 pp/6otl53kbfw==
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
Subject: [PATCH v11 02/11] HID: asus: initialize additional endpoints only for
 legacy devices
Date: Fri, 16 Jan 2026 14:31:41 +0100
Message-ID: <20260116133150.5606-3-lkml@antheas.dev>
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
 <176857032035.3550222.11231665196123298108@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, ID1/ID2 initializations are performed for all NKEY devices.
However, ID1 initializations are only required for RGB control and are
only supported for RGB capable devices. ID2 initializations are only
required for initializing the Anime display endpoint which is only
supported on devices with an Anime display. Both of these
initializations are out of scope for this driver (this is a brightness
control and keyboard shortcut driver) and they should not be performed
for devices that do not support them in any case.

At the same time, there are older NKEY devices that have only been
tested with these initializations in the kernel and it is not possible
to recheck them. There is a possibility that especially with the ID1
initialization, certain laptop models might have their shortcuts stop
working (currently unproven).

For an abundance of caution, only initialize ID1/ID2 for those older
NKEY devices by introducing a quirk for them and replacing the NKEY
quirk in the block that performs the inits with that.

In addition, as these initializations might not be supported by the
affected devices, change the function to not bail if they fail.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 323e6302bac5..dc7af12cf31a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
+#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
 		return -ENODEV;
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
-		if (ret < 0)
-			return ret;
-
-		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
-		if (ret < 0)
-			return ret;
+	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
+		asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
+		asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
 	}
 
 	if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
@@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
-- 
2.52.0



