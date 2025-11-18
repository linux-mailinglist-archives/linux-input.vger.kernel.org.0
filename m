Return-Path: <linux-input+bounces-16187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DAC6AF3F
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 923784E8AFF
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ED7366DD9;
	Tue, 18 Nov 2025 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsvgAQeo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F75366DA8;
	Tue, 18 Nov 2025 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486209; cv=none; b=b/lFBkYmoxEcnqTzdwKYKCvbZdTvH27s2YT85Pq4pBlmVz94aG0XxVcD7sEIsOQFF/URtD8tPwpYYdyxUA1U8izgEiL4nXA7U9jfeCe3+CLBeCo5qB2NgTytw7IbsQ+K/qrUUEA82IA00N1qYctKe/V6R9D1lxhQhHt7w9YwsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486209; c=relaxed/simple;
	bh=ZpPaF4qbwEKUKvpZAen5k1CfPWViDBBKeH5nCFrmMVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KL+Xve0xXBu91Fw+djekTWRYelc4mdiTJingZmjpwh11t+yEmubJn5XvsqMZrD6/+y1rRKkXhyBCepGGkRoNAUCyO80REC4pp29CkSprpUwMywJBNQIfeYhwCWd5Kc36ou2wx9yvI9DFHunh6Al+6A44MpghwrxmS1ibEKP7zwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsvgAQeo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE6C2BCFD;
	Tue, 18 Nov 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486206;
	bh=ZpPaF4qbwEKUKvpZAen5k1CfPWViDBBKeH5nCFrmMVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TsvgAQeonhRi2/N4zp6zlZr/HA0cw8NSloi99Lr5gs+iTV3S4l9Rta5Kavj7sfdjV
	 mikGHbHJWVyUxW4uOJoyIQVcoc/kU82ycqzUQ8E4wOn7j58z5ix03UtTYRn5LVM1qp
	 e6eRpVM8bpfSerK0kiBVYdO3d78IVXaO3upHtlLC0uVx3yyBdSWizlV7DK/mbpSXIF
	 wj9XyRCFkpVEjzWhXM5pPy6LrTEuSR5Xl5bDDyViaKgi835+S9AwplSSmsTTjae/OB
	 h9Df2h9VMcW6IoGi7eI8tl2VATg9eCNMQCbMgWyGkBUwo/U85mCO+fsgwKs5XEyJup
	 DJUCH3DwNmRHw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Tue, 18 Nov 2025 18:16:25 +0100
Subject: [PATCH 04/10] HID: bpf: Add fixup for Logitech SpaceNavigator
 variants
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-4-0f8105c54835@kernel.org>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Curran Muhlberger <curran@cs.cornell.edu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486192; l=3908;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=ZpPaF4qbwEKUKvpZAen5k1CfPWViDBBKeH5nCFrmMVY=;
 b=0dToVlc/BJ804HWaj8Wpjiye6ov+Q8DLtSG7fZG6wvv0Yb4TkklpEDogxAQgovC1Szi+OEV8g
 1H7funUtF0UCmojEMqF64D2n4ldEoENJVfVyF78ZMdFDVbbNGl/93tk
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The 3Dconnexion SpaceNavigator HID report descriptor declares its axis
data to be "relative" when it is actually "absolute".  This quirk was
addressed in the kernel in 2.6.33, but some SpaceNavigator variants have
a slightly different report descriptor whose axis input items are at
different offsets than those assumed by the kernel fixup.

Add a BPF fixup to handle both sets of offsets for known SpaceNavigator
variants if the descriptor has not already been fixed by the kernel.

