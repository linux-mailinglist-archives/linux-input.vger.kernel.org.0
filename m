Return-Path: <linux-input+bounces-9850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA2A2C436
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 714931687DE
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185D821D018;
	Fri,  7 Feb 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpYC8HKL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9E21D003;
	Fri,  7 Feb 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936596; cv=none; b=DK2hy+FOU/m9wJqe3XXtka6Bam0lie0DQ0DMbj5RgpzDJ6L/qPk1XNzRHkZKXRIfMXcvM9Jm/8UPfe0q9i1tAa8xSnv2thQXSpztrhBfAowBRDSOwzGGQomnGn9Ifp+VWCJvq/w/xwgh0ZScolyBmDBzc1DujKHO1dEyDR43Snc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936596; c=relaxed/simple;
	bh=yAVztHnNEfJNcapun2CKXaJ/53phh1wyDW0W3990WgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsBc8imS/97HO0Es7uuJ6C/BAQhnzeyjfdy+KuRUVvT7V7oTdlI+MpxOdoMpefMTk/Gashaubdz7Rhu3hRXo75Ix21hq+RmtN0Vh9WGvc/34FL0EHsaQ5lPOqKrkLQiXkvvyMweeQpAdpc94zvhuOSwEmHFn9VZmlmkNlHjqMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpYC8HKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF05C4CEDF;
	Fri,  7 Feb 2025 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936595;
	bh=yAVztHnNEfJNcapun2CKXaJ/53phh1wyDW0W3990WgA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GpYC8HKLyJwblQGOrCUwsSHXO3vrlf6VsnAXTVw2nUhnJCYRJYV4r7eHzw9/qlggT
	 6vouxehL0qqZmaoNhuZp9OKETFKOF17Vziq/eHZ3pT3mr8fzpcN8qTbOX34IBs8VUf
	 hiC8D/Mw/6ocxbKZI+3JklEpuDSqywLhVNji1oYklDSuugRh588KMHcYMB8rQ5ILdv
	 fs6e38hnbVo+jWzCF2DfwYKKoRI12/bnQLduN2QQUOOpFcMeWFtmiprqu7VrMxG/SS
	 fUcxkrMrWpQ+zny01U7uhaxxuCDvmfLl2D5C85m1SxDZyEF58I/clvrSx/gsh1Opqy
	 07PviSBAns3Wg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:56:03 +0100
Subject: [PATCH 7/7] HID: bpf: add a v6.11+ compatible BPF fixup for the
 XPPen ACK05 remote
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-7-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=13748;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=yAVztHnNEfJNcapun2CKXaJ/53phh1wyDW0W3990WgA=;
 b=o9Y/k62pS2ZjMs8wBtSda1PGKSWH15MoKhwu9Fs2Oii2OBOCr80zQRb3Mvt0fTUoQ3uyI3pOo
 Is0ONlvVWbFDBZMYY6IinInrizW7UILJ8p0R4zi56IGhpZo1+VXm0kc
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

With v6.11+, we can actually call hid_hw_output_report() and put the device
into raw mode, thus getting accurate events without being messed up.

Technically we could do the same on v6.10, but given that wayland, gnome
and KDE are still not capable of handling the dial, and that v6.10 is EOL,
we can safely save a little bit of compilation by only allowing v6.11+.

We can easily export the battery information to userspace by adding a
dedicated report. However, we need to cheat on the kernel to force it
not to query the battery by making the physical collection a stylus. The
kernel will then only rely on the events it gets from the device.

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/133
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/XPPen__ACK05.bpf.c | 330 +++++++++++++++++++++++++++++++
 1 file changed, 330 insertions(+)

