Return-Path: <linux-input+bounces-9192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0EA0B777
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7C83A4403
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022B722F172;
	Mon, 13 Jan 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOD2jVot"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF251231C80;
	Mon, 13 Jan 2025 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772581; cv=none; b=pZi/LCOwTGCj6wnS8QUBk1ZBmI2QXSP7Rtb5QKjyVuUNpaKOv5Nb2v+YbPi3HwWx87P3yCpaVT8dJct6xUjzPveCu2vZ4XVnaS6vjyPy5LvHCdejWLvFg7uaqOjMqZscvfJG0MeKtVMPF8U47Ugd8w3saT7AsG8BMKtTbLsqCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772581; c=relaxed/simple;
	bh=8Ai6MHLLfUNdYTV4eukBW97XboF2ZkeyBx2Oclw6RsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gF6QkxGi0hQY9bN0ABgWcu4A1LsIt34OzJ4B00mUCAbwAEQuDJfuHvcCppAfxvfPUtILyLiIXp6GP2kMRy3XVakbnk1LcPFex9EHTx+gdirHZeyJUnS/EyzwNP8jvR1pZh5wBM1mlcnoIdThE18myzbHRtTuMBvZj/Fivb9nW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOD2jVot; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e395932c6so430525e87.2;
        Mon, 13 Jan 2025 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772578; x=1737377378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngugzYbBqdvyqcWs61z02MKyeKB0wNRHW1tziXtBtJo=;
        b=KOD2jVotO5FkNGugrnTrYVlJPZDVvRWIDkC+Cvon0ZCZfhxUBLVMamaGV1d74l5zDw
         1w0Hazx7w6larkbf9/O4wc408y7PFaUXE3QHw7kA0ZV+GLyWl/P0ViE/MvTIkOepzyLL
         Pl3nHM4UFqoyIw6BpIt0j6BqmSsSHX0xs7VLa02/kWmnTTfyyUVa0OVafwBF7bhhavu0
         jG+NHzdWThGVD034D57dg3WVRsf5uBeufU8ySzinxVCU5iix2cjpYwAa4Jg1Ae4qtt/a
         cncObnoPtM6DcspROnBEjvrFTtErEZmmMiY1munuM7r89nrgQ7A/FeZYz0U8haYq7r/1
         fi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772578; x=1737377378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngugzYbBqdvyqcWs61z02MKyeKB0wNRHW1tziXtBtJo=;
        b=xQJWEObuh8MqWXXOJPusEi6idd+zuf13nE+78k0oWCS00z/jcRHnfaRTpYWnBB+Ftf
         qqfWRhas47tHKLEGt1WG36pdMYal0YF1UR3y9SqMNwVH7VTkoZ59/Vl1AoPVcMhkuBpU
         1cgTQ1sX5ZR1oYvZ/FkFEftXTcxMJxJLQE/3PeW89vH1XoaBYOLSDnzzoaChzr/HO84t
         555EfiTsQBUUiCAUySmb4DyRKi2b09aeUGJoWOh8TAmukxyok2QkKhenDLI9wZJJhjja
         wKrXwFt3G1hXU6fueEVWHvsproExWgYOTQ0mNmrZZiESeTBUyzyEj+XHVuJZl/HjUuAo
         c6ng==
X-Forwarded-Encrypted: i=1; AJvYcCVy34t7IRob2RhFcg1OWHzaBEmvq+GbKHPumv+lYX2Uif6vpfmos9o3/iFMpHqh6GmqaS9sBjMB+iLu0g==@vger.kernel.org, AJvYcCVzWOC0hNte3Zi3YTJqCjSSuJyfqaSPgdEHSQtYeIw1zqI5XlgZ2qEsQv8BtFE8UzWFMAnpyeBl4X4Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ciFcj+4Tu9FH4NjVpSMGpm3pwNzb9y1A/dRNNuDHtynwGpX4
	LWYRhsZfJFzyHeNTX0RoI8oRZlkXwNNzqn6TpqNjl0jnzf1wcXZH
