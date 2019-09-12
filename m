Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2CEB0C3D
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2019 12:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbfILKGA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 06:06:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56053 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730450AbfILKF7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 06:05:59 -0400
Received: by mail-wm1-f67.google.com with SMTP id g207so6743479wmg.5
        for <linux-input@vger.kernel.org>; Thu, 12 Sep 2019 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=/Z9HkP+XLaY0RmHGUim+S2WyPUX2d1uw38xIvTwui4k=;
        b=Tqa2b0ZkIvC1jF2uCZl1tWi0P3m0cZraXfT9EsNTbyCe5A5lfrgt5qcXx7egHFhkuW
         ORQiNe2tlIsaV+Ka9zNBQV++r82CdeZwEhr4vFCerFaqrM5tJ2VOsVyz/5E4D2UCfyEl
         hy7tuRWyCb4ZwHhlcx5rj0P/qw+9Cf9jX3CVhqiAF4QXpaRcQe3F7eg87Ifk+Yw8YuqM
         yu8M4zf4rfjHPnpFOFDDX00SBoEX4JSOIcMlfNLUZqkBvRKRB5z9zyYpbKkLYz+bOauc
         uODKLLBJZok6NsWAcNtcEX2j63eYixk/DI+M02F5YqdmvX0mABNGhqhZSA+4CcD4SZaU
         vSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Z9HkP+XLaY0RmHGUim+S2WyPUX2d1uw38xIvTwui4k=;
        b=SqTaXUOgC+JGbiSZ9Dj8WmK9exextci/+cbssffblgLaHXo3ZS6qs3c+cJtKdMHGqH
         jJaNWib+zDbAqJoPmewF8a/axu3erSCKsq0HJCoc40fpWyFmY0xaSLqCHiAMlNJSJeTC
         amHE92aPqk5MuAOWrN4zDR2dOnJEC2Lm+WILbpEkdJsCSb3THXlnQY6QOvCjb3//WYP7
         IlAtq/Kei1LD3J0rvXPsXRhJWnFdx4gs5n1pOHCahFRoFitkhNYacgzXN671SEWPTOmX
         kpqshfi4KNxDIU2FdsjhJRitjZ0q3ebmE63SoJGvrNV0y8jwaCCYebRD1hehlpKQr2qT
         6JcQ==
X-Gm-Message-State: APjAAAXOS/K9jqPDtAEB1uWbDgJurzZ8l4vkVt0KY71oSqmpz45wWVAm
        fXQ8pj0Bav0Lkd2dhqaIC/nS+E7eXhZeMKQ7
X-Google-Smtp-Source: APXvYqxUxwqd94gLa+Ysyu59LeoU4NCfWANUbFHR2bXowNpwBfeLUh1iWtNTtpCRqkPK59mgGqt+qQ==
X-Received: by 2002:a1c:a558:: with SMTP id o85mr7629550wme.30.1568282755742;
        Thu, 12 Sep 2019 03:05:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:1e51:7ba0:c57b:6743])
        by smtp.gmail.com with ESMTPSA id q19sm34024795wra.89.2019.09.12.03.05.54
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 03:05:54 -0700 (PDT)
Date:   Thu, 12 Sep 2019 11:05:50 +0100
From:   Siarhei Vishniakou <svv@google.com>
To:     linux-input@vger.kernel.org
Subject: Re: Regression post "HID: core: move Usage Page concatenation to
 Main item"
Message-ID: <20190912100550.GA252117@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65865f56882af2baf8389458c5e6f05096f36818.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

The broken test in question is representing an actual, shipped device. The test
uses development vendor id 0x18d1 and product id 0x2c40. The actual shipped
device was Asus Gamepad, which is still being used and sold today.
Asus Gamepad has vendor id 0x0b05 and product id 0x4500.
The descriptor in the Android CTS test is identical to the one reported by
the actual joystick.

This patch means that all of the existing Asus Gamepad controllers will no longer
function on Linux and Android.

If reverting this patch is not feasible, can we please consider adding a custom
driver for Asus Gamepad?
I'm attaching a patch to fix up the descriptor that is based on the updated
descriptor provided by a partner.


From 0fcd0fb045e450d895f79de7377b00e08f4bd720 Mon Sep 17 00:00:00 2001
From: Siarhei Vishniakou <svv@google.com>
Date: Fri, 23 Aug 2019 14:20:32 +0100
Subject: [PATCH] Add Asus Gamepad descriptor fix

Asus Gamepad descriptor got broken by a recent kernel update. Fix it
here by overriding with a custom value.

Test: atest AsusGamepadTestCase
Signed-Off-By: Siarhei Vishniakou <svv@google.com>
---
 drivers/hid/Kconfig                 |  6 +++
 drivers/hid/Makefile                |  1 +
 drivers/hid/hid-asus-gamepad.c      | 66 +++++++++++++++++++++++++++++
 drivers/hid/hid-core.c              |  1 +
 drivers/hid/hid-ids.h               |  1 +
 5 files changed, 75 insertions(+)
 create mode 100644 drivers/hid/hid-asus-gamepad.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 8eed456a67be..7ba54b2ddf7a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -144,6 +144,12 @@ config HID_ASUS
 	- EeeBook X205TA
 	- VivoBook E200HA
 
+config HID_ASUS_GAMEPAD
+	tristate "Asus Gamepad"
+	depends on HID
+	---help---
+	Support for Asus Gamepad joystick.
+
 config HID_AUREAL
 	tristate "Aureal"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 86b2b5785fd2..d8a622a4feea 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
 obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
 obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
 obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
