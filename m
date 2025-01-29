Return-Path: <linux-input+bounces-9615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A1EA225BE
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C61188721F
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDDC1E5734;
	Wed, 29 Jan 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlJw+oy1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A791E5738;
	Wed, 29 Jan 2025 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186198; cv=none; b=HEvIhTZoq/aU/KyKtKYEvBxBefGAl64FXOc49WKsA4qv9sPhacT0vJYFUNnq+1GaPo+oyk7ZDMX9kfqUJgDkPIWBF3t1ooK6nuphUia+omZ3U059/t+7ctFSHXowcxjctxaN//JQl4Lr89tA0Uw0LtGruMpM9inFYvUM0xp3IHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186198; c=relaxed/simple;
	bh=AH/+LQlFM6qksel++KWSI+JDIbYZiANFMgwth/8FPh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvYBQa5U2pIXnxqRb5S4RXw9Mhq27q1tc23jUz2zaYujiS6eNPsyxOPwC1o2ZqjQDh3+Vw+azaPTnz11hMA4aQ1NAfhlDHhixBrl8ERLYRhWGP7WeMQqcbojkoFVtX3oiV0ndcyTJHy8XB1WL9pFSd7kJJAGxuzEpkfrZul9AzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlJw+oy1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3c3e38d0so15146e87.3;
        Wed, 29 Jan 2025 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186194; x=1738790994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE2M4p6TnJM8c4BCHMbaM2QSaKaUNezS2BMYrci6Qbw=;
        b=QlJw+oy1ab2cFm+MukSgXEFhioW4ZWLUS/qZlKubnFQdhm+dGyeUiB/yymnt7V1pHb
         K2tPsjAEH/GdF+5lLCjgM0u4xPZdX2V8Nc8YSJMFoJjkGJR7SF5yXLbeJ117KUdP3L6Y
         rlx0w1A6MFktdt8RKtoe3V85OOmzeOJJMvsswvNYwKjl4KU1OVNvLu9x/1lW5ijvBawY
         W0eU0i/NHGd4aBY0FmJsBlRFSdavxrn5+ysB80vyzzR8gKuEPJMzUXOIoN2DgZsAItEd
         Di7LAXrViJD9e3QoK5SGkGuMcxuT1qmCAQgllRnr8bDbvF2OSh/y1s3dxiM8qlfhbgeR
         pcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186194; x=1738790994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE2M4p6TnJM8c4BCHMbaM2QSaKaUNezS2BMYrci6Qbw=;
        b=lMMh6Bq43Gj5OzaS8fpI+6iBfnGqRXVpp3zuXljTCVI8Q2ixSipMVfwSv0bMC41l/l
         ew4IkKVyxbMPZdnuhOTUOfk8yqOGgggQHOmuudaJ9IMDbP+zL6aLy2XlPCrfMyhRZct6
         +ye6xK8jjr4YDq/pLEoPlM+CmcA6+g/3zoADvX7Nixc8JZOUJe8ZOHjxZ/7MngxzWtug
         Yj6vQ/QFOjAV1fcGeqjC8UFabyO/eXykAZGnRRCqoqCbXCPIiroO0cctf7rI5JDlx5FI
         6KLIiPZy46B9jLs300ot7jt2UjeUuiYwnQHIwZ1/kfriNe5qta4agPR6Pz0Yih53QScY
         aykA==
X-Forwarded-Encrypted: i=1; AJvYcCV9kXAnnC7NY/tRArrEkh4F1NZWpuHoi9NKX0kZcUrAmsaqrWKp+DCOpz4lZK02vCui7NSMLB11+Xtr@vger.kernel.org, AJvYcCWHf9N3azeD2BKxVdYLNC5gW/vXUSQz1y2qmloZKyQtxs6dq6icUPCJIFFnIzV9VdO0bIvHK5ps5DT2aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSJ/Od38IxxUGkYRYl3+d9RoB2CnA3zlPpdVZMZN337iGG/iD
	bOhApM3xrod2mHDKeqxUegunE7Ck8sU29eW5C+Er2H13V6Is6uWQoDzRtLRg
