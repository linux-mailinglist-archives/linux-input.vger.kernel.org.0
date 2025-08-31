Return-Path: <linux-input+bounces-14401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90864B3D1BA
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 11:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D610E1890415
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 09:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9365E223337;
	Sun, 31 Aug 2025 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg+JMRZ3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314A205E25;
	Sun, 31 Aug 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756633930; cv=none; b=oHkY4MroM4NtkcKaELGPpa9Nr9ATYDX/QWu5xQP03V9p0+p0oBj8Ne6HjCujw4Zo2XOmn4tC7iu1u2Y9LBgWdHVG8Mxfc2M3gZdeUBia6Nx+jPwzdaqWlFUWHjf869Q/LBFG02/bg13JsCKvMRUak3eC8FBI49iNMEj1BIb5ipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756633930; c=relaxed/simple;
	bh=Ek+BiIRHxgNs2ntzTc4wtOGbFbtBAir6+BOqV5HXXc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TW4nM0O177/YtlXj4gytMmUjQZuimUSKa/0SK9EXrIRk7xBXB8fd9Q3n0itkVwaVM/7r+UXyrfZ9fF7Zyr+xiUS81tQ5eCagZjH6qKFVRVNti7HuptYFMhRF2Cizx2jLOhgAcXjb1kcK6gY7isBOLd43EcLtWNK7eKAhRlXH3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg+JMRZ3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d3f46e231fso439065f8f.3;
        Sun, 31 Aug 2025 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756633927; x=1757238727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZgIDh3/JXHTnaWBbnGXx9Cu8hTVtAVj9QpuBiEQrzw=;
        b=hg+JMRZ3E6TE5NHveLxxJwn/2aXtiCdZU2Y9BZo5Nw6sMad2YuM9dFUDApfpsslinn
         5ALXfNLwuL6nW5on6yVxROuUc+SlokU9bqDU/5kHI48FkTQYJTQwQ7ylp1lNtpvg3slI
         nT5ii5iYu5PxsZfYQ8gYhbNkjVGjTarRbwoALrB18vhh2QrKcWowd6agPwPnw0dgHbpC
         hgDgBF20FMcr/hhsL0piyieU84GXFmlhzBSDV8zYLCnwyW3lzofeJn1U7ZukvjcxkrL+
         THpfKRG2dUY+XFHJZxcsQ/+zaa0DoJJPjSOPbhX+lxJ63C4xHD7pXEhySeV7zAYBAH+m
         XuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756633927; x=1757238727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZgIDh3/JXHTnaWBbnGXx9Cu8hTVtAVj9QpuBiEQrzw=;
        b=FChRaaWwz/Vorg/VIIXcdZo9EEK7LDJFky6TVBLKV4n6JOMT1jf5JPi/snJROWAb44
         yQ0FchduwvrcdX6ubLAaNHiq1JY1LkPmXorwhjfWm40UzB0DhC2ulRP0sIqjnv7tazEz
         wwzEvUgPpfFp0R8iZG1UJwvkAyliqMvlV+L++N7QsGHRsWShW6mCmO4Uk/fpYGgAfnKl
         2rAOQ/GqqVhQKIRzEMK3BZeCbEm0zof3UsWjkVISc/gzx1U75k86B3e/9GA5b8HGWIU4
         kyIZMn05OMa5/aDs5xwlD8+J57e2tsIp+L6BcOCy4yUtDrHAuY9hyDcHeOLoinJC0laP
         Np9A==
X-Forwarded-Encrypted: i=1; AJvYcCUmJcRZxp5vjkLL75Gu1ZTzmP/KhBHfX/XcTK26pesPsB5xNmXNygXdrAm/dKEHqTxPbj3GB1ZhqFTnQew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2c7uAqSUBCuYB8HKfNIRAKhARWaOH1MwP09VA1Ngsz0/MmBH6
	3dLadbFKqjNJ8jdfHZHJ7orZfMEWY443O8dFFFeEw9XjItK9sCyNMnhU5abUYg95
X-Gm-Gg: ASbGnctUWBJeALwqnpgUoNQxfrbxm6Ew2IF6wxZrHSbdNN2b6J5dd6I/QXvbC5tpGz1
	Q5+X2tU8VQ+fxUlSJMGUy4HMYTbNWIxhKMya3k+MB+e9YPAEz17d4SWwk5knXHaMDBGemzyr4tX
	d1MYWX73YXxYKCDUAacSiA+JVP7GiR/DkrQBa+4DhOEyLJ8oGqZAHhDgJtR0hOn61xvRUWqxRrO
	ZUUR8XaK42G0+D4lM01wvxNI2yGVhFsCrD7kPU9TlTMOl3GxsOherdqcU0RlmrDzImCJQHFdNAN
	qxQHnhbNhoV4GowQIRE1IVjamgYsnNpDtJuVxSEr5DBIisW6lE4COWKkMY2z6IfhZmVhnKPKxQP
	JjO5QUaqPJCWZAss8srtxh5c2LfXLDg6VNUh1D+AZdVcXvShR/yAAI5lGNn9sBA==
