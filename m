Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A1D24C538
	for <lists+linux-input@lfdr.de>; Thu, 20 Aug 2020 20:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgHTSVn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Aug 2020 14:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgHTSVk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Aug 2020 14:21:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A599C061385
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 11:21:40 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ds1so1335691pjb.1
        for <linux-input@vger.kernel.org>; Thu, 20 Aug 2020 11:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bgIjhAbKVly3NPd2z98FjTgAi7eNaicRWeEyGgxYVOE=;
        b=Hg0d+/9k0YYK0cmy+JA5/k+0X+tIVJLSzuLZDLQmuBhjTkiRAhLr6cKQdqTSBnB9Lb
         RSpT59nw5JoZU44/7vR5mrqjylUygNa2DVd0n2xdXZ78+EU4jFBW+j6vFEZS4sh3xR1i
         HfSzMnLWTz6sCEgZP/IPCW3Ot982lF/A6rRxWN2HI+TiBQJ8Rh4ILtKr3Ghxb+AMDKiW
         dSqwEzVyWWQ2hazwfjIFH7AJp9/tBxUpOrEE6Sz2IHJHlsd7gxA0jxuXibLpSG3HQwuJ
         1AgYHHU9Qk7gf5ejWFNP8xNryEYmge3tpz8FFsnnnv9D7BfXeQ0bhxmuWS/V0uiP9UrF
         ipyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bgIjhAbKVly3NPd2z98FjTgAi7eNaicRWeEyGgxYVOE=;
        b=DG1/NduJDF+6swEUjlGpJOL+B557qYPLR/4tMP+wdYYe16rQyc+vI/uUwyRSIpuzp8
         mfZ1MfnF3YgvT9PvVchW6fJpOLK7BfVTPtfI+XlE2oy1QxA8VPWPO8+uWdNGKDtvdJwN
         QWveYEOwVMyaVvD5w2OyWr8s05C7hZLtWQFrLmL8T0JIAqa9kGtjghEzcAb6adfkDGen
         iwzazQpK57R9+4RWHHZoASvKMpUcdtQ9fetINxD/Go46WnDSn1BOkAp7cKl9MgrUwBgW
         M/8ERsyEezmn6ulaPG+8ms0yxN+lVCd5m/Fbo2k1LrhR+MprAKuTwyHqScwbkai25vb0
         Hufg==
X-Gm-Message-State: AOAM533mpUnQrZ2C3jxQ6i2WU565vJmFGXlg3Sp2b7vqrshMj3xjjX+v
        pI3E0GJAs8Xwzk/CKSapyedulGky4KkNMA==
X-Google-Smtp-Source: ABdhPJw+1B0Xar1ShTBspZyAXpyLJM2kcnQ623Mk5Qp+rJtfx/34FL+B1297FeNDRmtvyi5zST7www==
X-Received: by 2002:a17:902:cd15:: with SMTP id g21mr3431945ply.337.1597947699022;
        Thu, 20 Aug 2020 11:21:39 -0700 (PDT)
Received: from localhost.localdomain ([211.245.188.120])
        by smtp.gmail.com with ESMTPSA id x18sm3506475pfc.93.2020.08.20.11.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 11:21:37 -0700 (PDT)
From:   Frank Yang <puilp0502@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Frank Yang <puilp0502@gmail.com>
Subject: [PATCH v2] HID: Support Varmilo Keyboards' media hotkeys
Date:   Fri, 21 Aug 2020 03:16:50 +0900
Message-Id: <20200820181650.15027-1-puilp0502@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729135341.16799-1-puilp0502@gmail.com>
References: <20200729135341.16799-1-puilp0502@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Varmilo VA104M Keyboard (04b4:07b1, reported as Varmilo Z104M)
exposes media control hotkeys as a USB HID consumer control device, but
these keys do not work in the current (5.8-rc1) kernel due to the
incorrect HID report descriptor. Fix the problem by modifying the
internal HID report descriptor.

More specifically, the keyboard report descriptor specifies the
logical boundary as 572~10754 (0x023c ~ 0x2a02) while the usage
boundary is specified as 0~10754 (0x00 ~ 0x2a02). This results in an
incorrect interpretation of input reports, causing inputs to be ignored.
By setting the Logical Minimum to zero, we align the logical boundary
with the Usage ID boundary.

Some notes:

