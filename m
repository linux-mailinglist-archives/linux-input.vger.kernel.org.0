Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB94817883A
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 03:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387400AbgCDCZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 21:25:02 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:14714 "EHLO
        ACLMS1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387398AbgCDCZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 21:25:02 -0500
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS1.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Tddb17c849aac14014bd38@ACLMS1.advantech.com.tw>;
 Wed, 4 Mar 2020 10:25:00 +0800
Received: from mail-ot1-f54.google.com (209.85.210.54) by
 taipei08.ADVANTECH.CORP (172.20.0.235) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:24:58 +0800
Received: by mail-ot1-f54.google.com with SMTP id v10so553234otp.2;
        Tue, 03 Mar 2020 18:24:58 -0800 (PST)
X-Gm-Message-State: ANhLgQ3ZKRdDso39NwAdDWogTiCyYViHevXLcixvvkPKzTvNu/pIaQMU
        WuJNwA0aEwGrFkqZleP74Hw1wC4jklMlS5c/a0A=
X-Google-Smtp-Source: ADFU+vtlctne6blA9aClNHENbOQS87DU627SIWKVMpXL/ES4k0iVY79mTOru/gpzy93PcT4YOBKIO3zR/ZND0igtghE=
X-Received: by 2002:a9d:282:: with SMTP id 2mr680006otl.178.1583288696558;
 Tue, 03 Mar 2020 18:24:56 -0800 (PST)
MIME-Version: 1.0
From:   Andrea Ho <andrea.ho@advantech.com.tw>
Date:   Wed, 4 Mar 2020 10:24:30 +0800
X-Gmail-Original-Message-ID: <CAGBRx8PzDmugZALw_rnKKv7ut0XVCgn5-sOD=+t-WM0Um84Vpg@mail.gmail.com>
Message-ID: <CAGBRx8PzDmugZALw_rnKKv7ut0XVCgn5-sOD=+t-WM0Um84Vpg@mail.gmail.com>
Subject: [V3,1/1] Input/misc: add support for Advantech software defined button
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [209.85.210.54]
X-ClientProxiedBy: taipei08.ADVANTECH.CORP (172.20.0.235) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>

Advantech sw_button is a ACPI event trigger button.

With this driver, we can report KEY_EVENT on the
Advantech Tabletop Network Appliances products and it has been
tested in FWA1112VC.

Add the software define button support to report EV_REP key_event
(BTN_TRIGGER_HAPPY) by pressing button that cloud be get on user
interface and trigger the customized actions.

Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>

v2:
        - remove fix-patch in patch
        - fix build WARNING on format string.
        - using linux kernel sort function
v3:
        - remove X86 dependency
        - License only for GPL 2.0 and remove redundancy paragraphs
        - remove version and prefix
        - remove printk message
        - remove double click and long press event check
        - remove MODULE_PARAM
---
 MAINTAINERS                       |   5 +
 drivers/input/misc/Kconfig        |  11 ++
 drivers/input/misc/Makefile       |   2 +-
 drivers/input/misc/adv_swbutton.c | 207 ++++++++++++++++++++++++++++++
 4 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/misc/adv_swbutton.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8982c6e013b3..821c5cacf553 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -543,6 +543,11 @@ S: Maintained
 F:     Documentation/scsi/advansys.txt
 F:     drivers/scsi/advansys.c

+ADVANTECH SWBTN DRIVER
+M:     Andrea Ho <Andrea.Ho@advantech.com.tw>
+S:     Maintained
+F:     drivers/input/misc/adv_swbutton.c
+
 ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
 M:     Michael Hennerich <michael.hennerich@analog.com>
 W:     http://wiki.analog.com/ADXL345
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c..b49a0fad60b0 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -879,4 +879,15 @@ config INPUT_STPMIC1_ONKEY
          To compile this driver as a module, choose M here: the
          module will be called stpmic1_onkey.

