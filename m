Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8616C47C756
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241737AbhLUTRw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241729AbhLUTRv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:51 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482BAC061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:51 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l4so66463wmq.3
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WUQOlH+CRkkd1Psuoq24m4twbzqmWsxWeJKyPpr5VA8=;
        b=ddW495LtvWG5dVnbSwkTiSF/FvEQGpPQtAWyyzmDevmEjPzNLSLwnxlz84s7+x7o8F
         gQ5WT/XIxf4fYX8GUnRI5TdduYAvBTnbcjC0B/xT0BWknWQA68E8QeTMrnRjZ4eKcQyb
         HTsp/R5U9bP4jTHZbyojE5KO1DTr74byysI4yzAw4Ng4TxARNQYPwxCFEuv3YCKatdSE
         htF+EsQm3ExjEI5Hdr1VLTV0gBx5M5K/hHASbsU1Y/yfZOXb4A0/TZUPaLuEk9XDiWCg
         nfowI7Vqkz5KDQbEEkmi+MFfQ27FDA8fAewFmSZLjaZnL5EHZHqsEvJEETAdAOwXNedd
         polg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WUQOlH+CRkkd1Psuoq24m4twbzqmWsxWeJKyPpr5VA8=;
        b=aZW5wV14jDKMk/aqsS3e+t1bDqiUPqqB6HkjXTWqBJmpKKh5MaejS6BDbDbAIECYmw
         zRutd8BYfjY1riJq470HeqANWOUq0kn+UVvx4lYHBeK/aaIcp62DZYHG4gbeqCYAb8jB
         QSfsNZN6xMG9uVu80s1ZXj+vFDzqi5pAOAbZcOSbYkj/HGnf2xUNY+gamLvDCNvTlBNI
         O/dHJZQ2KeZLk5UoXR0bogMGta2u8eLgV1H6IO/mmeBPAUlnFK2OHnQKo+5dqXrhGX7t
         Nix/wkVlX6cvsuM4MR0e6SuW7mb/75GAQaoFEXaDYIpuL6ZbRCZW/agLobwQ6wfTmR4S
         DTDA==
X-Gm-Message-State: AOAM533/daTfPpWX37Xw1ALznt3m7WVAboIxXJ3q2cFts5D6nqxCFbmv
        WLs/VHcllQ4sBBhBnlIIxj0jcSNjXlCfNkOPwOI=
X-Google-Smtp-Source: ABdhPJwIuu+MXLH4Djnn+GcalfdxeSyVSpvrwz0cPiRaMacIh8QI+ZoLRj7MBFLGxM+Uc1S1bRSDKA==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr3932741wmj.168.1640114269850;
        Tue, 21 Dec 2021 11:17:49 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:49 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 04/18] HID: haptic: introduce hid_haptic_device
Date:   Tue, 21 Dec 2021 19:17:29 +0000
Message-Id: <20211221191743.1893185-5-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Define a new structure that contains simple haptic device configuration
as well as current state.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/Kconfig      |  4 +++
 drivers/hid/Makefile     |  1 +
 drivers/hid/hid-haptic.c | 10 ++++++
 drivers/hid/hid-haptic.h | 68 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 drivers/hid/hid-haptic.c
 create mode 100644 drivers/hid/hid-haptic.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a7c78ac96270..8d1eb4491a7f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -89,6 +89,10 @@ config HID_GENERIC
 
 	If unsure, say Y.
 
+config HID_HAPTIC
+	bool
+	default n
+
 menu "Special HID drivers"
 	depends on HID
 
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 55a6fa3eca5a..65d54ccd4574 100644
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
index 000000000000..0910d8af9f38
--- /dev/null
+++ b/drivers/hid/hid-haptic.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak
+ */
+
+/*
+ */
+#include "hid-haptic.h"
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
new file mode 100644
index 000000000000..41f19cd22f75
--- /dev/null
+++ b/drivers/hid/hid-haptic.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  HID Haptic support for Linux
+ *
+ *  Copyright (c) 2021 Angela Czubak
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
+	__u8 *report_buf;
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
+	__s32 pressure_sum;
+	__s32 force_logical_minimum;
+	__s32 force_physical_minimum;
+	__s32 force_resolution;
+	__u32 press_threshold;
+	__u32 release_threshold;
+	__u32 mode;
+	__u32 default_auto_trigger;
+	__u32 vendor_page;
+	__u32 vendor_id;
+	__u32 max_waveform_id;
+	__u32 max_duration_id;
+	__u16 *hid_usage_map;
+	__u32 *duration_map;
+	__u16 press_ordinal_orig;
+	__u16 press_ordinal_cur;
+	__u16 release_ordinal_orig;
+	__u16 release_ordinal_cur;
+#define HID_HAPTIC_RELEASE_EFFECT_ID 0
+#define HID_HAPTIC_PRESS_EFFECT_ID 1
+	struct hid_haptic_effect *effect;
+	struct hid_haptic_effect stop_effect;
+};
-- 
2.34.1.307.g9b7440fafd-goog