X-Gm-Gg: ASbGncsbY3J1HUanoyZOReNasREukGoh0XcHj3yUigaIIcQjKJ1cRZJQnKivBZO+CCf
	ANtUY6uSLz6guDYypBIj+p7nm7RRNHfBjdfPbJl+Pps8jn6WMfPfPDrrq3uK2bzH6pan1UvFxzy
	jYosN+6zuZibotZpZUTXyO+UraTJduv+mjUUcrI+HSlO65RTTzVuYxcehRGzeRji1EwGaI/ZmiU
	ZVgKfyXdz6S27TVvGjr+HgTiL5/nX3YDNbo/opZz2ZprtJeDzqVmNHQrqpki4UYzoA1brPm1obW
	5jaEi42LDtIQuorVbFk7IY9OjDZVUctz7k9OoxJEDtILikrJAOTKVsRoHyGAB9tpAtlJaZtE
X-Google-Smtp-Source: AGHT+IEA+ljG/OOCI2YjIKpojDGQ9UaacYTRfz2TU+AU+lRYBvVHOEz5gQnU6S1tfoojhJ/lmj/Zfg==
X-Received: by 2002:a05:6512:3f20:b0:542:2990:5db6 with SMTP id 2adb3069b0e04-543e4ba667cmr616924e87.0.1738186194127;
        Wed, 29 Jan 2025 13:29:54 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:53 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 10/21] HID: Add hid-universal-pidff driver and supported device ids
Date: Wed, 29 Jan 2025 22:29:24 +0100
Message-ID: <20250129212935.780998-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend pidff compatibility, usable button range, manage pidff quirks and
set improved fuzz/flat default for high precision devices. Possibility
of fixing device descriptors in the future if such needs arises.

As many of PID devices are quite similar and not dependent on
custom drivers, this one can handle all of PID devices which
need special care.

Numerous sim racing/sim flight bases report a lot of buttons
in excess of 100. Moza Racing exposes 128 of them and thus
the need to extend the available range.

All the included devices were tested and confirmed working
with the help of the sim racing community.

Changes in v6:
- Support "split" devices with a separate "input device" for buttons
- Fixed comment styling

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  31 +++++
 drivers/hid/hid-universal-pidff.c | 192 ++++++++++++++++++++++++++++++
 4 files changed, 238 insertions(+)
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
index 1f47fda809b9..4870811aa2c8 100644
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
 
@@ -817,6 +826,13 @@
 #define I2C_DEVICE_ID_LG_8001		0x8001
 #define I2C_DEVICE_ID_LG_7010		0x7010
 
+#define USB_VENDOR_ID_LITE_STAR		0x11ff
+#define USB_DEVICE_ID_PXN_V10		0x3245
+#define USB_DEVICE_ID_PXN_V12		0x1212
+#define USB_DEVICE_ID_PXN_V12_LITE	0x1112
+#define USB_DEVICE_ID_PXN_V12_LITE_2	0x1211
+#define USB_DEVICE_LITE_STAR_GT987_FF	0x2141
+
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_Z_10_SPK	0x0a07
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
@@ -964,6 +980,18 @@
 #define USB_VENDOR_ID_MONTEREY		0x0566
 #define USB_DEVICE_ID_GENIUS_KB29E	0x3004
 
+#define USB_VENDOR_ID_MOZA		0x346e
+#define USB_DEVICE_ID_MOZA_R3		0x0005
+#define USB_DEVICE_ID_MOZA_R3_2		0x0015
+#define USB_DEVICE_ID_MOZA_R5		0x0004
+#define USB_DEVICE_ID_MOZA_R5_2		0x0014
+#define USB_DEVICE_ID_MOZA_R9		0x0002
+#define USB_DEVICE_ID_MOZA_R9_2		0x0012
+#define USB_DEVICE_ID_MOZA_R12		0x0006
+#define USB_DEVICE_ID_MOZA_R12_2	0x0016
+#define USB_DEVICE_ID_MOZA_R16_R21	0x0000
+#define USB_DEVICE_ID_MOZA_R16_R21_2	0x0010
+
 #define USB_VENDOR_ID_MSI		0x1770
 #define USB_DEVICE_ID_MSI_GT683R_LED_PANEL 0xff00
 
@@ -1373,6 +1401,9 @@
 #define USB_DEVICE_ID_VELLEMAN_K8061_FIRST	0x8061
 #define USB_DEVICE_ID_VELLEMAN_K8061_LAST	0x8068
 