+config INPUT_ADV_SWBUTTON
+        tristate "Advantech ACPI Software button Driver"
+        depends on ACPI
+        help
+          Say Y here to enable support for Advantech software defined
+          button feature. More information can be fount at
+          <http://www.advantech.com.tw/products/>
+
+          To compile this driver as a module, choose M here. The module will
+          be called adv_swbutton.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..a5ceb98f18f6 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -85,4 +85,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)         += wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)        += xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)            += yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)   += ideapad_slidebar.o
-
+obj-$(CONFIG_INPUT_ADV_SWBUTTON)    += adv_swbutton.o
diff --git a/drivers/input/misc/adv_swbutton.c
b/drivers/input/misc/adv_swbutton.c
new file mode 100644
index 000000000000..ef237f9c4f52
--- /dev/null
+++ b/drivers/input/misc/adv_swbutton.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  adv_swbutton.c - Software Button Interface Driver.
+ *
+ *  (C) Copyright 2020 Advantech Corporation, Inc
+ *
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/version.h>
+#include <linux/types.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include <linux/acpi.h>
+#include <linux/ktime.h>
+#include <linux/moduleparam.h>
+#include <acpi/button.h>
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+
+#define ACPI_BUTTON_CLASS                   "button"
+#define ACPI_BUTTON_FILE_INFO               "info"
+#define ACPI_BUTTON_FILE_STATE              "state"
+#define ACPI_BUTTON_TYPE_UNKNOWN            0x00
+
+#define ACPI_BUTTON_SUBCLASS_SOFTWARE       "software"
+#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
+#define ACPI_BUTTON_DEVICE_NAME_SOFTWARE    "Software Button"
+#define ACPI_BUTTON_TYPE_SOFTWARE           0x07
+
+#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
+#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
+
+#define SOFTWARE_BUTTON                     BTN_TRIGGER_HAPPY
+
+#define _COMPONENT                          ACPI_BUTTON_COMPONENT
+
+ACPI_MODULE_NAME("swbutton");
+
+MODULE_AUTHOR("Andrea Ho");
+MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
+MODULE_LICENSE("GPL");
+
+static const struct acpi_device_id button_device_ids[] = {
+       {ACPI_BUTTON_HID_SWBTN, 0},
+       {"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, button_device_ids);
+
+static int acpi_button_add(struct acpi_device *device);
+static int acpi_button_remove(struct acpi_device *device);
+static void acpi_button_notify(struct acpi_device *device, u32 event);
+
+static struct acpi_driver acpi_button_driver = {
+       .name = ACPI_BUTTON_DEVICE_NAME_SOFTWARE,
+       .class = ACPI_BUTTON_CLASS,
+       .owner = THIS_MODULE,
+       .ids = button_device_ids,
+       .ops = {
+               .add = acpi_button_add,
+               .remove = acpi_button_remove,
+               .notify = acpi_button_notify,
+       },
+};
+
+struct acpi_button {
+       unsigned int type;
+       struct input_dev *input;
+       char phys[32];
+       bool pressed;
+};
+
+/*-------------------------------------------------------------------------
+ *                               Driver Interface
+ *--------------------------------------------------------------------------
+ */
+static void acpi_button_notify(struct acpi_device *device, u32 event)
+{
+       struct acpi_button *button = acpi_driver_data(device);
+       struct input_dev *input;
+
+       int keycode, BTN_KEYCODE = SOFTWARE_BUTTON;
+
+       switch (event) {
+       case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
+               input = button->input;
+
+               if (!button->pressed)
+                       return;
+
+               keycode = test_bit(BTN_KEYCODE, input->keybit) ?
+                               BTN_KEYCODE : KEY_UNKNOWN;
+
+               button->pressed = false;
+
+               input_report_key(input, keycode, 0);
+               input_sync(input);
+       break;
+       case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
+               input = button->input;
+               button->pressed = true;
+
+               keycode = test_bit(BTN_KEYCODE, input->keybit) ?
+                           BTN_KEYCODE : KEY_UNKNOWN;
+
+               input_report_key(input, keycode, 1);
+               input_sync(input);
+       break;
+       default:
+               ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+                                 "Unsupported event [0x%x]\n", event));
+       break;
+       }
+}
+
+static int __init acpi_button_init(void)
+{
+       return acpi_bus_register_driver(&acpi_button_driver);
+}
+
+static void __exit acpi_button_exit(void)
+{
+       acpi_bus_unregister_driver(&acpi_button_driver);
+}
+
+static int acpi_button_add(struct acpi_device *device)
+{
+       struct acpi_button *button;
+       struct input_dev *input;
+       const char *hid = acpi_device_hid(device);
+       char *name, *class;
+       int error;
+
+       button = kzalloc(sizeof(struct acpi_button), GFP_KERNEL);
+       if (!button)
+               return -ENOMEM;
+
+       device->driver_data = button;
+
+       button->input = input_allocate_device();
+       input = button->input;
+       if (!input) {
+               error = -ENOMEM;
+               goto err_free_button;
+       }
+
+       name = acpi_device_name(device);
+       class = acpi_device_class(device);
+
+       if (!strcmp(hid, ACPI_BUTTON_HID_SWBTN)) {
+               button->type = ACPI_BUTTON_TYPE_SOFTWARE;
+               button->pressed = false;
+               strcpy(name, ACPI_BUTTON_DEVICE_NAME_SOFTWARE);
+               sprintf(class, "%s/%s", ACPI_BUTTON_CLASS,
+                       ACPI_BUTTON_SUBCLASS_SOFTWARE);
+       } else {
+               error = -ENODEV;
+               goto err_free_input;
+       }
+
+       snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
+
+       input->name = name;
+       input->phys = button->phys;
+       input->id.bustype = BUS_HOST;
+       input->id.product = button->type;
+       input->dev.parent = &device->dev;
+
+       switch (button->type) {
+       case ACPI_BUTTON_TYPE_SOFTWARE:
+               set_bit(EV_KEY, input->evbit);
+               set_bit(EV_REP, input->evbit);
+
+               input_set_capability(input, EV_KEY, SOFTWARE_BUTTON);
+       break;
+       }
+
+       input_set_drvdata(input, device);
+       error = input_register_device(input);
+       if (error)
+               goto err_free_input;
+
+       device_init_wakeup(&device->dev, true);
+
+       return 0;
+
+err_free_input:
+       input_free_device(input);
+err_free_button:
+       kfree(button);
+       return error;
+}
+
+static int acpi_button_remove(struct acpi_device *device)
+{
+       struct acpi_button *button = acpi_driver_data(device);
+
+       input_unregister_device(button->input);
+       kfree(button);
+       return 0;
+}
+
+module_init(acpi_button_init);
+module_exit(acpi_button_exit);
--
2.17.1
