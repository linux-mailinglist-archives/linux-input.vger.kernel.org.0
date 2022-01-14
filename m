Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A64948EFED
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242991AbiANSca (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243074AbiANSc1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:27 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1875BC061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:27 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id w26so7689247wmi.0
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6dgo/VtRvg7jFI73Uw9wSSOHiw5h8cMUYKD+BdbIj8=;
        b=1Ohe0pYqWBc07mwAHVXbfVpm5JskC7wHBzuubCqH457zH9xLANP11CywqYhmMhkhAs
         LJpLwtrds55wsfpnzlOkENJGhjiGFYep9Rlk1SfCUMbr7BDg+JgJjHTwDwnsgEjuGtaE
         kBeWv7lbRpciQZ8K0+JGEE0GyuWotlrCxsnfo2QE6VqeUZ+J0rjcXRFGZhqMhZ4m0ARC
         tlZ9DXh7xLH8NEslQOI5LW/AmDWnnKsdy4/Ve/b4czR+CoUTrqxD2a699cx7bxlWE4Gu
         f2rSMM/MhRI7ajwO+/WRNGXV6/z704M4V+d3/pQUUYs8VFjE4bvAOU9b7YvRMY2kA18H
         xpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6dgo/VtRvg7jFI73Uw9wSSOHiw5h8cMUYKD+BdbIj8=;
        b=j8zFhFR1Hk6lJTuJF1s4152UwhipT5/b/qE9kqDyNdnr4ygPoTuf6tfb9fIhGlc4iF
         f68zf5zdO6Oua88+k7Bx/LDjaR5bKxJrHZ97OFonfWwucmzaDJfXrQtSaBK2OgBZ6CZH
         BBIJ1pPm6gjlW1YqTH1c+wIKPdfLEEl1bDQL/dQK+69YD1flE51E/tmdlje/iJkEp3oI
         HO6rViHdXpZYw/b1s81YcEaELSA+YD5engvaFecEoDIESh6wGu9yRQER9DeJBYX0fPLT
         atpD4mJY/Z6FemKjLba0Eq1R9WiDYxSW6X15uVRwIk0Ek2Xqmxuyh96vJYn43GLkoByb
         hW2Q==
X-Gm-Message-State: AOAM531+WgCerE9jPBDBm1vNQwu3AUIvZ8lL2MgxZc+HDxLSeXlDGqXT
        v+Y22/akEoYampw4PQuCnGFKDCXL2iDWegbz3Y8=
X-Google-Smtp-Source: ABdhPJz74v44uGNGF+iR02lOdi4d0Vn2CdZOAchfA1HlpoVsPr2tr6ghUAZiyKs5l49abwky+E+h/w==
X-Received: by 2002:a05:600c:1907:: with SMTP id j7mr16676036wmq.175.1642185145690;
        Fri, 14 Jan 2022 10:32:25 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:25 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 04/16] HID: haptic: introduce hid_haptic_device
Date:   Fri, 14 Jan 2022 18:31:40 +0000
Message-Id: <20220114183152.1691659-5-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Define a new structure that contains simple haptic device configuration
as well as current state.
Add functions that recognize auto trigger and manual trigger reports
as well as save their addresses.
Verify that the pressure unit is either grams or newtons.
Mark the input device as a haptic touchpad if the unit is correct and
the reports are found.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/Kconfig      |   3 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-haptic.c |  72 +++++++++++++++++++++++++
 drivers/hid/hid-haptic.h | 114 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f5544157576c..3e7555b868e7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -89,6 +89,9 @@ config HID_GENERIC
 
 	If unsure, say Y.
 
+config HID_HAPTIC
+	bool
+
 menu "Special HID drivers"
 	depends on HID
 
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 6d3e630e81af..f21338e142ef 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -4,6 +4,7 @@
 #
 hid-y			:= hid-core.o hid-input.o hid-quirks.o
 hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
+hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
 
 obj-$(CONFIG_HID)		+= hid.o
 obj-$(CONFIG_UHID)		+= uhid.o
diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
new file mode 100644
index 000000000000..d659a430c1a6
--- /dev/null
+++ b/drivers/hid/hid-haptic.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
+ */
+
+#include "hid-haptic.h"
+
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage *usage)
+{
+	if (usage->hid == HID_HP_AUTOTRIGGER) {
+		if (usage->usage_index >= field->report_count) {
+			dev_err(&hdev->dev,
+				"HID_HP_AUTOTRIGGER out of range\n");
+			return;
+		}
+
+		hid_device_io_start(hdev);
+		hid_hw_request(hdev, field->report, HID_REQ_GET_REPORT);
+		hid_hw_wait(hdev);
+		hid_device_io_stop(hdev);
+		haptic->default_auto_trigger =
+			field->value[usage->usage_index];
+		haptic->auto_trigger_report = field->report;
+	}
+}
+EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
+
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+		return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
+
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	if (usage->hid == HID_HP_MANUALTRIGGER) {
+		haptic->manual_trigger_report = field->report;
+		/* we don't really want to map these fields */
+		return -1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_mapping);
+
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+
+	if (hi->application == HID_DG_TOUCHPAD) {
+		if (haptic->auto_trigger_report &&
+		    haptic->manual_trigger_report) {
+			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
+			return 1;
+		}
+		return 0;
+	}
+	return -1;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
new file mode 100644
index 000000000000..601630e7049f
--- /dev/null
+++ b/drivers/hid/hid-haptic.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
+ */
+
+/*
+ */
+
+
+#include <linux/hid.h>
+
+#define HID_HAPTIC_ORDINAL_WAVEFORMNONE 1
+#define HID_HAPTIC_ORDINAL_WAVEFORMSTOP 2
+
+#define HID_HAPTIC_PRESS_THRESH 200
+#define HID_HAPTIC_RELEASE_THRESH 180
+
+#define HID_HAPTIC_MODE_DEVICE 0
+#define HID_HAPTIC_MODE_KERNEL 1
+
+struct hid_haptic_effect {
+	u8 *report_buf;
+	struct input_dev *input_dev;
+	struct work_struct work;
+	struct list_head control;
+	struct mutex control_mutex;
+};
+
+struct hid_haptic_effect_node {
+	struct list_head node;
+	struct file *file;
+};
+
+struct hid_haptic_device {
+	struct input_dev *input_dev;
+	struct hid_device *hdev;
+	struct hid_report *auto_trigger_report;
+	struct mutex auto_trigger_mutex;
+	struct workqueue_struct *wq;
+	struct hid_report *manual_trigger_report;
+	struct mutex manual_trigger_mutex;
+	size_t manual_trigger_report_len;
+	int pressed_state;
+	s32 pressure_sum;
+	s32 force_logical_minimum;
+	s32 force_physical_minimum;
+	s32 force_resolution;
+	u32 press_threshold;
+	u32 release_threshold;
+	u32 mode;
+	u32 default_auto_trigger;
+	u32 vendor_page;
+	u32 vendor_id;
+	u32 max_waveform_id;
+	u32 max_duration_id;
+	u16 *hid_usage_map;
+	u32 *duration_map;
+	u16 press_ordinal_orig;
+	u16 press_ordinal_cur;
+	u16 release_ordinal_orig;
+	u16 release_ordinal_cur;
+#define HID_HAPTIC_RELEASE_EFFECT_ID 0
+#define HID_HAPTIC_PRESS_EFFECT_ID 1
+	struct hid_haptic_effect *effect;
+	struct hid_haptic_effect stop_effect;
+};
+
+#ifdef CONFIG_MULTITOUCH_HAPTIC
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage);
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field);
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max);
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi);
+#else
+static inline
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage)
+{}
+static inline
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	return false;
+}
+static inline
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	return 0;
+}
+static inline
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+	return 0;
+}
+#endif
-- 
2.34.1.703.g22d0c6ccf7-goog