+#define USB_VENDOR_ID_VRS	0x0483
+#define USB_DEVICE_ID_VRS_DFP	0xa355
+
 #define USB_VENDOR_ID_VTL		0x0306
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
 
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
new file mode 100644
index 000000000000..55aad2e4ac1b
--- /dev/null
+++ b/drivers/hid/hid-universal-pidff.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * HID UNIVERSAL PIDFF
+ * hid-pidff wrapper for PID-enabled devices
+ * Handles device reports, quirks and extends usable button range
+ *
+ * Copyright (c) 2024, 2025 Makarenko Oleg
+ * Copyright (c) 2024, 2025 Tomasz Pakuła
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
+/*
+ * Map buttons manually to extend the default joystick button limit
+ */
+static int universal_pidff_input_mapping(struct hid_device *hdev,
+	struct hid_input *hi, struct hid_field *field, struct hid_usage *usage,
+	unsigned long **bit, int *max)
+{
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_BUTTON)
+		return 0;
+
+	if (field->application != HID_GD_JOYSTICK)
+		return 0;
+
+	int button = ((usage->hid - 1) & HID_USAGE);
+	int code = button + BTN_JOYSTICK;
+
+	/* Detect the end of JOYSTICK buttons range */
+	if (code > BTN_DEAD)
+		code = button + KEY_NEXT_FAVORITE - JOY_RANGE;
+
+	/*
+	 * Map overflowing buttons to KEY_RESERVED to not ignore
+	 * them and let them still trigger MSC_SCAN
+	 */
+	if (code > KEY_MAX)
+		code = KEY_RESERVED;
+
+	hid_map_usage(hi, usage, bit, max, EV_KEY, code);
+	hid_dbg(hdev, "Button %d: usage %d", button, code);
+	return 1;
+}
+
+/*
+ * Check if the device is PID and initialize it
+ * Add quirks after initialisation
+ */
+static int universal_pidff_probe(struct hid_device *hdev,
+				 const struct hid_device_id *id)
+{
+	int i, error;
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
+	/* Check if device contains PID usage page */
+	error = 1;
+	for (i = 0; i < hdev->collection_size; i++)
+		if ((hdev->collection[i].usage & HID_USAGE_PAGE) == HID_UP_PID) {
+			error = 0;
+			hid_dbg(hdev, "PID usage page found\n");
+			break;
+		}
+
+	/*
+	 * Do not fail as this might be the second "device"
+	 * just for additional buttons/axes. Exit cleanly if force
+	 * feedback usage page wasn't found (included devices were
+	 * tested and confirmed to be USB PID after all).
+	 */
+	if (error) {
+		hid_dbg(hdev, "PID usage page not found in the descriptor\n");
+		return 0;
+	}
+
+	/* Check if HID_PID support is enabled */
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
+		hid_warn(hdev, "Error initialising force feedback\n");
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
+	int axis;
+	struct input_dev *input = hidinput->input;
+
+	if (!input->absinfo)
+		return 0;
+
+	/* Decrease fuzz and deadzone on available axes */
+	for (axis = ABS_X; axis <= ABS_BRAKE; axis++) {
+		if (!test_bit(axis, input->absbit))
+			continue;
+
+		input_set_abs_params(input, axis,
+			input->absinfo[axis].minimum,
+			input->absinfo[axis].maximum,
+			axis == ABS_X ? 0 : 8, 0);
+	}
+
+	/* Remove fuzz and deadzone from the second joystick axis */
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
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3_2),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5_2),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9_2),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12_2),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21_2),
+		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C5) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C12) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_DFP),
+		.driver_data = HID_PIDFF_QUIRK_PERMISSIVE_CONTROL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
+
+static struct hid_driver universal_pidff = {
+	.name = "hid-universal-pidff",
+	.id_table = universal_pidff_devices,
+	.input_mapping = universal_pidff_input_mapping,
+	.probe = universal_pidff_probe,
+	.input_configured = universal_pidff_input_configured
+};
+module_hid_driver(universal_pidff);
+
+MODULE_DESCRIPTION("Universal driver for USB PID Force Feedback devices");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Makarenko Oleg <oleg@makarenk.ooo>");
+MODULE_AUTHOR("Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>");
-- 
2.48.1


