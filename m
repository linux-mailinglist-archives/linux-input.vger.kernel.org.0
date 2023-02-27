Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 038416A3939
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 04:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjB0DHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Feb 2023 22:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjB0DHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Feb 2023 22:07:30 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF32412861
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 19:07:27 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id c1so5321890plg.4
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 19:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1bajlVaeym9e7MvQ7OtWjtJKO/KD90961cqLQi69h0=;
        b=pG0I2+nsXzyYx1r2AQVxmegKtqReT6Jwag8NlW7Z1R+aPTU+JWy78yA7cYGlbEDR8y
         5nQlOV5Yns3fQMKpgzl3DkocUxVMz+Z7kd7o2z9PaCIg70SfjoOxZMtwU5klHg1EbyeI
         zqpXJeHtYyQWI1ZOOF3TkKagCZLmOSw612kNE340AmTrtBUGJ7O/Y3MK104UjRVuovlf
         Ma7X+d9smPoh9ARFw4yV/f+nVbmhWzEZ/ZC3SwLkbCrcC32SjuUWbn5pOXzHWNkE0MnH
         6nYAeJlFoMILtAVACODqd/EsYdMj1js+8Fnw0lxWN3dnPtYjrpNJOyy/swA64lZNJM/U
         jb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1bajlVaeym9e7MvQ7OtWjtJKO/KD90961cqLQi69h0=;
        b=uZGcDcOeEWHC/p8AKYfaEpnqGywpxvXvg9Wse1BFyC5bGocAF5QgZ2kr962Jhu2TCN
         XFsKybVvDGAgecJ9jcTbOs+KIRbUfdT54SViORnun7eZKrP7Azh7vfXqET3/kY38G9Yp
         HtsdnAUozEoUDm6SSu47xnpq90ZBXUgqyMmFdIgGo7aTdv4xM0vSpxxsfr4nFIeQU/w2
         Hq5cHNMgoQEKaRZxjS6/XmDskZqkHtPmLojGNrJcWv5N9n80TtDO+k7nZIpAZsTbf62h
         9iDgPlzWDukzwZclEIQWVmLiJ8uvBntBtAZBOlNMJRqeAewRDcMlEuzlULsQJxLN9IFP
         9Igg==
X-Gm-Message-State: AO0yUKUiTmyehaRGLEYmaFbRoX9A0056RVRyjtasgtLxSUu5S8XLXTI9
        7tsj5WGUEP1q7fDHsoiXezRixIy5ciQ=
X-Google-Smtp-Source: AK7set9S/LPxfmZYFp8GULK2kj11iXb3Ot+LGQ55eOy9nCnBMbPWxWwF/mTP/hNNgmY5ewpDbEcI6w==
X-Received: by 2002:a17:902:da91:b0:19a:f02c:a05b with SMTP id j17-20020a170902da9100b0019af02ca05bmr29405864plx.3.1677467246723;
        Sun, 26 Feb 2023 19:07:26 -0800 (PST)
Received: from xavier.lan ([2607:fa18:92fe:92b::2a2])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b00196047fc25dsm3328245plq.42.2023.02.26.19.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 19:07:26 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jkosina@suse.cz
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2] HID: apple: Set the tilde quirk flag on the Geyser 4 and later
Date:   Sun, 26 Feb 2023 20:06:13 -0700
Message-Id: <20230227030614.827480-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I recently tested several old MacBooks and as far as I can tell, all
MacBooks that have an ISO keyboard have the tilde key quirk:

Product    Model  Year  System      CPU    Shape  Labels     Country  Quirky
============================================================================
05ac:021b  A1181  2006  MacBook2,1  T5600  ISO    British    13       Yes
05ac:021b  A1181  2007  MacBook2,1  T7200  ISO    Québécois  13       Yes
05ac:0229  A1181  2007  MacBook4,1  T8300  ANSI   Usonian    33       No
05ac:022a  A1181  2007  MacBook4,1  T8100  ISO    English    13       Yes
05ac:022a  A1181  2007  MacBook5,2  P7350  ISO    Québécois  13       Yes
05ac:0237  A1278  2008  MacBook5,1  P7350  ISO    Dutch      13       Yes
05ac:0237  A1278  2009  MacBook5,5  P7550  ISO    British    13       Yes

The model number and year are from the laptop case. Since Apple printed
the same model and year on many different laptops, the system name (as
reported in the SMBIOS tables) and CPU form a more precise identifier.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
v2: Added system names from SMBIOS tables to commit message, no code
changes
---
 drivers/hid/hid-apple.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 1ccab8aa326c..5c145775482b 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -882,7 +882,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_RDESC_JIS },
@@ -901,7 +902,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_RDESC_JIS },
@@ -942,31 +944,31 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ANSI),
-- 
2.39.2

