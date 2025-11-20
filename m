Return-Path: <linux-input+bounces-16236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD0C734B6
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1C174E8DD9
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D8E3164DE;
	Thu, 20 Nov 2025 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TrC8ffgY"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B830DD14;
	Thu, 20 Nov 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631999; cv=none; b=bJLl4768y9+pYwPhymk6piiBGlt+Dy8seZALmCPGVwWuMY34wnhnq8AqccHaaFbi5AeTK1NIF5C4E3hTS6UOFFIHdAK2zP22dWgufqpmkIIKtjGsrW56OqXJ1GFiOaR8otWAZRc+9LeV81pBbupgxk4uDzVq8wjgjlxMO3CKc9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631999; c=relaxed/simple;
	bh=XczMuwY2PG08xrTAUAcEUtH2Au/kzFoR+YRNMCgIAK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHVkwLdh41SzEC6z13uICWCBwn3vZJY1LlBwXiD+MIXoXvDQvCkmSPPDNbJorWrRq9wZ/wc87LXEXYtpI+dosj8LKFWUlJwbfjjWT7iKrNT5wRA9scVvnfg2DfL5wToAKjt6FoOsozZG3LpEtqnd8G57BkiUnZUzpIl2j8ThATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TrC8ffgY; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 4E4473F3F6;
	Thu, 20 Nov 2025 11:46:30 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id BBC933F382;
	Thu, 20 Nov 2025 11:46:29 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A94FB1FE2E1;
	Thu, 20 Nov 2025 11:46:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631989;
	bh=HuBQqL+gPfeZK1b8cClnia9IRPHgXIRQ8d5AjKJGJqs=; h=From:To:Subject;
	b=TrC8ffgY5Cx0vxzCYTNUnK9BS0ZO2xQX/73k53OQUnkCOD1TGQsyJA/uxakD4WG60
	 sbRurbiueUEqX82JTHRUW+Ks7mbw9StDYfeVQ3Mc25GfAbZpajz9Zy26QjAs16RPoX
	 z8B7QS7YM4coBmpYDYuUcnkY4/ogfkRME7Jqe8ftW8o9XkTthxcSLMpk53D3hP47zs
	 yTjy5rYHIA3qp4hHdHlA/TlbsMru1E1pUBD3cYnbSwFelZw+VtraLowflwMesYemqH
	 f8ZEMVlJ4sg1bF5+c9hcCvfld2bnaMtYe996C/4EjbJbukF0qkf/Y7fi2sZbVfivR0
	 km9t1gjhuG/eg==
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
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 02/11] HID: asus: initialize additional endpoints only for
 legacy devices
Date: Thu, 20 Nov 2025 10:46:08 +0100
Message-ID: <20251120094617.11672-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363198926.1474935.11492040414026245180@linux3247.grserver.gr>
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

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 415d067938e3..db2cc9922447 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -89,6 +89,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
+#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -651,7 +652,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
 		return -ENODEV;
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
 		if (ret < 0)
 			return ret;
@@ -1375,10 +1376,10 @@ static const struct hid_device_id asus_devices[] = {
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



