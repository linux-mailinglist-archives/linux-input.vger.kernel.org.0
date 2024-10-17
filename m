Return-Path: <linux-input+bounces-7509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 895409A26EC
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 17:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD041C222FB
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 15:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD291DFD83;
	Thu, 17 Oct 2024 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8JvA/aF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540A1DF757;
	Thu, 17 Oct 2024 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179355; cv=none; b=pcWo/JkEaqPjhoGasMtJNJokyn6pV6U//zhRdwa2e4Speq3qlcURMJi/4c/gWOqBGlqOn6j7fkgXbYImbGBypipRdkh6uhm4c+oAXu03PkK7UJAoJl6EFd/YM2L6DFCNP6uWd/mcRqOrSUH0NwMEgvybf7IFeVZui7QZS0gJFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179355; c=relaxed/simple;
	bh=7ooXSZ+J0j2Q34QpXzX7m72jWCrWTcg7SAokkSZtu/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tm7VOikf/MVUyI8MbZemrGxFcfg1Qe1wrssSGXWeRhPr0iZlNsCT5qmXkqwTpiQjysBmPS6rSyIMcv69qNPDZpnqc7aZ+qPbKuE21wh7RBxc4pGapS2W9YQlKLcdk9dmbj7RaB+e93zNHvkZcIQL9+Z6Pss3BJjLNpF6lLuXetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8JvA/aF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB706C4CED3;
	Thu, 17 Oct 2024 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179354;
	bh=7ooXSZ+J0j2Q34QpXzX7m72jWCrWTcg7SAokkSZtu/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R8JvA/aFzKmx9JXCP7ewNJD1K4QHMf3Rno7N5US9kM4SToUuSId8g79Sqt9sU5p3o
	 4RusRyH+I1mtnX7oINdSc6PrJ/lZ8cHuE/A8JxI5UmkVWpNHpJMQIT7/vAge4J5qin
	 lIkA63HMqID1COszMaMrGrsP3D08Z+1200YD6udv7+N6wNKzHuTXHFi9m4G0wCvbRQ
	 earl5Fzca3105sacY47R1HG+Hae7URn2q+Pjehh7pfIvmgvjeQhqarbbQtoFb67EH7
	 KBNZ8RX7qoZfGrg544+pSNWLqrxHWm2pWfQbjp0QdDPYo323D47k8A+owriszuyNux
	 eEvY0S4fHGobg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 17 Oct 2024 17:35:41 +0200
Subject: [PATCH 2/2] HID: bpf: Fix Rapoo M50 Plus Silent side buttons
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241017-import_bpf_6-13-v1-2-197d882ade37@kernel.org>
References: <20241017-import_bpf_6-13-v1-0-197d882ade37@kernel.org>
In-Reply-To: <20241017-import_bpf_6-13-v1-0-197d882ade37@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729179350; l=8349;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=7ooXSZ+J0j2Q34QpXzX7m72jWCrWTcg7SAokkSZtu/o=;
 b=9c1gYGgwj+sYeq22Ih4D2Q8hDlGy5SHoCuIg/SSPZxKghzf64+PTOqIdokXQiiB03vLL+5Pbg
 z8sgRKmY96RCLBMY7SIZbWIzsJwBBFtbFvmy+piUcI9p3qjCW1BQvuq
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The Rapoo M50 Plus Silent mouse has 2 side buttons in addition to the
left, right and middles buttons. However, its original HID descriptor
has a Usage Maximum of 3, preventing the side buttons to work.

