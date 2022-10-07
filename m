Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D545F7D5B
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiJGSa0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJGSaV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:21 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DFBA3F7B
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j16so8471448wrh.5
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drDDGSL6Q8RDfLC8xntw44nc3OWMxJhGm2KM89I9WAQ=;
        b=F30GtYkx9OYa+gXvcFUXX4+OfQhzAotOfiX/tVdZWhbZ34fhfGcTnHK/WKlqOr+zQR
         rt4Rr6fZ3IJPApJlVjWvp+oxtXAYsgMJVWe17f//0srhfuZMS7HXf6qdAqdPWubpLzXf
         ZbmN9h91GF18tVXsv6vqXrqReNEI67B9RNUtOLfwoRmSUuN6MtooUUZxVXKQ3+xssmoM
         B+OZmoi97b3SCSSt5cykjiCqOFcy8Md7H5tetSvxM6QLhUGdMgwbLvoROQeSTdHfzoHK
         yYgDoP3Gr9yye3daUxFheKfueY/+1Go5UvFMF8S3FpycsIEYq2bfMVJMaIcd4QxvZeOY
         aWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drDDGSL6Q8RDfLC8xntw44nc3OWMxJhGm2KM89I9WAQ=;
        b=Qp2/nXvtQdQTfSbGhJKw/u0DmQr0gpwSlMIbizDZapvP19btZdJk2DdT0XYpsVxjc4
         9Cr7cuOyyCw8xYDb3GAlVIVuSOXF8FtVfyaSV0/lET/gHyz4KRnaF3nClRr0XnYyJ1rj
         DrFGTJjHUR+THUEnVGViM/bKBc4e1B88PUordkO8+3GBDIVMgtH38KFxSrxtjCdUIJg5
         R8AU+UXS85tFjebkcupnXRDG2YKo1LqnTOKkEA41TRHj64+S8k/nfetkgfGJfeuySS/3
         ecxhoZ34KkeVEy42Co1AiXlpSTgpEO8FZk01c7zvoRS0Fe8s1kWmFijy/BzxGzN+YGCt
         WUFA==
X-Gm-Message-State: ACrzQf3ZCf7Oo01xGkTM87Ae1eDEudq1u7HtepEG+WNRL7AQXulZQS6S
        Gk4gnH+i5hSHxLppxWHho8dN4d9VD1rikjj5
X-Google-Smtp-Source: AMsMyM5uOSqt6sgJrFv47k99D1KSDvUcQNUwWzj6LdXwsaANmO1qXNA41KwsNkekSMYGGiRBqMx4pg==
X-Received: by 2002:adf:e18b:0:b0:22e:a2ce:7746 with SMTP id az11-20020adfe18b000000b0022ea2ce7746mr2897225wrb.468.1665167413910;
        Fri, 07 Oct 2022 11:30:13 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:13 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 03/17] HID: haptic: introduce hid_haptic_device
Date:   Fri,  7 Oct 2022 18:29:31 +0000
Message-Id: <20221007182945.1654046-4-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 6ce92830b5d1f..1b47e5d0d1c07 100644
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
index b0bef80981394..8ae531355f5bf 100644
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
index 0000000000000..ea1004319bc02
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
index 0000000000000..ea96b0fb540f2
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
2.38.0.rc1.362.ged0d419d3c-goog