X-Gm-Gg: ASbGncuDxQ1g7psy48VAXOR7a5v5z586MWUhhT0LWT/Z1gOZhl1JPFlxO7imCfI34h6
	xbMqvwjF6KwXaPNcFEenqP/uJ27ePvK4RUkeDw8BqgHLEfGuxVWpp6c6+m5N0DNSV1/MvEYb6n8
	NuHS+6mOf0H5sGAHbmcZGVT/y2LwgesO6KSBQRmRTAMr2/eg4riHVRnoj9pMEVn0GFRpqHxGNOv
	RdfUd0LwMMdTpdrNqDoUqI09BHGYlrcz0jxwRydkvoaxbbq3O815TNo4C3jH1NHWDy1H/00S+Ne
	YnhtRStNshbJxMF0nrNsIyQEug8=
X-Google-Smtp-Source: AGHT+IFU+uAiO2DdeBkRhAGKP19tDPZB0a7bnA0zWQIIOEzwpIfsMBTTdkHCM7cUIqVwZr+F9SHvnQ==
X-Received: by 2002:a05:6512:1081:b0:542:2998:ac88 with SMTP id 2adb3069b0e04-542845116eemr2282255e87.1.1736772577625;
        Mon, 13 Jan 2025 04:49:37 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 10/11] HID: Add hid-universal-pidff driver and supported device ids
Date: Mon, 13 Jan 2025 13:49:22 +0100
Message-ID: <20250113124923.234060-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend pidff compatibility, usable button range, fix
device descriptors, manage pidff quirks and set improved
fuzz/flat default for high precision devices.

As many of PID devices are quite similar and not dependent on
custom drivers, this one can handle all of PID devices which
need special care.

Numerous sim racing/sim flight bases report a lot of buttons
in excess of 100. Moza Racing exposes 128 of them and thus
the need to extend the available range.

All the included devices were tested and confirmed working
with the help of the sim racing community.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  29 +++++
 drivers/hid/hid-universal-pidff.c | 188 ++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/hid/hid-universal-pidff.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4d2a89d65b65..59d8da16f5b4 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1217,6 +1217,20 @@ config HID_U2FZERO
 	  allow setting the brightness to anything but 1, which will
 	  trigger a single blink and immediately reset back to 0.
 
+config HID_UNIVERSAL_PIDFF
+	tristate "universal-pidff: extended USB PID driver compatibility and usage"
+	depends on USB_HID
+	depends on HID_PID
+	help
+	  Extended PID support for selected devices.
+
+	  Contains report fixups, extended usable button range and
+	  pidff quirk management to extend compatibility with slightly
+	  non-compliant USB PID devices and better fuzz/flat values for
+	  high precision direct drive devices.
+
+	  Supports Moza Racing, Cammus, VRS, FFBeast and more.
+
 config HID_WACOM
 	tristate "Wacom Intuos/Graphire tablet support (USB)"
 	depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 24de45f3677d..919d6a146077 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -140,6 +140,7 @@ hid-uclogic-objs		:= hid-uclogic-core.o \
 				   hid-uclogic-params.o
 obj-$(CONFIG_HID_UCLOGIC)	+= hid-uclogic.o
 obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
+obj-$(CONFIG_HID_UNIVERSAL_PIDFF)	+= hid-universal-pidff.o
 obj-$(CONFIG_HID_LED)		+= hid-led.o
 obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
 obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1f47fda809b9..af74dbca69fd 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -261,6 +261,10 @@
 #define USB_DEVICE_ID_BTC_EMPREX_REMOTE	0x5578
 #define USB_DEVICE_ID_BTC_EMPREX_REMOTE_2	0x5577
 
+#define USB_VENDOR_ID_CAMMUS		0x3416
+#define USB_DEVICE_ID_CAMMUS_C5		0x0301
+#define USB_DEVICE_ID_CAMMUS_C12	0x0302
+
 #define USB_VENDOR_ID_CANDO		0x2087
 #define USB_DEVICE_ID_CANDO_PIXCIR_MULTI_TOUCH 0x0703
 #define USB_DEVICE_ID_CANDO_MULTI_TOUCH	0x0a01
