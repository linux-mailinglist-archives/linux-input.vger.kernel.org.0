Return-Path: <linux-input+bounces-9848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09BA2C432
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B26D716A2E7
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8A22066D7;
	Fri,  7 Feb 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJtY5uYV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A01FF7B7;
	Fri,  7 Feb 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936593; cv=none; b=Rj4d2owo+aJfGgB/OTxs06jN3kVt4/YbRGfcuX6Db6RVwwUMhbLZCmATIlQyq8FbdNJ2rvxx7Sf1qdSXGzr01XXInccYSFm3kYjw/I/Ym31mSZ5jphSrb+adA83M7VXZHhHrMZrgrETk/efW9l61lpp+hEdUAyRkRRQqCYZOq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936593; c=relaxed/simple;
	bh=rAU4Mo85vZRk/egJ4o0I2i5pn8PnEvtG5ZWu2RSw+Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgjKkb1NfuAV9hUJbDlMRvyW2iQAmJ0fkviUNmdJSNsulRaRVl4oOZ5w7xwfKpIAgsrN84VYjR3pN2SatukXVIREwz30jI+V93iS3803wciniuXMt1cbnTQSj/gvAFzrtCgLqUx9iuIj7gsoP8JEECzUtVa06Dx33JOKmRzB9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJtY5uYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9038DC4CEE5;
	Fri,  7 Feb 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936592;
	bh=rAU4Mo85vZRk/egJ4o0I2i5pn8PnEvtG5ZWu2RSw+Ao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJtY5uYVieUa0MMF2kTA6ouGpTmwwWrrAg441Qw4JGMwwlDN89Y7X+aNcsQqIahJL
	 Iz86RT1fXjbutvA56aHsa3QfDY9m+MCR3iL/WynbC0Bi4+fGj3ouGOuTQgEj2BrwJ3
	 p9n/ObDCBEdAa0GCTPdYok+SyFqGnceI55059EDLEWOU0e3Dc5R9ays1NapA1AKehq
	 fa3u1Eh7eZ9wgtfVDx7X82eeyHMuYjK8Kza3Sfk+R6u1B+6hPypwSziUZcHQ5q5mp+
	 CPUi3md0bJnVicKO3hyb4oxbXnbDukVgi9k+QWh9T09PPfgzAZsKMWA2YF14Bsm1oI
	 woONkoDnorOjw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:56:01 +0100
Subject: [PATCH 5/7] HID: bpf: import new kfunc from v6.10 & v6.11
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-5-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=1862;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=rAU4Mo85vZRk/egJ4o0I2i5pn8PnEvtG5ZWu2RSw+Ao=;
 b=W8HfDg1gXZCeiE95HUx8ht2hXVF8PAuGV2JF2QhMYPuP0hPLrgeR++5jBAdvOmRXzwUXE2iPJ
 1CfsM4mXwolB4kTR5Ft9nZyPQ5vVoPsMd3wsZjzWAdxSZ4UgRE7onvt
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

These kfunc are all in v6.10 except for the hid_bpf_try_input_report()
which will be in v6.11. Import their definition once now so we can make
use of it.

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/114
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/hid_bpf_helpers.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hid/bpf/progs/hid_bpf_helpers.h b/drivers/hid/bpf/progs/hid_bpf_helpers.h
index 3ba24d125a081be4b09d88be4a2afcdc6b8c5f00..bf19785a6b06734d9465547e915bf8baeec23350 100644
--- a/drivers/hid/bpf/progs/hid_bpf_helpers.h
+++ b/drivers/hid/bpf/progs/hid_bpf_helpers.h
@@ -19,6 +19,25 @@ extern int hid_bpf_hw_request(struct hid_bpf_ctx *ctx,
 			      size_t buf__sz,
 			      enum hid_report_type type,
 			      enum hid_class_request reqtype) __ksym;
+extern int hid_bpf_hw_output_report(struct hid_bpf_ctx *ctx,
+				    __u8 *buf, size_t buf__sz) __weak __ksym;
+extern int hid_bpf_input_report(struct hid_bpf_ctx *ctx,
+				enum hid_report_type type,
+				__u8 *data,
+				size_t buf__sz) __weak __ksym;
+extern int hid_bpf_try_input_report(struct hid_bpf_ctx *ctx,
+				    enum hid_report_type type,
+				    __u8 *data,
+				    size_t buf__sz) __weak __ksym;
+
+/* bpf_wq implementation */
+extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
+extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
+extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
+		int (callback_fn)(void *map, int *key, void *value),
+		unsigned int flags__k, void *aux__ign) __ksym;
+#define bpf_wq_set_callback(wq, cb, flags) \
+	bpf_wq_set_callback_impl(wq, cb, flags, NULL)
 
 #define HID_MAX_DESCRIPTOR_SIZE	4096
 #define HID_IGNORE_EVENT	-1

-- 
2.47.0


