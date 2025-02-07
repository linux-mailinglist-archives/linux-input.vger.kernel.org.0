Return-Path: <linux-input+bounces-9846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2436A2C42E
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5CA3AACCD
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0447C1F91C8;
	Fri,  7 Feb 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH6hIKeT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB661F8EF1;
	Fri,  7 Feb 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936589; cv=none; b=kuPOGc8N5ORB1Qvz6Cnpw07u2RpdzInFhqjX3tY7/fusuwSumNppwnom4CkoFqGKv0CqY9M/pqXkZxkSnOpN0tsvqFJlil1JXsrV1OG0+aco9Ks0+98I8zy7/9DuL+BviH+n4E9VQdYfIzfHXjHhkVC9SUegw19Sk65nQoL8RKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936589; c=relaxed/simple;
	bh=CRzZ9NbV37dT/3RZjq6vQB+PPSjf3/hWQ8H0AXaimQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSn9Mt0uPUf8E+u0GyhlDXIYijml0F/+HNBw4Nnw2w7H/qs9GJFvX2aNYjl8/9YFJRGOkuHKCr7iOtwg0Ko1I8MnCs6Mtv8pnbySBYTOHpKT1mocG09Dt5edF4s/G84662PxWVp5YEKWzSxKPuEBvHYmEgV4aYD+DCh0RYiPoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH6hIKeT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85509C4CED1;
	Fri,  7 Feb 2025 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936589;
	bh=CRzZ9NbV37dT/3RZjq6vQB+PPSjf3/hWQ8H0AXaimQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OH6hIKeTGz+LhHCUsFvf4Il5PqDzdJ+C5OwWWzng7Z7JgodY5PC66BpAEfQ090OMP
	 zdE54tJ79TtmD5HKOvqRBFtEUVjCvnQg52oMZK0IpJKbEpCLB2o3N8DY5k35h1tvii
	 vmiCof6wepQhUQPZiYo0hP3yJFOyI2wNNxuMRSpD4GosuxBH74AaVC33NacdMd5WTb
	 QNsvYi/6+0TJ82rHzZGfnHvpeeHKiNI7s43Cdo0/cBzlrFKTUkyutyiSqNS74fir0C
	 kNzSjOrlZQr2u87CZsVkS3Vx87iBqnCvbfSuMItMta377Z3KHeXQUXcLjvMwxb1Oql
	 8Z7c8PY182bhg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:55:59 +0100
Subject: [PATCH 3/7] HID: bpf: Added updated Kamvas Pro 19 descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-3-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, Aki Van Ness <aki@lethalbit.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=7513;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=CRzZ9NbV37dT/3RZjq6vQB+PPSjf3/hWQ8H0AXaimQk=;
 b=PJVHA9Fssrb3ErZ+wLWUMs89YnXg5CcB3V6MdIHVlBwzZuKh6cGsdaC6qv1xqi9cFm2qAIm+w
 yJ2jXRpRUIABc/m8DhUec0kVYb/xDr2g018Vhh/HuU69IZUomeUmg53
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

