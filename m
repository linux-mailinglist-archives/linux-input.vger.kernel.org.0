Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37C5231FA6
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 15:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgG2Nxx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 09:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgG2Nxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 09:53:52 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F7CC061794
        for <linux-input@vger.kernel.org>; Wed, 29 Jul 2020 06:53:52 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so11813250ply.11
        for <linux-input@vger.kernel.org>; Wed, 29 Jul 2020 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Qt6jGzvm3GC6CjwiV6wln+Xb/8pwnGX0O0vF6jd8ZYE=;
        b=edOIVKNoH1ieGoyMgT/td7yTvHZMZPVwh7pEjBKEyFNlcy8Lg7aqUNo8z14D/Oo3y2
         HltSSm/S8iT+hr+FmqjgAOe+kWXYKjkPygZnD7vVs3oyK0dNfrrFsqmcmAys4z+ZzyKc
         VPFJ+qQ9RPzsRZDkeUUhlzAjwR9RVKWJXOdUx7KMEBcOBwlJhb2Y7yKsFhOxM+Es86J5
         t5vKdYQ+78GHvD33Tr8Aqdy/USQdTkw3GMKW46ziTXUQ6P08m27OgBxg1mc//hXE6p3Z
         NxH/Loi+18Ed1yw3Jj/D/uDHX1DViTLr/cqtp/uiX86jm9xrP1Rzb3Ggnr4FwvJD9Z3B
         Ieqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qt6jGzvm3GC6CjwiV6wln+Xb/8pwnGX0O0vF6jd8ZYE=;
        b=F94D6VOWy2kWMyy2L/pCO6xWeQTDy+bWBEx8yYrQOWQLcltEgzJE96w6Mb/QugDHsd
         ubyDluBTashKIUwsvwIZ9DgPhl02DLn2WshCZ/F9IvMuyxJzn/76AWXQWlcMrnzXaYNw
         5H2LMGHxB/g0XjwiZ7XNLTDivplSHnaVuRWOUeQycnqIEP7FbrGVHhgynb+nyZMXBnZZ
         rUuMR376T5D32YUC/LkxWUnsBywIAT6Yac/yvJJklBDp45cUUC+204xGpCxihT3ihPOZ
         i7hXsFNWuccfidovunX6/moavZh9PzzM+tfHD9iN6EvGvmlnx0hX6IabUtFB7cHujZZo
         bE0g==
X-Gm-Message-State: AOAM533XJx8nzBTwdhmTvdN+40W0DXio4tQo5edB9aAEhImC059axUWR
        brejhxk5qMhlWbwM+Yni51Fo//qGfphkbA==
X-Google-Smtp-Source: ABdhPJzxPlWbh+gIkECjz8sCpCiurQyMzTQfc4bsFZj+t1wJ3Tv41ehZyEKEu2hTcSX+m86YvVLtQw==
X-Received: by 2002:a17:902:9a47:: with SMTP id x7mr27340622plv.90.1596030832011;
        Wed, 29 Jul 2020 06:53:52 -0700 (PDT)
Received: from frank-MS-7C02.skbroadband ([211.245.188.115])
        by smtp.gmail.com with ESMTPSA id y200sm2518147pfb.33.2020.07.29.06.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:53:51 -0700 (PDT)
From:   Frank Yang <puilp0502@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Frank Yang <puilp0502@gmail.com>
Subject: [PATCH] HID: Support Varmilo Keyboards' media hotkeys
Date:   Wed, 29 Jul 2020 22:53:41 +0900
Message-Id: <20200729135341.16799-1-puilp0502@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Varmilo VA104M Keyboard (04b4:07b1, reported as Varmilo Z104M)
exposes media control hotkeys as a USB HID consumer control device,
but these keys do not work in the current (5.8-rc1) kernel due to
the incorrect HID report descriptor. Fix the problem by modifying
the internal HID report descriptor.

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
 drivers/hid/Kconfig       |  6 ++++
 drivers/hid/Makefile      |  1 +
 drivers/hid/hid-ids.h     |  2 ++
 drivers/hid/hid-varmilo.c | 58 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 drivers/hid/hid-varmilo.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 443c5cbbde04..c9f0c9b79158 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -441,6 +441,12 @@ config HID_WALTOP
 	---help---
 	Support for Waltop tablets.
 
+config HID_VARMILO
+	tristate "Varmilo Keyboards"
+	depends on HID
+	help
+	  Support for Varmilo keyboards.
+
 config HID_VIEWSONIC
 	tristate "ViewSonic/Signotec"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index d8ea4b8c95af..e90a98090452 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_HID_LED)		+= hid-led.o
 obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
 obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
 obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
+obj-$(CONFIG_HID_VARMILO)	+= hid-varmilo.o
 obj-$(CONFIG_HID_VIEWSONIC)	+= hid-viewsonic.o
 
 wacom-objs			:= wacom_wac.o wacom_sys.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 874fc3791f3b..955be22fc69d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1189,6 +1189,8 @@
 #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0709	0x0709
 #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19	0x0a19
 
+#define USB_DEVICE_ID_VARMILO_VA104M_07B1   0X07b1
+
 #define USB_VENDOR_ID_VELLEMAN		0x10cf
 #define USB_DEVICE_ID_VELLEMAN_K8055_FIRST	0x5500
 #define USB_DEVICE_ID_VELLEMAN_K8055_LAST	0x5503
diff --git a/drivers/hid/hid-varmilo.c b/drivers/hid/hid-varmilo.c
new file mode 100644
index 000000000000..10e50f2dca61
--- /dev/null
+++ b/drivers/hid/hid-varmilo.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID report fixup for varmilo keyboards
+ *
+ *  Copyright (c) 2020 Frank Yang <puilp0502@gmail.com>
+ *
+ */
+
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+/*
+ * Varmilo VA104M with device ID of 07B1 incorrectly reports Logical Minimum as
+ * 572 (0x02 0x3c). We fix this by setting Logical Minimum to zero.
+ */
+static __u8 *varmilo_07b1_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				       unsigned int *rsize)
+{
+	if (*rsize == 25 &&
+	    rdesc[0] == 0x05 && rdesc[1] == 0x0c &&
+	    rdesc[2] == 0x09 && rdesc[3] == 0x01 &&
+	    rdesc[6] == 0x19 && rdesc[7] == 0x00 &&
+	    rdesc[11] == 0x16 && rdesc[12] == 0x3c && rdesc[13] == 0x02) {
+		hid_info(hdev,
+			 "fixing up varmilo VA104M consumer control report descriptor\n");
+		rdesc[12] = 0x00;
+		rdesc[13] = 0x00;
+	}
+	return rdesc;
+}
+
+static __u8 *varmilo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				  unsigned int *rsize)
+{
+	if (hdev->product == USB_DEVICE_ID_VARMILO_VA104M_07B1 &&
+	    hdev->vendor == USB_VENDOR_ID_CYPRESS)
+		rdesc = varmilo_07b1_report_fixup(hdev, rdesc, rsize);
+	return rdesc;
+}
+
+static const struct hid_device_id varmilo_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CYPRESS, USB_DEVICE_ID_VARMILO_VA104M_07B1) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, varmilo_devices);
+
+static struct hid_driver varmilo_driver = {
+	.name = "varmilo",
+	.id_table = varmilo_devices,
+	.report_fixup = varmilo_report_fixup,
+};
+
+module_hid_driver(varmilo_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.17.1

