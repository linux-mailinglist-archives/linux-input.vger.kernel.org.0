Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00244C6422
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiB1Hze (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbiB1Hzd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:33 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7B945AF3
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:54 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id u16so10350175pfg.12
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OabbcmxJxJWwRor4LztospRi+3hYablgoflT4i1DMEw=;
        b=MegYvnRwvH8MvcMU7DRGWY27ubvL+q10OJ1zpNQIyFmkT3DfhndCOfhQYJpeQdvTGW
         k2GhMPr2JyhL9Yb2RkUdJaTzc1CD1nAfW8av23UzD+KkWdwVWa+8Hpw7m2yjpaP1+Wnn
         v0v//Syzz9zNaIOBnr8vlV7AQUqQaBfJdD7CwvCXfxIv2cI1GutrvlwfkDXojvUgajGF
         2q4765OAnYF0lFL2RtGGcOAlweJjYY8ub+ruVfZhQwtihUnGvyURD9Z6JMgu9ORz3w5l
         1Pt7ExpKOyPj4u1X170YcXbsLA06yDBUglDe7t79oefP6Z2Ioj/ebCtncNkv/gqJJkqS
         fXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OabbcmxJxJWwRor4LztospRi+3hYablgoflT4i1DMEw=;
        b=7aiJmtxSX5XO1lodfInHGU9Nobw6iLAuOHBNZjObdQrtvxMGnd7t8hRItSO5cE1u3U
         ZNRiV4H+X38CPnnM4BrOXwqcIQlpqyCKlNQ5HZfAJBJ4NiHEaQcjZzPLoMV9+jcwgEHO
         m63+GpkuS6hDhU+A7uWMaG1EYbpSy6tAt4Yq5bsBGy3fU4k9ZEDCWty9+8PScjbduORn
         WKD5m231Nuj0JRC7OXZyPyVP6XTik/bsIisqiR2OBNQdYBrRevYi1TLRuSK7UygHc/+9
         u499uGb37PSGPExxxXK9YfwhQ83buxzThbdUgNuY4vzukThUuXQdJaKpxLUTT13SweT7
         O6lQ==
X-Gm-Message-State: AOAM530B1ItZmSMOvmM09evHhWD8wPQSdCSJWQIJCmFcUuOctdc7LcEf
        L2E7nFsrH+ZOIxUG6RkZyOgc7FQ0HIw=
X-Google-Smtp-Source: ABdhPJzfoy0YfFt9aVua6H4hGRDVhcZ6exIk3bnf7H2UsO0p6XDoCrZ0BO3k7sIXiQlKugvMmQttdQ==
X-Received: by 2002:a63:701:0:b0:374:3afb:e5d4 with SMTP id 1-20020a630701000000b003743afbe5d4mr16478425pgh.600.1646034893139;
        Sun, 27 Feb 2022 23:54:53 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:52 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Subject: [PATCH v5 2/5] Input: extract ChromeOS vivaldi physmap show function
Date:   Sun, 27 Feb 2022 23:54:43 -0800
Message-Id: <20220228075446.466016-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

Let's introduce a common library file for the physmap show function
duplicated between three different keyboard drivers. This largely copies
the code from cros_ec_keyb.c which has the most recent version of the
show function, while using the vivaldi_data struct from the hid-vivaldi
driver. This saves a small amount of space in an allyesconfig build.

$ ./scripts/bloat-o-meter vmlinux.before vmlinux.after

add/remove: 3/0 grow/shrink: 2/3 up/down: 412/-720 (-308)
Function                                     old     new   delta
vivaldi_function_row_physmap_show              -     292    +292
_sub_I_65535_1                           1057564 1057616     +52
_sub_D_65535_0                           1057564 1057616     +52
e843419@49f2_00062737_9b04                     -       8      +8
e843419@20f6_0002a34d_35bc                     -       8      +8
atkbd_parse_fwnode_data                      480     472      -8
atkbd_do_show_function_row_physmap           316      76    -240
function_row_physmap_show                    620     148    -472
Total: Before=285581925, After=285581617, chg -0.00%

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20220216195901.1326924-2-swboyd@chromium.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/Kconfig                   |  1 +
 drivers/hid/hid-vivaldi.c             | 27 +++++------------
 drivers/input/Kconfig                 |  7 +++++
 drivers/input/Makefile                |  1 +
 drivers/input/keyboard/Kconfig        |  2 ++
 drivers/input/keyboard/atkbd.c        | 27 +++++------------
 drivers/input/keyboard/cros_ec_keyb.c | 43 ++++++++++-----------------
 drivers/input/vivaldi-fmap.c          | 39 ++++++++++++++++++++++++
 include/linux/input/vivaldi-fmap.h    | 27 +++++++++++++++++
 9 files changed, 108 insertions(+), 66 deletions(-)
 create mode 100644 drivers/input/vivaldi-fmap.c
 create mode 100644 include/linux/input/vivaldi-fmap.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f5544157576c..5569a2029dab 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -411,6 +411,7 @@ config HID_GOOGLE_HAMMER
 
 config HID_VIVALDI
 	tristate "Vivaldi Keyboard"
+	select INPUT_VIVALDIFMAP
 	depends on HID
 	help
 	  Say Y here if you want to enable support for Vivaldi keyboards.
diff --git a/drivers/hid/hid-vivaldi.c b/drivers/hid/hid-vivaldi.c
index 42ceb2058a09..ca8cb40928e6 100644
--- a/drivers/hid/hid-vivaldi.c
+++ b/drivers/hid/hid-vivaldi.c
@@ -8,37 +8,24 @@
 
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/input/vivaldi-fmap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sysfs.h>
 
-#define MIN_FN_ROW_KEY	1
-#define MAX_FN_ROW_KEY	24
+#define MIN_FN_ROW_KEY 1
+#define MAX_FN_ROW_KEY VIVALDI_MAX_FUNCTION_ROW_KEYS
 #define HID_VD_FN_ROW_PHYSMAP 0x00000001
 #define HID_USAGE_FN_ROW_PHYSMAP (HID_UP_GOOGLEVENDOR | HID_VD_FN_ROW_PHYSMAP)
 
-struct vivaldi_data {
-	u32 function_row_physmap[MAX_FN_ROW_KEY - MIN_FN_ROW_KEY + 1];
-	int max_function_row_key;
-};
-
 static ssize_t function_row_physmap_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct vivaldi_data *drvdata = hid_get_drvdata(hdev);
-	ssize_t size = 0;
-	int i;
-
-	if (!drvdata->max_function_row_key)
-		return 0;
 
-	for (i = 0; i < drvdata->max_function_row_key; i++)
-		size += sprintf(buf + size, "%02X ",
-				drvdata->function_row_physmap[i]);
-	size += sprintf(buf + size, "\n");
-	return size;
+	return vivaldi_function_row_physmap_show(drvdata, buf);
 }
 
 static DEVICE_ATTR_RO(function_row_physmap);
