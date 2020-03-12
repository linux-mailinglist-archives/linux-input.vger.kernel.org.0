Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30A01835F3
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 17:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgCLQQ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 12:16:27 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38761 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgCLQQ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 12:16:27 -0400
Received: by mail-qk1-f194.google.com with SMTP id h14so7144863qke.5;
        Thu, 12 Mar 2020 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7tlPy2TYZUhXZx8HY0lzq3tefcqbsla4DROe53Ao2KQ=;
        b=k53RwFc26238V8qVmubeOn2Xn1Swqz/coTMW6kR9LS6wG3nT3qWK0j/cGaLiaNZyaE
         +wUdj4azLKf8KobotiMgozPPk0GLM0ZwAFEY/Nl6TS5lxSbRO4UBUkN/SXbvwKTLOXvg
         B6E9YuHQ6fllkFXgCeKTsAfITbr982FkBdQLNxQWg+X3pHxNND3bv7pXn9Qil62g2UFv
         oZ08uN8tL2I8F0x+/75eE125IoHJD6SME63NHiW1yzCIAjer8eBT6lRNR6/WXDSSo0uF
         7yhKsy0vEPaFU/2EvZYgjH1OqcPzWYnWX5pAKaoIy+ODj8le83RNIEa8ItYOY0RWuxsz
         09QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7tlPy2TYZUhXZx8HY0lzq3tefcqbsla4DROe53Ao2KQ=;
        b=PmqFJjqpmEWsBkqDE7xFQB52dm5AY2XvY6G6TSdC75VUd8jJXkh26Az+/q6s/jHlq+
         c3nkLqeY6fRVSm/augZOz5FSnDYqRhzmo0vhRoXNg/s6j1+RUewb2Tk2EcMV+kWwSQt4
         wFyCFrH/Lj59LAR0zSUZ5IU+LHcxh2vtU0sD3LDMKVaj7Z5d+xQvE8IJg/g+OWMQOZE5
         PMa0XL0rVjufBjpfvw2iIT46/G9FIyYc5X1cLgH9RqMbaevSn2ifrJ0W3+zBfqhByp4f
         GTdEJ6nOf6vXohfg1tA4eUgT/05alzPWxiSunyxrSUs7DsfRE4Nign5pdQ7Nj/87FsdQ
         6o6w==
X-Gm-Message-State: ANhLgQ0GwvYC08zCouS+l7y3gCqRO17l8130e1YRHCza4Q/Kq5SzmOMK
        KlVX9p1ZqgDNJaw0mcW+/VI=
X-Google-Smtp-Source: ADFU+vuCOV5fkEGs3aOnnkFnUQW8t179gUuAnKFZPnNP4Rn6EMkTpFNdIT6aaH+sEH8VyjXNXnvs7g==
X-Received: by 2002:a37:b0d:: with SMTP id 13mr8744948qkl.9.1584029786259;
        Thu, 12 Mar 2020 09:16:26 -0700 (PDT)
Received: from localhost.localdomain ([65.88.88.177])
        by smtp.gmail.com with ESMTPSA id o7sm9741512qtg.63.2020.03.12.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:16:25 -0700 (PDT)
From:   Tony Fischetti <tony.fischetti@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tony.fischetti@gmail.com
Subject: [PATCH] HID: add ALWAYS_POLL quirk to lenovo pixart mouse
Date:   Thu, 12 Mar 2020 12:16:06 -0400
Message-Id: <20200312161606.14133-1-tony.fischetti@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A lenovo pixart mouse (17ef:608d) is afflicted common the the malfunction
where it disconnects and reconnects every minute--each time incrementing
the device number. This patch adds the device id of the device and
specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
work properly.

Signed-off-by: Tony Fischetti <tony.fischetti@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce603c4..327eaed9de4e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -726,6 +726,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
+#define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 
 #define USB_VENDOR_ID_LG		0x1fd2
 #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e7b2d998395..3735546bb524 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -103,6 +103,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M912), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C007), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C077), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_KEYBOARD_G710_PLUS), HID_QUIRK_NOGET },
-- 
2.20.1

