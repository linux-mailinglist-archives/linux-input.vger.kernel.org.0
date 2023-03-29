Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076D26CCF99
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 03:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjC2Bqb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 21:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjC2Bqa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 21:46:30 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB6C19B2;
        Tue, 28 Mar 2023 18:46:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u10so13481049plz.7;
        Tue, 28 Mar 2023 18:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680054388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deoW1nDD6AE5M0junL3wJzEC4AyY0UpQhfct2xRu5gY=;
        b=gCFOs/LY8lU0CaYkzaFI9uAa36DfSn/jxprj+2MYJi87nWxcEWPQjuqzT6G8YOij8o
         nyoknv6Mdgspd1CKpNG5w8ar+OcXXy0NLMPjMSzckrv+kQShBRw3eCd/SJ233HEQmHSc
         0/cJhc+Ar+sZL5TUsbeO5cD2K50oqNcmUOK9hKb3QgMcx4HSAvf65zy+u5E+dWma+E8c
         tNbUQwxBS2xj1QmklGuPxCg3fEy+kK0sUCZQXJ8dymwnLq6i3pfFZl+CeblZskyO0gsn
         044+pkXy7N08TQIi6iox4k7vZ+Hr1KxEyhyAjkwyqcV/DxlQF0Y500gE44CWwvyqy9kJ
         bB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680054388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deoW1nDD6AE5M0junL3wJzEC4AyY0UpQhfct2xRu5gY=;
        b=p38dQDAum6f0LyQWY5MDH0VH/9t6GN0sBpwDurlS+Eqv+X7ShJToPSJ60tcuoP7XU0
         4OCK9nVE72JxGaPTGe+KWRCoDEgZsiuPxwVbiBlnDm03OnCXlG+Lf33OOmrXoZWxHvF2
         KTAdw5Yb9TyrmXot12nmpeA5fYgYKyY7qTRYgsr/Y2e6Bpk3TNpZnSqSOX9eBu3pZzYY
         luTDZnQPJdhd5/7GzORvjJX2yUoXh0phK+29FD+nuWkZYrBjPy00Ql58gvwwVXdiyGWU
         65QU6Y5tj2oXxngBIpzyngDlRrvefrlm+dDshYNngIOnuVuUHa/jIwZJjpx6vKOwHp43
         xNgw==
X-Gm-Message-State: AAQBX9dAWOlCb7SKj6WvCieI6oz+1F1IkCknYcn5FATCa2WjE/VxYtxt
        oKk2kTkorZvmAswzW4C9VpuhrdqVoAbkUQ==
X-Google-Smtp-Source: AKy350aeGsaD3eph8lpkUHo5NCf3HnAg1n56vMCH0fvLw0/oqmtTP+FHaeHsXl4AXqG4AZ0ICBTutQ==
X-Received: by 2002:a17:90a:db97:b0:236:6a28:f784 with SMTP id h23-20020a17090adb9700b002366a28f784mr18780768pjv.3.1680054387881;
        Tue, 28 Mar 2023 18:46:27 -0700 (PDT)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id nv8-20020a17090b1b4800b00233cde36909sm203918pjb.21.2023.03.28.18.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 18:46:27 -0700 (PDT)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Date:   Tue, 28 Mar 2023 18:45:59 -0700
Message-Id: <20230329014559.44494-3-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329014559.44494-1-kallmeyeras@gmail.com>
References: <20230329014559.44494-1-kallmeyeras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Gergo Koteles <soyer@irl.hu>

This WMI driver for the tablet mode control switch for Lenovo Yoga
notebooks was originally written by Gergo Koteles. The mode is mapped to
a SW_TABLET_MODE switch capable input device.

Andrew followed the suggestions that were posted in reply to Gergo's RFC
patch, and on the v1 & v2 versions of this patch to follow-up and get it
merged.

Changes from Gergo's RFC:

 - Refactored obtaining a reference to the EC ACPI device needed for the
   quirk implementation as suggested by Hans de Goede
 - Applied small fixes and switched to always registering handles with
   the driver for automatic cleanup as suggested by Barnabás Pőcze.
 - Merged the lenovo_ymc_trigger_ec function with the
   ideapad_trigger_ymc_next_read function since it was no longer
   external.
 - Added the word "Tablet" to the driver description to hopefully make
   it more clear.
 - Fixed the LENOVO_YMC_QUERY_METHOD ID and the name string for the EC
   APCI device trigged for the quirk
 - Triggered the input event on probe so that the initial tablet mode
   state when the driver is loaded is reported to userspace as suggested
   by Armin Wolf.
 - Restricted the permissions of the ec_trigger parameter as suggested
   by Armin Wolf. Also updated the description.

We have tested this on the Yoga 7 14AIL7 for the non-quirk path and on
the Yoga 7 14ARB7 which has the firmware bug that requires triggering
the embedded controller to send the mode change events. This workaround
is also used by the Windows drivers.

According to reports at https://github.com/lukas-w/yoga-usage-mode,
which uses the same WMI devices, the following models should also work:
Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
Link: https://lore.kernel.org/r/20230310041726.217447-1-kallmeyeras@gmail.com/
Link: https://lore.kernel.org/r/20230323025200.5462-1-kallmeyeras@gmail.com/
---
 drivers/platform/x86/Kconfig          |  10 ++
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/ideapad-laptop.h |   1 +
 drivers/platform/x86/lenovo-ymc.c     | 186 ++++++++++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-ymc.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2..858be0c65 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
 
