Return-Path: <linux-input+bounces-9652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF67A248A5
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4DF3A84A2
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8630016EBE8;
	Sat,  1 Feb 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK7z5BWT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971F19D06E;
	Sat,  1 Feb 2025 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409964; cv=none; b=U2AiL5RwG7OHkr4x3GoTFlEztwikAipe0ax14B6sCSNtWd19re4qJ0bcMbeN85eV76tjttFF/+maKSRn3/x6wgt0nuBELwQcYVDH5RjnwXkxGmylbX9v+OTvm1zm+JQEldVF37cbXeiYeNFqF4INfru3mnvrwY2/Ixg0PDCjHbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409964; c=relaxed/simple;
	bh=d8Jm5LKjSPtCAO4H/2mfwRYJqELnzRTa2S088FOWS80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+8lotRPVHKkZbvzRQqE8AIYiDthfm0bXBhA4RooX17USxfTbsN0nIp7ZMXMS3Kfu5k9h6Yt/f4vCBIlT3MdiRDpUcmAhGxv4DpSOGPTURep9NUmnFHz+3CCFuApuPAbt1AXpDDZSp9300AJIOcYIfEDthUviFxRrePuQq5ZIus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PK7z5BWT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so468909a12.2;
        Sat, 01 Feb 2025 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409961; x=1739014761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6NDM2osPcDiGS1j+VQDbNhlZJoiJ9pCbSczytHzw4c=;
        b=PK7z5BWTPXqpdGDAlpAlmKIQklYlS9pcZai1RR8+jZ058pP0zdd2KJEkjJSEdfW5YD
         Ke0ydkLDwf61HC5QLMR3t2UIEJcu1J6O6tqxMIvnktwZl5NQqA9CE1wPmmHxgQW4EIUb
         tnNpw7k14uYYcAdlZNa8BhMNu0Um+8gRnxBIjXbTMhAkB1uoD0TB2Xo6i81D/dOLKAG2
         KoZ/fKaSD/IKwXjv1sj/c3w7n0jtbWuz4FZjPLzZHxULgjxYTVTUB2wpv3/jBiQQYIg5
         ut8dhgcmURhNu4ms18oeprJlWHEGaQdsy93J5B6OSqd/3i6QfzP86yNuN/5yWkEgjmsj
         mTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409961; x=1739014761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6NDM2osPcDiGS1j+VQDbNhlZJoiJ9pCbSczytHzw4c=;
        b=E/B3lBLCe00JzxlGH5QpVcbp/mUJOdVifA08/y4F8bdCpgHP3za8XpkHpMd4niJg6A
         Vv/e0TmaNal7T9XSuTMfgwp2DaVyrK0ENzZloWub5iuZxIPExBmBMTs01JJNdvNf1YaL
         rlqVO6c9AJAdevPwFNinbps/8i3AWxtvo1+UGiUDDINvom19p4hrCBKTaIqCM+QXG/nl
         HO61upfcNsm9ZA2dU9twfiYvuXOGjSxrzJNcD5dKClE6zomcMgHvCitCnK8Df23xJmij
         y/3w7vt7BsebVL01hvV+qDgXVX0sfhmBuWpuLXAK4Cd2p9pElLBApTDXXyBNyxUh8knv
         eAjA==
X-Forwarded-Encrypted: i=1; AJvYcCUX/8aW4XH6E9i3ftQzaBNgnL086vsKoAKSE3f/Hsspr1mww1u66Bygd4fV5Ott5kR9a2lHyAYwjf3LGQ==@vger.kernel.org, AJvYcCWvMXgouhPsNGWOJv0pEisZxl0/uBsYnuHPF77ZIb/W63X1TfXYVZLUlrjRB8Wq1o2OJaHUcFWX0lOz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5gbayGUDxwyuBQtECz8EPXbS+1Gj8OG7f7rpRZZ4/KAkTk99
	BvO3K9kekDuMn7evLjpRN5IAzqH47CmzZFzHCXbK9WriGBT0R4ll
X-Gm-Gg: ASbGnct8mtNV3VFFJoPvYyDO8KAFV2FJ4cZu+as3d2RDnZUxLkFuCwtr0iptPLucLtU
	0ZfTCccDx08KcP3vXkI4OgwQ6x8NpYNYxp43OHs2mJ7W/nzuKW6X+3D0r0CfXYyRYtYFURMXFIL
	oGlp6ltUv9M4jj+VizCUIwb7LWi6u1EZs0qbsPcKNIV2oUdWdAnAwoxkyAgvPzNr+X+emMgSR2E
	X5C6m/esiuUBGnf5o74nSsANXFM0Frg2fuSMxzsQuVuqL1Si7BQta4aqhTWoNYKCYv/tDBOotQ3
	w+z4wygNcFaKJxUPwU//0nyk1zhXx96wt6Au3fsKHSnxUm3oheY5Yh1rKVNu6A==
X-Google-Smtp-Source: AGHT+IGSiYWdBg6vuBh9rSoclXJvNm0exBAZuf+qF9/MeSG+iM7kUSrqCilqb8eOb/bVWQykJPLBwg==
X-Received: by 2002:a05:6402:28ca:b0:5dc:882f:74b1 with SMTP id 4fb4d7f45d1cf-5dc882f754cmr2092925a12.3.1738409960468;
        Sat, 01 Feb 2025 03:39:20 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:20 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 10/22] HID: Add hid-universal-pidff driver and supported device ids
Date: Sat,  1 Feb 2025 12:38:54 +0100
Message-ID: <20250201113906.769162-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
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