@@ -85,11 +72,11 @@ static void vivaldi_feature_mapping(struct hid_device *hdev,
 	    (usage->hid & HID_USAGE_PAGE) != HID_UP_ORDINAL)
 		return;
 
-	fn_key = (usage->hid & HID_USAGE);
+	fn_key = usage->hid & HID_USAGE;
 	if (fn_key < MIN_FN_ROW_KEY || fn_key > MAX_FN_ROW_KEY)
 		return;
-	if (fn_key > drvdata->max_function_row_key)
-		drvdata->max_function_row_key = fn_key;
+	if (fn_key > drvdata->num_function_row_keys)
+		drvdata->num_function_row_keys = fn_key;
 
 	report_data = buf = hid_alloc_report_buf(report, GFP_KERNEL);
 	if (!report_data)
diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 5baebf62df33..e2752f7364bc 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -77,6 +77,13 @@ config INPUT_MATRIXKMAP
 	  To compile this driver as a module, choose M here: the
 	  module will be called matrix-keymap.
 
+config INPUT_VIVALDIFMAP
+	tristate
+	help
+	  ChromeOS Vivaldi keymap support library. This is a hidden
+	  option so that drivers can use common code to parse and
+	  expose the vivaldi function row keymap.
+
 comment "Userland interfaces"
 
 config INPUT_MOUSEDEV
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 037cc595106c..2266c7d010ef 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -12,6 +12,7 @@ input-core-y += touchscreen.o
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
 obj-$(CONFIG_INPUT_MATRIXKMAP)	+= matrix-keymap.o
+obj-$(CONFIG_INPUT_VIVALDIFMAP)	+= vivaldi-fmap.o
 
 obj-$(CONFIG_INPUT_LEDS)	+= input-leds.o
 obj-$(CONFIG_INPUT_MOUSEDEV)	+= mousedev.o
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 9417ee0b1eff..04954ecb1437 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -103,6 +103,7 @@ config KEYBOARD_ATKBD
 	select SERIO_LIBPS2
 	select SERIO_I8042 if ARCH_MIGHT_HAVE_PC_SERIO
 	select SERIO_GSCPS2 if GSC
+	select INPUT_VIVALDIFMAP
 	help
 	  Say Y here if you want to use a standard AT or PS/2 keyboard. Usually
 	  you'll need this, unless you have a different type keyboard (USB, ADB
