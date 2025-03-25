Return-Path: <linux-input+bounces-11272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5146A709B2
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCB0B189FAE3
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3051FDE01;
	Tue, 25 Mar 2025 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QuxRH2Cq"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992611FCFF2;
	Tue, 25 Mar 2025 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928390; cv=none; b=RiEsDRvob3xZnmlKcQkTAb4qNiF7PdwOSl/8DWWbKD4cY0pG0y52pHM2tOCvXN7FbMNxT/s/ixytSmqw005/7WYuZtEp0kcyOVdOtq8BWoU3YhV/iAk+IozxNUPn+lTKgkA98R5vEOL50czRIAsg5QGNwxziI/4O6KkdHAAOwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928390; c=relaxed/simple;
	bh=cnyYgtOi5KNtxZEDgq5Z8kRh7d0LELzKtjDTyWT0K08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4kHtBiGBw/MPDNERHBuGwOLWTwbvlIw3Q6fxrJoZhJM8zpa72o/wWi1yk/22U9DGEMLSe5VlbCCST8SuMOU2yL8LA97wzERT3M12FLRxhUbZO5Br29PsI715RXJTOmuv61yU40LPWa9odH0MlQxw2Eht+zViKaQhx97SC0TrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QuxRH2Cq; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 4091E2E024F9;
	Tue, 25 Mar 2025 20:46:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928386;
	bh=az0RkbSqa+vM4kpXbq8OEgK4+Zp0D8jSA5cGFeYf7oo=; h=From:To:Subject;
	b=QuxRH2CqGDrGUpf5qypp6+MVHwQ/aMCEStrdrDLEilZ9gKlVY4coSeT3SWcKTKkSG
	 MhMOHCyECvIALlBw9/FrwoUu7iXGH0D0CU4sN4edFFFo3QqLk3qD4OmBmGbIIcYlbh
	 Xai//HmQqCzxgq3uQcRd4XPzW4Fg5b5TUyXZyiq4=
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
Subject: [PATCH v5 11/11] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
Date: Tue, 25 Mar 2025 19:46:00 +0100
Message-ID: <20250325184601.10990-12-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292838629.8406.5763028106211749699@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

These keyboards have always had initialization in the kernel for 0x5d.
At this point, it is hard to verify again and we risk regressions by
removing this. Therefore, initialize with 0x5d, and skip RGB
initialization if that is enabled.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index fa8ec237efe26..d02d0629d03cd 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_HANDLE_GENERIC		BIT(13)
 #define QUIRK_ROG_NKEY_RGB		BIT(14)
+#define QUIRK_ROG_NKEY_LEGACY		BIT(15)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -647,12 +648,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	unsigned char kbd_func;
 	struct asus_kbd_leds *leds;
+	bool rgb_init = true;
 	int ret;
 
 	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
 	if (ret < 0)
 		return ret;
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
+		/*
+		 * These keyboards might need 0x5d for shortcuts to work.
+		 * As it has been more than 5 years, it is hard to verify.
+		 */
+		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
+		if (ret < 0)
+			return ret;
+
+		rgb_init = false;
+	}
+
 	/* Get keyboard functions */
 	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
 	if (ret < 0)
@@ -683,7 +697,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	leds->rgb_colors[0] = 0;
 	leds->rgb_colors[1] = 0;
 	leds->rgb_colors[2] = 0;
-	leds->rgb_init = true;
+	leds->rgb_init = rgb_init;
 	leds->rgb_set = false;
 	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 					"asus-%s:rgb:peripheral",
@@ -1415,10 +1429,10 @@ static const struct hid_device_id asus_devices[] = {
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
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
-- 
2.49.0