Signed-off-by: Curran Muhlberger <curran@cs.cornell.edu>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/181
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 .../hid/bpf/progs/Logitech__SpaceNavigator.bpf.c   | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/hid/bpf/progs/Logitech__SpaceNavigator.bpf.c b/drivers/hid/bpf/progs/Logitech__SpaceNavigator.bpf.c
new file mode 100644
index 0000000000000000000000000000000000000000..b17719d6d9c71e7b538d75c7a7197b4e1fead213
--- /dev/null
+++ b/drivers/hid/bpf/progs/Logitech__SpaceNavigator.bpf.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2025 Curran Muhlberger
+ */
+
+#include "vmlinux.h"
+#include "hid_bpf.h"
+#include "hid_bpf_helpers.h"
+#include <bpf/bpf_tracing.h>
+
+#define VID_LOGITECH 0x046D
+#define PID_SPACENAVIGATOR 0xC626
+
+HID_BPF_CONFIG(
+	HID_DEVICE(BUS_USB, HID_GROUP_ANY, VID_LOGITECH, PID_SPACENAVIGATOR)
+);
+
+/*
+ * The 3Dconnexion SpaceNavigator 3D Mouse is a multi-axis controller with 6
+ * axes (grouped as X,Y,Z and Rx,Ry,Rz).  Axis data is absolute, but the report
+ * descriptor erroneously declares it to be relative.  We fix the report
+ * descriptor to mark both axis collections as absolute.
+ *
+ * The kernel attempted to fix this in commit 24985cf68612 (HID: support
+ * Logitech/3DConnexion SpaceTraveler and SpaceNavigator), but the descriptor
+ * data offsets are incorrect for at least some SpaceNavigator units.
+ */
+
+SEC(HID_BPF_RDESC_FIXUP)
+int BPF_PROG(hid_fix_rdesc, struct hid_bpf_ctx *hctx)
+{
+	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);
+
+	if (!data)
+		return 0; /* EPERM check */
+
+	/* Offset of Input item in X,Y,Z and Rx,Ry,Rz collections for all known
+	 * firmware variants.
+	 * - 2009 model: X,Y,Z @ 32-33, Rx,Ry,Rz @ 49-50 (fixup originally
+	 *   applied in kernel)
+	 * - 2016 model (size==228): X,Y,Z @ 36-37, Rx,Ry,Rz @ 53-54
+	 *
+	 * The descriptor size of the 2009 model is not known, and there is evidence
+	 * for at least two other variants (with sizes 202 & 217) besides the 2016
+	 * model, so we try all known offsets regardless of descriptor size.
+	 */
+	const u8 offsets[] = {32, 36, 49, 53};
+
+	for (size_t idx = 0; idx < ARRAY_SIZE(offsets); idx++) {
+		u8 offset = offsets[idx];
+
+		/* if Input (Data,Var,Rel) , make it Input (Data,Var,Abs) */
+		if (data[offset] == 0x81 && data[offset + 1] == 0x06)
+			data[offset + 1] = 0x02;
+	}
+
+	return 0;
+}
+
+HID_BPF_OPS(logitech_spacenavigator) = {
+	.hid_rdesc_fixup = (void *)hid_fix_rdesc,
+};
+
+SEC("syscall")
+int probe(struct hid_bpf_probe_args *ctx)
+{
+	/* Ensure report descriptor size matches one of the known variants. */
+	if (ctx->rdesc_size != 202 &&
+	    ctx->rdesc_size != 217 &&
+	    ctx->rdesc_size != 228) {
+		ctx->retval = -EINVAL;
+		return 0;
+	}
+
+	/* Check whether the kernel has already applied the fix. */
+	if ((ctx->rdesc[32] == 0x81 && ctx->rdesc[33] == 0x02 &&
+	     ctx->rdesc[49] == 0x81 && ctx->rdesc[50] == 0x02) ||
+	    (ctx->rdesc[36] == 0x81 && ctx->rdesc[37] == 0x02 &&
+	     ctx->rdesc[53] == 0x81 && ctx->rdesc[54] == 0x02))
+		ctx->retval = -EINVAL;
+	else
+		ctx->retval = 0;
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";

-- 
2.51.1


