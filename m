Return-Path: <linux-input+bounces-5342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C7947D3C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 16:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 231971F21DAC
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 14:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25C9762D2;
	Mon,  5 Aug 2024 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DetjwE/f"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B413C909
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722869517; cv=none; b=biKM8c7WNup+HXryVzobcgWx7ybWcgz/xll6xisM9jFNsnNqP6fyN8fhtFwFY5zhgbLGkSgvAlks5PhSZhkkSCviOymHeT4J89H28K8zykEmbNbkxMJ1XidGUECw4kF49c8nR5MWXIDpCWYz8LKkgRoCgnYHXd4jDRXShH0OPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722869517; c=relaxed/simple;
	bh=9leIO3g9xBCu6dvdJQeR7d0HaXrvU/onSbsJySFsfVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLtoRSvfOIbAus5ySnUNgxW3QUzke55lP7LZkyeqHSDea8DBCGsCXvJ+sdoPI4VDCQfoIiHYURH8p39G0KVmoKfW5doHWWFQZ/fdA4v17eRDbptMyAJDboYyxAExcM1rLDWIH3OsDKQcOvCArIfO7F6hA1Mci7pUdfubE2xpjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DetjwE/f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722869514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dJXhZm9S/kqfWIjZf1PfMh53bUGWEwD7uzpc//77xK8=;
	b=DetjwE/fBY7ZgWNJuFe1/Ti0DABQpZiXzJUmD6xtjsKuXqlnCdOssh4wPllC0cg+k2ZKTh
	W4O/Cl/8U6hU9x3MGM7gUZKr1eZT3k2xIuaHdWsfUneT7rvix2BxlypPKdWwqqC0vNo42p
	To+7a1QFNpgA9qmLU035XsnTf3wioHY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-Ks67LuoVOk67GCaDuzibUw-1; Mon,
 05 Aug 2024 10:51:53 -0400
X-MC-Unique: Ks67LuoVOk67GCaDuzibUw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B23E01955D48;
	Mon,  5 Aug 2024 14:51:51 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56B8E1955E76;
	Mon,  5 Aug 2024 14:51:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	Louis Dalibard <ontake@ontake.dev>
Subject: [PATCH] HID: Ignore battery for all ELAN I2C-HID devices
Date: Mon,  5 Aug 2024 16:51:47 +0200
Message-ID: <20240805145147.172362-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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
---
Note it has not yet been confirmed that this actually fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2302776
but given that the issue there is basically just needing nother
ignore-battery quirk and that this patch now sets that quirk
for all Elan I2C-HID devices I'm pretty sure that this does
actualy fix that.
---
 drivers/hid/hid-ids.h   | 16 ----------------
 drivers/hid/hid-input.c | 37 +++++--------------------------------
 2 files changed, 5 insertions(+), 48 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7ce1b..72936a523c54 100644
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
index c9094a4f281e..fda9dce3da99 100644
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
2.45.2


