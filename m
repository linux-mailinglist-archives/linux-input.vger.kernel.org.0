Return-Path: <linux-input+bounces-8972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B8A03228
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2531886351
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8961E00A7;
	Mon,  6 Jan 2025 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPUKmP6z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BB21E0DEB;
	Mon,  6 Jan 2025 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199359; cv=none; b=V8tmRQaVnxz5xpq0v7OtyzinsXxyRZHfqkJ7his2VkBexJ8quamtXh+MOC+mb8N2vvEtYNYtiq8XDxJPPXcVS2SPqg8FtzsgR0UmDSe0q7hyLYFdkV1ydoDEp+Zo7sOosmBdr1mpXm4ftZ0zIglEdFrrBaB6s6ds3KYKgL0LRbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199359; c=relaxed/simple;
	bh=thZObaPve25NtBG3jcnVjHg9Um0cKRGUkJwJKnTyNzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeX8xWmdTPFL848tesRglSIp1jMvnK9ZpYYPtaFAj5wyKd+n2m/IC/SBYsypTCgk1z3o1fUKoIWt3/nMcSdlBSr1vsL7KiPV/B01B9hJk5Tjc9wfLzSTQqwJfIr07VYe8Y2LoJ7MdH7UFtmgQGWGgzinO0UVvW44un6pgR9q5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPUKmP6z; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3be7f663cso3093595a12.2;
        Mon, 06 Jan 2025 13:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199356; x=1736804156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg7gd5e/aYfvvOTa6WnC73IyJbYoHac2d0kgAimlDP4=;
        b=HPUKmP6zIHllk2CkpF+Kdw743KRKHQpzqan2/aNFJld+kpYxtPMKS7hVhMbe/sCD0h
         Du/Tcr43dp35H6AKVo2suXwKpVlNLRd0IsIh1VOKRIPAqGnnvY+GUGIH6KrzHLE8dPrG
         kRSuO/q/i+buD2LVCp+bvc/OJ33mnmseQdiVlSjYZDJP7uBadUxMNH9EndyPS/4sUaAO
         FLLZtCcC94hlveGqufUNRQuTPKMyXRFDAyr1G8VYuJY2R9nFvQM1aMc8eq1uA1oo1Qc+
         In8mTNrAQ2AlITcrbA1ajNvISMP7rdnHncINGK3eFds5LTMuFvRX9pJwRT1sgQvtB8qS
         9irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199356; x=1736804156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xg7gd5e/aYfvvOTa6WnC73IyJbYoHac2d0kgAimlDP4=;
        b=cmuFxPR8WUEGuJe2Kfq+DdeMFVQrzvKPyIi6alPEjd2D2nM79aPuKSx0Ws1vfb2s55
         d4PaefjLEs5TqYPnXcyDBZv2RFfea91DBCnnVBlHSklDrYwH4LZi6YntSZOsLMXLydtN
         2PdOYUs8vGwEO7MAVfjHoMv1dG2DsxW21rDmxVw/c/kNn3VtC5UVUE5yl7RfUXTB0cFt
         IuMZ4HNEmoLsGVm2NXoavEs8ZTTHjKSDUoyMgl5CJXD8lGgEdd3wglRl1BooI3ollMad
         l5fowHF7mtPyv6YEhehnEX/Dgz6GpaxLCyjVoMqqCRwDbvrr0a+0gAvX0C+E3ORuwqNo
         3iaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXohAINni+t01eR7ohkjW2rRK73Ib0oaZfx4fLh72LzjoR4IUZkc/eJg2yXdS3SVlXFFzmThhYSnvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxInvIInj4itqiFXTO7D66hl73ILVruwTOQpM4lb2YfPHVInGJR
	/3EKUHRbPr27qWcC5IQ40S/Y0jNl6//xqGCLoRCisxHdxU2flRoIyxw4AZB4
X-Gm-Gg: ASbGncshUAQeaAh5au68pyjCn3lJNHvWwaiQnTqW1JWD7GDTV76ReSIMNYPS/FG+pjA
	ieT8OEliLwS2tAEUXkpbMsGDlzwVobo85NDAMnPIyepAtlRkb/W3FE0mpAXsJd4hJj+raFzqO6D
	21ObjKCIx1foT7Qi4Q7cw2WLNAPtYwfWhBMcb0cmtzPS6kHQzSed94b1Qw+rMWp+w85d9NjLTvG
	W4jka7WLsMMsSgyDpmHzaFj9F68d8/ezt2AckGHBq/CDMXlNo8zp0CxlfuOq5/DLmNGqZsmQECy
	57dk7ATZHuVpEgg0C2dsfptljQc=
X-Google-Smtp-Source: AGHT+IFheAiEj+twn+ngCqjA4EgwQur170OdaHT64DGeYsJmwS2lKqBh05YSJYRtYPDyTJy4nnJ4iw==
X-Received: by 2002:a05:6402:5109:b0:5d0:bd3b:b9a9 with SMTP id 4fb4d7f45d1cf-5d81de1c38cmr21554572a12.8.1736199355783;
        Mon, 06 Jan 2025 13:35:55 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:54 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 10/10] HID: Add hid-universal-pidff driver and supported device ids
Date: Mon,  6 Jan 2025 22:35:39 +0100
Message-ID: <20250106213539.77709-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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
 drivers/hid/hid-ids.h             |  24 ++++
 drivers/hid/hid-universal-pidff.c | 185 ++++++++++++++++++++++++++++++
 4 files changed, 224 insertions(+)
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
index 1f47fda809b9..205dbb4ed6a3 100644
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
 
@@ -964,6 +973,18 @@
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
 
@@ -1373,6 +1394,9 @@
 #define USB_DEVICE_ID_VELLEMAN_K8061_FIRST	0x8061
 #define USB_DEVICE_ID_VELLEMAN_K8061_LAST	0x8068
 
+#define USB_VENDOR_ID_VRS	0x0483
+#define USB_DEVICE_ID_VRS_DFP	0xa355
+
 #define USB_VENDOR_ID_VTL		0x0306
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
 
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
new file mode 100644
index 000000000000..df0206f5e77d
--- /dev/null
+++ b/drivers/hid/hid-universal-pidff.c
@@ -0,0 +1,185 @@
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
2.47.1


