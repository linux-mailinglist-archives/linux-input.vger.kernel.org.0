Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F4C273ECF
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIVJsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVJsV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:48:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17FDC061755;
        Tue, 22 Sep 2020 02:48:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so13584181ljm.3;
        Tue, 22 Sep 2020 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUG1AkXVLi/EB3zDpgh2q5YX6SiXzdzs/YFnBtCctl8=;
        b=Z2QqPHDaaaWDthdvW6GpnyGgX6MstMlIsfGwkBDkXgumtgBy18vvmAc3+VRZQxgRhH
         crc6Ngg+uohhiWRVzzoRxZ0MvJjTbBHMIKrMqIpAxlEhmHR+2cxb0ID2fIheBCYJtOUw
         gQi6f0EM66BDdl68WNCvEKZ/w9cUmNick1hlVhnc6Yl7GUdvk4bJqGb6BdRuzhLyQ4xw
         GBZ5+LPuGKrIbDBVdbjkUn6YJZrfUiqXXozuQaoOYAONxABgCzg4dUJe7+y9+Tl9SNMh
         lDlkCcU69Xgpso03mPolhLvJy52NA1UPWNh6sg1WBCDp5jiMOvd2ytgO8A7VTLBnUupJ
         Pifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BUG1AkXVLi/EB3zDpgh2q5YX6SiXzdzs/YFnBtCctl8=;
        b=mQGZKZp2xdv1dBMSP3OMROLWiqK6+rOw9C43lY4+slV7Iln/O6EbdzheXUnt4a3SkJ
         eiCsQLLWPsXb9Lfw9Z3rxtHnGnX8E/ip74dY17GRWm60FoGQDSknc+hV8lcGnOhFnbjp
         dWDBfPND2aDQbvB+ASrnW59yf9k624y7c2Pg1x+Lb4VzJaOCBFzgXd5dUgIe+lAYYFVF
         cZvURghCCgtVs9ahVzfHI18dwgGVAnJu2uWe+AxaJDme7N+NZt+ZPKmJ8CFw+mLcQTxW
         96K2sGLSgDDMuYdtyFNd3Q1kiYkHrUbkw780ssG5KzJREIT6VMyN5pWeFrXIlALy6B5R
         NUUA==
X-Gm-Message-State: AOAM533jNgm+RWrxBEqXQSpl4Z+OVYgpsuV6dYI4WrotJ6UuDHnrM8wo
        ICo4fVH1Ov2MjiNL04Qhebg=
X-Google-Smtp-Source: ABdhPJxczWsDqrlHRjwoW4Zw8wGakjZs2/7+pchjW0iAV52h7bPQHvDODucviFt58OXRu/1e2LAmfw==
X-Received: by 2002:a2e:9655:: with SMTP id z21mr1218017ljh.410.1600768099049;
        Tue, 22 Sep 2020 02:48:19 -0700 (PDT)
Received: from localhost.localdomain (c80-217-156-226.bredband.comhem.se. [80.217.156.226])
        by smtp.gmail.com with ESMTPSA id v25sm3582777ljh.102.2020.09.22.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:48:18 -0700 (PDT)
From:   =?UTF-8?q?Mikael=20Wikstr=C3=B6m?= <leakim.wikstrom@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Mikael=20Wikstr=C3=B6m?= <leakim.wikstrom@gmail.com>
Subject: [PATCH 1/2] HID: multitouch: Lenovo X1 Tablet Gen3 trackpoint and buttons
Date:   Tue, 22 Sep 2020 11:48:10 +0200
Message-Id: <20200922094810.3669-1-leakim.wikstrom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One more device that needs 40d5bb87 to resolve regression for the trackpoint
and three mouse buttons on the type cover of the Lenovo X1 Tablet Gen3.

It is probably also needed for the Lenovo X1 Tablet Gen2 with PID 0x60a3

Signed-off-by: Mikael Wikström <leakim.wikstrom@gmail.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74fc1df6e3c2..6a6e2c1b6090 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -727,6 +727,7 @@
 #define USB_DEVICE_ID_LENOVO_TP10UBKBD	0x6062
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
+#define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e3152155c4b8..99f041afd5c0 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1973,6 +1973,12 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
 
+	/* Lenovo X1 TAB Gen 3 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X1_TAB3) },
+
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
 		MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
-- 
2.25.1

