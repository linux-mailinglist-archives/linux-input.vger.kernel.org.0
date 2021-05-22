Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0638D6C9
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 20:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhEVSHq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 14:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhEVSHo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 14:07:44 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BEEC0613ED;
        Sat, 22 May 2021 11:06:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z17so24126780wrq.7;
        Sat, 22 May 2021 11:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmaW3DHknv/IqorFvXkou48CAqTVgYoEed8/ElnIKvQ=;
        b=OB9iwCSxWplJKOrP02WjDrcvsvBmgA1sLphFCFfydPlAYGS3GDczOrzWEF/DjyR50g
         WRtYfxG+940RZJ4CkWVfRy6Ubj1FeuGZZyes1E4S4A9lvL0zDHomGpsF+pQ9ckw31ZMt
         JZNs2FRepQKgOS6Sasc1sgLnbNiwjLtD2e+QWEFtlrHOABSZRd1Eicx1fn+22haw0Mvh
         UhmJa//a6jD9a8Jmw9naSMDHoejGZF8nV4ZdFF0U+DCz1djtAZLpQah6p4SW+DPVYHow
         NJJEGFZejMatdvaNfnYiVC+OkOUjSS9+d7V3TONAKbiY8kkPMBHP4W1ah9fUB2Op/V6g
         hAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmaW3DHknv/IqorFvXkou48CAqTVgYoEed8/ElnIKvQ=;
        b=CliqfDeTcbsRdzxOcj2VrKCQuBIQA84sIYDkkQRDzRkS2/xeAfzJd7U/dzu/C5OynU
         72zQSTSlydazDj1DZGng4Ii1pF2bCTtzWHkqE7b5ZO+fpBgrU295KRmDvmdXQGY0CQ7l
         CxF3BHHWXREWdiuOApIHJSePT1lFAXKOfR/0qD1NFkULrYDMYRgCbonTurYw1I/4Vm5t
         iGmTNiH9kY3ak6TrUveyqLw769hUCxcXPlsyPU2k072PKAOHHLWkb26lTJAT9kmQRYIZ
         XghiUwqqZWFNko8yg/OZAB0rxA31/jOzjmzG3+8BM2sNTXqvhpj/ZDH4Su8ub/gkXFBK
         XhOA==
X-Gm-Message-State: AOAM532j1yx3VRY4+l24cfvM9MO7ep65gop2kQfNf2gHzhUHdP4YVbCe
        B0magFexFhKXEc87oo5VlcQ=
X-Google-Smtp-Source: ABdhPJzBD0uew326CWxWknYulddmvtJRc3WE77Gm+LSm5nO+lCaqToZIK1a03hIdq2pGCZ1+zlNOMQ==
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr15244540wrz.284.1621706778180;
        Sat, 22 May 2021 11:06:18 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id v12sm5913217wrv.76.2021.05.22.11.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 11:06:17 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 4/5] HID: magicmouse: Magic Mouse 2 USB battery capacity
Date:   Sat, 22 May 2021 20:06:10 +0200
Message-Id: <20210522180611.314300-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210522180611.314300-1-jose.exposito89@gmail.com>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
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

