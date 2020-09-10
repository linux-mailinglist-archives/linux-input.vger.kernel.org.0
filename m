Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD502642CF
	for <lists+linux-input@lfdr.de>; Thu, 10 Sep 2020 11:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgIJJty (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Sep 2020 05:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730269AbgIJJt2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Sep 2020 05:49:28 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D338C061756;
        Thu, 10 Sep 2020 02:49:28 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c10so4798278otm.13;
        Thu, 10 Sep 2020 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uXg/iJJ4ccPNr9MQRtCOvct8uIrO7djqC5BnlM/ckNg=;
        b=NAA6Pu278YXbfj8K1thQgWscHENF/1Mi1HyksWw3h3HrFaUtSvXQQvInRmj96jQUW7
         hL/ATac3qDWoOiJjvVklmcfBHYS+tfHlZAD+Gy9Cat1zWqPFuD6VUtv/KvY0U5ZPrBGq
         7nc97Yk+xD6BfNl74FmZ1oTkQO0jxlLtPu1JQMMH6o//YA9P1edtC4d5cQG3/O+r3xXp
         e/26hsd0tf3mjAYT7YZhyVAlEpOZqBOzFFzyu4oL5iqKMqxxf5G7IH8RiTO0uXobtrjg
         P/B1XCgx2eANbB1kUGB9sJz0EZ553Z6peRYoqFS9wSbEYTD839oIM2i4iWEhnLgDu12C
         zRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uXg/iJJ4ccPNr9MQRtCOvct8uIrO7djqC5BnlM/ckNg=;
        b=GKqXTZFTup87Dc5NdZA+uLAJyaLcGXf6sIAIqK+a5NOobS9WnzKFOFMVF4j51CMYJ+
         fVBP0rP2ngNqMao0R6dfAEXYl2nt056+F457x0jz7n/kHZSo9FA8hpjj1EG7P7puDn2m
         vvUwrjsUZDPMt+J+ESWKHaq5DHPgywVPJTdhgo4AAMl9JtG3Gi53kmQXdFj6eVTtvoax
         KJbDMeIMbUomHs16MRCsrpK52qU9DSYV4NX7a5LT1lkQR3M296016iIXEGy8SFVSFVxY
         KrorcQCfHbleaU1Ev7jAYFvOyKPmz72Hm2iR1uzo7oHefL8nOYmyGPudMk65pLJNMVLE
         8RuA==
X-Gm-Message-State: AOAM533vZMy0ay/6yh1RztBShcP76tQjdv5HCXl9a1jsbG9cwBGxUdZX
        YSfGpO2kI0QxWxCq41IngWaFWygDnjRs4JKYzLU=
X-Google-Smtp-Source: ABdhPJy/X2sYCS8VdE2Lw0h3Uwudoe7u5V1s70HK3HMj4FgMUUVCzNo4sJEnDVHNsmGfhUPqwilqlFy3NisGn2AUxO0=
X-Received: by 2002:a9d:908:: with SMTP id 8mr3465011otp.356.1599731367438;
 Thu, 10 Sep 2020 02:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200603054438.5541-1-Andrea.Ho@advantech.com.tw>
In-Reply-To: <20200603054438.5541-1-Andrea.Ho@advantech.com.tw>
From:   Andrea Ho <voyandrea@gmail.com>
Date:   Thu, 10 Sep 2020 17:49:01 +0800
Message-ID: <CAGBRx8PniAyjoY8MSMf3A6VZPrLdoSu-U7rP793No1386BiRBg@mail.gmail.com>
Subject: [V4,1/1] Input/misc: add support for Advantech software defined button
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jeff LaBundy <jeff@labundy.com>,
        Brian Masney <masneyb@onstation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
v4:
        - match MODULE_LICENSE and SPDX header
        - rename the device name
        - move driver name and class as macros to open-code
        - remove the forward declarations of the functions
        - replace fucntions acpi_button_init() and
          acpi_button_exit() by module_acpi_driver()
        - replace kzalloc() by devm_kzalloc()
        - replace input_allocate_device() by devm_input_allocate_device()
---
 MAINTAINERS                       |   5 +
 drivers/input/misc/Kconfig        |  11 ++
 drivers/input/misc/Makefile       |   2 +-
 drivers/input/misc/adv_swbutton.c | 190 ++++++++++++++++++++++++++++++
 4 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/misc/adv_swbutton.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d7e3eab852d3..02c818161aab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -561,6 +561,11 @@ S: Maintained
 F:     Documentation/scsi/advansys.rst
 F:     drivers/scsi/advansys.c

+ADVANTECH SWBTN DRIVER
+M:     Andrea Ho <Andrea.Ho@advantech.com.tw>
+S:     Maintained
+F:     drivers/input/misc/adv_swbutton.c
+
 ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
 M:     Michael Hennerich <michael.hennerich@analog.com>
 S:     Supported
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 362e8a01980c..f88d1490ae40 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -869,4 +869,15 @@ config INPUT_STPMIC1_ONKEY
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
index a48e5f2d859d..a03430f5ee9d 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -84,4 +84,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)         += wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)        += xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)            += yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)   += ideapad_slidebar.o
-
+obj-$(CONFIG_INPUT_ADV_SWBUTTON)    += adv_swbutton.o
diff --git a/drivers/input/misc/adv_swbutton.c
b/drivers/input/misc/adv_swbutton.c
new file mode 100644
index 000000000000..09e5a83c61a9
--- /dev/null
+++ b/drivers/input/misc/adv_swbutton.c
@@ -0,0 +1,190 @@
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
+#define ACPI_SWBTN_NAME                     "Software Button"
+#define ACPI_BUTTON_CLASS                   "button"
+
+#define ACPI_BUTTON_SUBCLASS_SOFTWARE       "software"
+#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
+#define ACPI_BUTTON_TYPE_SOFTWARE           0x07
+
+#define ACPI_BUTTON_FILE_INFO               "info"
+#define ACPI_BUTTON_FILE_STATE              "state"
+#define ACPI_BUTTON_TYPE_UNKNOWN            0x00
+
+#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
+#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
+
+#define SOFTWARE_BUTTON                     BTN_TRIGGER_HAPPY
+
+#define _COMPONENT                          ACPI_BUTTON_COMPONENT
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
+static int acpi_button_add(struct acpi_device *device)
+{
+       struct acpi_button *button;
+       struct input_dev *input;
+       const char *hid = acpi_device_hid(device);
+       char *name, *class;
+       int error;
+
+       button = devm_kzalloc(&device->dev, sizeof(*button), GFP_KERNEL);
+       if (!button)
+               return -ENOMEM;
+
+       device->driver_data = button;
+       input = devm_input_allocate_device(&device->dev);
+       if (!input) {
+               error =  -ENOMEM;
+               goto err_free_mem;
+       }
+
+       button->input = input;
+
+       name = acpi_device_name(device);
+       class = acpi_device_class(device);
+
+       if (!strcmp(hid, ACPI_BUTTON_HID_SWBTN)) {
+               button->type = ACPI_BUTTON_TYPE_SOFTWARE;
+               button->pressed = false;
+               strcpy(name, ACPI_SWBTN_NAME);
+               sprintf(class, "%s/%s", ACPI_BUTTON_CLASS,
+                       ACPI_BUTTON_SUBCLASS_SOFTWARE);
+       } else {
+               return -ENODEV;
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
+               return error;
+
+       device_init_wakeup(&device->dev, true);
+
+       return 0;
+
+err_free_mem:
+       devm_kfree(&device->dev, button);
+       return error;
+}
+
+static int acpi_button_remove(struct acpi_device *device)
+{
+       struct acpi_button *button = acpi_driver_data(device);
+
+       input_unregister_device(button->input);
+       devm_kfree(&device->dev, button);
+       return 0;
+}
+
+static const struct acpi_device_id button_device_ids[] = {
+       {ACPI_BUTTON_HID_SWBTN, 0},
+       {"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, button_device_ids);
+
+static struct acpi_driver acpi_button_driver = {
+       .name = ACPI_SWBTN_NAME,
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
+module_acpi_driver(acpi_button_driver);
+
+ACPI_MODULE_NAME("swbutton");
+
+MODULE_AUTHOR("Andrea Ho");
+MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
+MODULE_LICENSE("GPL v2");
--
2.17.1
