Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41052C8E4E
	for <lists+linux-input@lfdr.de>; Mon, 30 Nov 2020 20:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgK3Toz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Nov 2020 14:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgK3Toy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Nov 2020 14:44:54 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EE7C0613CF;
        Mon, 30 Nov 2020 11:44:07 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id k11so10724109pgq.2;
        Mon, 30 Nov 2020 11:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYXZYz7t8iKyLXm09G0wi2yo2X7rJ2ES4ZGNlSW38fQ=;
        b=GoxIhQfMJRIk0oY4XBWN6+7MQWtlUQXogv4yqnRE82NdIFV2JwCP4TZTkKpIgWOpBj
         ks6Heak+Yzhq0bSADfoMvFriJ8j/PLctPH+xq3nG2RsC8+D7aMc81DNq3WWXY5CDPCUR
         WlMBC5XAkW19YJu2Q2+qPYCYCG1Zixr/ZigjDgYoGmhxLG0VxtbSMd+0Rj1PsHqQGWAm
         FuulMoggcUBr14Ny6y148XFbc29qS0pj4lDwpSx2DTKA/2JMKX0GGFPBfxAasi7S3AgK
         SX/CO+rKIQpeG0JOw3rhJjNuQvfxYWFvfagwJiizSkz6zhtVJY87iWGPK2kLN/ziBOtd
         XCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYXZYz7t8iKyLXm09G0wi2yo2X7rJ2ES4ZGNlSW38fQ=;
        b=qYlcUlhYfVA/5NEUydqxak8+SjA6QUNCy17T5R7/2kd0sy4/awOdxOmXsfaCJT+yra
         BS6VbLJPZmxi2twCemMEwKBjgwoTgwrMZd2RI/3tdXVILe1miudzY0VJ7qRmjEefssyx
         pNM+0b9z1E3qGVKxdPi4eJSJo4RYxlRzP3BahczunRzulx53z/v8LA4MWdIrq/j6cRmC
         DduD4hB3thYpbt8ivH1lKAcyoG72zfI4ZJdEs/xvlJ8nIp3mx03eN7Bi5QyZHfNzoL2Y
         qMLI8trB2MfbYbTRt6nsE3yv6Opa2WsSM1StEGYHG7g/cvB1+a5gTc69TIFaxJbuurxz
         46bA==
X-Gm-Message-State: AOAM533bZhfy0O/ZkTdfi4TGtgyHcxR7NofEwr1nMY+GS7fMtAfVVcpz
        2Wy+gemDjbwJ9rwjASKLmcs=
X-Google-Smtp-Source: ABdhPJzjAptZ9d9FazY901gm/gg5JD4GwqG0LgMjDZEEudgRoUQIudAATHudvkwQj6YFpcwXGS3sKg==
X-Received: by 2002:a63:545:: with SMTP id 66mr6329239pgf.220.1606765447060;
        Mon, 30 Nov 2020 11:44:07 -0800 (PST)
Received: from archlinux.forge.wetaworkshop.co.nz ([2407:7000:aa27:b302:92e6:aee5:1373:39cd])
        by smtp.gmail.com with ESMTPSA id m14sm17186913pgu.0.2020.11.30.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:44:06 -0800 (PST)
From:   sanjay.govind9@gmail.com
To:     jikos@kernel.org
Cc:     Sanjay Govind <sanjay.govind9@gmail.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pascal.Giard@etsmtl.ca
Subject: [PATCH] HID: sony: Add support for tilt on guitar hero guitars
Date:   Tue,  1 Dec 2020 08:43:15 +1300
Message-Id: <20201130194314.89509-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sanjay Govind <sanjay.govind9@gmail.com>

This commit adds support for tilt on Standard Guitar Hero PS3 Guitars, and GH3 PC Guitars, mapping it to ABS_RY.