This adds an updated HID descriptor for the Huion Kamvas Pro 19 that is
present on newer firmware revisions, while also trying to keep
compat with the older versions.

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/164
Signed-off-by: Aki Van Ness <aki@lethalbit.net>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c | 75 ++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c b/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
index a4a4f324aedd5658bb9b5114b2513d37ed719c0f..489cb4fcc2cd2702e4d996ad9435ba0ca454b6d9 100644
--- a/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
+++ b/drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c
@@ -41,7 +41,7 @@ static const __u8 fixed_rdesc[] = {
 	0x15, 0x00,                    //   Logical Minimum (0)               22
 	0x25, 0x01,                    //   Logical Maximum (1)               24
 	0x75, 0x01,                    //   Report Size (1)                   26
-	0x95, 0x05,                    //   Report Count (5)                  28 /* changed (was 5) */
+	0x95, 0x05,                    //   Report Count (5)                  28 /* changed (was 6) */
 	0x81, 0x02,                    //   Input (Data,Var,Abs)              30
 	0x05, 0x09,                    //   Usage Page (Button)                  /* inserted */
 	0x09, 0x4a,                    //   Usage (0x4a)                         /* inserted to be translated as input usage 0x149: BTN_STYLUS3 */
@@ -189,8 +189,68 @@ static const __u8 fixed_rdesc[] = {
 	0x96, 0x00, 0x01,              //  Report Count (256)                 322
 	0xb1, 0x02,                    //  Feature (Data,Var,Abs)             325
 	0xc0,                          // End Collection                      327
+	/* New in Firmware Version: HUION_M220_240524 */
+	0x05, 0x01,                    // Usage Page (Generic Desktop)            328
+	0x09, 0x01,                    // Usage (Pointer)                         330
+	0xa1, 0x01,                    // Collection (Application)                332
+	0x09, 0x01,                    //   Usage (Pointer)                       334
+	0xa1, 0x00,                    //   Collection (Physical)                 336
+	0x05, 0x09,                    //     Usage Page (Button)                 338
+	0x19, 0x01,                    //     UsageMinimum (1)                    340
+	0x29, 0x03,                    //     UsageMaximum (3)                    342
+	0x15, 0x00,                    //     Logical Minimum (0)                 344
+	0x25, 0x01,                    //     Logical Maximum (1)                 346
+	0x85, 0x02,                    //     Report ID (2)                       348
+	0x95, 0x03,                    //     Report Count (3)                    350
+	0x75, 0x01,                    //     Report Size (1)                     352
+	0x81, 0x02,                    //     Input (Data,Var,Abs)                354
+	0x95, 0x01,                    //     Report Count (1)                    356
+	0x75, 0x05,                    //     Report Size (5)                     358
+	0x81, 0x01,                    //     Input (Cnst,Arr,Abs)                360
+	0x05, 0x01,                    //     Usage Page (Generic Desktop)        362
+	0x09, 0x30,                    //     Usage (X)                           364
+	0x09, 0x31,                    //     Usage (Y)                           366
+	0x15, 0x81,                    //     Logical Minimum (-127)              368
+	0x25, 0x7f,                    //     Logical Maximum (127)               370
+	0x75, 0x08,                    //     Report Size (8)                     372
+	0x95, 0x02,                    //     Report Count (2)                    374
+	0x81, 0x06,                    //     Input (Data,Var,Rel)                376
+	0x95, 0x04,                    //     Report Count (4)                    378
+	0x75, 0x08,                    //     Report Size (8)                     380
+	0x81, 0x01,                    //     Input (Cnst,Arr,Abs)                382
+	0xc0,                          //   End Collection                        384
+	0xc0,                          // End Collection                          385
+	0x05, 0x0d,                    // Usage Page (Digitizers)                 386
+	0x09, 0x05,                    // Usage (Touch Pad)                       388
+	0xa1, 0x01,                    // Collection (Application)                390
+	0x06, 0x00, 0xff,              //   Usage Page (Vendor Defined Page FF00) 392
+	0x09, 0x0c,                    //   Usage (Vendor Usage 0x0c)             395
+	0x15, 0x00,                    //   Logical Minimum (0)                   397
+	0x26, 0xff, 0x00,              //   Logical Maximum (255)                 399
+	0x75, 0x08,                    //   Report Size (8)                       402
+	0x95, 0x10,                    //   Report Count (16)                     404
+	0x85, 0x3f,                    //   Report ID (63)                        406
+	0x81, 0x22,                    //   Input (Data,Var,Abs,NoPref)           408
+	0xc0,                          // End Collection                          410
+	0x06, 0x00, 0xff,              // Usage Page (Vendor Defined Page FF00)   411
+	0x09, 0x0c,                    // Usage (Vendor Usage 0x0c)               414
+	0xa1, 0x01,                    // Collection (Application)                416
+	0x06, 0x00, 0xff,              //   Usage Page (Vendor Defined Page FF00) 418
+	0x09, 0x0c,                    //   Usage (Vendor Usage 0x0c)             421
+	0x15, 0x00,                    //   Logical Minimum (0)                   423
+	0x26, 0xff, 0x00,              //   Logical Maximum (255)                 425
+	0x85, 0x44,                    //   Report ID (68)                        428
+	0x75, 0x08,                    //   Report Size (8)                       430
+	0x96, 0x6b, 0x05,              //   Report Count (1387)                   432
+	0x81, 0x00,                    //   Input (Data,Arr,Abs)                  435
+	0xc0,                          // End Collection                          437
 };
 
+#define PRE_240524_RDESC_SIZE 328
+#define PRE_240524_RDESC_FIXED_SIZE 338 /* The original bits of the descriptor */
+#define FW_240524_RDESC_SIZE 438
+#define FW_240524_RDESC_FIXED_SIZE sizeof(fixed_rdesc)
+
 SEC(HID_BPF_RDESC_FIXUP)
 int BPF_PROG(hid_fix_rdesc_huion_kamvas_pro_19, struct hid_bpf_ctx *hctx)
 {
@@ -199,9 +259,14 @@ int BPF_PROG(hid_fix_rdesc_huion_kamvas_pro_19, struct hid_bpf_ctx *hctx)
 	if (!data)
 		return 0; /* EPERM check */
 
-	__builtin_memcpy(data, fixed_rdesc, sizeof(fixed_rdesc));
+	if (hctx->size == FW_240524_RDESC_SIZE) {
+		__builtin_memcpy(data, fixed_rdesc, FW_240524_RDESC_FIXED_SIZE);
+		return sizeof(fixed_rdesc);
+	}
+
+	__builtin_memcpy(data, fixed_rdesc, PRE_240524_RDESC_FIXED_SIZE);
 
-	return sizeof(fixed_rdesc);
+	return PRE_240524_RDESC_FIXED_SIZE;
 }
 
 /*
@@ -263,7 +328,9 @@ HID_BPF_OPS(huion_Kamvas_pro_19) = {
 SEC("syscall")
 int probe(struct hid_bpf_probe_args *ctx)
 {
-	ctx->retval = ctx->rdesc_size != 328;
+
+	ctx->retval = !((ctx->rdesc_size == PRE_240524_RDESC_SIZE) ||
+			(ctx->rdesc_size == FW_240524_RDESC_SIZE));
 	if (ctx->retval)
 		ctx->retval = -EINVAL;
 

-- 
2.47.0