+config LENOVO_YMC
+	tristate "Lenovo Yoga Tablet Mode Control"
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on IDEAPAD_LAPTOP
+	select INPUT_SPARSEKMAP
+	help
+	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
+	  events for Lenovo Yoga notebooks.
+
 config SENSORS_HDAPS
 	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
 	depends on INPUT
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1d3d1b025..10054cdea 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 # IBM Thinkpad and Lenovo
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
index 7dd8ce027..2564cb1cd 100644
--- a/drivers/platform/x86/ideapad-laptop.h
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -35,6 +35,7 @@ enum {
 	VPCCMD_W_FAN,
 	VPCCMD_R_RF,
 	VPCCMD_W_RF,
+	VPCCMD_W_YMC = 0x2A,
 	VPCCMD_R_FAN = 0x2B,
 	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
 	VPCCMD_W_BL_POWER = 0x33,
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
new file mode 100644
index 000000000..5e520a764
--- /dev/null
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * lenovo-ymc.c - Lenovo Yoga Mode Control driver
+ *
+ * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/wmi.h>
+#include "ideapad-laptop.h"
+
+#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
+#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
+
+#define LENOVO_YMC_QUERY_INSTANCE 0
+#define LENOVO_YMC_QUERY_METHOD 0x01
+
+static bool ec_trigger __read_mostly;
+module_param(ec_trigger, bool, 0444);
+MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force emitting tablet mode events");
+
+static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
+	{
+		// Lenovo Yoga 7 14ARB7
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
+		},
+	},
+	{ },
+};
+
+struct lenovo_ymc_private {
+	struct input_dev *input_dev;
+	struct acpi_device *ec_acpi_dev;
+};
+
+static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
+{
+	int err;
+	if (!priv->ec_acpi_dev)
+		return;
+	err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
+	if (err)
+		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
+}
+
+static const struct key_entry lenovo_ymc_keymap[] = {
+	// Laptop
+	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
+	// Tablet
+	{ KE_SW, 0x02, { .sw = { SW_TABLET_MODE, 1 } } },
+	// Drawing Board
+	{ KE_SW, 0x03, { .sw = { SW_TABLET_MODE, 1 } } },
+	// Tent
+	{ KE_SW, 0x04, { .sw = { SW_TABLET_MODE, 1 } } },
+	{ KE_END },
+};
+
+static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
+{
+	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
+
+	u32 input_val = 0;
+	struct acpi_buffer input = {sizeof(input_val), &input_val};
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	acpi_status status;
+	union acpi_object *obj;
+	int code;
+
+	status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
+				LENOVO_YMC_QUERY_INSTANCE,
+				LENOVO_YMC_QUERY_METHOD,
+				&input, &output);
+
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&wdev->dev,
+			"Failed to evaluate query method: %s\n",
+			acpi_format_exception(status));
+		return;
+	}
+
+	obj = output.pointer;
+
+	if (obj->type != ACPI_TYPE_INTEGER) {
+		dev_warn(&wdev->dev,
+			"WMI event data is not an integer\n");
+		goto free_obj;
+	}
+	code = obj->integer.value;
+
+	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
+		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
+
+free_obj:
+	kfree(obj);
+	lenovo_ymc_trigger_ec(wdev, priv);
+}
+
+static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
+
+static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct input_dev *input_dev;
+	struct lenovo_ymc_private *priv;
+	int err;
+
+	ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (ec_trigger) {
+		pr_debug("Lenovo YMC enable EC triggering.\n");
+		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
+
+		if (!priv->ec_acpi_dev) {
+			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
+			return -ENODEV;
+		}
+		err = devm_add_action_or_reset(&wdev->dev,
+				acpi_dev_put_helper, priv->ec_acpi_dev);
+		if (err) {
+			dev_err(&wdev->dev,
+				"Could not clean up EC ACPI device: %d\n", err);
+			return err;
+		}
+	}
+
+	input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name = "Lenovo Yoga Tablet Mode Control switch";
+	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->dev.parent = &wdev->dev;
+	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
+	if (err) {
+		dev_err(&wdev->dev,
+			"Could not set up input device keymap: %d\n", err);
+		return err;
+	}
+
+	err = input_register_device(input_dev);
+	if (err) {
+		dev_err(&wdev->dev,
+			"Could not register input device: %d\n", err);
+		return err;
+	}
+
+	priv->input_dev = input_dev;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	// Report the state for the first time on probe
+	lenovo_ymc_trigger_ec(wdev, priv);
+	lenovo_ymc_notify(wdev, NULL);
+	return 0;
+}
+
+static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
+	{ .guid_string = LENOVO_YMC_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
+
+static struct wmi_driver lenovo_ymc_driver = {
+	.driver = {
+		.name = "lenovo-ymc",
+	},
+	.id_table = lenovo_ymc_wmi_id_table,
+	.probe = lenovo_ymc_probe,
+	.notify = lenovo_ymc_notify,
+};
+
+module_wmi_driver(lenovo_ymc_driver);
+
+MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
+MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
+MODULE_LICENSE("GPL");
-- 
2.40.0

