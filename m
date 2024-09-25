Return-Path: <linux-input+bounces-6707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0D985F61
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB6A1F25C36
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 13:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BF5223EE6;
	Wed, 25 Sep 2024 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfka6DFP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34522315C;
	Wed, 25 Sep 2024 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266538; cv=none; b=APKhvFlK2O1XxUsGDtojXt+LRr7ZdiF+MR1DSUcAuqjfW9wMRmnnQqINJtHVN0z1jW3r1fKSTUXw0almoetSUuo66JJaaAaT410MqcqH7R6IrN7yDuhwakCZ6GmnMBpyV/E3p9opIclMLJj5SZwrEIMbjbz9AGlmlh9JE5DeTe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266538; c=relaxed/simple;
	bh=kvyju/kigoKn+hsJz+3swqa1Eu8vgeIhMIOEK1XD+3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fG+pSjlcvglvIUgcK575P+Mif8VAly3WqnzyiU1OeSgbbcVj+AIBpBFWxU8bSvdUs9dLRBAUhQ565njwtMyHrrr7b5Kr98eGjfKniioRAgAGqXBNDOl8jmBZCbo3TBBrfRyOtlBhyPHqX3ww5CoUacG0CzBlKylE9BGH967sM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfka6DFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285CBC4CEC3;
	Wed, 25 Sep 2024 12:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266538;
	bh=kvyju/kigoKn+hsJz+3swqa1Eu8vgeIhMIOEK1XD+3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfka6DFPBbI2kwDFTk/X34IsFoeCIbSP8xc7WBU10vzkvOsq4aPr58/7j/7ZGx0tV
	 +29v/9V0FS62VhMl0NIYs2zp27b+OzmwA1bJXJro4w4+39vWlrw2y85hrM2CNIzJbu
	 Wf+5d4IHummjKl93u4WRJZac969OkxFLGhBY+Cmywz6o94ZfrZ2pan+YtpsqM2+lY6
	 cwUu/lgT5noyAPJhS3XClgGIXlgPgcNpN6NNaW3wAw2IvivYZGSFisJaZJeceuP3ye
	 IXq8kpIzv4cyPaAVH1jw9GblKHJkDLuB1yciqbM26sFnW51JhsT848LWysrRYD7CJ9
	 Ro7ThKGTHhmDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Louis Dalibard <ontake@ontake.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 090/139] HID: Ignore battery for all ELAN I2C-HID devices
Date: Wed, 25 Sep 2024 08:08:30 -0400
Message-ID: <20240925121137.1307574-90-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit bcc31692a1d1e21f0d06c5f727c03ee299d2264e ]

Before this change there were 16 vid:pid based quirks to ignore the battery
reported by Elan I2C-HID touchscreens on various Asus and HP laptops.

And a report has been received that the 04F3:2A00 I2C touchscreen on
the HP ProBook x360 11 G5 EE/86CF also reports a non present battery.

Since I2C-HID devices are always builtin to laptops they are not battery
owered so it should be safe to just ignore the battery on all Elan I2C-HID
devices, rather then adding a 17th quirk for the 04F3:2A00 touchscreen.

As reported in the changelog of commit a3a5a37efba1 ("HID: Ignore battery
for ELAN touchscreens 2F2C and 4116"), which added 2 new Elan touchscreen
quirks about a month ago, the HID reported battery seems to be related
to a stylus being used. But even when a stylus is in use it does not
properly report the charge of the stylus battery, instead the reported
battery charge jumps from 0% to 1%. So it is best to just ignore the
HID battery.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2302776
Cc: Louis Dalibard <ontake@ontake.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h   | 16 ----------------
 drivers/hid/hid-input.c | 37 +++++--------------------------------
 2 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4246348ca16e9..ad4e5c5a38ad2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -411,24 +411,8 @@
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
-#define I2C_DEVICE_ID_HP_ENVY_X360_15	0x2d05
-#define I2C_DEVICE_ID_HP_ENVY_X360_15T_DR100	0x29CF
-#define I2C_DEVICE_ID_HP_ENVY_X360_EU0009NV	0x2CF9
-#define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
-#define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
-#define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
-#define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
-#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
-#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
-#define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
-#define I2C_DEVICE_ID_SURFACE_GO2_TOUCHSCREEN	0x2A1C
-#define I2C_DEVICE_ID_LENOVO_YOGA_C630_TOUCHSCREEN	0x279F
-#define I2C_DEVICE_ID_HP_SPECTRE_X360_13T_AW100	0x29F5
-#define I2C_DEVICE_ID_HP_SPECTRE_X360_14T_EA100_V1	0x2BED
-#define I2C_DEVICE_ID_HP_SPECTRE_X360_14T_EA100_V2	0x2BEE
-#define I2C_DEVICE_ID_HP_ENVY_X360_15_EU0556NG		0x2D02
 #define I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM	0x2F81
 
 #define USB_VENDOR_ID_ELECOM		0x056e
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c9094a4f281e9..fda9dce3da998 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -373,14 +373,6 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD),
 	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
@@ -391,32 +383,13 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGEE, USB_DEVICE_ID_UGEE_XPPEN_TABLET_DECO_PRO_SW),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_15),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_15T_DR100),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_EU0009NV),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_GO2_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_LENOVO_YOGA_C630_TOUCHSCREEN),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_13T_AW100),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_14T_EA100_V1),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_14T_EA100_V2),
-	  HID_BATTERY_QUIRK_IGNORE },
-	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_15_EU0556NG),
-	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
+	/*
+	 * Elan I2C-HID touchscreens seem to all report a non present battery,
+	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
+	 */
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.43.0


