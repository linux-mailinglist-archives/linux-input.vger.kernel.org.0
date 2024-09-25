Return-Path: <linux-input+bounces-6698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F4985ADC
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 14:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A271C23EC0
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E8218FC7E;
	Wed, 25 Sep 2024 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JniDXSH6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E218FC74;
	Wed, 25 Sep 2024 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264762; cv=none; b=scxoP1wAybgqXQPzORvZdY9Qb6anBGS0imZpo3jC9+bIustyMAGgbIjcesuDnd34AtyDM174Ilik+wQdEABo9fU/PIvVkLWI4aZ1S6hEO94Qy8THYon5iZRw6Wj19ueaEUr6sB9z+ZUJKosqpS4+LDZRu1+q7Q2fkJq8PiK/fbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264762; c=relaxed/simple;
	bh=SW7PU2WdimJ4gHFwg7uw/EbHyN5KiO3AXMYHLsUw23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DA+CTQElEUWf/L6TgUcVPL9M4IkZyy6vSYCmyrS7ol6UviXgcG/PkJstGm7gKGdbM/WtMR59+hAD0Jk4nPweJly38ykoYkkLMyHePRyTBjGu3MQwAFhJh7sGUgMB2VyBysDDpXbVwWhGEZjUWIPzwFCftanZ1NTcVQ0ECQio6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JniDXSH6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4DDC4CEC3;
	Wed, 25 Sep 2024 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264762;
	bh=SW7PU2WdimJ4gHFwg7uw/EbHyN5KiO3AXMYHLsUw23A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JniDXSH6Vp0yLudy7GMu08NixmXeG3hea9HBau2eH3kYDASNYahYCndGiUa4qYhUG
	 7zY2i0pfKFun81XY+YnYQlpCgMN8TpamZXaCR6J4q3xB6o0hZJQHpm40Lszd+u4Neb
	 cVUpBlk+mVA0R4CVIMIIt5uuD6+bbr4hP/BNY5wLcmNJVR/J5jaJkXFFY36rYtdhcm
	 hMh4p5ya4JmJwt1I+C44Ia8Fpehp/aWZkUQ4sPZgrpfXNQPXx9g9Ic24C4cPi5vePk
	 KPJ+3L/tUC99YrhCpUMtyrGmB6mtDipXifQCTW/UZCReVCtwZWqCVD3rx8rmVzOKHY
	 pnPGh5II1AWPw==
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
Subject: [PATCH AUTOSEL 6.11 149/244] HID: Ignore battery for all ELAN I2C-HID devices
Date: Wed, 25 Sep 2024 07:26:10 -0400
Message-ID: <20240925113641.1297102-149-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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
index 781c5aa298598..53655f81d9950 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -417,24 +417,8 @@
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


