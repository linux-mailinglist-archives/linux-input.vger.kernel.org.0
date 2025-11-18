Return-Path: <linux-input+bounces-16188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A05C6AF54
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 469E34F946B
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F8B369215;
	Tue, 18 Nov 2025 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICXyGa/o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE2369210;
	Tue, 18 Nov 2025 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486210; cv=none; b=JWWJ+kgllEg6tUkEc1maFA8cNq2SYXybXh1pfS4srT2vZvxFQHMi74gnKkurBkjMp6ZeExUvo9A80ygRmCxH0jUShhyeUFDPr5lGxh47M7EmtKrQECH3vbA9SG3BMTqhPmWGI+cxjB8yxjekFDDt1xKVx5nmYaXFz7PxlmzzK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486210; c=relaxed/simple;
	bh=lo1Qd7kH11xyLAQbymgjV8k5Aew4Vg0gLPSH35Zi2ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJpBkiM7xkrXI5OmpqfcWCU3h7G3xkdzXHs5CIWu9iLQLdGFWgiHqgE6BkL3iFrlH0RVADEbJ+9yrgOAWlZpLUFAhgMQgx+dbEeHT0bYbMeYkig+1ld6u+tK3FEdH6olS72mrN9apbWhBnpL1GkaO5KwMmhm05dYPAalpq2juoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICXyGa/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFF0C2BCB8;
	Tue, 18 Nov 2025 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486210;
	bh=lo1Qd7kH11xyLAQbymgjV8k5Aew4Vg0gLPSH35Zi2ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ICXyGa/oAEUQ/FA26g0qiopmGOU0yBWN2XPn4XFhw2wXQgKZPzcBy9Yfj2V7K2X/j
	 rNe14FUDbb/q2P26XMgI8GPKIHfEniAEJpkUimvk0ZHS4YdKnxuUa3OhKLjfJtJQRU
	 x75CAOVu7e6top++s89MKomC7REGI/VizOh7qz2OhFYcFr9hwUBfYYmcRErB+WEevv
	 Q2ty2TI9gjIr73pLlT2NzduduG9PDzppKjkg6jzJE3vnsVfvVMxKPT+Rc66CkAyw8e
	 bzHh10k2Tklm9vsZkBNHp98GLB2npUbe8tjxKJjXIWxHHlyT7xx04WJSq52YPLJzb5
	 rwXY5pwAwc7YQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Tue, 18 Nov 2025 18:16:26 +0100
Subject: [PATCH 05/10] HID: bpf: Add support for the Waltop Batteryless
 Tablet
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-5-0f8105c54835@kernel.org>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>, 
 Jan Felix Langenbach <JanFelix.Langenbach@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486192; l=15751;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=lo1Qd7kH11xyLAQbymgjV8k5Aew4Vg0gLPSH35Zi2ss=;
 b=FyLZVMj8Ipk8feH14Bx0qslREd8P6nEnHEquXbsaha/yxUwH+guoT7bzTQ02IcewkW7DfBwtY
 d/j1Z+hWRlnD0po0gU8G0q8M2D9uqLQ9SIZx6kVnS0MgHw6j1jmLkgq
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Several bugs as outlined in udev-hid-bpf#66 and udev-hid-bpf!198:
- pressure curve is far from linear
- tilt range is ±60, not ±127
- pressing the second button sets both tip down and
  barrel switch

Fix the second button by adding a Secondary Barrel Switch in the
existing padding and check for the tip down/barrel switch down combo.
When  both values become true at the same time, set the Secondary Barrel
Switch instead.

Implement a custom pressure curve that maps the hardware range 0-102
linearly to the logical range 0-1224, and maps the hardware range
103-2047 logarithmically to the logical range 1232-2047. This mapping
isn’t perfect, but it’s way more natural than the stock configuration.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Signed-off-by: Jan Felix Langenbach <JanFelix.Langenbach@protonmail.com>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/200
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 .../hid/bpf/progs/WALTOP__Batteryless-Tablet.bpf.c | 321 +++++++++++++++++++++
 1 file changed, 321 insertions(+)