* There seem to be multiple variants of the VA104M keyboard. This
  patch specifically targets 04b4:07b1 variant.

* The device works out-of-the-box on Windows platform with the generic
  consumer control device driver (hidserv.inf). This suggests that
  Windows either ignores the Logical Minimum/Logical Maximum or
  interprets the Usage ID assignment differently from the linux
  implementation; Maybe there are other devices out there that only
  works on Windows due to this problem?

Signed-off-by: Frank Yang <puilp0502@gmail.com>
---
Changes since v1:
    - Extend hid-cypress.c instead of creating new drivers for varmilo,
      since the device reports the VID of Cypress (0x04b4).
      Suggested by: Jiri Kosina <jikos@kernel.org>

 drivers/hid/hid-cypress.c | 44 ++++++++++++++++++++++++++++++++++-----
 drivers/hid/hid-ids.h     |  2 ++
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-cypress.c b/drivers/hid/hid-cypress.c
index a50ba4a4a1d7..b88f889b3932 100644
--- a/drivers/hid/hid-cypress.c
+++ b/drivers/hid/hid-cypress.c
@@ -23,19 +23,17 @@
 #define CP_2WHEEL_MOUSE_HACK		0x02
 #define CP_2WHEEL_MOUSE_HACK_ON		0x04
 
+#define VA_INVAL_LOGICAL_BOUNDARY	0x08
+
 /*
  * Some USB barcode readers from cypress have usage min and usage max in
  * the wrong order
  */
-static __u8 *cp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static __u8 *cp_rdesc_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
-	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
 	unsigned int i;
 
-	if (!(quirks & CP_RDESC_SWAPPED_MIN_MAX))
-		return rdesc;
-
 	if (*rsize < 4)
 		return rdesc;
 
@@ -48,6 +46,40 @@ static __u8 *cp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+static __u8 *va_logical_boundary_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	/*
+	 * Varmilo VA104M (with VID Cypress and device ID 07B1) incorrectly
+	 * reports Logical Minimum of its Consumer Control device as 572
+	 * (0x02 0x3c). Fix this by setting its Logical Minimum to zero.
+	 */
+	if (*rsize == 25 &&
+			rdesc[0] == 0x05 && rdesc[1] == 0x0c &&
+			rdesc[2] == 0x09 && rdesc[3] == 0x01 &&
+			rdesc[6] == 0x19 && rdesc[7] == 0x00 &&
+			rdesc[11] == 0x16 && rdesc[12] == 0x3c && rdesc[13] == 0x02) {
+		hid_info(hdev,
+			 "fixing up varmilo VA104M consumer control report descriptor\n");
+		rdesc[12] = 0x00;
+		rdesc[13] = 0x00;
+	}
+	return rdesc;
+}
+
+static __u8 *cp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
+
+	if (quirks & CP_RDESC_SWAPPED_MIN_MAX)
+		rdesc = cp_rdesc_fixup(hdev, rdesc, rsize);
+	if (quirks & VA_INVAL_LOGICAL_BOUNDARY)
+		rdesc = va_logical_boundary_fixup(hdev, rdesc, rsize);
+
+	return rdesc;
+}
+
 static int cp_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 		struct hid_field *field, struct hid_usage *usage,
 		unsigned long **bit, int *max)
@@ -128,6 +160,8 @@ static const struct hid_device_id cp_devices[] = {
 		.driver_data = CP_RDESC_SWAPPED_MIN_MAX },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYPRESS, USB_DEVICE_ID_CYPRESS_MOUSE),
 		.driver_data = CP_2WHEEL_MOUSE_HACK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CYPRESS, USB_DEVICE_ID_CYPRESS_VARMILO_VA104M_07B1),
+		.driver_data = VA_INVAL_LOGICAL_BOUNDARY },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, cp_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 874fc3791f3b..dbca98da8aa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -331,6 +331,8 @@
 #define USB_DEVICE_ID_CYPRESS_BARCODE_4	0xed81
 #define USB_DEVICE_ID_CYPRESS_TRUETOUCH	0xc001
 
+#define USB_DEVICE_ID_CYPRESS_VARMILO_VA104M_07B1   0X07b1
+
 #define USB_VENDOR_ID_DATA_MODUL	0x7374
 #define USB_VENDOR_ID_DATA_MODUL_EASYMAXTOUCH	0x1201
 
-- 
2.17.1

