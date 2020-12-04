Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2262CE7BF
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 06:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgLDFqk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 00:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgLDFqk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 00:46:40 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0605C061A4F;
        Thu,  3 Dec 2020 21:45:59 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id p6so2503073plr.7;
        Thu, 03 Dec 2020 21:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIxbYegqQFre8x12h9MVkBbKb9p3m0mnJBU2PyAXKgc=;
        b=qU7nkVPSPkIrH3r+dw+Z1GJimEMVBs52fQmpg5zQmyy0NPap//Pv/TIqOUQ7aBw/2A
         i5sqb016MshvAlsODar402XyXMRt0W+ER704CzN/8RsYkqwuw/xKBHIma7771LHY0gh0
         nj2ATzkiVvoryeBnK5XxYvspexbdEjYgaLqEln+q9tPZMpimRinGbGJME7Ek2D/FCjVz
         cfoytbla25Skr2GMkXOZWgl4NcPNqqTdeOmNH5C+CZSD0K5m9WDlEkHmrTXgY9BHTLvp
         UpQt7ZRYUVYf31iG2r+7E6Bf6kyn5qHbNAc3A1vZSFWaqwu05RWgDmfw8xh1xYlAn9Ow
         Dxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIxbYegqQFre8x12h9MVkBbKb9p3m0mnJBU2PyAXKgc=;
        b=e/MNFQluQOeCcGa/OhZH+U87Ti11V8Qp6Exa6pGdPjZkPnlI1w7H43RixkhNwo55K0
         p13YZkoM60A0zkJZrhM6fUpyMHdhf3r/HUZrhjVfmhLXd8tG1dHDsvm2fsCmkIogYAOM
         m5GItyI3veX5VkyYSQzD7RXkPQ0sI/PpAt4/wiB9fzB1nmlMcaQFJv/xIsq+OwgYQK7u
         /HUTOs9cJmNsJyXGT3abFGF9kgY75tERauVFKo6T/6WJkMeU3fymg+LMgvUp0vCkKBAO
         ToCUCgV95tmk0nAXLWjFuIvKnA/kJlo/Mp4+0K0FSlmbTal6/YbVZFjiYdw/VS2uIUHH
         Ix5A==
X-Gm-Message-State: AOAM5325STLlXtUToPRwy/zRp8GQxdx37q9mDc4Xny4O3om2rWG139bR
        n/UZ6wRvrUWfQYJrb3uYgT0QgYZXEzWcPDvT
X-Google-Smtp-Source: ABdhPJzpUblVaIcJu9Qt7AsYpLKKWE8qbW3qhozhE3gIctKpgDg/axFG3pNNKUrAGd30th74JqYO8Q==
X-Received: by 2002:a17:902:76c8:b029:d9:d6c3:357d with SMTP id j8-20020a17090276c8b02900d9d6c3357dmr2637785plt.34.1607060759488;
        Thu, 03 Dec 2020 21:45:59 -0800 (PST)
Received: from archlinux.GovzHome.Govindz.co.nz ([2407:7000:aa27:b302:92e6:aee5:1373:39cd])
        by smtp.gmail.com with ESMTPSA id m5sm950836pjl.19.2020.12.03.21.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 21:45:58 -0800 (PST)
From:   sanjay.govind9@gmail.com
To:     jikos@kernel.org
Cc:     Sanjay Govind <sanjay.govind9@gmail.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pascal.Giard@etsmtl.ca
Subject: [PATCH v2] HID: sony: Add support for tilt on guitar hero guitars
Date:   Fri,  4 Dec 2020 18:45:27 +1300
Message-Id: <20201204054526.148299-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130194314.89509-1-sanjay.govind9@gmail.com>
References: <20201130194314.89509-1-sanjay.govind9@gmail.com>
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

Fix some incorrect constants after a refactor
---
 drivers/hid/Kconfig    |  1 +
 drivers/hid/hid-ids.h  |  6 +++++-
 drivers/hid/hid-sony.c | 20 ++++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

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
index 326c4bdbd0ea..0b334a338b9a 100644
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
@@ -3145,8 +3147,14 @@ static const struct hid_device_id sony_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG_MR7U_REMOTE),
 		.driver_data = NSG_MR7U_REMOTE_BT },
 	/* Guitar Hero Live PS3 and Wii U guitar dongles */
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_GHLIVE, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
-		.driver_data = GHL_GUITAR_PS3WIIU},
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
+		.driver_data = GHL_GUITAR_PS3WIIU | GH_GUITAR_CONTROLLER },
+	/* Guitar Hero PC Guitar Dongle */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE),
+		.driver_data = GH_GUITAR_CONTROLLER },
+	/* Guitar Hero PS3 World Tour Guitar Dongle */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE),
+		.driver_data = GH_GUITAR_CONTROLLER },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.29.2

