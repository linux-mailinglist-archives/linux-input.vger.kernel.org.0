Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4362542654E
	for <lists+linux-input@lfdr.de>; Fri,  8 Oct 2021 09:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhJHHjN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Oct 2021 03:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhJHHjM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Oct 2021 03:39:12 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB10DC061570
        for <linux-input@vger.kernel.org>; Fri,  8 Oct 2021 00:37:17 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id u7so7435900pfg.13
        for <linux-input@vger.kernel.org>; Fri, 08 Oct 2021 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+jXb/u4Nu2v0/y0TpbZQTGUginK+N59q3pyzqXdN+BY=;
        b=TQ0C0GStxlREcwyFSOar+jbmZKyb1mXgfG+1LY4veiPTzClEXhn3CEceXuNvqdJ3le
         UXCf9J4thgXFtro59+usCxr/ssuPYKgqfhvX29IrEXsYe2sMKZdDw15t6g+aq50D42pF
         T9YnymxFdm3Wi2iPryh9/boBWQwMlBlvluPkdn3EtKv6FE8eceqGJmSCk9BhDm9uQO2f
         LFf61kgu/sT2jzMPStqtskpDXAdeMgInUKqGWGKr24geZMpr64Zt6ikshx+canZ+Ds60
         7QKuYDyuJnX5A3do80B9XSDNEqjjxuGSK4pY4UHyX+16yLbM6eLZ39rkzmpm4sZ5R24h
         Imyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+jXb/u4Nu2v0/y0TpbZQTGUginK+N59q3pyzqXdN+BY=;
        b=eFNtqqt0TuSzEMerhT+qkMNqpkFnY3kzuPJjGE8GLzPWGNjMaURsVMdCERA2ujt90G
         fbkhk38Pfpex7tn5SSgPUKFX29+nbjRO1cWmUUD0UKlncobsmr6q+01HRiITlokqXco0
         Si/N/uFY5zcK0/NJW/KlNkLah7ohMb0SoAHUsZysP/9bZs4O8nuWVN80uHf1Pv3PCEyq
         Lbn2EObRcwJ9wovTPa6rJPJGZkEaiazf2r7TGpcuta+EOsCMJYUrPA7J8tdCX9A73g2R
         /MqImnpX9SpW/IAMATayVcoisL13oVCQr6h8SRwD4xNu86ynidouWAg/80M2bcBqGEvl
         FRlg==
X-Gm-Message-State: AOAM533mz7iA7Ck2yECFPCR3FjtCPUYnIpmd1o/WDbZIKuSz6ogCYS5i
        wnleauP6Bfsqujd0eNXSKXHLVbV4xTY=
X-Google-Smtp-Source: ABdhPJxaCXRvsMAHBp8NG5z2SAIfo4TabeEqMJZ+3xQ+cs77kHQx7w/aeiRpDFuUNRAnLaIqkGqKAg==
X-Received: by 2002:a62:1ac3:0:b0:44b:85d0:5a98 with SMTP id a186-20020a621ac3000000b0044b85d05a98mr8592915pfa.18.1633678637037;
        Fri, 08 Oct 2021 00:37:17 -0700 (PDT)
Received: from xavier.lan ([207.135.154.184])
        by smtp.gmail.com with ESMTPSA id 22sm1556583pgn.88.2021.10.08.00.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 00:37:16 -0700 (PDT)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jikos@kernel.org, jose.exposito89@gmail.com,
        jslaby@suse.cz, juw@posteo.de, lukas@wunner.de
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 1/3] HID: apple: Rename MAGIC_KEYBOARD_ANSI to MAGIC_KEYBOARD_2015
Date:   Fri,  8 Oct 2021 01:37:00 -0600
Message-Id: <20211008073702.5761-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ANSI, ISO, and JIS variants of this keyboard all have the same
product ID.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c  | 8 ++++----
 drivers/hid/hid-ids.h    | 4 ++--
 drivers/hid/hid-quirks.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6ccfa0cb997a..6f019e4f7bba 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -544,13 +544,13 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
 		.driver_data = APPLE_HAS_FN },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI),
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
 		.driver_data = APPLE_HAS_FN },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_ANSI),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
 		.driver_data = APPLE_HAS_FN },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_ANSI),
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
 		.driver_data = APPLE_HAS_FN },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..c84ff8e4038f 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -159,8 +159,8 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI  0x0255
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO   0x0256
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI   0x0267
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_ANSI   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 2e104682c22b..256bf42f9629 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -299,7 +299,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
 #endif
-- 
2.33.0

