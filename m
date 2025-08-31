Return-Path: <linux-input+bounces-14402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D3B3D1BC
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 11:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 491923B8984
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3FF2236E9;
	Sun, 31 Aug 2025 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXVQYGsj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF321F4631;
	Sun, 31 Aug 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634038; cv=none; b=UckCfZ/Xs23JeRKUM6/7U6OBpOEL9ngd2hVx9+Js9nmIMn5jRXHsXRV3Kt35+H5eQtEMfyspe6vTr7uD2eRReQ4dDHn6des55TaWRflEqBQCLAJebvfMUvQTZa003Dbtwuq288bxnTzBjA87qT6UHtQiwJ/cg1seUn68k4MxIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634038; c=relaxed/simple;
	bh=Ek+BiIRHxgNs2ntzTc4wtOGbFbtBAir6+BOqV5HXXc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/yioWOAFPnSTMRphqkWQxHOoZGTk0YH3X81Pm5yU3T1T6rXTH/qxlZRFAI2oLpozgKBaV3w6dDjnw9STSa6xU+cBzoJTtdrFe1s2Q31WTIfSorVdFDy/Nf0q/vigPcJM+67v7c1NK8a8s9ps0o5ssiTkPIrZXG3RYH5HY+DeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXVQYGsj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso1197355e9.2;
        Sun, 31 Aug 2025 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634035; x=1757238835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZgIDh3/JXHTnaWBbnGXx9Cu8hTVtAVj9QpuBiEQrzw=;
        b=eXVQYGsjeQKRvzSgLOHLwK+S+fIeMsmcPQDwevMnHP0i8z+XSG9dB2UbxU76q+7Xn4
         OIz6W/LOI746NXDoc1E/KhNwGTYBsE7AbgixbHnoOrsgv9Ov3bKsIDWKQqMz66oZsSLz
         aErpj8EoBejssMhXyD8eNcQnI5/PBWDTC9jTDZz59+WbghpkyCiRU6EjcFUuAJ0szubg
         mt2kLzZi9Lvm18K5MQNXsP/m1T0WJOni7j88zPqk6q3fCFYUvNdUVQTHupnb4QCZzJkf
         7DSj7oa1FyKS4x9NGSLsF9mI6ELdQn8oiQW85g4ma9QNcslVXBlcTc3+1y3lVAY3X8AD
         vEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634035; x=1757238835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZgIDh3/JXHTnaWBbnGXx9Cu8hTVtAVj9QpuBiEQrzw=;
        b=Mb5GKuxWkftb5Pc9Y3AFrlT1EHrrBPqS04bV/o1K0HVFjau9RPUisVOuK6XFjuxpzz
         oqQybfL0AMAGCNI8Z5mwaPRaT13WBE9IKd2Hf0TQZyTB0UYUZmxARWD4YGxUS9zywU5c
         O/X9Cfw8BQZj8ViSAMOQOgJQmduwPW6RAPguXC1zuZOqp80yhV0dl/UgxxrVEDmi6AQn
         PVm1YFOJEl8rq1OClQzCa8kO3t0OFNBmfQEaV3XLJOVWTqC1fcJkcNj1AbqyXf3XQxTD
         yk4sFlHFu9C7U3CEfFcvxhdr6jCWn0/iipyMxiN4iuEEyFzFSbjmvS5AAR9PqgUD9jK6
         MvGg==
X-Forwarded-Encrypted: i=1; AJvYcCXYBwce7lgetAucnjXS/jAA97nIHJ2vPRw0r6r6ZBpGvd5pHWgNo/OAB4DKjl4fnzCELweu3OlOvMg1sns=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMwDvroBFrFJl/QAJKvNrf/swKR6e34zyX4ZiIqJaFc+lrwz6
	GsGhDdoID1aQB9mFVuX3kILpOkSGthUzXjPBM3zet1jR+wgXfFVkhi4o
X-Gm-Gg: ASbGncshdSd6hk1M219KFmojb5yGxEWdDOabRr9q2h/CndZN/QKNj4RuEOnY1+aj8dI
	LSd+rAV2CtkXKRHiKDN4mWXzeJwAya49S+tHWHKL/ACctoBBbLMgQtCMb6WEHC8QMCpi4dZW3DC
	3PhOqZ7kvkx4+BYpSrfG+HtttWm7Ef2PhhuwQSeJjrKauY+/vp1GpAG0glHM5FK2OzrfLs0ATFE
	R+5arSSG+qeeh30dNZy7HhdgvDStG4juX2vXfOY8zR/E/gyvFj9tCKQu7hok+EPJrHHQEGBJmq8
	+XxJBYAF8EXfmgk84w0FMdPcN8dC/qTGrze+0O3N49gU1xXUeM3RocA4SNiBkIRnNHPLSbvNerW
	POVHvRCjYYAkrExOihYshp2cakHHuZMIdImt2l2MUZLugHBjW7uOULQ9qK6mX8A==
X-Google-Smtp-Source: AGHT+IGXBZ3aj54GVw0OLH+dJmWIcaFJv0Uaox2YesewDE7M3HMKuoDLbwBL9ToqcHZJj+kAhToRJQ==
X-Received: by 2002:a5d:64e4:0:b0:3ce:f4fe:403c with SMTP id ffacd0b85a97d-3d1dddf0380mr2601998f8f.16.1756634034976;
        Sun, 31 Aug 2025 02:53:54 -0700 (PDT)
Received: from bookboi.. (v2202404220747262886.hotsrv.de. [152.53.14.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0b9402299sm9415133f8f.18.2025.08.31.02.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 02:53:54 -0700 (PDT)
From: stepeos <stevepeter.oswald@gmail.com>
X-Google-Original-From: stepeos <onegearmode@gmail.com>
To: jikos@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve Oswald <stevepeter.oswald@gmail.com>
Subject: [PATCH] HID: LOFREE: Fix back/forward buttons for
Date: Sun, 31 Aug 2025 12:53:48 +0300
Message-ID: <20250831095348.93453-1-onegearmode@gmail.com>
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


