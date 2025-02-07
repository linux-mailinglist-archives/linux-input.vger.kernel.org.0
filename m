Return-Path: <linux-input+bounces-9845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9991A2C42B
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C5F3169D51
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01121F868F;
	Fri,  7 Feb 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZFrdarb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D41F4169;
	Fri,  7 Feb 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936588; cv=none; b=dGoJ877Eq8sWOkY84HIwbtR/QDMEGg+1ky6/LLE0sgoTxZkmZbDjlUDb/gFkIxn6o5J6ujmg5R7vhXSlZaf6i9MiTlM5YVaSWOe2TH2/YBjtdAM3I+pxnzoCZXTarxoS7vyL37cld3V6J2n5d2hrza9jQvAnk/M1KrChDvUxJnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936588; c=relaxed/simple;
	bh=hhGOUjq9gKw2uCegb4idyIFAtU1Ni0yyB2zWQs1v3Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlNWDR8UJ2RqO1S7B83Ujf6VglJzmjtMcwDS334WXmD1Q51XWdOqV49lsxBiE3A/ND5tZHs1hfgT0ZfVf1WPlhftufVLF1OgDVzw7M637mOcSdq09YwwItxfHTOJJ39M78beTg++lcdbnTVI7HZlmsLegdkbpNAirbaNDrjRfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZFrdarb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FA3C4CEE2;
	Fri,  7 Feb 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936588;
	bh=hhGOUjq9gKw2uCegb4idyIFAtU1Ni0yyB2zWQs1v3Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RZFrdarbyvO0L9rMvxiwyPGS4v+n/lJS8ykZgaw/awxFrYuaovegCHROQjWJ8kJ1e
	 36msLfD5w3cnsUFTPylSLQJlcdIRdP2aZj9fn4N8/WP5No2CQKPSGvTG3bgym40E+x
	 vtv49bYimXArE8YOO2vHjC08x78rD3yt85aNLPt2wRS3PmvPuKPNryo/zO0Vs8149t
	 0Rh6Gif1s/W9t8i3HdiFP3TWl74ZfUhluYDwSQDTGqQCwTh+vCyT4Jn3e8gTSMQ0AE
	 o6ckD0pele5BOkyGXI8JNm/+OS6E+zfY2GkOllu+PFRoogCtqcpJoYwmqE0OKokdfL
	 6cBFj6zE0PPPA==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:55:58 +0100
Subject: [PATCH 2/7] HID: bpf: Suppress bogus F13 trigger on Sirius
 keyboard full fan shortcut
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-2-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=2509;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=hhGOUjq9gKw2uCegb4idyIFAtU1Ni0yyB2zWQs1v3Y8=;
 b=OMGOyuA40LStVM6Dcy7n7hhHVPnYVbYuJ3HPSNz7vrC7XPgVG8jhhUnoY1QCqeNBK+Q8mYpxT
 kt8YQyb2Yt8Cj9U9p8Av3G7Rc7JEewsMG2Jj9Tn2EIIsVFR41clMh+C
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The TUXEDO Sirius 16 Gen1 and the TUXEDO Sirius 16 Gen2 Notebooks have an
additional "fan" key next to F12.

Pressing it alone sends a F14 key press which can be bound by user space.

Pressing it while holding the FN key triggers two things:
- The EC firmware locks the fan speed of the internal fans at 100%
- F13 key press is registered which by default is already bound in xkb and
  desktop environments (e.g. in KDE Plasma it launches system settings)

To avoid this unexpected double duty of the FN shortcut, this bpf program
suppresses the F13 key press.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/166
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 .../progs/TUXEDO__Sirius-16-Gen1-and-Gen2.bpf.c    | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/hid/bpf/progs/TUXEDO__Sirius-16-Gen1-and-Gen2.bpf.c b/drivers/hid/bpf/progs/TUXEDO__Sirius-16-Gen1-and-Gen2.bpf.c
new file mode 100644
index 0000000000000000000000000000000000000000..a123003fb5fdd0a27bc204b9b393da52b0956cfa
--- /dev/null
+++ b/drivers/hid/bpf/progs/TUXEDO__Sirius-16-Gen1-and-Gen2.bpf.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2025 TUXEDO Computers GmbH
+ */
+
+#include "vmlinux.h"
+#include "hid_bpf.h"
+#include "hid_bpf_helpers.h"
+#include <bpf/bpf_tracing.h>
+
+HID_BPF_CONFIG(
+	HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, 0x048D, 0x8910)
+);
+
+SEC(HID_BPF_DEVICE_EVENT)
+int BPF_PROG(ignore_key_fix_event, struct hid_bpf_ctx *hid_ctx)
+{
+	const int expected_length = 37;
+	const int expected_report_id = 1;
+	__u8 *data;
+	int i;
+
+	if (hid_ctx->size < expected_length)
+		return 0;
+
+	data = hid_bpf_get_data(hid_ctx, 0, expected_length);
+	if (!data || data[0] != expected_report_id)
+		return 0;
+
+	// Zero out F13 (HID usage ID: 0x68) key press.
+	// The first 6 parallel key presses (excluding modifier keys) are
+	// encoded in an array containing usage IDs.
+	for (i = 3; i < 9; ++i)
+		if (data[i] == 0x68)
+			data[i] = 0x00;
+	// Additional parallel key presses starting with the 7th (excluding
+	// modifier keys) are encoded as a bit flag with the offset being
+	// the usage ID.
+	data[22] &= 0xfe;
+
+	return 0;
+}
+
+HID_BPF_OPS(ignore_button) = {
+	.hid_device_event = (void *)ignore_key_fix_event,
+};
+
+char _license[] SEC("license") = "GPL";

-- 
2.47.0