This HID-BPF driver changes that usage to 5.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1015
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/116
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c | 148 +++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c b/drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c
new file mode 100644
index 0000000000000000000000000000000000000000..6b379e45f531dbe843fe59fd98cc12d3fd3c8cc8
--- /dev/null
+++ b/drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024 José Expósito
+ */
+
+#include "vmlinux.h"
+#include "hid_bpf.h"
+#include "hid_bpf_helpers.h"
+#include <bpf/bpf_tracing.h>
+
+#define VID_RAPOO	0x24AE
+#define PID_M50		0x2015
+#define RDESC_SIZE	186
+
+HID_BPF_CONFIG(
+	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, VID_RAPOO, PID_M50)
+);
+
+/*
+ * The Rapoo M50 Plus Silent mouse has 2 side buttons in addition to the left,
+ * right and middle buttons. However, its original HID descriptor has a Usage
+ * Maximum of 3, preventing the side buttons to work. This HID-BPF driver
+ * changes that usage to 5.
+ *
+ * For reference, this is the original report descriptor:
+ *
+ * 0x05, 0x01,       // Usage Page (Generic Desktop)        0
+ * 0x09, 0x02,       // Usage (Mouse)                       2
+ * 0xa1, 0x01,       // Collection (Application)            4
+ * 0x85, 0x01,       //  Report ID (1)                      6
+ * 0x09, 0x01,       //  Usage (Pointer)                    8
+ * 0xa1, 0x00,       //  Collection (Physical)              10
+ * 0x05, 0x09,       //   Usage Page (Button)               12
+ * 0x19, 0x01,       //   Usage Minimum (1)                 14
+ * 0x29, 0x03,       //   Usage Maximum (3)                 16 <- change to 0x05
+ * 0x15, 0x00,       //   Logical Minimum (0)               18
+ * 0x25, 0x01,       //   Logical Maximum (1)               20
+ * 0x75, 0x01,       //   Report Size (1)                   22
+ * 0x95, 0x05,       //   Report Count (5)                  24
+ * 0x81, 0x02,       //   Input (Data,Var,Abs)              26
+ * 0x75, 0x03,       //   Report Size (3)                   28
+ * 0x95, 0x01,       //   Report Count (1)                  30
+ * 0x81, 0x01,       //   Input (Cnst,Arr,Abs)              32
+ * 0x05, 0x01,       //   Usage Page (Generic Desktop)      34
+ * 0x09, 0x30,       //   Usage (X)                         36
+ * 0x09, 0x31,       //   Usage (Y)                         38
+ * 0x16, 0x01, 0x80, //   Logical Minimum (-32767)          40
+ * 0x26, 0xff, 0x7f, //   Logical Maximum (32767)           43
+ * 0x75, 0x10,       //   Report Size (16)                  46
+ * 0x95, 0x02,       //   Report Count (2)                  48
+ * 0x81, 0x06,       //   Input (Data,Var,Rel)              50
+ * 0x09, 0x38,       //   Usage (Wheel)                     52
+ * 0x15, 0x81,       //   Logical Minimum (-127)            54
+ * 0x25, 0x7f,       //   Logical Maximum (127)             56
+ * 0x75, 0x08,       //   Report Size (8)                   58
+ * 0x95, 0x01,       //   Report Count (1)                  60
+ * 0x81, 0x06,       //   Input (Data,Var,Rel)              62
+ * 0xc0,             //  End Collection                     64
+ * 0xc0,             // End Collection                      65
+ * 0x05, 0x0c,       // Usage Page (Consumer Devices)       66
+ * 0x09, 0x01,       // Usage (Consumer Control)            68
+ * 0xa1, 0x01,       // Collection (Application)            70
+ * 0x85, 0x02,       //  Report ID (2)                      72
+ * 0x75, 0x10,       //  Report Size (16)                   74
+ * 0x95, 0x01,       //  Report Count (1)                   76
+ * 0x15, 0x01,       //  Logical Minimum (1)                78
+ * 0x26, 0x8c, 0x02, //  Logical Maximum (652)              80
+ * 0x19, 0x01,       //  Usage Minimum (1)                  83
+ * 0x2a, 0x8c, 0x02, //  Usage Maximum (652)                85
+ * 0x81, 0x00,       //  Input (Data,Arr,Abs)               88
+ * 0xc0,             // End Collection                      90
+ * 0x05, 0x01,       // Usage Page (Generic Desktop)        91
+ * 0x09, 0x80,       // Usage (System Control)              93
+ * 0xa1, 0x01,       // Collection (Application)            95
+ * 0x85, 0x03,       //  Report ID (3)                      97
+ * 0x09, 0x82,       //  Usage (System Sleep)               99
+ * 0x09, 0x81,       //  Usage (System Power Down)          101
+ * 0x09, 0x83,       //  Usage (System Wake Up)             103
+ * 0x15, 0x00,       //  Logical Minimum (0)                105
+ * 0x25, 0x01,       //  Logical Maximum (1)                107
+ * 0x19, 0x01,       //  Usage Minimum (1)                  109
+ * 0x29, 0x03,       //  Usage Maximum (3)                  111
+ * 0x75, 0x01,       //  Report Size (1)                    113
+ * 0x95, 0x03,       //  Report Count (3)                   115
+ * 0x81, 0x02,       //  Input (Data,Var,Abs)               117
+ * 0x95, 0x05,       //  Report Count (5)                   119
+ * 0x81, 0x01,       //  Input (Cnst,Arr,Abs)               121
+ * 0xc0,             // End Collection                      123
+ * 0x05, 0x01,       // Usage Page (Generic Desktop)        124
+ * 0x09, 0x00,       // Usage (Undefined)                   126
+ * 0xa1, 0x01,       // Collection (Application)            128
+ * 0x85, 0x05,       //  Report ID (5)                      130
+ * 0x06, 0x00, 0xff, //  Usage Page (Vendor Defined Page 1) 132
+ * 0x09, 0x01,       //  Usage (Vendor Usage 1)             135
+ * 0x15, 0x81,       //  Logical Minimum (-127)             137
+ * 0x25, 0x7f,       //  Logical Maximum (127)              139
+ * 0x75, 0x08,       //  Report Size (8)                    141
+ * 0x95, 0x07,       //  Report Count (7)                   143
+ * 0xb1, 0x02,       //  Feature (Data,Var,Abs)             145
+ * 0xc0,             // End Collection                      147
+ * 0x06, 0x00, 0xff, // Usage Page (Vendor Defined Page 1)  148
+ * 0x09, 0x0e,       // Usage (Vendor Usage 0x0e)           151
+ * 0xa1, 0x01,       // Collection (Application)            153
+ * 0x85, 0xba,       //  Report ID (186)                    155
+ * 0x95, 0x1f,       //  Report Count (31)                  157
+ * 0x75, 0x08,       //  Report Size (8)                    159
+ * 0x26, 0xff, 0x00, //  Logical Maximum (255)              161
+ * 0x15, 0x00,       //  Logical Minimum (0)                164
+ * 0x09, 0x01,       //  Usage (Vendor Usage 1)             166
+ * 0x91, 0x02,       //  Output (Data,Var,Abs)              168
+ * 0x85, 0xba,       //  Report ID (186)                    170
+ * 0x95, 0x1f,       //  Report Count (31)                  172
+ * 0x75, 0x08,       //  Report Size (8)                    174
+ * 0x26, 0xff, 0x00, //  Logical Maximum (255)              176
+ * 0x15, 0x00,       //  Logical Minimum (0)                179
+ * 0x09, 0x01,       //  Usage (Vendor Usage 1)             181
+ * 0x81, 0x02,       //  Input (Data,Var,Abs)               183
+ * 0xc0,             // End Collection                      185
+ */
+
+SEC(HID_BPF_RDESC_FIXUP)
+int BPF_PROG(hid_rdesc_fixup_rapoo_m50, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0, HID_MAX_DESCRIPTOR_SIZE);
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	if (data[17] == 0x03)
+		data[17] = 0x05;
+
+	return 0;
+}
+
+HID_BPF_OPS(rapoo_m50) = {
+	.hid_rdesc_fixup = (void *)hid_rdesc_fixup_rapoo_m50,
+};
+
+SEC("syscall")
+int probe(struct hid_bpf_probe_args *ctx)
+{
+	ctx->retval = ctx->rdesc_size != RDESC_SIZE;
+	if (ctx->retval)
+		ctx->retval = -EINVAL;
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";

-- 
2.47.0