@@ -749,6 +750,7 @@ config KEYBOARD_XTKBD
 config KEYBOARD_CROS_EC
 	tristate "ChromeOS EC keyboard"
 	select INPUT_MATRIXKMAP
+	select INPUT_VIVALDIFMAP
 	depends on CROS_EC
 	help
 	  Say Y here to enable the matrix keyboard used by ChromeOS devices
diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index fbdef95291e9..d4131236d18c 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/input.h>
+#include <linux/input/vivaldi-fmap.h>
 #include <linux/serio.h>
 #include <linux/workqueue.h>
 #include <linux/libps2.h>
@@ -64,8 +65,6 @@ static bool atkbd_terminal;
 module_param_named(terminal, atkbd_terminal, bool, 0);
 MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard connected via AT/PS2");
 
-#define MAX_FUNCTION_ROW_KEYS	24
-
 #define SCANCODE(keymap)	((keymap >> 16) & 0xFFFF)
 #define KEYCODE(keymap)		(keymap & 0xFFFF)
 
@@ -237,8 +236,7 @@ struct atkbd {
 	/* Serializes reconnect(), attr->set() and event work */
 	struct mutex mutex;
 
-	u32 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
-	int num_function_row_keys;
+	struct vivaldi_data vdata;
 };
 
 /*
@@ -308,17 +306,7 @@ static struct attribute *atkbd_attributes[] = {
 
 static ssize_t atkbd_show_function_row_physmap(struct atkbd *atkbd, char *buf)
 {
-	ssize_t size = 0;
-	int i;
-
-	if (!atkbd->num_function_row_keys)
-		return 0;
-
-	for (i = 0; i < atkbd->num_function_row_keys; i++)
-		size += scnprintf(buf + size, PAGE_SIZE - size, "%02X ",
-				  atkbd->function_row_physmap[i]);
-	size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
-	return size;
+	return vivaldi_function_row_physmap_show(&atkbd->vdata, buf);
 }
 
 static umode_t atkbd_attr_is_visible(struct kobject *kobj,
@@ -329,7 +317,7 @@ static umode_t atkbd_attr_is_visible(struct kobject *kobj,
 	struct atkbd *atkbd = serio_get_drvdata(serio);
 
 	if (attr == &atkbd_attr_function_row_physmap.attr &&
-	    !atkbd->num_function_row_keys)
+	    !atkbd->vdata.num_function_row_keys)
 		return 0;
 
 	return attr->mode;
@@ -1206,10 +1194,11 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 
 	/* Parse "function-row-physmap" property */
 	n = device_property_count_u32(dev, "function-row-physmap");
-	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
+	if (n > 0 && n <= VIVALDI_MAX_FUNCTION_ROW_KEYS &&
 	    !device_property_read_u32_array(dev, "function-row-physmap",
-					    atkbd->function_row_physmap, n)) {
-		atkbd->num_function_row_keys = n;
+					    atkbd->vdata.function_row_physmap,
+					    n)) {
+		atkbd->vdata.num_function_row_keys = n;
 		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
 	}
 }
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index fc02c540636e..6534dfca60b4 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -15,6 +15,7 @@
 #include <linux/bitops.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/vivaldi-fmap.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/notifier.h>
@@ -27,8 +28,6 @@
 
 #include <asm/unaligned.h>
 
