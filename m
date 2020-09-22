Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42002273F3B
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 12:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgIVKHg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 06:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVKHf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 06:07:35 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF03C061755;
        Tue, 22 Sep 2020 03:07:35 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x69so17370140lff.3;
        Tue, 22 Sep 2020 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X3xqrdnSAeujW8eOtD+7+Lv8BWCJaPf9AgZ75a/h8S4=;
        b=LF4PiLjYtqFh71NnnQ9xeMhrW54jII2IcLZwRYfA/1klXM2cL9NaBSZqOxvDv43i5j
         +TeA6CRyw3VgQf2Dfl+uD/tN7Q6mx/W3X32KMFlNGMwWCfXuqRNIFcVgqoJ7re3kSfW+
         SGj35VYjg2T1ZYOJoD8ch2FOLnuaQToK6x9Co2mquL5BcHWVChAcQL6ewBlaxpqfQjcs
         YK1qxK9FpLtUkU5D0SSWPBxgjXlo15Zrc2iufKsdJF7tiIYx3JXGJ6u4XboB4E9ziRyq
         ikJWSg9dVw++LPhcWyo6cQEcc8M9jYn06jdWgixe82raFANib8Siq99fbeWN3dFzphq9
         NVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X3xqrdnSAeujW8eOtD+7+Lv8BWCJaPf9AgZ75a/h8S4=;
        b=ujs3lCnms/i/VLBjqhCNbLk4vnYEiitFB7jkjiyPiO2JVmoJDcxOjfUdneavxxjHbO
         ZXq2ZU9G+2sauSo84fed2YhTCgayG9uXCVgSby/cPEInDb0nEYsWgK25nvA7k1ye9DrW
         NenzCnPLtmdKoQEQdYdD+HByThlTYgZn5KyuMUDnq/s/WZVMhACySi2GG9XJFx6tYD3u
         vAR3e3c3UxVkhViZYBah2QyIGFJeRtPC7xMFjRGrudX9Ep86E4N6L9hNOWNufO8GaToA
         9BwHa8JgdTuKEA+4rAG+FS5XKT9EzJWb2OOYPFQgZBpQvayZP9P3dFDSR+h1lJSUWirc
         c7Gw==
X-Gm-Message-State: AOAM533tvjgw58hg4wH7uEnmxfZg3EHOS9yjg2C+ANJDXQhYnJOHLtK3
        +ZySbscQMhyADCAx42tyVq8=
X-Google-Smtp-Source: ABdhPJyVEwzvra6GR386t2gQvxtiYRUxtWUrCycFIYOoTLkkmauRS1NGaUQKwJjzLyNnzC40St7hgA==
X-Received: by 2002:a19:6b07:: with SMTP id d7mr1607059lfa.510.1600769253745;
        Tue, 22 Sep 2020 03:07:33 -0700 (PDT)
Received: from localhost.localdomain (c80-217-156-226.bredband.comhem.se. [80.217.156.226])
        by smtp.gmail.com with ESMTPSA id j20sm3346031lfe.132.2020.09.22.03.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:07:33 -0700 (PDT)
From:   =?UTF-8?q?Mikael=20Wikstr=C3=B6m?= <leakim.wikstrom@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Mikael=20Wikstr=C3=B6m?= <leakim.wikstrom@gmail.com>
Subject: [PATCH 2/2] HID: multitouch: Lenovo X1 Tablet Gen2 trackpoint and buttons
Date:   Tue, 22 Sep 2020 12:07:15 +0200
Message-Id: <20200922100715.3840-1-leakim.wikstrom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One more device that needs 40d5bb87 to resolve regression for the trackpoint
and three mouse buttons on the type cover of the Lenovo X1 Tablet Gen2.

Signed-off-by: Mikael Wikström <leakim.wikstrom@gmail.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6a6e2c1b6090..70fbcededc30 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -727,6 +727,7 @@
 #define USB_DEVICE_ID_LENOVO_TP10UBKBD	0x6062
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
+#define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99f041afd5c0..d670bcd57bde 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1973,6 +1973,12 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
 
+	/* Lenovo X1 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X1_TAB) },
+
 	/* Lenovo X1 TAB Gen 3 */
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.25.1