Note that GH3 PC Guitars are identical, only they use different VID and PIDs.
Also note that vendor id 0x12ba is used by a variety of different rhythm controllers on the ps3.

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
 drivers/hid/Kconfig    |  1 +
 drivers/hid/hid-ids.h  |  6 +++++-
 drivers/hid/hid-sony.c | 18 +++++++++++++-----
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 18b3ad50e1ca..02124c2c4b2e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -908,6 +908,7 @@ config HID_SONY
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
 	  * Guitar Hero Live PS3 and Wii U guitar dongles
+	  * Guitar Hero PS3 and PC guitar dongles
 
 config SONY_FF
 	bool "Sony PS2/3/4 accessories force feedback support" 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index eee6e27d5f1e..3479ae7dd651 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -40,6 +40,9 @@
 #define USB_VENDOR_ID_ACTIONSTAR	0x2101
 #define USB_DEVICE_ID_ACTIONSTAR_1011	0x1011
 
+#define USB_VENDOR_ID_ACTIVISION	0x1430
+#define USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE	0x474c
+
 #define USB_VENDOR_ID_ADS_TECH		0x06e1
 #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X	0xa155
 
@@ -1074,8 +1077,9 @@
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
 #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER	0x1000
 
-#define USB_VENDOR_ID_SONY_GHLIVE			0x12ba
+#define USB_VENDOR_ID_SONY_RHYTHM	0x12ba
 #define USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE	0x074b
+#define USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE	0x0100
 
 #define USB_VENDOR_ID_SINO_LITE			0x1345
 #define USB_DEVICE_ID_SINO_LITE_CONTROLLER	0x3008
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 326c4bdbd0ea..94dca5a5d361 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -12,6 +12,7 @@
  *  Copyright (c) 2014-2016 Frank Praznik <frank.praznik@gmail.com>
  *  Copyright (c) 2018 Todd Kelner
  *  Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
+ *  Copyright (c) 2020 Sanjay Govind <sanjay.govind9@gmail.com>
  */
 
 /*
@@ -59,7 +60,8 @@
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
 #define SHANWAN_GAMEPAD           BIT(16)
-#define GHL_GUITAR_PS3WIIU        BIT(17)
+#define GH_GUITAR_CONTROLLER      BIT(17)
+#define GHL_GUITAR_PS3WIIU        BIT(18)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -84,7 +86,7 @@
 #define NSG_MRXU_MAX_Y 1868
 
 #define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
-#define GHL_GUITAR_TILT_USAGE 44
+#define GUITAR_TILT_USAGE 44
 
 /* Magic value and data taken from GHLtarUtility:
  * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
@@ -692,7 +694,7 @@ static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR) {
 		unsigned int abs = usage->hid & HID_USAGE;
 
-		if (abs == GHL_GUITAR_TILT_USAGE) {
+		if (abs == GUITAR_TILT_USAGE) {
 			hid_map_usage_clear(hi, usage, bit, max, EV_ABS, ABS_RY);
 			return 1;
 		}
@@ -1481,7 +1483,7 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & DUALSHOCK4_CONTROLLER)
 		return ds4_mapping(hdev, hi, field, usage, bit, max);
 
-	if (sc->quirks & GHL_GUITAR_PS3WIIU)
+	if (sc->quirks & GH_GUITAR_CONTROLLER)
 		return guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	/* Let hid-core decide for the others */
@@ -3146,7 +3148,13 @@ static const struct hid_device_id sony_devices[] = {
 		.driver_data = NSG_MR7U_REMOTE_BT },
 	/* Guitar Hero Live PS3 and Wii U guitar dongles */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_GHLIVE, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
-		.driver_data = GHL_GUITAR_PS3WIIU},
+		.driver_data = GHL_GUITAR_PS3WIIU | GH_GUITAR_CONTROLLER },
+	/* Guitar Hero PC Guitar Dongle */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR),
+		.driver_data = GH_GUITAR_CONTROLLER },
+	/* Guitar Hero PS3 World Tour Guitar Dongle */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE),
+		.driver_data = GH_GUITAR_CONTROLLER },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.29.2

