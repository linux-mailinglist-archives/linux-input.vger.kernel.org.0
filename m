Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF113126EE
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 19:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBGSsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 13:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhBGSsB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 13:48:01 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D05C06174A;
        Sun,  7 Feb 2021 10:47:20 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c5so128103qth.2;
        Sun, 07 Feb 2021 10:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWH0Q1jDOx5EaYy2MNAK/VPeRKFAi3UCkZzRnTfh4UE=;
        b=oDf5QSvimmbIXC/gP428oJLlhvSC3kQ8xYGWeIrGKsMCzkH97bxjzfLFhnFNboDWNp
         rpc5+Lf6WlR5Z8ocZZrcVRGkyNLG03Ly7RstgOKpjCYXdRmUR60AFu3Lr2L/od+BBSr5
         /g9Glun5ttkSQXUD2VfAAb0tgEhYQGWpgQmO4rG8Ayj4VH9zEZmlbSUUZMa4YeRkhmDw
         2X8EEcGqN5dqNDPXUM2lxq5ah9iaq51Z3mAwuIzqburpspRvEsNJNOxsgPVFDnoOkCg9
         Wnmh7G1vAOPuCgKGkuuO8gt57c53cjAGBHl6g0H/oRydCQVqPtEFHV4r+DD71gXO5Ptk
         yIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWH0Q1jDOx5EaYy2MNAK/VPeRKFAi3UCkZzRnTfh4UE=;
        b=QxL7UbL2aZhjEQ0dSr1M22gxo+N1sE8McM1VCtgSGrzzEW1I4WGG+kdIjO9Jhwqm/S
         UrxBwAIjP9MGNAm4x5gwaPi5689+caEabrlU1eIZpy5tu0qhuV4ijB9rIV+LOwfW0wcN
         SvUd1+lM3Veb/mLs2ap8nBdk9Z8/MeSET30Vrm55F+21lK36OuUYY0t8053Y7ASjvzkl
         YQf425FIGKAiDFzr8g+tiPbE5tvw6x7yg0ycMRrqTc+JJCsX1auuirBgHJIuxPb6yYRn
         ldv9L3l0tKQ+cqlPP2u9O0UR8lT0PepwQf2HnxnbALI7Yj9AoYreyWNK6mD4Gljq4wrL
         N1cw==
X-Gm-Message-State: AOAM531CwrEQrjrFQfhdbtGmHHRP629Si9Yh7uAqH+5Er0GFnQbolt/5
        dL68wy8/Fq2JHcs5jsS9jt4=
X-Google-Smtp-Source: ABdhPJwMwOtctq4J6ZbqJ8psrh4ZIxwlvD1pp6BXdTW/m04Xbkju2IjKZsRYlGhw8sX95x83IS3udQ==
X-Received: by 2002:ac8:392a:: with SMTP id s39mr9285653qtb.109.1612723639937;
        Sun, 07 Feb 2021 10:47:19 -0800 (PST)
Received: from localhost.localdomain (c-73-119-27-70.hsd1.ma.comcast.net. [73.119.27.70])
        by smtp.gmail.com with ESMTPSA id z5sm15067092qkc.61.2021.02.07.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:47:19 -0800 (PST)
From:   Benjamin Moody <benjamin.moody@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Benjamin Moody <bmoody@member.fsf.org>
Subject: [PATCH] HID: semitek: new driver for GK6X series keyboards
Date:   Sun,  7 Feb 2021 13:47:04 -0500
Message-Id: <20210207184704.2961-1-benjamin.moody@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Benjamin Moody <bmoody@member.fsf.org>

A number of USB keyboards, using the Semitek firmware, are capable of
handling arbitrary N-key rollover, but due to a buggy report
descriptor, keys beyond the sixth cannot be detected by the generic
HID driver.

There are numerous hardware variants sold by several vendors, mostly
using generic names like "GK61" for the 61-key version.  These
keyboards are sometimes known collectively as the "GK6X" series.