X-Google-Smtp-Source: AGHT+IE+apOcxfuwsEvJHZq4CtQ/7NnQsz01wVBMFkOUFGEHuctYiAnB0nEY0MEXSoErsk4DeVa5Yw==
X-Received: by 2002:a05:6000:1ace:b0:3ce:e5fc:6215 with SMTP id ffacd0b85a97d-3d1dd337b6cmr2851952f8f.26.1756633926715;
        Sun, 31 Aug 2025 02:52:06 -0700 (PDT)
Received: from bookboi.. (v2202404220747262886.hotsrv.de. [152.53.14.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7ef7cfsm109870295e9.6.2025.08.31.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 02:52:06 -0700 (PDT)
From: stepeos <stevepeter.oswald@gmail.com>
X-Google-Original-From: stepeos <onegearmode@gmail.com>
To: stevepeter.oswald@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: LOFREE: Fix back/forward buttons for
Date: Sun, 31 Aug 2025 12:52:03 +0300
Message-ID: <20250831095203.92177-1-onegearmode@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Oswald <stevepeter.oswald@gmail.com>

---
 drivers/hid/hid-ids.h    |  3 ++
 drivers/hid/hid-lofree.c | 96 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 drivers/hid/hid-lofree.c

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 33cc5820f2be..cb2704550043 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -848,6 +848,9 @@
 #define USB_DEVICE_ID_PXN_V12_LITE_2	0x1211
 #define USB_DEVICE_LITE_STAR_GT987_FF	0x2141
 
+#define USB_VENDOR_ID_LOFREE		0x248A
+#define USB_VENDOR_ID_LOFREE_TOUCH		0x8266
+
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_Z_10_SPK	0x0a07
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
diff --git a/drivers/hid/hid-lofree.c b/drivers/hid/hid-lofree.c
new file mode 100644
index 000000000000..89383527e519
--- /dev/null
+++ b/drivers/hid/hid-lofree.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Custom HID driver for Lofree products
+ * Adds support for Back (BTN_SIDE) and Forward (BTN_EXTRA) buttons
+ * 
+ * Copyright (c) 2025 Steve Oswald
+ * based on hid-cherry
+ */
+
+#include <linux/module.h>
+#include <linux/hid.h>
+#include <linux/input.h>
+#include "hid-ids.h"
+
+/*
+ * Remaps back/forward buttons to input events for Lofree Touch.
+ */
+static int lofree_touch_raw_event(struct hid_device *hdev,
+				  struct hid_report *report, u8 *data, int size)
+{
+	struct hid_input *hidinput;
+	struct input_dev *input;
+
+	if (report->id != 3)
+		return 0;
+
+	list_for_each_entry(hidinput, &hdev->inputs, list) {
+		input = hidinput->input;
+		input_report_key(input, BTN_SIDE, !!(data[1] & 0x08));
+		input_report_key(input, BTN_EXTRA, !!(data[1] & 0x10));
+		input_sync(input);
+	}
+
+	return 0;
+}
+
+/*
+ * Apply capabilities.
+ */
+static int lofree_touch_input_configured(struct hid_device *hdev,
+					 struct hid_input *hi)
+{
+	struct input_dev *input = hi->input;
+
+	input_set_capability(input, EV_KEY, BTN_SIDE);
+	input_set_capability(input, EV_KEY, BTN_EXTRA);
+
+	return 0;
+}
+
+static int lofree_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "HID parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "HID hw start failed\n");
+		return ret;
+	}
+
+	hid_info(hdev, "Touch@LOFREE custom HID driver loaded\n");
+	return 0;
+}
+
+static void lofree_remove(struct hid_device *hdev)
+{
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id lofree_touch_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOFREE,
+			       USB_VENDOR_ID_LOFREE_TOUCH) },
+	{}
+};
+MODULE_DEVICE_TABLE(hid, lofree_touch_devices);
+
+static struct hid_driver lofree_touch_driver = {
+	.name = "hid_lofree_touch",
+	.id_table = lofree_touch_devices,
+	.probe = lofree_probe,
+	.remove = lofree_remove,
+	.raw_event = lofree_touch_raw_event,
+	.input_configured = lofree_touch_input_configured,
+};
+
+module_hid_driver(lofree_touch_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(
+	"HID driver for some special Lofree devices like Lofree Touch mouse.");
-- 
2.48.1


