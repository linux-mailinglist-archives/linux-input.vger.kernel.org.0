Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E650137AE4D
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhEKSVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhEKSVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:21:54 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF27C061574;
        Tue, 11 May 2021 11:20:47 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a10-20020a05600c068ab029014dcda1971aso92814wmn.3;
        Tue, 11 May 2021 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmaW3DHknv/IqorFvXkou48CAqTVgYoEed8/ElnIKvQ=;
        b=kBKU6eTdDt6NG/MYmpYulXFHqIqyOlUO4nayE4hvFFLtceQ2Dm6w72XYzOe79NFq/o
         FjGtl9a1NY1MKxlZKckPt+V3+y6OUFcY/uLKq3xuhP5nO+CT7Hmc1oS2MBR8AfWVpqF8
         5XTqlf0DEN2Wa0T/VAkkqo+/eR0SIzr2WgNTtlekdnmlN6s50cqCBF6LBS/moDTcjL+U
         oSOdDUHOjnK3eUtPDKU2f6cUdVys0Yk2KOIXMv+VZplNd7iD4XVg7KL2z+/qeavQfde/
         mcViMDagvkcicIEhEap8RofDajiptb12pv53oAiVdJkI1C6ulh+0KpGBvMK9n295+SGi
         q0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmaW3DHknv/IqorFvXkou48CAqTVgYoEed8/ElnIKvQ=;
        b=HlMcOdU37Tq+6GgWyNskHlk9pPJj1pGKA06SFSImLYnOK50fu2aQogM8xA2zkko1pZ
         x9MCJG3LkSRoi6szuW6cNGWm7wwLFPfFS2zNRmevvIWkLPgH/ehrt37TQLaiCs4OMeHC
         DxknPZ+z5L9UjhRmg9G815j4R7kMN+xhf8MTEwS+JjYqHxpaBYU4n3XLX8opXKzNY5+e
         +NQfLYgtJi6O/2eWEbI4w+8teBUXWGMM1mkM9O47yri285IhbIx8zzEIZTY0aqAga9/8
         tjJ73PEtT+2vIpb4chOOM3PXSmIDvNIeGIkmmEN/vjhWEUc03LHim/ZUQFGpNkAytLXY
         gC9g==
X-Gm-Message-State: AOAM53112h2pSwKkJiOwop+qx5KRg18O6xica+S3n05l4pSfbLGzV1wA
        LtLRYujD78OIPTvzub2mSRg=
X-Google-Smtp-Source: ABdhPJxe9X8zjmSjBAuV2MC6xu4NXcTX7FN9uu8/IVV6Nnu7+fYm34yvw6k1BQHcHmENuJCXSDjUiw==
X-Received: by 2002:a05:600c:4982:: with SMTP id h2mr33751845wmp.108.1620757246118;
        Tue, 11 May 2021 11:20:46 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id d15sm28012133wrw.71.2021.05.11.11.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:20:45 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 4/5] HID: magicmouse: Magic Mouse 2 USB battery capacity
Date:   Tue, 11 May 2021 20:20:22 +0200
Message-Id: <20210511182023.730524-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511182023.730524-1-jose.exposito89@gmail.com>
References: <20210511182023.730524-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report the battery capacity percentage for the Apple Magic Mouse 2
when it is connected over USB.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index ea8a85767c39..53e8a10f0551 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -911,8 +911,17 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
 			feature = feature_mt_trackpad2_usb;
 		}
 	} else if (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
-		feature_size = sizeof(feature_mt_mouse2);
-		feature = feature_mt_mouse2;
+		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
+			feature_size = sizeof(feature_mt_mouse2);
+			feature = feature_mt_mouse2;
+		} else { /* USB_VENDOR_ID_APPLE */
+			/*
+			 * The Magic Mouse 2 has the lightning connector on the
+			 * bottom, making impossible to use it when it is
+			 * charging.
+			 */
+			return 0;
+		}
 	} else {
 		feature_size = sizeof(feature_mt);
 		feature = feature_mt;
@@ -947,7 +956,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	int ret;
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
-	    id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) &&
 	    hdev->type != HID_TYPE_USBMOUSE)
 		return 0;
 
@@ -1068,6 +1078,8 @@ static const struct hid_device_id magic_mice[] = {
 		USB_DEVICE_ID_APPLE_MAGICMOUSE), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
-- 
2.25.1

