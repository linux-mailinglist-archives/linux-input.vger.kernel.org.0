Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C356317D663
	for <lists+linux-input@lfdr.de>; Sun,  8 Mar 2020 22:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgCHViL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Mar 2020 17:38:11 -0400
Received: from 109-230-57-163.dynamic.orange.sk ([109.230.57.163]:56416 "EHLO
        mail.sammserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgCHViL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Mar 2020 17:38:11 -0400
X-Greylist: delayed 503 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Mar 2020 17:38:10 EDT
Received: by mail.sammserver.com (Postfix, from userid 5011)
        id F232091CED1; Sun,  8 Mar 2020 22:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sammserver.com;
        s=email; t=1583702985;
        bh=dcJuL7aZ/LO/cCw9tSvxNVq+5T2x8hXF3UN7VlqyATA=;
        h=From:To:Cc:Subject:Date:From;
        b=S+GPhvBhdSQQkvHKev186Zom8IboabftwknExcx1salDsbYl7TsHJxigKAsM9LIv1
         QqBT59iyX44uNDkSj00H+1aIKRRyq6tcOTj8rqVecZuGHn/Ta3n1aLF/iiWT5+R7jp
         p5BptPUtNjg6Z+UZIC/W7OWmcJFAQ5jUw0gddEMM=
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id A4F0C91CECE;
        Sun,  8 Mar 2020 22:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sammserver.com;
        s=email; t=1583702985;
        bh=dcJuL7aZ/LO/cCw9tSvxNVq+5T2x8hXF3UN7VlqyATA=;
        h=From:To:Cc:Subject:Date:From;
        b=S+GPhvBhdSQQkvHKev186Zom8IboabftwknExcx1salDsbYl7TsHJxigKAsM9LIv1
         QqBT59iyX44uNDkSj00H+1aIKRRyq6tcOTj8rqVecZuGHn/Ta3n1aLF/iiWT5+R7jp
         p5BptPUtNjg6Z+UZIC/W7OWmcJFAQ5jUw0gddEMM=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id 8510D142290F; Sun,  8 Mar 2020 22:29:45 +0100 (CET)
From:   =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>
Subject: [PATCH] HID: Add driver fixing Glorious PC Gaming Race mouse report descriptor
Date:   Sun,  8 Mar 2020 22:27:30 +0100
Message-Id: <20200308212729.51336-1-sammko@sammserver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Glorious Model O mice (and also at least the Model O-, which is
driver-wise the same mouse) have a bug in the descriptor of HID
Report with ID 2. This report is used for Consumer Control buttons,
which can be mapped using the provided Windows only software.

Here is an excerpt from the original descriptor:

  INPUT(2)[INPUT]
    Field(0)
      Flags( Constant Variable Absolute )
    Field(1)
      Flags( Constant Variable Absolute )
    Field(2)
      Flags( Constant Variable Absolute )

The issue is the Constant flag specified on all 3 fields, which
causes the hid driver to ignore changes in these fields and
essentialy causes the buttons to not work at all. The submitted driver
patches the descriptor to end up with the following:

  INPUT(2)[INPUT]
    Field(0)
      Flags( Variable Relative )
    Field(1)
      Flags( Variable Relative )
    Field(2)
      Flags( Variable Relative )

The Constant bit is reset and the Relative bit has been set in
order to prevent repeat events when holding down the button.
Additionally, the device name is set to "Glorious Model O",
where the original was "SINOWEALTH Wired Gaming Mouse".

Signed-off-by: Samuel Čavoj <sammko@sammserver.com>
---
 drivers/hid/Kconfig        |  9 ++++-
 drivers/hid/Makefile       |  1 +
 drivers/hid/hid-glorious.c | 69 ++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h      |  3 ++
 4 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/hid-glorious.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 494a39e74939..1e1f1b16d44d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -362,6 +362,13 @@ config HID_GFRM
 	---help---
 	Support for Google Fiber TV Box remote controls
 
+config HID_GLORIOUS
+	tristate "Glorious PC Gaming Race mice"
+	depends on HID
+	help
+	  Support for Glorious PC Gaming Race mice such as
+	  the Glorious Model O and O-.
+
 config HID_HOLTEK
 	tristate "Holtek HID devices"
 	depends on USB_HID
@@ -892,7 +899,7 @@ config HID_SONY
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
 
 config SONY_FF
-	bool "Sony PS2/3/4 accessories force feedback support" 
+	bool "Sony PS2/3/4 accessories force feedback support"
 	depends on HID_SONY
 	select INPUT_FF_MEMLESS
 	---help---
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index bfefa365b1ce..be0f38dcf942 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_HID_ELO)		+= hid-elo.o
 obj-$(CONFIG_HID_EZKEY)		+= hid-ezkey.o
 obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
+obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
 obj-$(CONFIG_HID_GT683R)	+= hid-gt683r.o
 obj-$(CONFIG_HID_GYRATION)	+= hid-gyration.o
diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
new file mode 100644
index 000000000000..c12bf36b8d4c
--- /dev/null
+++ b/drivers/hid/hid-glorious.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  USB HID driver for Glorious PC Gaming Race
+ *  Glorious Model O and O- mice.
+ *
+ *  Copyright (c) 2020 Samuel Čavoj <sammko@sammserver.com>
+ */
+
+/*
+ */
+
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+MODULE_AUTHOR("Samuel Čavoj <sammko@sammserver.com>");
+MODULE_DESCRIPTION("HID driver for Glorious PC Gaming Race mice");
+
+/*
+ * Glorious Model O and O- specify the const flag in the consumer input
+ * report descriptor, which leads to inputs being ignored. Fix this
+ * by patching the descriptor.
+ */
+static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	if (*rsize == 213 &&
+		rdesc[84] == 129 && rdesc[112] == 129 && rdesc[140] == 129 &&
+		rdesc[85] == 3   && rdesc[113] == 3   && rdesc[141] == 3) {
+		hid_info(hdev, "patching Glorious Model O consumer control report descriptor\n");
+		rdesc[85] = rdesc[113] = rdesc[141] = 6;
+	}
+	return rdesc;
+}
+
+static int glorious_probe(struct hid_device *hdev,
+		const struct hid_device_id *id)
+{
+	int ret;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	snprintf(hdev->name, sizeof(hdev->name), "%s", "Glorious Model O");
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static const struct hid_device_id glorious_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
+		USB_DEVICE_ID_GLORIOUS_MODEL_O) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, glorious_devices);
+
+static struct hid_driver glorious_driver = {
+	.name = "glorious",
+	.id_table = glorious_devices,
+	.probe = glorious_probe,
+	.report_fixup = glorious_report_fixup
+};
+
+module_hid_driver(glorious_driver);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce603c4..3256ac6953fc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -464,6 +464,9 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
+#define USB_VENDOR_ID_GLORIOUS  0x258a
+#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
+
 #define I2C_VENDOR_ID_GOODIX		0x27c6
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
-- 
2.25.1

