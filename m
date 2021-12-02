Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2FF465E27
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 07:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhLBGUy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 01:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbhLBGUx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Dec 2021 01:20:53 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B3AC061574
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 22:17:30 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id q16so26015771pgq.10
        for <linux-input@vger.kernel.org>; Wed, 01 Dec 2021 22:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GajwMokPHBEeO5qEyHkNbV2lIovNdl91vvLNoj3avsk=;
        b=kgrkjbjbcCR/cypm1MofXVbS2paiAHVVHTkhGDmdMBp8ldRyfe2Ix5IJ2cUyzUSFVO
         KCMjMEPGnBqcZ96TY76rlkKrGYKBcvPQ7UGnpW9XYEeTVmLKOL+tM3uJT4mK1uWC0z0p
         4Pha/J1WCUmvpmaVaH5fykUnv+mboTifXDTwjTIGT56lt64EagaAMnBan+hbxStImGoy
         T05k03IDaGa++mibRIPOMj6x8sjAe4+6wXMs7Ni5gnNh3orWZhAoC5htgduYI370dq9T
         lxNlUC1xOGUQkgweF5KZ6+hT/isOybXr5Cj+Xnl0qIN3XatJ0I+7D+XX3YGfzdDVD/A0
         gm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GajwMokPHBEeO5qEyHkNbV2lIovNdl91vvLNoj3avsk=;
        b=VB75qVhhzxoUXP7b3ly7Vxa6rn9ujehq2IwwAmawUy76aGfzkE5lOqRBHIlpG/Iwvz
         UOUaaRkD+/3NYXgJXN2GPvYyY5VlVI3XIxCNVOdq9MrqQx58W+DeNTJRTnGftTJsWW4t
         /duakx4u5z9SYCHq3jpIMtVyzajl3BHtQNoQTaMlrj/rSAmJ7r4Ac5uueocVUuWpN+OM
         /jwu3BsqfVpGj1T1YyDNB4TXE4LHR6qQpLkibeJWo6tTRIYe7fkJ14GfDnUFFUJvQ1CC
         tX070SmvE6BzEHu69S+miv4rWSauEb+U+eQMFkvD/u7npMrqGYkcOBjs+B1mKRMzQdEc
         rnGg==
X-Gm-Message-State: AOAM532vphqeLsP8S/cxRc98mRHI/XsfIk3M6dkenB+EpVY1T3T8XYOO
        8jk1ahgim19erz+60MZ7y3UzD5QwHfY=
X-Google-Smtp-Source: ABdhPJx+w9kQ0w2bbZwjEfOf4N2ItKZ6Gc1EWvD0VcWKVzR+vphksiPhkK4Av8n4WUh03PgXSojBQA==
X-Received: by 2002:a63:755b:: with SMTP id f27mr8146165pgn.321.1638425849488;
        Wed, 01 Dec 2021 22:17:29 -0800 (PST)
Received: from xavier.lan ([166.70.246.164])
        by smtp.gmail.com with ESMTPSA id x33sm1663763pfh.133.2021.12.01.22.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 22:17:28 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin@sipsolutions.net, bberg@redhat.com,
        jose.exposito89@gmail.com
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 1/2] HID: apple: Add 2021 Magic Keyboard with fingerprint reader
Date:   Wed,  1 Dec 2021 23:16:50 -0700
Message-Id: <20211202061651.115548-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c  | 4 ++++
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 2c9c5faa74a9..b2d8bcd86bd5 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -640,6 +640,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 
 	{ }
 };
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 96a455921c67..8c70a731ef46 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -175,6 +175,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 
 #define USB_VENDOR_ID_ASUS		0x0486
 #define USB_DEVICE_ID_ASUS_T91MT	0x0185
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 06b7908c874c..319bbae7ff62 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -303,6 +303,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021) },
 #endif
 #if IS_ENABLED(CONFIG_HID_APPLEIR)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_IRCONTROL) },
-- 
2.34.1

