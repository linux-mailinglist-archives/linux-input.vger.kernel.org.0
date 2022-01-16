Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFBD48FF97
	for <lists+linux-input@lfdr.de>; Mon, 17 Jan 2022 00:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbiAPXCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jan 2022 18:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbiAPXCb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jan 2022 18:02:31 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D27C061574
        for <linux-input@vger.kernel.org>; Sun, 16 Jan 2022 15:02:31 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id n16-20020a17090a091000b001b46196d572so6070945pjn.5
        for <linux-input@vger.kernel.org>; Sun, 16 Jan 2022 15:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh+0A8N3fYO5wfBPNNAUlzLTG/yLc9vb0BzlExuRavI=;
        b=gzFFyElkY0fQjGTQYcxxE4DvoNE17Xqpk0HMhXj9UWHUR9VM6pMBCnWFOYgtdFQt9e
         8Ioce+5s7a67GDYjJ/+p/QJeTBJ/v9HWdtsjD++PRdIbXfzUOaLnZuONEadPfxPpk5NZ
         /VnT6FqDCBKJ7Rsd6E8WTRQV1D2gMYvHAchQNRO0HxjbKnZ69yLCSUeeBOWgMwda/k2+
         ia8qDdbb/DqUcH2U+ZhJTJsQDtKZ5Z6Y5UqwgTFRzx3KV4iTsnJEYW86GTN3lBxPb/37
         6/zIqIMHz6NxKTabXhJDFCKxZukkvEd6h6O2HkWdNz3mp1QQb6eepXx7aaQCehnoYhfo
         QIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh+0A8N3fYO5wfBPNNAUlzLTG/yLc9vb0BzlExuRavI=;
        b=5pReN/j+RFLCjg2Bp90V4dwMi8XGnBfV3i8zae+F9lUef9ZwlBxjaNe7wLSjhGtlJG
         RtJmF1lVfAqEQZl8sluBcXaooE+Oa0SGDbvRioy+8yVvnEXc7Fql/CuBlZsrEr6cFgqY
         2Gfns05STiPlG/A5jKjjQ+3D0arWf+yRqIl3EybAPcFBtONCgEBDVusvesmjrgmtr8D6
         ARUnxkpwt/HTf8SxNCSQY8gxOh+CY3x2guHfgdLYOYmnZ1x7hR+tbA+Viw0LObriOVhj
         3V9rU1yRctvuqrOlI7j6FLnXO2xEqYOojvQEnrajx+nL8lqcD52iluYnuxoJn9x3KaKc
         Gn8Q==
X-Gm-Message-State: AOAM533s1/oF6H0ut0GMox2XpcBJvVv0CtHHV+4+3GUb89DoofZD8l7N
        FBXdeyk/xqEHiKDmn6j6rBx/jBuUXW0=
X-Google-Smtp-Source: ABdhPJzjiItlrgUpI07j46U+6vqfwar+ISECIG/PIsAt+vUZnmtDsDYacj9K4C8FbJxJS1XCBHu/cg==
X-Received: by 2002:a17:902:e544:b0:14a:586c:1336 with SMTP id n4-20020a170902e54400b0014a586c1336mr20657556plf.41.1642374150498;
        Sun, 16 Jan 2022 15:02:30 -0800 (PST)
Received: from xavier.lan ([2001:470:b:114::cc1])
        by smtp.gmail.com with ESMTPSA id j22sm11878236pfj.102.2022.01.16.15.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 15:02:30 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jkosina@suse.cz
Cc:     Alex Henrie <alexhenrie24@gmail.com>,
        Markus Wageringel <markus.wageringel@gmail.com>
Subject: [PATCH] HID: apple: Set the tilde quirk flag on the Wellspring 5 and later
Date:   Sun, 16 Jan 2022 16:01:58 -0700
Message-Id: <20220116230158.29596-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Markus reports that his 2011 MacBook with a German ISO keyboard (USB
product code 05ac:0246, HID country code 13) has the tilde key quirk.
Seeing as all of the standalone Apple ISO keyboards since about 2008
have the quirk, it seems reasonable to assume that once the integrated
laptop keyboards started having the quirk, they likewise never stopped
having it.

Reported-by: Markus Wageringel <markus.wageringel@gmail.com>
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 24802a4a636e..7dc89dc6b0f0 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -691,49 +691,49 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5A_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5A_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5A_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7A_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7A_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7A_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING8_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING8_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING9_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI),
-- 
2.34.1