@@ -452,6 +456,11 @@
 #define USB_VENDOR_ID_EVISION           0x320f
 #define USB_DEVICE_ID_EVISION_ICL01     0x5041
 
+#define USB_VENDOR_ID_FFBEAST		0x045b
+#define USB_DEVICE_ID_FFBEAST_JOYSTICK	0x58f9
+#define USB_DEVICE_ID_FFBEAST_RUDDER	0x5968
+#define USB_DEVICE_ID_FFBEAST_WHEEL	0x59d7
+
 #define USB_VENDOR_ID_FLATFROG		0x25b5
 #define USB_DEVICE_ID_MULTITOUCH_3200	0x0002
 
@@ -817,6 +826,11 @@
 #define I2C_DEVICE_ID_LG_8001		0x8001
 #define I2C_DEVICE_ID_LG_7010		0x7010
 
+#define USB_VENDOR_ID_LITE_STAR		0x11ff
+#define USB_DEVICE_ID_PXN_V12		0x1212
+#define USB_DEVICE_ID_PXN_V12_LITE	0x1112
+#define USB_DEVICE_ID_PXN_V12_LITE_2	0x1211
+
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_Z_10_SPK	0x0a07
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
@@ -964,6 +978,18 @@
 #define USB_VENDOR_ID_MONTEREY		0x0566
 #define USB_DEVICE_ID_GENIUS_KB29E	0x3004
 
+#define USB_VENDOR_ID_MOZA		0x346e
+#define USB_DEVICE_ID_MOZA_R3		0x0005
+#define USB_DEVICE_ID_MOZA_R5		0x0004
+#define USB_DEVICE_ID_MOZA_R9		0x0002
+#define USB_DEVICE_ID_MOZA_R12		0x0006
+#define USB_DEVICE_ID_MOZA_R16_R21	0x0000
+#define USB_DEVICE_ID_MOZA_R3_ALT	0x0015
+#define USB_DEVICE_ID_MOZA_R5_ALT	0x0014
+#define USB_DEVICE_ID_MOZA_R9_ALT	0x0012
+#define USB_DEVICE_ID_MOZA_R12_ALT	0x0016
+#define USB_DEVICE_ID_MOZA_R16_R21_ALT	0x0010
+
 #define USB_VENDOR_ID_MSI		0x1770
 #define USB_DEVICE_ID_MSI_GT683R_LED_PANEL 0xff00
 
@@ -1373,6 +1399,9 @@
 #define USB_DEVICE_ID_VELLEMAN_K8061_FIRST	0x8061
 #define USB_DEVICE_ID_VELLEMAN_K8061_LAST	0x8068
 
