Return-Path: <linux-input+bounces-16286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C170DC7CD2B
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C2D3A8D06
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7033B2FC860;
	Sat, 22 Nov 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="PvpWTWhW"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1193261B9D;
	Sat, 22 Nov 2025 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809277; cv=none; b=OmlURb5vsePll8qNsVuczoBjJwm3470v2IGtxVlgwzRBPDJgjyZVnRX3TOyuw9RmRul+SsYxTjrZ/lW9lb3CyhDpIoC/KGk99bpwMLctpXtYjVowl2K6uWPyHETv16I0pYgLebKmHNxVXiQvbmLTo0l9DtRdPNByXZNy084JKdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809277; c=relaxed/simple;
	bh=INPwnY/Pxf/NDxHN1ORC7NA4csVwVDxsp5AjG/r1gWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVcCa8/bguevNy5zqnD05PzP1Fe9v1v6yR6A9obzT+VKza4fkfnpIh5ICCCNGLXfA+7RCjKLMb3PT1e7zd1TsqT8/5vnlz5VGvZF0bXc2ZbT0rQ8OV4KlZyUY+MMJx+h0GcyCDFuX6pPVYdHLiBhHMwaKuZIcy9/azkNNat9ni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=PvpWTWhW; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 063D6C1650;
	Sat, 22 Nov 2025 13:01:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C443BC01F9;
	Sat, 22 Nov 2025 13:01:02 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 47A7A1FFF8A;
	Sat, 22 Nov 2025 13:01:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809262;
	bh=dDd0sr0qoT0Cifr9Bly8kpqt2o3XOW4nXAcAAHiunRs=; h=From:To:Subject;
	b=PvpWTWhW7YtjdOshGNw4DErvIRs9nmF2pms/Bu2zFCOpBxZsmrJRgQrdPeQUc3Wda
	 WLHd5aKSb7eqcYOEY1gb2/Qm4Jucah2b6/MT1wVT0R7DMDQdsuitv34UJZu+cUYE2z
	 EuIYkJM6CBxeIvmpPGCRyEVZFNT109R/1Kl5BLjwooD6JQfZFsQg/tn2LNOSaPLxCM
	 ve2711UiidyxPg3GeHG4t1/wde3NfY/L8x1WpAz+QVlCJtzlyiOYCpLGKqP8ruUNWU
	 mBlczPsfxsYUml0gfcvu1i3hnKbIT1K2GX+N9Qw0aTk+WszbY9rLzqgOb6uP3z9Pf4
	 pasN9QwG2K1DA==
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
Subject: [PATCH v10 02/11] HID: asus: initialize additional endpoints only for
 legacy devices
Date: Sat, 22 Nov 2025 12:00:23 +0100
Message-ID: <20251122110032.4274-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926217.358160.9281542325823852467@linux3247.grserver.gr>
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
index a82286a427b8..9004814fb0d3 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
+#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -652,7 +653,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
 		return -ENODEV;
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
 		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
 		if (ret < 0)
 			return ret;
@@ -1376,10 +1377,10 @@ static const struct hid_device_id asus_devices[] = {
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