-#define MAX_NUM_TOP_ROW_KEYS   15
-
 /**
  * struct cros_ec_keyb - Structure representing EC keyboard device
  *
@@ -44,9 +43,7 @@
  * @idev: The input device for the matrix keys.
  * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
  * @notifier: interrupt event notifier for transport devices
- * @function_row_physmap: An array of the encoded rows/columns for the top
- *                        row function keys, in an order from left to right
- * @num_function_row_keys: The number of top row keys in a custom keyboard
+ * @vdata: vivaldi function row data
  */
 struct cros_ec_keyb {
 	unsigned int rows;
@@ -64,8 +61,7 @@ struct cros_ec_keyb {
 	struct input_dev *bs_idev;
 	struct notifier_block notifier;
 
-	u16 function_row_physmap[MAX_NUM_TOP_ROW_KEYS];
-	size_t num_function_row_keys;
+	struct vivaldi_data vdata;
 };
 
 /**
@@ -537,9 +533,9 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	int err;
 	struct property *prop;
 	const __be32 *p;
-	u16 *physmap;
+	u32 *physmap;
 	u32 key_pos;
-	int row, col;
+	unsigned int row, col, scancode, n_physmap;
 
 	err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
 	if (err)
@@ -591,20 +587,21 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
 	ckdev->idev = idev;
 	cros_ec_keyb_compute_valid_keys(ckdev);
 
-	physmap = ckdev->function_row_physmap;
+	physmap = ckdev->vdata.function_row_physmap;
+	n_physmap = 0;
 	of_property_for_each_u32(dev->of_node, "function-row-physmap",
 				 prop, p, key_pos) {
-		if (ckdev->num_function_row_keys == MAX_NUM_TOP_ROW_KEYS) {
+		if (n_physmap == VIVALDI_MAX_FUNCTION_ROW_KEYS) {
 			dev_warn(dev, "Only support up to %d top row keys\n",
-				 MAX_NUM_TOP_ROW_KEYS);
+				 VIVALDI_MAX_FUNCTION_ROW_KEYS);
 			break;
 		}
 		row = KEY_ROW(key_pos);
 		col = KEY_COL(key_pos);
-		*physmap = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
-		physmap++;
-		ckdev->num_function_row_keys++;
+		scancode = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
+		physmap[n_physmap++] = scancode;
 	}
+	ckdev->vdata.num_function_row_keys = n_physmap;
 
 	err = input_register_device(ckdev->idev);
 	if (err) {
@@ -619,18 +616,10 @@ static ssize_t function_row_physmap_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
-	ssize_t size = 0;
-	int i;
-	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
-	u16 *physmap = ckdev->function_row_physmap;
-
-	for (i = 0; i < ckdev->num_function_row_keys; i++)
-		size += scnprintf(buf + size, PAGE_SIZE - size,
-				  "%s%02X", size ? " " : "", physmap[i]);
-	if (size)
-		size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
+	const struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
+	const struct vivaldi_data *data = &ckdev->vdata;
 
-	return size;
+	return vivaldi_function_row_physmap_show(data, buf);
 }
 
 static DEVICE_ATTR_RO(function_row_physmap);
@@ -648,7 +637,7 @@ static umode_t cros_ec_keyb_attr_is_visible(struct kobject *kobj,
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
 
 	if (attr == &dev_attr_function_row_physmap.attr &&
-	    !ckdev->num_function_row_keys)
+	    !ckdev->vdata.num_function_row_keys)
 		return 0;
 
 	return attr->mode;
diff --git a/drivers/input/vivaldi-fmap.c b/drivers/input/vivaldi-fmap.c
new file mode 100644
index 000000000000..6dae83d96806
--- /dev/null
+++ b/drivers/input/vivaldi-fmap.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helpers for ChromeOS Vivaldi keyboard function row mapping
+ *
+ * Copyright (C) 2022 Google, Inc
+ */
+
+#include <linux/export.h>
+#include <linux/input/vivaldi-fmap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+/**
+ * vivaldi_function_row_physmap_show - Print vivaldi function row physmap attribute
+ * @data: The vivaldi function row map
+ * @buf: Buffer to print the function row phsymap to
+ */
+ssize_t vivaldi_function_row_physmap_show(const struct vivaldi_data *data,
+					  char *buf)
+{
+	ssize_t size = 0;
+	int i;
+	const u32 *physmap = data->function_row_physmap;
+
+	if (!data->num_function_row_keys)
+		return 0;
+
+	for (i = 0; i < data->num_function_row_keys; i++)
+		size += scnprintf(buf + size, PAGE_SIZE - size,
+				  "%s%02X", size ? " " : "", physmap[i]);
+	if (size)
+		size += scnprintf(buf + size, PAGE_SIZE - size, "\n");
+
+	return size;
+}
+EXPORT_SYMBOL_GPL(vivaldi_function_row_physmap_show);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/input/vivaldi-fmap.h b/include/linux/input/vivaldi-fmap.h
new file mode 100644
index 000000000000..7e4b7023bf04
--- /dev/null
+++ b/include/linux/input/vivaldi-fmap.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VIVALDI_FMAP_H
+#define _VIVALDI_FMAP_H
+
+#include <linux/types.h>
+
+#define VIVALDI_MAX_FUNCTION_ROW_KEYS	24
+
+/**
+ * struct vivaldi_data - Function row map data for ChromeOS Vivaldi keyboards
+ * @function_row_physmap: An array of scancodes or their equivalent (HID usage
+ *                        codes, encoded rows/columns, etc) for the top
+ *                        row function keys, in an order from left to right
+ * @num_function_row_keys: The number of top row keys in a custom keyboard
+ *
+ * This structure is supposed to be used by ChromeOS keyboards using
+ * the Vivaldi keyboard function row design.
+ */
+struct vivaldi_data {
+	u32 function_row_physmap[VIVALDI_MAX_FUNCTION_ROW_KEYS];
+	unsigned int num_function_row_keys;
+};
+
+ssize_t vivaldi_function_row_physmap_show(const struct vivaldi_data *data,
+					  char *buf);
+
+#endif /* _VIVALDI_FMAP_H */
-- 
2.35.1.574.g5d30c73bfb-goog

