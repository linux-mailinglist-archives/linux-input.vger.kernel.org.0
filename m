Return-Path: <linux-input+bounces-9392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA26A161FE
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6B8916497B
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B731DF244;
	Sun, 19 Jan 2025 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEveaVMP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B431DF740;
	Sun, 19 Jan 2025 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292458; cv=none; b=WJMer8K07OisS6mtoP6ZVR0KAqMyK20tM0QP91F+5gUJB+Sj52kkErU0xYcAuN2oCnQzMPfjfvt7IXB2lc8/UGp7JjmBSL+1FkxfbOPxL2fzAx1szwIAwdSCfmtwtFCurVpAQQOEAcowg13/esu7V1QvdUBH0GDYNK8A0eU2QZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292458; c=relaxed/simple;
	bh=5O6+A9/8muwiHs6jmr8CR4NhE34g5Ohn2N6QGh1gtBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LMYVVsEOnjnY0zc1DpQoARXRlTHHN3qQUHFGHQp/3LfNj7sITKDpdF2BI6NiNo/9/R6Dw5eakXx9Svx76eAAzMKxxZ8WmTaPYi7F57RIV5O/BIAChpTVMMsiBIIufYB89l0vOJPgvVIvHdCpQAHFYvdCmmeMIrmfdsUiGCGFxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEveaVMP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso649866a12.0;
        Sun, 19 Jan 2025 05:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292454; x=1737897254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjRcri7+dbrHf8BT0YdfBRzc/LKUF2yCKpsEYPu1KZ0=;
        b=jEveaVMPoNUVKrIyikLwquK9Qgo6qQoX+4rmiPYO6c8bttLpXo7u3Bd+0LuYf43Aqe
         4e6xni7A7OUtZ29uWmiVNcDUSlOSXuhKCcM0HuBwOAWVv/qhZ+1l2Wn1qknT3yZqRIJg
         HYFWn32xHei65bMC4ein76/vHoTz4GAisoVB+NisivPCK0ZQojFnr3A0+s3EzFlmZeLM
         ruc4Yj1Z5m3LYGZXlUjYDprwj83uwWhUOCLika6yRFiHnG/92YXYc/900sLFBEVEabXl
         gDwyXDCBMRgnMyOlWb1BEqoX0cg3tJPoysc+j74kw2bVqFjmys4pGZTis07vJ7/JuSJl
         Gicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292454; x=1737897254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjRcri7+dbrHf8BT0YdfBRzc/LKUF2yCKpsEYPu1KZ0=;
        b=YB+I7csq99CW2bu6UrQLM1lcdr9Flg2dUkUNlmgGry0zGGuP7mFZTIJ73ZhLh4gWMI
         SUQWP+adpnyrhOjEY9+gkGkpGttvlRdHw21aV4h6VZxwdVkQs1lqAnSJLkf4+WNmNfUI
         L7j+mKT6w6w4vkbAXGnFX1P67rWSENo5/OlAzqOBskYeNXk5nnV35AhZ8EPOQR8sHMV2
         c0WGnp1S7p7u2qYIXFWJgrGO9+dKVQiLZhJKJzkkBoPJnGZGwr3oPUBJlF5T6XeB89wV
         EpwwgmxUZxJ8P7UBIVFNJOppGfqm4FPqgufRps9pm3LFTqNff1JQdrADJNB8wWsBhOmM
         QqFw==
X-Forwarded-Encrypted: i=1; AJvYcCWyxD5/hzu5bsny9ktcWvYDT7jHh2zbqNOxSADOtHrph54ek5FHSU4qZcFBsOFGSJi3S5qpFFLN+TOxjA==@vger.kernel.org, AJvYcCXRhnVZ6F8hYSO8DB0GdArflPIpe49NXCPgGnsKN2cW8fv3J/GO3Q2vrmBdLY+tZkudfcp6VgGbtlrm@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGb1cKxCRVExpnExUlGu+x4Ub0DnsovDpmOe7YbPhmUBesgY0
	G8VEl1CaFt2Jq9yJaklFsNgm2/L5FWtyVJWHlb1hitposKgNncbR
X-Gm-Gg: ASbGnct6t3QFjzFpKwxMzBrBeQgNFiXzvlZ4KZyirOrJWWhYMgWwoJSLe+Qc8miEvez
	zln1TY1O4KfPT71xEMdzY3xeIpYyUwwjPnGegrAKK54aBCIhoeAhmvqv/6dVXWtYmgM3/bBB4Oy
	b2/M9jcpxnHQAzk+AlKrQqftZr8FBIIdIehXvKjgSgkBbbZmf4bt5LXq/aO6YM5xvx0njbt2i+y
	DmeyXtyUdXOvvyBzaf25zmn0Snxxf6w5wT1IBhjSdRVORqgJBCphwOD55D/10ax0BLC4UvKGmmv
	dl+itXsZexqH3I6fdgQpfZkDxMGCXfbhrvlByyh8
X-Google-Smtp-Source: AGHT+IEbA4BJocGGL2XQCxFx55NoUtjmMyy1HBDM5uRu/A5ZGYJVJYB9Q+eiaezHJpjXFb5NmMGdbw==
X-Received: by 2002:a17:907:6d1f:b0:aa6:9b81:e7aa with SMTP id a640c23a62f3a-ab38b32037amr355302366b.7.1737292453546;
        Sun, 19 Jan 2025 05:14:13 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:12 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 10/12] HID: Add hid-universal-pidff driver and supported device ids
Date: Sun, 19 Jan 2025 14:13:01 +0100
Message-ID: <20250119131356.1006582-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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
2.48.1