diff --git a/drivers/hid/bpf/progs/WALTOP__Batteryless-Tablet.bpf.c b/drivers/hid/bpf/progs/WALTOP__Batteryless-Tablet.bpf.c
new file mode 100644
index 0000000000000000000000000000000000000000..156d75af516d7d0d49d0f5ee1ff5d3ebb720c7d9
--- /dev/null
+++ b/drivers/hid/bpf/progs/WALTOP__Batteryless-Tablet.bpf.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Red Hat
+ */
+
+#include "vmlinux.h"
+#include "hid_bpf.h"
+#include "hid_bpf_helpers.h"
+#include <bpf/bpf_tracing.h>
+
+#define VID_WALTOP 0x172F
+#define PID_BATTERYLESS_TABLET 0x0505
+
+HID_BPF_CONFIG(
+	HID_DEVICE(BUS_USB, HID_GROUP_ANY, VID_WALTOP, PID_BATTERYLESS_TABLET)
+);
+
+#define EXPECTED_RDESC_SIZE 335
+#define PEN_REPORT_ID 16
+
+#define TIP_SWITCH BIT(0)
+#define BARREL_SWITCH BIT(1)
+#define SECONDARY_BARREL_SWITCH BIT(5)
+
+static __u8 last_button_state;
+
+static const __u8 fixed_rdesc[] = {
+	0x05, 0x01,                    // Usage Page (Generic Desktop)
+	0x09, 0x02,                    // Usage (Mouse)
+	0xa1, 0x01,                    // Collection (Application)
+	0x85, 0x01,                    //   Report ID (1)
+	0x09, 0x01,                    //   Usage (Pointer)
+	0xa1, 0x00,                    //   Collection (Physical)
+	0x05, 0x09,                    //     Usage Page (Button)
+	0x19, 0x01,                    //     Usage Minimum (1)
+	0x29, 0x05,                    //     Usage Maximum (5)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x25, 0x01,                    //     Logical Maximum (1)
+	0x75, 0x01,                    //     Report Size (1)
+	0x95, 0x05,                    //     Report Count (5)
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0x75, 0x03,                    //     Report Size (3)
+	0x95, 0x01,                    //     Report Count (1)
+	0x81, 0x03,                    //     Input (Cnst,Var,Abs)
+	0x05, 0x01,                    //     Usage Page (Generic Desktop)
+	0x09, 0x30,                    //     Usage (X)
+	0x09, 0x31,                    //     Usage (Y)
+	0x09, 0x38,                    //     Usage (Wheel)
+	0x15, 0x81,                    //     Logical Minimum (-127)
+	0x25, 0x7f,                    //     Logical Maximum (127)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x03,                    //     Report Count (3)
+	0x81, 0x06,                    //     Input (Data,Var,Rel)
+	0x05, 0x0c,                    //     Usage Page (Consumer)
+	0x15, 0x81,                    //     Logical Minimum (-127)
+	0x25, 0x7f,                    //     Logical Maximum (127)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x01,                    //     Report Count (1)
+	0x0a, 0x38, 0x02,              //     Usage (AC Pan)
+	0x81, 0x06,                    //     Input (Data,Var,Rel)
+	0xc0,                          //   End Collection
+	0xc0,                          // End Collection
+	0x05, 0x0d,                    // Usage Page (Digitizers)
+	0x09, 0x02,                    // Usage (Pen)
+	0xa1, 0x01,                    // Collection (Application)
+	0x85, 0x02,                    //   Report ID (2)
+	0x09, 0x20,                    //   Usage (Stylus)
+	0xa1, 0x00,                    //   Collection (Physical)
+	0x09, 0x00,                    //     Usage (0x0000)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x26, 0xff, 0x00,              //     Logical Maximum (255)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x09,                    //     Report Count (9)
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0x09, 0x3f,                    //     Usage (Azimuth)
+	0x09, 0x40,                    //     Usage (Altitude)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x26, 0xff, 0x00,              //     Logical Maximum (255)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x02,                    //     Report Count (2)
+	0xb1, 0x02,                    //     Feature (Data,Var,Abs)
+	0xc0,                          //   End Collection
+	0x85, 0x05,                    //   Report ID (5)
+	0x05, 0x0d,                    //   Usage Page (Digitizers)
+	0x09, 0x20,                    //   Usage (Stylus)
+	0xa1, 0x00,                    //   Collection (Physical)
+	0x09, 0x00,                    //     Usage (0x0000)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x26, 0xff, 0x00,              //     Logical Maximum (255)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x07,                    //     Report Count (7)
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0xc0,                          //   End Collection
+	0x85, 0x0a,                    //   Report ID (10)
+	0x05, 0x0d,                    //   Usage Page (Digitizers)
+	0x09, 0x20,                    //   Usage (Stylus)
+	0xa1, 0x00,                    //   Collection (Physical)
+	0x09, 0x00,                    //     Usage (0x0000)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x26, 0xff, 0x00,              //     Logical Maximum (255)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x07,                    //     Report Count (7)
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0xc0,                          //   End Collection
+	0x85, 0x10,                    //   Report ID (16)
+	0x09, 0x20,                    //   Usage (Stylus)
+	0xa1, 0x00,                    //   Collection (Physical)
+	0x09, 0x42,                    //     Usage (Tip Switch)
+	0x09, 0x44,                    //     Usage (Barrel Switch)
+	0x09, 0x3c,                    //     Usage (Invert)
+	0x09, 0x45,                    //     Usage (Eraser)
+	0x09, 0x32,                    //     Usage (In Range)
+	0x09, 0x5a,                    //     Usage (Secondary Barrel Switch)  <-- added
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x25, 0x01,                    //     Logical Maximum (1)
+	0x75, 0x01,                    //     Report Size (1)
+	0x95, 0x06,                    //     Report Count (6)                 <--- changed from 5
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0x95, 0x02,                    //     Report Count (2)                 <--- changed from 3
+	0x81, 0x03,                    //     Input (Cnst,Var,Abs)
+	0x05, 0x01,                    //     Usage Page (Generic Desktop)
+	0x09, 0x30,                    //     Usage (X)
+	0x75, 0x10,                    //     Report Size (16)
+	0x95, 0x01,                    //     Report Count (1)
+	0xa4,                          //     Push
+	0x55, 0x0d,                    //       Unit Exponent (-3)
+	0x65, 0x33,                    //       Unit (EnglishLinear: in³)
+	0x15, 0x00,                    //       Logical Minimum (0)
+	0x26, 0x00, 0x7d,              //       Logical Maximum (32000)
+	0x35, 0x00,                    //       Physical Minimum (0)
+	0x46, 0x00, 0x7d,              //       Physical Maximum (32000)
+	0x81, 0x02,                    //       Input (Data,Var,Abs)
+	0x09, 0x31,                    //       Usage (Y)
+	0x15, 0x00,                    //       Logical Minimum (0)
+	0x26, 0x20, 0x4e,              //       Logical Maximum (20000)
+	0x35, 0x00,                    //       Physical Minimum (0)
+	0x46, 0x20, 0x4e,              //       Physical Maximum (20000)
+	0x81, 0x02,                    //       Input (Data,Var,Abs)
+	0x05, 0x0d,                    //       Usage Page (Digitizers)
+	0x09, 0x30,                    //       Usage (Tip Pressure)
+	0x15, 0x00,                    //       Logical Minimum (0)
+	0x26, 0xff, 0x07,              //       Logical Maximum (2047)
+	0x35, 0x00,                    //       Physical Minimum (0)
+	0x46, 0xff, 0x07,              //       Physical Maximum (2047)
+	0x81, 0x02,                    //       Input (Data,Var,Abs)
+	0x05, 0x0d,                    //       Usage Page (Digitizers)
+	0x09, 0x3d,                    //       Usage (X Tilt)
+	0x09, 0x3e,                    //       Usage (Y Tilt)
+	0x15, 0xc4,                    //       Logical Minimum (-60)          <- changed from -127
+	0x25, 0x3c,                    //       Logical Maximum (60)           <- changed from 127
+	0x75, 0x08,                    //       Report Size (8)
+	0x95, 0x02,                    //       Report Count (2)
+	0x81, 0x02,                    //       Input (Data,Var,Abs)
+	0xc0,                          //     End Collection
+	0xc0,                          //   End Collection
+	0x05, 0x01,                    //   Usage Page (Generic Desktop)
+	0x09, 0x06,                    //   Usage (Keyboard)
+	0xa1, 0x01,                    //   Collection (Application)
+	0x85, 0x0d,                    //     Report ID (13)
+	0x05, 0x07,                    //     Usage Page (Keyboard/Keypad)
+	0x19, 0xe0,                    //     Usage Minimum (224)
+	0x29, 0xe7,                    //     Usage Maximum (231)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x25, 0x01,                    //     Logical Maximum (1)
+	0x75, 0x01,                    //     Report Size (1)
+	0x95, 0x08,                    //     Report Count (8)
+	0x81, 0x02,                    //     Input (Data,Var,Abs)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x01,                    //     Report Count (1)
+	0x81, 0x01,                    //     Input (Cnst,Arr,Abs)
+	0x05, 0x07,                    //     Usage Page (Keyboard/Keypad)
+	0x19, 0x00,                    //     Usage Minimum (0)
+	0x29, 0x65,                    //     Usage Maximum (101)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x25, 0x65,                    //     Logical Maximum (101)
+	0x75, 0x08,                    //     Report Size (8)
+	0x95, 0x05,                    //     Report Count (5)
+	0x81, 0x00,                    //     Input (Data,Arr,Abs)
+	0xc0,                          //   End Collection
+	0x05, 0x0c,                    //   Usage Page (Consumer)
+	0x09, 0x01,                    //   Usage (Consumer Control)
+	0xa1, 0x01,                    //   Collection (Application)
+	0x85, 0x0c,                    //     Report ID (12)
+	0x09, 0xe9,                    //     Usage (Volume Increment)
+	0x09, 0xea,                    //     Usage (Volume Decrement)
+	0x09, 0xe2,                    //     Usage (Mute)
+	0x15, 0x00,                    //     Logical Minimum (0)
+	0x25, 0x01,                    //     Logical Maximum (1)
+	0x75, 0x01,                    //     Report Size (1)
+	0x95, 0x03,                    //     Report Count (3)
+	0x81, 0x06,                    //     Input (Data,Var,Rel)
+	0x75, 0x05,                    //     Report Size (5)
+	0x95, 0x01,                    //     Report Count (1)
+	0x81, 0x07,                    //     Input (Cnst,Var,Rel)
+	0xc0,                          //   End Collection
+};
+
+static inline unsigned int bitwidth32(__u32 x)
+{
+	return 32 - __builtin_clzg(x, 32);
+}
+
+static inline unsigned int floor_log2_32(__u32 x)
+{
+	return bitwidth32(x) - 1;
+}
+
+/* Maps the interval [0, 2047] to itself using a scaled
+ * approximation of the function log2(x+1).
+ */
+static unsigned int scaled_log2(__u16 v)
+{
+	const unsigned int XMAX = 2047;
+	const unsigned int YMAX = 11; /* log2(2048) = 11 */
+
+	unsigned int x = v + 1;
+	unsigned int n = floor_log2_32(x);
+	unsigned int b = 1 << n;
+
+	/* Fixed-point fraction in [0, 1), linearly
+	 * interpolated using delta-y = 1 and
+	 * delta-x = (2b - b) = b.
+	 */
+	unsigned int frac = (x - b) << YMAX;
+	unsigned int lerp = frac / b;
+	unsigned int log2 = (n << YMAX) + lerp;
+
+	return ((log2 * XMAX) / YMAX) >> YMAX;
+}
+
+SEC(HID_BPF_RDESC_FIXUP)
+int BPF_PROG(hid_fix_rdesc, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	__builtin_memcpy(data, fixed_rdesc, sizeof(fixed_rdesc));
+
+	return sizeof(fixed_rdesc);
+}
+
+SEC(HID_BPF_DEVICE_EVENT)
+int BPF_PROG(waltop_fix_events, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 10 /* size */);
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	__u8 report_id = data[0];
+
+	if (report_id != PEN_REPORT_ID)
+		return 0;
+
+	/* On this tablet if the secondary barrel switch is pressed,
+	 * the tablet sends tip down and barrel down. Change this to
+	 * just secondary barrel down when there is no ambiguity.
+	 *
+	 * It's possible that there is a bug in the firmware and the
+	 * device intends to set invert + eraser instead (i.e. the
+	 * pysical button is an eraser button) but since
+	 * the pressure is always zero, said eraser button
+	 * would be useless anyway.
+	 *
+	 * So let's just change the button to secondary barrel down.
+	 */
+
+	__u8 tip_switch = data[1] & TIP_SWITCH;
+	__u8 barrel_switch = data[1] & BARREL_SWITCH;
+
+	__u8 tip_held = last_button_state & TIP_SWITCH;
+	__u8 barrel_held = last_button_state & BARREL_SWITCH;
+
+	if (tip_switch && barrel_switch && !tip_held && !barrel_held) {
+		data[1] &= ~(TIP_SWITCH | BARREL_SWITCH); /* release tip and barrel */
+		data[1] |= SECONDARY_BARREL_SWITCH; /* set secondary barrel switch */
+	}
+
+	last_button_state = data[1];
+
+	/* The pressure sensor on this tablet maps around half of the
+	 * logical pressure range into the interval [0-100]. Further
+	 * pressure causes the sensor value to increase exponentially
+	 * up to a maximum value of 2047.
+	 *
+	 * The values 12 and 102 were chosen to have an integer slope
+	 * with smooth transition between the two curves around the
+	 * value 100.
+	 */
+
+	__u16 pressure = (((__u16)data[6]) << 0) | (((__u16)data[7]) << 8);
+
+	if (pressure <= 102)
+		pressure *= 12;
+	else
+		pressure = scaled_log2(pressure);
+
+	data[6] = pressure >> 0;
+	data[7] = pressure >> 8;
+
+	return 0;
+}
+
+HID_BPF_OPS(waltop_batteryless) = {
+	.hid_device_event = (void *)waltop_fix_events,
+	.hid_rdesc_fixup = (void *)hid_fix_rdesc,
+};
+
+SEC("syscall")
+int probe(struct hid_bpf_probe_args *ctx)
+{
+	if (ctx->rdesc_size == EXPECTED_RDESC_SIZE)
+		ctx->retval = 0;
+	else
+		ctx->retval = -EINVAL;
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";

-- 
2.51.1


