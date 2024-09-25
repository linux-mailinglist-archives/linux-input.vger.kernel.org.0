Return-Path: <linux-input+bounces-6703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD8985DDB
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50C51B2D4E9
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 13:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442F5200131;
	Wed, 25 Sep 2024 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C899/ir6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA01B2ED5;
	Wed, 25 Sep 2024 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265928; cv=none; b=J9Qo9UyFD8nKz803r1DmM6VkCt/LfJogfcksMcIF6UJpwPFE4PacWoZCkcVyoBpWAeM2/jwPfcV589CxYc2JwS+IQUGcxIZ1lIaSmseUsmp2XDjQ3ntz+Rj8Qu4tDtiYoSQY8OaJIt8Fn+oC/tz64KUAcGsjDM6qObbWaVCV4vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265928; c=relaxed/simple;
	bh=wgI+Lb7Fcw/azkFQy/xY9VDIMMusdDJP18UL8Qu0csA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKdxe0lG36yvCr2n3juGZxsOYP/fB2FltM+tSaf7xHebnpYeMyLvov2D0M+RZe3cO1CcaIGV2tdsjzHSi1AZwdtACn3uxbGMr61TEaeUlOZ7TI1U2qFaGCIwO+Lo96nny4MTprxXv2Ueuc5LhXbcchaWk/KOBmKwfjqcZyMVnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C899/ir6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86498C4CEC3;
	Wed, 25 Sep 2024 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265926;
	bh=wgI+Lb7Fcw/azkFQy/xY9VDIMMusdDJP18UL8Qu0csA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C899/ir6v8nGGjlr8pxqkTqf0SKHH2DlurOHvMvgdTVSG+/95gfZSa+sl5jDInJ7A
	 GbnT9OTZOtZQLrH6PhaS30DeFioiF4UPxQH1lAj5gIjw761BuW4I+30RjC0UwpFo/W
	 UWTUIRnpqETJbTberKZFpDtij8+d/bEVxC2QY9u9dJW+6vZinD8rtzacrFdXwLnus8
	 0tW8tEitCbHzvN+UUwjD1XpJgdFrXbiscJYAT6aWAHGWUMbHdQvTKitCZg7zdINO5N
	 PGsiWE95XDaHD+rUy/xrZjur+U8E/k8cOoZE1Z5JBM6DJtfQdA1WMg3TzOmycaiV87
	 mfMqCOpvznQZQ==
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
Subject: [PATCH AUTOSEL 6.10 127/197] HID: Ignore battery for all ELAN I2C-HID devices
Date: Wed, 25 Sep 2024 07:52:26 -0400
Message-ID: <20240925115823.1303019-127-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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
index 72d56ee7ce1b9..72936a523c543 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -416,24 +416,8 @@
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