The keyboard has three USB interfaces.  Interface 0 uses the standard
HID boot protocol, limited to eight modifier keys and six normal keys;
interface 2 uses a custom report format that permits any number of
keys.  If more than six keys are pressed simultaneously, the first six
are reported via interface 0 while subsequent keys are reported via
interface 2.

(Interface 1 uses a custom protocol for reprogramming the keyboard;
this can be controlled through userspace tools and is not of concern
for the present driver.)

The report descriptor for interface 2, however, is incorrect (for
report ID 0x04, the input field is marked as "array" rather than
"variable".)  The descriptor appears to be correct in other respects,
so we simply replace the incorrect byte before parsing the descriptor.

Signed-off-by: Benjamin Moody <bmoody@member.fsf.org>
---
 drivers/hid/Kconfig       | 15 +++++++++++++++
 drivers/hid/Makefile      |  1 +
 drivers/hid/hid-ids.h     |  3 +++
 drivers/hid/hid-semitek.c | 40 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 drivers/hid/hid-semitek.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 09fa75a2b..06131a79d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -893,6 +893,21 @@ config HID_SAMSUNG
 	help
 	Support for Samsung InfraRed remote control or keyboards.
 
+config HID_SEMITEK
+	tristate "Semitek USB keyboards"
+	depends on HID
+	help
+	Support for Semitek USB keyboards that are not fully compliant
+	with the HID standard.
+
+	There are many variants, including:
+	- GK61, GK64, GK68, GK84, GK96, etc.
+	- SK61, SK64, SK68, SK84, SK96, etc.
+	- Dierya DK61/DK66
+	- Tronsmart TK09R
+	- Woo-dy
+	- X-Bows Nature/Knight
+
 config HID_SONY
 	tristate "Sony PS2/3/4 accessories"
 	depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 014d21fe7..1c02f551e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
 obj-$(CONFIG_HID_RMI)		+= hid-rmi.o
 obj-$(CONFIG_HID_SAITEK)	+= hid-saitek.o
 obj-$(CONFIG_HID_SAMSUNG)	+= hid-samsung.o
+obj-$(CONFIG_HID_SEMITEK)	+= hid-semitek.o
 obj-$(CONFIG_HID_SMARTJOYPLUS)	+= hid-sjoy.o
 obj-$(CONFIG_HID_SONY)		+= hid-sony.o
 obj-$(CONFIG_HID_SPEEDLINK)	+= hid-speedlink.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5ba0aa1d2..def7626d0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1041,6 +1041,9 @@
 #define USB_DEVICE_ID_SEMICO_USB_KEYKOARD	0x0023
 #define USB_DEVICE_ID_SEMICO_USB_KEYKOARD2	0x0027
 
+#define USB_VENDOR_ID_SEMITEK	0x1ea7
+#define USB_DEVICE_ID_SEMITEK_KEYBOARD	0x0907
+
 #define USB_VENDOR_ID_SENNHEISER	0x1395
 #define USB_DEVICE_ID_SENNHEISER_BTD500USB	0x002c
 
diff --git a/drivers/hid/hid-semitek.c b/drivers/hid/hid-semitek.c
new file mode 100644
index 000000000..ba6607d5e
--- /dev/null
+++ b/drivers/hid/hid-semitek.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Semitek keyboards
+ *
+ *  Copyright (c) 2021 Benjamin Moody
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+static __u8 *semitek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+                                  unsigned int *rsize)
+{
+	/* In the report descriptor for interface 2, fix the incorrect
+	   description of report ID 0x04 (the report contains a
+	   bitmask, not an array of keycodes.) */
+	if (*rsize == 0xcb && rdesc[0x83] == 0x81 && rdesc[0x84] == 0x00) {
+		hid_info(hdev, "fixing up Semitek report descriptor\n");
+		rdesc[0x84] = 0x02;
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id semitek_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMITEK, USB_DEVICE_ID_SEMITEK_KEYBOARD) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, semitek_devices);
+
+static struct hid_driver semitek_driver = {
+	.name = "semitek",
+	.id_table = semitek_devices,
+	.report_fixup = semitek_report_fixup,
+};
+module_hid_driver(semitek_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.20.1

