Return-Path: <linux-input+bounces-4872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E9928869
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 14:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3399B1F225DF
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 12:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D196D149C52;
	Fri,  5 Jul 2024 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEavjuUz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2451494C9;
	Fri,  5 Jul 2024 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720181370; cv=none; b=EJGVRWhuqxKhpsOp0w6d+/Tjx4zcIlEGGGGAXltER0jWGB0Bmal1DnyjZsCdHZXAWseZuLVW8ODx+Jd5N/fqCpndkoynnkDdmyaCM0NBmRbdoz9ax1QUoG7Jfqy/izcg1Nq2ZDtUWqZEd96UHVKjyeRhr+ITV4VeyYWDz4YxJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720181370; c=relaxed/simple;
	bh=t8+W4Z4NsMZbk0E9xXKyLFJHQHRBhJ9ib2DEibKFdy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XWgosTpBUq1JhgDs82LU5n0SWZ6AkdzaNZBusP05zUyyn7PJhHB1IjRGIeWwVupY74vSRShonypEyAZ7X2k+681C8uAcKcZDqeca/1hSv7Kd/vAVNls1E2AsAV9vjsO/bOW6RQhFaYeBNHWLUWQMtkpX2v6HzhHWSV/8Id/w5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEavjuUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D10DC116B1;
	Fri,  5 Jul 2024 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720181370;
	bh=t8+W4Z4NsMZbk0E9xXKyLFJHQHRBhJ9ib2DEibKFdy0=;
	h=From:Date:Subject:To:Cc:From;
	b=GEavjuUzRfvg6Zjh/g4vEGVxZ3lPzVadYLqrc7qG+naGefOzOoSzIFLlAhG6VKCVV
	 RWOGOponasDvAfFl8Q1PazRNCYkRh2pLHtf4gJ31QtgwJcJC0EqZ8NvdP7e3qnsU76
	 O6uDZXfS4OMOMC2G3OjKkVdJnc2U4zPj+ImqJ/pa+5qolvGDygixUhu3vhCLf0DuA4
	 ObiApRrMaNIA5ySen8g5sCueCheQImv5RL36LUCC9AmezqIBCDHSIfX2ebsGskVmm9
	 Ut6or6mn1RoHIWVWPV1ACYJf4X4GzwtSK3tSDmef6EiPwdJBwQee2RpLAh7cZI4bai
	 ah/baQ9vSGrQQ==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 05 Jul 2024 14:09:25 +0200
Subject: [PATCH] HID: samples: fix the 2 struct_ops definitions
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-for-6-11-bpf-v1-1-1960e3165c9e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHTih2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNT3bT8Il0zXUND3aSCNN1EYxPL1LRkA4uUNAsloJaCotS0zAqwcdG
 xtbUASXe8914AAAA=
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720181369; l=2906;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=t8+W4Z4NsMZbk0E9xXKyLFJHQHRBhJ9ib2DEibKFdy0=;
 b=FKZZ3YsTYtUib50z4596Y99G4Aejdq4FoeS3EcKpJEdgXTWPOzobjF410DDv5ltMla3Rtp+Nj
 S7SYiT6riR9D5maQZ4IGAnFl0l2zrjb1WZ+naLHtzvlgHVlBqysJ63M
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Turns out that this is not compiling anymore because the hid_bpf_ops
struct_ops definition had a change during the revisions.

Fixes: e342d6f6f7d8 ("HID: samples: convert the 2 HID-BPF samples into struct_ops")
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 samples/hid/hid_mouse.bpf.c        | 8 ++++----
 samples/hid/hid_surface_dial.bpf.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/samples/hid/hid_mouse.bpf.c b/samples/hid/hid_mouse.bpf.c
index bd901fa855c9..f7f722dcf56d 100644
--- a/samples/hid/hid_mouse.bpf.c
+++ b/samples/hid/hid_mouse.bpf.c
@@ -67,7 +67,7 @@ static int hid_x_event(struct hid_bpf_ctx *hctx)
 	return 0;
 }
 
-SEC("struct_ops/device_event")
+SEC("struct_ops/hid_device_event")
 int BPF_PROG(hid_event, struct hid_bpf_ctx *hctx, enum hid_report_type type)
 {
 	int ret = hid_y_event(hctx);
@@ -79,7 +79,7 @@ int BPF_PROG(hid_event, struct hid_bpf_ctx *hctx, enum hid_report_type type)
 }
 
 
-SEC("struct_ops/rdesc_fixup")
+SEC("struct_ops/hid_rdesc_fixup")
 int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
 {
 	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);
@@ -121,8 +121,8 @@ int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
 
 SEC(".struct_ops.link")
 struct hid_bpf_ops mouse_invert = {
-	.rdesc_fixup = (void *)hid_rdesc_fixup,
-	.device_event = (void *)hid_event,
+	.hid_rdesc_fixup = (void *)hid_rdesc_fixup,
+	.hid_device_event = (void *)hid_event,
 };
 
 char _license[] SEC("license") = "GPL";
diff --git a/samples/hid/hid_surface_dial.bpf.c b/samples/hid/hid_surface_dial.bpf.c
index d8d0fb07391f..527d584812ab 100644
--- a/samples/hid/hid_surface_dial.bpf.c
+++ b/samples/hid/hid_surface_dial.bpf.c
@@ -10,7 +10,7 @@
 #define HID_UP_BUTTON		0x0009
 #define HID_GD_WHEEL		0x0038
 
-SEC("struct_ops/device_event")
+SEC("struct_ops/hid_device_event")
 int BPF_PROG(hid_event, struct hid_bpf_ctx *hctx)
 {
 	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 9 /* size */);
@@ -101,7 +101,7 @@ int set_haptic(struct haptic_syscall_args *args)
 }
 
 /* Convert REL_DIAL into REL_WHEEL */
-SEC("struct_ops/rdesc_fixup")
+SEC("struct_ops/hid_rdesc_fixup")
 int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
 {
 	__u8 *data = hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);
@@ -132,8 +132,8 @@ int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
 
 SEC(".struct_ops.link")
 struct hid_bpf_ops surface_dial = {
-	.rdesc_fixup = (void *)hid_rdesc_fixup,
-	.device_event = (void *)hid_event,
+	.hid_rdesc_fixup = (void *)hid_rdesc_fixup,
+	.hid_device_event = (void *)hid_event,
 };
 
 char _license[] SEC("license") = "GPL";

---
base-commit: f58e7f404da44c94e46bfe657b8707195aebd25a
change-id: 20240705-for-6-11-bpf-a349efc08df8

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


