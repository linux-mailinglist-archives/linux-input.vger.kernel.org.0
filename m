Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42A5525F78
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379096AbiEMJj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379042AbiEMJjt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:49 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D5729ED0B
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d5so10661583wrb.6
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3Y7mgRa4QHnOk2vJqykkfvQEB+3h0r4ILNwSLuGqGs=;
        b=bsttD1pO+WkIvIIEqgvCQZKaoC7yJBJDW66XhvyKBjScvuR40cVYFCGAhrwlFuIJE7
         tKqyFfRBPm03pO1/pnGV6q5e7MOwJC3+8NsNmxdqajKVk6uIV/HsUVACJtWvbiTZnAP0
         OBd/3TeFafZLEiyywkeQND/ThAdId/hya5mpoCF+EdBxRNv1xjE9hPt4yGp8+ByDxeL5
         t4LCOgEeID+F6jCU+ggLokFD1T5bn5eZhxjkaeLQSLVhVpH8DZWlgJOKJvRP5QW3CaYB
         nq9TGqwzAjLROdV264Msbeo3k4ma/Fwx/a2PP7sXT9n2Y+twXb/3jA8ETpmkXgOga4bw
         mMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3Y7mgRa4QHnOk2vJqykkfvQEB+3h0r4ILNwSLuGqGs=;
        b=SCdW1U4VkBkb01CMl45pTA6pfqCni4nr/6n8yf7pwbYWhFAVQVQ+1ilIFs+OBKd2kM
         Piu8o8KSJ78hfzRIuyyHAiP4EOt7XQcxhzJEY5PGD6rfhd/UjKkVA1LbEsKo9HeD1P1t
         zpXazuuA6/ZNcORopGey6iJfCtPcZSvm+beaMtJ3Yu3iEchglJtBaKC5eioI9yarWa94
         c7TYXaqLyJY7NB4QQPP1IDKp3jAzndlG2sFqul0SKgxA7rX6s7aiaeJEQfR0BFRYBeA0
         9giTx4fBHw9w9WaV/DswP+o8MjQrwgO25vlAXfpZlo29D6NspgcEk13SQ7qiUVIvTQmR
         15oA==
X-Gm-Message-State: AOAM530CfoOZWVeV/PcTUTfW/I3p7rTQFHvnHGry9xZP/3FzFmCkQ0AB
        xts+5viuv8TYVdea8AH0RE050KIWlRYEIje3YxA=
X-Google-Smtp-Source: ABdhPJxbZK5tL6koGJgZemWAw7SmHUYSgzNNaNITWymDg0VHcXDecmTDgqRr/HE0+/KUE1aKxFlTUQ==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ecb:1113 with SMTP id e11-20020a5d6d0b000000b0020c4ecb1113mr3075566wrq.203.1652434786383;
        Fri, 13 May 2022 02:39:46 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:45 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 03/17] HID: haptic: introduce hid_haptic_device
Date:   Fri, 13 May 2022 09:39:13 +0000
Message-Id: <20220513093927.1632262-4-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Define a new structure that contains simple haptic device configuration
as well as current state.
Add functions that recognize auto trigger and manual trigger reports
as well as save their addresses.
Recognize the input device as a haptic one if the reports are found.
Verify that the pressure unit is either grams or newtons.
Mark the input device as a haptic forcepad if the unit is correct.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/Kconfig      |   3 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-haptic.c |  65 ++++++++++++++++++++++
 drivers/hid/hid-haptic.h | 113 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a95a7cbc4a59..c892cfea3bb5 100644
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
index 345ac5581bd8..bfd09957e58d 100644
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
index 000000000000..ea1004319bc0
--- /dev/null
+++ b/drivers/hid/hid-haptic.c
@@ -0,0 +1,65 @@
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
+bool hid_haptic_is_forcepad(struct hid_haptic_device *haptic,
+			    struct hid_input *hi, struct hid_field *field)
+{
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+		haptic->is_forcepad = true;
+	return haptic->is_forcepad;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_is_forcepad);
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
+bool hid_haptic_input_configured(struct hid_device *hdev,
+				 struct hid_haptic_device *haptic)
+{
+	if (haptic->auto_trigger_report && haptic->manual_trigger_report)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
new file mode 100644
index 000000000000..ea96b0fb540f
--- /dev/null
+++ b/drivers/hid/hid-haptic.h
@@ -0,0 +1,113 @@
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
+	s32 pressure;
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
+	bool is_forcepad;
+};
+
+#ifdef CONFIG_MULTITOUCH_HAPTIC
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage);
+bool hid_haptic_is_forcepad(struct hid_haptic_device *haptic,
+			    struct hid_input *hi, struct hid_field *field);
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max);
+bool hid_haptic_input_configured(struct hid_device *hdev,
+				 struct hid_haptic_device *haptic);
+#else
+static inline
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage)
+{}
+static inline
+bool hid_haptic_is_forcepad(struct hid_haptic_device *haptic,
+			    struct hid_input *hi, struct hid_field *field)
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
+bool hid_haptic_input_configured(struct hid_device *hdev,
+				 struct hid_haptic_device *haptic)
+{
+	return 0;
+}
+#endif
-- 
2.36.0.550.gb090851708-goog