+obj-$(CONFIG_HID_ASUS_GAMEPAD)	+= hid-asus-gamepad.o
 obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
 obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
 obj-$(CONFIG_HID_BETOP_FF)	+= hid-betopff.o
diff --git a/drivers/hid/hid-asus-gamepad.c b/drivers/hid/hid-asus-gamepad.c
new file mode 100644
index 000000000000..799c3c9f5057
--- /dev/null
+++ b/drivers/hid/hid-asus-gamepad.c
@@ -0,0 +1,66 @@
+/*
+ *  HID driver for Asus Gamepad.
+ *  Fix the descriptor due to tightening HID specifications.
+ *  Copyright (c) 2019 Siarhei Vishniakou <svv@google.com>
+ *
+ *  Based on a patch contributed by JeiFeng Lee and Thunder Yu.
+ */
+
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2 of the License, or (at your option)
+ * any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+static __u8 GAMEPAD_DESCRIPTOR[] = {
+	0x05, 0x01, 0x09, 0x05, 0xa1, 0x01, 0x85, 0x01, 0x05, 0x09, 0x0a,
+	0x01, 0x00, 0x0a, 0x02, 0x00, 0x0a, 0x04, 0x00, 0x0a, 0x05, 0x00,
+	0x0a, 0x07, 0x00, 0x0a, 0x08, 0x00, 0x0a, 0x0e, 0x00, 0x0a, 0x0f,
+	0x00, 0x0a, 0x0d, 0x00, 0x15, 0x00, 0x25, 0x01, 0x75, 0x01, 0x95,
+	0x09, 0x81, 0x02, 0x05, 0x0c, 0x0a, 0x24, 0x02, 0x0a, 0x23, 0x02,
+	0x95, 0x02, 0x81, 0x02, 0x75, 0x01, 0x95, 0x01, 0x81, 0x03, 0x05,
+	0x01, 0x75, 0x04, 0x95, 0x01, 0x25, 0x07, 0x46, 0x3b, 0x01, 0x66,
+	0x14, 0x00, 0x09, 0x39, 0x81, 0x42, 0x66, 0x00, 0x00, 0x09, 0x01,
+	0xa1, 0x00, 0x09, 0x30, 0x09, 0x31, 0x09, 0x32, 0x09, 0x35, 0x15,
+	0x00, 0x26, 0xff, 0x00, 0x35, 0x00, 0x46, 0xff, 0x00, 0x75, 0x08,
+	0x95, 0x04, 0x81, 0x02, 0x05, 0x02, 0x09, 0xc5, 0x09, 0xc4, 0x95,
+	0x02, 0x81, 0x02, 0xc0, 0x85, 0x02, 0x05, 0x08, 0x0a, 0x01, 0x00,
+	0x0a, 0x02, 0x00, 0x0a, 0x03, 0x00, 0x0a, 0x04, 0x00, 0x15, 0x00,
+	0x25, 0x01, 0x75, 0x01, 0x95, 0x04, 0x91, 0x02, 0x75, 0x04, 0x95,
+	0x01, 0x91, 0x03, 0xc0, 0x05, 0x0c, 0x09, 0x01, 0xa1, 0x01, 0x85,
+	0x03, 0x05, 0x01, 0x09, 0x06, 0xa1, 0x02, 0x05, 0x06, 0x09, 0x20,
+	0x15, 0x00, 0x26, 0xff, 0x00, 0x75, 0x08, 0x95, 0x01, 0x81, 0x02,
+	0x06, 0xbc, 0xff, 0x0a, 0xad, 0xbd, 0x75, 0x08, 0x95, 0x06, 0x81,
+	0x02, 0xc0, 0xc0};
+
+static __u8 *asus_gamepad_report_fixup(struct hid_device *hdev,
+					__u8 *rdesc, unsigned int *rsize)
+{
+	if (hdev->product == USB_DEVICE_ID_ASUSTEK_GAMEPAD) {
+		hid_info(hdev, "Fixing up Asus Gamepad report descriptor\n");
+		*rsize = ARRAY_SIZE(GAMEPAD_DESCRIPTOR);
+		return GAMEPAD_DESCRIPTOR;
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id asus_devices[] = {
+	{HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK,
+					USB_DEVICE_ID_ASUSTEK_GAMEPAD)},
+};
+MODULE_DEVICE_TABLE(hid, asus_devices);
+
+static struct hid_driver asus_driver = {
+	.name = "asus-gamepad",
+	.id_table = asus_devices,
+	.report_fixup = asus_gamepad_report_fixup};
+module_hid_driver(asus_driver);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 832ff592a4bf..b51e0ba093aa 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1873,6 +1873,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_NOTEBOOK_KEYBOARD) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_GAMEPAD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AUREAL, USB_DEVICE_ID_AUREAL_W01RN) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BELKIN, USB_DEVICE_ID_FLIP_KVM) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185BFM, 0x2208) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f4c84d824e6..138c28639107 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -173,6 +173,7 @@
 #define USB_DEVICE_ID_ASUSTEK_MULTITOUCH_YFO	0x0186
 
 #define USB_VENDOR_ID_ASUSTEK		0x0b05
+#define USB_DEVICE_ID_ASUSTEK_GAMEPAD      0x4500
 #define USB_DEVICE_ID_ASUSTEK_LCM	0x1726
 #define USB_DEVICE_ID_ASUSTEK_LCM2	0x175b
 #define USB_DEVICE_ID_ASUSTEK_NOTEBOOK_KEYBOARD	0x8585
-- 

