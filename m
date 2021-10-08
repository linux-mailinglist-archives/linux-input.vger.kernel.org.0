Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DCF42654F
	for <lists+linux-input@lfdr.de>; Fri,  8 Oct 2021 09:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbhJHHjO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Oct 2021 03:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbhJHHjO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Oct 2021 03:39:14 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36797C061570
        for <linux-input@vger.kernel.org>; Fri,  8 Oct 2021 00:37:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w14so5652499pll.2
        for <linux-input@vger.kernel.org>; Fri, 08 Oct 2021 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QoD1YkFciRZhqrXBVBN4kfBFUKcrV4f1F3xbpsUVZQQ=;
        b=UzbCv8uPx2nuJimFdfzuoAYHuUZCmsqKRJLqCp+iz+ZTGKiW24olcgR3Yi97k/fBtP
         DGzUjWhgqbc2rbjfpsXKC84/PMvpWA7v+1DxLOQ8Jv/80c2qPnuy2E0Id8WOIcQJdlWY
         EaHPOknKy+eGsDLyRIuU3PpSh5PITnyZ5lUfusUHXdBwPNY/qOS7ohuV+aQFUhqB3lrm
         FU93FERe0rmGbK9XQlKOdsP2bgev9r4idpgi4LwNX2Ya4bF35EjGyyMd3V+dEyl9PbQi
         JCgIfwlIokeDSpogTMZ8SyF6vzU500JZ8sh383SV9AxvFmB6XIvmt4wZJUM3c4fATaeq
         IB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoD1YkFciRZhqrXBVBN4kfBFUKcrV4f1F3xbpsUVZQQ=;
        b=BzKy6Fq0iDhTvCyqxvABjwb6vFqo7PfsNswdjcG4U2TqwtUTe0L8t1v22TVNKDi5SD
         WGwiJ0NpFaZCni0YRz4ibCTjtmt+eAkTiDVIDSCXvQ1E+uMOFnMm8OyWbqNMSVEj2Emv
         k0vFUpsAHw1jWjqd18luF+d/HmHS/zCbwYbbyZOw9HRGgg9zOM3y8AsQGvjTtvj7FMSq
         pWo10qT8PN3GUd9R0x6TWFaKZSYnSoAy3itxl/U4pHGxaA2yzMJ5cDiNHzWyCjMkiWOU
         mUhyEUOMETFRfJ/DmAINOaTJLZhhG19Vo7w85PJzbfslhMqXKlnJFhTYDXzWjN4A1+IA
         x5MA==
X-Gm-Message-State: AOAM5314MfRCs6lpiUwosNqqTgP+rK7QFludN8Qlx5N/SxEGR1jBm22X
        ko4h2l5vd32/a5SaTuPjeWeIj/vvvf4=
X-Google-Smtp-Source: ABdhPJzeID1YIEsB0DBwA72j2XkYMIEJByGKJRq9X6FhmUDgCTb2vSVJgVBv0dqdlwyE78wUh9o2fQ==
X-Received: by 2002:a17:902:6b84:b0:13f:2b8:c8e7 with SMTP id p4-20020a1709026b8400b0013f02b8c8e7mr8266178plk.76.1633678638415;
        Fri, 08 Oct 2021 00:37:18 -0700 (PDT)
Received: from xavier.lan ([207.135.154.184])
        by smtp.gmail.com with ESMTPSA id 22sm1556583pgn.88.2021.10.08.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 00:37:17 -0700 (PDT)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jikos@kernel.org, jose.exposito89@gmail.com,
        jslaby@suse.cz, juw@posteo.de, lukas@wunner.de
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 2/3] HID: apple: Add support for the 2021 Magic Keyboard
Date:   Fri,  8 Oct 2021 01:37:01 -0600
Message-Id: <20211008073702.5761-2-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008073702.5761-1-alexhenrie24@gmail.com>
References: <20211008073702.5761-1-alexhenrie24@gmail.com>
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
index 6f019e4f7bba..e7af40b737d8 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -640,6 +640,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
+		.driver_data = APPLE_HAS_FN },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
+		.driver_data = APPLE_HAS_FN },
 
 	{ }
 };
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c84ff8e4038f..8995350d5fd9 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -174,6 +174,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
 
 #define USB_VENDOR_ID_ASUS		0x0486
 #define USB_DEVICE_ID_ASUS_T91MT	0x0185
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 256bf42f9629..06b7908c874c 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -302,6 +302,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021) },
 #endif
 #if IS_ENABLED(CONFIG_HID_APPLEIR)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_IRCONTROL) },
-- 
2.33.0