+#define USB_VENDOR_ID_VRS	0x0483
+#define USB_DEVICE_ID_VRS_DFP	0xa355
+
 #define USB_VENDOR_ID_VTL		0x0306
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
 
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
new file mode 100644
index 000000000000..0f81df9a019b
--- /dev/null
+++ b/drivers/hid/hid-universal-pidff.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HID UNIVERSAL PIDFF
+ * hid-pidff wrapper for PID-enabled devices
+ * Handles device reports, quirks and extends usable button range
+ *
+ * Copyright (c) 2024 Makarenko Oleg
+ * Copyright (c) 2024 Tomasz Pakuła
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/input-event-codes.h>
+#include "hid-ids.h"
+
+#define JOY_RANGE (BTN_DEAD - BTN_JOYSTICK + 1)
+
+static const u8 *moza_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
+{
+	// Fix data type on PID Device Control
+	if (rdesc[1002] == 0x91 && rdesc[1003] == 0x02) {
+		rdesc[1003] = 0x00; // Fix header, it needs to be Array.
+	}
+	return rdesc;
+}
+
+
+static const u8 *universal_pidff_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					      unsigned int *rsize)
+{
+	if (hdev->vendor == USB_VENDOR_ID_MOZA) {
+		return moza_report_fixup(hdev, rdesc, rsize);
+	}
+	return rdesc;
+}
+
+/*
+ * Map buttons manually to extend the default joystick buttn limit
+ */
+static int universal_pidff_input_mapping(struct hid_device *hdev,
+	struct hid_input *hi, struct hid_field *field, struct hid_usage *usage,
+	unsigned long **bit, int *max)
+{
+	// Let the default behavior handle mapping if usage is not a button
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_BUTTON)
+		return 0;
+
+	int button = ((usage->hid - 1) & HID_USAGE);
+	int code = button + BTN_JOYSTICK;
+
+	// Detect the end of JOYSTICK buttons range
+	// KEY_NEXT_FAVORITE = 0x270
+	if (code > BTN_DEAD)
+		code = button + KEY_NEXT_FAVORITE - JOY_RANGE;
+
+	// Map overflowing buttons to KEY_RESERVED to not ignore
+	// them and let them still trigger MSC_SCAN
+	if (code > KEY_MAX)
+		code = KEY_RESERVED;
+
+	hid_map_usage(hi, usage, bit, max, EV_KEY, code);
+	hid_dbg(hdev, "Button %d: usage %d", button, code);
+	return 1;
+}
+
+
+/*
+ * Check if the device is PID and initialize it
+ * Add quirks after initialisation
+ */
+static int universal_pidff_probe(struct hid_device *hdev,
+				 const struct hid_device_id *id)
+{
+	int error;
+	error = hid_parse(hdev);
+	if (error) {
+		hid_err(hdev, "HID parse failed\n");
+		goto err;
+	}
+
+	error = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
+	if (error) {
+		hid_err(hdev, "HID hw start failed\n");
+		goto err;
+	}
+
+	// Check if HID_PID support is enabled
+	int (*init_function)(struct hid_device *, __u32);
+	init_function = hid_pidff_init_with_quirks;
+
+	if (!init_function) {
+		hid_warn(hdev, "HID_PID support not enabled!\n");
+		return 0;
+	}
+
+	error = init_function(hdev, id->driver_data);
+	if (error) {
+		hid_warn(hdev, "Force Feedback initialization failed\n");
+		goto err;
+	}
+
+	hid_info(hdev, "Universal pidff driver loaded sucesfully!");
+
+	return 0;
+err:
+	return error;
+}
+
+static int universal_pidff_input_configured(struct hid_device *hdev,
+					    struct hid_input *hidinput)
+{
+	// Remove fuzz and deadzone from the wheel/joystick axis
+	struct input_dev *input = hidinput->input;
+	input_set_abs_params(input, ABS_X,
+		input->absinfo[ABS_X].minimum, input->absinfo[ABS_X].maximum, 0, 0);
+
+	// Decrease fuzz and deadzone on additional axes
+	// Default Linux values are 255 for fuzz and 4096 for flat (deadzone)
+	int axis;
+	for (axis = ABS_Y; axis <= ABS_BRAKE; axis++) {
+		if (!test_bit(axis, input->absbit))
+			continue;
+
+		input_set_abs_params(input, axis,
+			input->absinfo[axis].minimum,
+			input->absinfo[axis].maximum, 8, 0);
+	}
+
+	// Remove fuzz and deadzone from the second joystick axis
+	if (hdev->vendor == USB_VENDOR_ID_FFBEAST &&
+	    hdev->product == USB_DEVICE_ID_FFBEAST_JOYSTICK)
+		input_set_abs_params(input, ABS_Y,
+			input->absinfo[ABS_Y].minimum,
+			input->absinfo[ABS_Y].maximum, 0, 0);
+
+	return 0;
+}
+
+static const struct hid_device_id universal_pidff_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3_ALT),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5_ALT),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9_ALT),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12_ALT),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21_ALT),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C5) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C12) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_DFP),
+		.driver_data = HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
+
+static struct hid_driver universal_pidff = {
+	.name = "hid-universal-pidff",
+	.id_table = universal_pidff_devices,
+	.input_mapping = universal_pidff_input_mapping,
+	.probe = universal_pidff_probe,
+	.input_configured = universal_pidff_input_configured,
+	.report_fixup = universal_pidff_report_fixup
+};
+module_hid_driver(universal_pidff);
+
+MODULE_DESCRIPTION("Universal driver for PID Force Feedback devices");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Makarenko Oleg <oleg@makarenk.ooo>");
+MODULE_AUTHOR("Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>");
-- 
2.48.0