diff --git a/drivers/hid/bpf/progs/XPPen__ACK05.bpf.c b/drivers/hid/bpf/progs/XPPen__ACK05.bpf.c
new file mode 100644
index 0000000000000000000000000000000000000000..1a0aeea6a081cdcfe30032537162784c5ab80001
--- /dev/null
+++ b/drivers/hid/bpf/progs/XPPen__ACK05.bpf.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024 Red Hat, Inc
+ */
+
+#include "vmlinux.h"
+#include "hid_bpf.h"
+#include "hid_bpf_helpers.h"
+#include "hid_report_helpers.h"
+#include <bpf/bpf_tracing.h>
+
+#define HID_BPF_ASYNC_MAX_CTX 1
+#include "hid_bpf_async.h"
+
+#define VID_UGEE		0x28BD
+/* same PID whether connected directly or through the provided dongle: */
+#define PID_ACK05_REMOTE	0x0202
+
+
+HID_BPF_CONFIG(
+	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_UGEE, PID_ACK05_REMOTE),
+);
+
+/*
+ * By default, the pad reports the buttons through a set of key sequences.
+ *
+ * The pad reports a classic keyboard report descriptor:
+ * # HANVON UGEE Shortcut Remote
+ * Report descriptor length: 102 bytes
+ *  0x05, 0x01,                    // Usage Page (Generic Desktop)              0
+ *  0x09, 0x02,                    // Usage (Mouse)                             2
+ *  0xa1, 0x01,                    // Collection (Application)                  4
+ *  0x85, 0x09,                    //   Report ID (9)                           6
+ *  0x09, 0x01,                    //   Usage (Pointer)                         8
+ *  0xa1, 0x00,                    //   Collection (Physical)                   10
+ *  0x05, 0x09,                    //     Usage Page (Button)                   12
+ *  0x19, 0x01,                    //     UsageMinimum (1)                      14
+ *  0x29, 0x03,                    //     UsageMaximum (3)                      16
+ *  0x15, 0x00,                    //     Logical Minimum (0)                   18
+ *  0x25, 0x01,                    //     Logical Maximum (1)                   20
+ *  0x95, 0x03,                    //     Report Count (3)                      22
+ *  0x75, 0x01,                    //     Report Size (1)                       24
+ *  0x81, 0x02,                    //     Input (Data,Var,Abs)                  26
+ *  0x95, 0x05,                    //     Report Count (5)                      28
+ *  0x81, 0x01,                    //     Input (Cnst,Arr,Abs)                  30
+ *  0x05, 0x01,                    //     Usage Page (Generic Desktop)          32
+ *  0x09, 0x30,                    //     Usage (X)                             34
+ *  0x09, 0x31,                    //     Usage (Y)                             36
+ *  0x26, 0xff, 0x7f,              //     Logical Maximum (32767)               38
+ *  0x95, 0x02,                    //     Report Count (2)                      41
+ *  0x75, 0x10,                    //     Report Size (16)                      43
+ *  0x81, 0x02,                    //     Input (Data,Var,Abs)                  45
+ *  0x05, 0x0d,                    //     Usage Page (Digitizers)               47
+ *  0x09, 0x30,                    //     Usage (Tip Pressure)                  49
+ *  0x26, 0xff, 0x07,              //     Logical Maximum (2047)                51
+ *  0x95, 0x01,                    //     Report Count (1)                      54
+ *  0x75, 0x10,                    //     Report Size (16)                      56
+ *  0x81, 0x02,                    //     Input (Data,Var,Abs)                  58
+ *  0xc0,                          //   End Collection                          60
+ *  0xc0,                          // End Collection                            61
+ *  0x05, 0x01,                    // Usage Page (Generic Desktop)              62
+ *  0x09, 0x06,                    // Usage (Keyboard)                          64
+ *  0xa1, 0x01,                    // Collection (Application)                  66
+ *  0x85, 0x06,                    //   Report ID (6)                           68
+ *  0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)            70
+ *  0x19, 0xe0,                    //   UsageMinimum (224)                      72
+ *  0x29, 0xe7,                    //   UsageMaximum (231)                      74
+ *  0x15, 0x00,                    //   Logical Minimum (0)                     76
+ *  0x25, 0x01,                    //   Logical Maximum (1)                     78
+ *  0x75, 0x01,                    //   Report Size (1)                         80
+ *  0x95, 0x08,                    //   Report Count (8)                        82
+ *  0x81, 0x02,                    //   Input (Data,Var,Abs)                    84
+ *  0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)            86
+ *  0x19, 0x00,                    //   UsageMinimum (0)                        88
+ *  0x29, 0xff,                    //   UsageMaximum (255)                      90
+ *  0x26, 0xff, 0x00,              //   Logical Maximum (255)                   92
+ *  0x75, 0x08,                    //   Report Size (8)                         95
+ *  0x95, 0x06,                    //   Report Count (6)                        97
+ *  0x81, 0x00,                    //   Input (Data,Arr,Abs)                    99
+ *  0xc0,                          // End Collection                            101
+ *
+ * Each button gets assigned the following events:
+ *
+ *   Buttons released: 06 00 00 00 00 00 00 00
+ *   Button 1:         06 01 12 00 00 00 00 00 -> LControl + o
+ *   Button 2:         06 01 11 00 00 00 00 00 -> LControl + n
+ *   Button 3:         06 00 3e 00 00 00 00 00 -> F5
+ *   Button 4:         06 02 00 00 00 00 00 00 -> LShift
+ *   Button 5:         06 01 00 00 00 00 00 00 -> LControl
+ *   Button 6:         06 04 00 00 00 00 00 00 -> LAlt
+ *   Button 7:         06 01 16 00 00 00 00 00 -> LControl + s
+ *   Button 8:         06 01 1d 00 00 00 00 00 -> LControl + z
+ *   Button 9:         06 00 2c 00 00 00 00 00 -> Space
+ *   Button 10:        06 03 1d 00 00 00 00 00 -> LControl + LShift + z
+ *   Wheel:            06 01 57 00 00 00 00 00 -> clockwise rotation (LControl + Keypad Plus)
+ *   Wheel:            06 01 56 00 00 00 00 00 -> counter-clockwise rotation
+ *						  (LControl + Keypad Minus)
+ *
+ * However, multiple buttons can be pressed at the same time, and when this happens,
+ * each button gets assigned a new slot in the Input (Data,Arr,Abs):
+ *
+ *   Button 1 + 3:     06 01 12 3e 00 00 00 00 -> LControl + o + F5
+ *
+ * When a modifier is pressed (Button 4, 5, or 6), the assigned key is set to 00:
+ *
+ *   Button 5 + 7:     06 01 00 16 00 00 00 00 -> LControl + s
+ *
+ * This is mostly fine, but with Button 8 and Button 10 sharing the same
+ * key value ("z"), there are cases where we can not know which is which.
+ *
+ */
+
+#define PAD_WIRED_DESCRIPTOR_LENGTH 102
+#define PAD_DONGLE_DESCRIPTOR_LENGTH 177
+#define STYLUS_DESCRIPTOR_LENGTH 109
+#define VENDOR_DESCRIPTOR_LENGTH 36
+#define PAD_REPORT_ID 6
+#define RAW_PAD_REPORT_ID 0xf0
+#define RAW_BATTERY_REPORT_ID 0xf2
+#define VENDOR_REPORT_ID 2
+#define PAD_REPORT_LENGTH 8
+#define VENDOR_REPORT_LENGTH 12
+
+__u16 last_button_state;
+
+static const __u8 disabled_rdesc[] = {
+	// Make sure we match our original report length
+	FixedSizeVendorReport(VENDOR_REPORT_LENGTH)
+};
+
+static const __u8 fixed_rdesc_vendor[] = {
+	UsagePage_GenericDesktop
+	Usage_GD_Keypad
+	CollectionApplication(
+		// -- Byte 0 in report
+		ReportId(RAW_PAD_REPORT_ID)
+		// Byte 1 in report - same than report ID
+		ReportCount(1)
+		ReportSize(8)
+		Input(Const) // padding (internal report ID)
+		LogicalMaximum_i8(0)
+		LogicalMaximum_i8(1)
+		UsagePage_Digitizers
+		Usage_Dig_TabletFunctionKeys
+		CollectionPhysical(
+			// Byte 2-3 is the button state
+			UsagePage_Button
+			UsageMinimum_i8(0x01)
+			UsageMaximum_i8(0x0a)
+			LogicalMinimum_i8(0x0)
+			LogicalMaximum_i8(0x1)
+			ReportCount(10)
+			ReportSize(1)
+			Input(Var|Abs)
+			Usage_i8(0x31) // will be mapped as BTN_A / BTN_SOUTH
+			ReportCount(1)
+			Input(Var|Abs)
+			ReportCount(5) // padding
+			Input(Const)
+			// Byte 4 in report - just exists so we get to be a tablet pad
+			Usage_Dig_BarrelSwitch // BTN_STYLUS
+			ReportCount(1)
+			ReportSize(1)
+			Input(Var|Abs)
+			ReportCount(7) // padding
+			Input(Const)
+			// Bytes 5/6 in report - just exists so we get to be a tablet pad
+			UsagePage_GenericDesktop
+			Usage_GD_X
+			Usage_GD_Y
+			ReportCount(2)
+			ReportSize(8)
+			Input(Var|Abs)
+			// Byte 7 in report is the dial
+			Usage_GD_Wheel
+			LogicalMinimum_i8(-1)
+			LogicalMaximum_i8(1)
+			ReportCount(1)
+			ReportSize(8)
+			Input(Var|Rel)
+		)
+		// -- Byte 0 in report
+		ReportId(RAW_BATTERY_REPORT_ID)
+		// Byte 1 in report - same than report ID
+		ReportCount(1)
+		ReportSize(8)
+		Input(Const) // padding (internal report ID)
+		// Byte 2 in report - always 0x01
+		Input(Const) // padding (internal report ID)
+		UsagePage_Digitizers
+		/*
+		 * We represent the device as a stylus to force the kernel to not
+		 * directly query its battery state. Instead the kernel will rely
+		 * only on the provided events.
+		 */
+		Usage_Dig_Stylus
+		CollectionPhysical(
+			// Byte 3 in report - battery value
+			UsagePage_BatterySystem
+			Usage_BS_AbsoluteStateOfCharge
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(100)
+			ReportCount(1)
+			ReportSize(8)
+			Input(Var|Abs)
+			// Byte 4 in report - charging state
+			Usage_BS_Charging
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(1)
+			ReportCount(1)
+			ReportSize(8)
+			Input(Var|Abs)
+		)
+	)
+};
+
+SEC(HID_BPF_RDESC_FIXUP)
+int BPF_PROG(ack05_fix_rdesc, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, HID_MAX_DESCRIPTOR_SIZE /* size */);
+	__s32 rdesc_size = hctx->size;
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	if (rdesc_size == VENDOR_DESCRIPTOR_LENGTH) {
+		/*
+		 * The vendor fixed rdesc is appended after the current one,
+		 * to keep the output reports working.
+		 */
+		__builtin_memcpy(data + rdesc_size, fixed_rdesc_vendor, sizeof(fixed_rdesc_vendor));
+		return sizeof(fixed_rdesc_vendor) + rdesc_size;
+	}
+
+	hid_set_name(hctx->hid, "Disabled by HID-BPF Hanvon Ugee Shortcut Remote");
+
+	__builtin_memcpy(data, disabled_rdesc, sizeof(disabled_rdesc));
+	return sizeof(disabled_rdesc);
+}
+
+static int HID_BPF_ASYNC_FUN(switch_to_raw_mode)(struct hid_bpf_ctx *hid)
+{
+	static __u8 magic_0[32] = {0x02, 0xb0, 0x04, 0x00, 0x00};
+	int err;
+
+	/*
+	 * The proprietary driver sends the 3 following packets after the
+	 * above one.
+	 * These don't seem to have any effect, so we don't send them to save
+	 * some processing time.
+	 *
+	 * static __u8 magic_1[32] = {0x02, 0xb4, 0x01, 0x00, 0x01};
+	 * static __u8 magic_2[32] = {0x02, 0xb4, 0x01, 0x00, 0xff};
+	 * static __u8 magic_3[32] = {0x02, 0xb8, 0x04, 0x00, 0x00};
+	 */
+
+	err = hid_bpf_hw_output_report(hid, magic_0, sizeof(magic_0));
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+SEC(HID_BPF_DEVICE_EVENT)
+int BPF_PROG(ack05_fix_events, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, PAD_REPORT_LENGTH);
+	int ret = 0;
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	if (data[0] != VENDOR_REPORT_ID)
+		return 0;
+
+	/* reconnect event */
+	if (data[1] == 0xf8 && data[2] == 02 && data[3] == 0x01)
+		HID_BPF_ASYNC_DELAYED_CALL(switch_to_raw_mode, hctx, 10);
+
+	/* button event */
+	if (data[1] == RAW_PAD_REPORT_ID) {
+		data[0] = data[1];
+		if (data[7] == 0x02)
+			data[7] = 0xff;
+		ret = 8;
+	} else if (data[1] == RAW_BATTERY_REPORT_ID) {
+		data[0] = data[1];
+		ret = 5;
+	}
+
+	return ret;
+}
+
+HID_BPF_OPS(xppen_ack05_remote) = {
+	.hid_device_event = (void *)ack05_fix_events,
+	.hid_rdesc_fixup = (void *)ack05_fix_rdesc,
+};
+
+SEC("syscall")
+int probe(struct hid_bpf_probe_args *ctx)
+{
+	switch (ctx->rdesc_size) {
+	case PAD_WIRED_DESCRIPTOR_LENGTH:
+	case PAD_DONGLE_DESCRIPTOR_LENGTH:
+	case STYLUS_DESCRIPTOR_LENGTH:
+	case VENDOR_DESCRIPTOR_LENGTH:
+		ctx->retval = 0;
+		break;
+	default:
+		ctx->retval = -EINVAL;
+		break;
+	}
+
+	if (ctx->rdesc_size == VENDOR_DESCRIPTOR_LENGTH) {
+		struct hid_bpf_ctx *hctx = hid_bpf_allocate_context(ctx->hid);
+
+		if (!hctx) {
+			ctx->retval = -EINVAL;
+			return 0;
+		}
+
+		ctx->retval = HID_BPF_ASYNC_INIT(switch_to_raw_mode) ||
+			      switch_to_raw_mode(hctx);
+
+		hid_bpf_release_context(hctx);
+	}
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";

-- 
2.47.0


