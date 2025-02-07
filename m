Return-Path: <linux-input+bounces-9849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D1A2C434
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35C8F16A235
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEA421579F;
	Fri,  7 Feb 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rylEUjNp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD7215793;
	Fri,  7 Feb 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936594; cv=none; b=qxLAfOP/rAf9IDWVUeDeQ4RSTLs1jkWY6YKXRe66/rdETaKLaN/fL4hHTr6Pw6kysiZ1c59frq2mG/ev2W1VascVL8MG3hBb9wgy+nb+8SAbsuKkbml/DwsvU+XNiz9l00ajXa30N9LeJTKUl1GWBz4IwVY6mgHwE5ecT7SDFDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936594; c=relaxed/simple;
	bh=2z5Pv1tccVbX+r4QMGR+0RbXXwaAVSkEfWk/C5nSLzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLiPJlR1c0abRk9XzVZzbdToyKCY4IJ3etGSEbt8U1y7Yeo0DslWOmbggi6Yv3Z6XayCTyVXwPKR6Gmm4laH+9dpxSgHzj1KYIblfXu/YvLoF8Gi1x4Ucvno5EOjxFw/OBnfz4/OE3KoC7x5W0uA17wRtmVGQ22OfxtXIwx8YAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rylEUjNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04632C4CED1;
	Fri,  7 Feb 2025 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936594;
	bh=2z5Pv1tccVbX+r4QMGR+0RbXXwaAVSkEfWk/C5nSLzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rylEUjNpSzrBeD3k8J6DJYTzv6M7938tSzwe1rtPPqWNJ8Hjvok2IK8/ZcEdUnN7B
	 brZngJ8P6gxeEh9SxuimwHM/C64yldQOWn7rqaeXKPn9wcJk1l+x8u41He+eNlK4iF
	 suROZhcWKwKh3Z2ufL0T1Nhalp8zUtPjJR4TgW3yJ4NE5GUQjdBUZE0q1FrNT70T4H
	 tysZTmFtUCBGwdIp67MlHQCllPXUJuflsDi0Fir4MSAEfEqvgk00i4NCOKW+qpuKyj
	 OAErU6zaJcSD2teYgwj4/AiEahEdtngNt8FVh0gycNWk+ocVTCoItrNwyqN8ODBNPY
	 eSLpmp3Ah1Znw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Feb 2025 14:56:02 +0100
Subject: [PATCH 6/7] HID: bpf: new hid_bpf_async.h common header
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bpf-import-2025-02-07-v1-6-6048fdd5a206@kernel.org>
References: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
In-Reply-To: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=7397;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=2z5Pv1tccVbX+r4QMGR+0RbXXwaAVSkEfWk/C5nSLzw=;
 b=forj309clmHoyGc7NehfynB4bD3KqMKDPMTIN3yQ3tFf9Ch7GbBWMSaXBeIIKCqbkAggPY3YE
 aVrIx6cCCjkAj1hPDFr/QgnphlYKBHq151IzgLBXI9ktak4Si/bjiEO
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

The purpose is to simplify the use of bpf_wq to defer blocking
operations in a sleepable context. Compared to a more "classic"
async approach, there is no sync mechanism to wait for the async
to finish.

The "simple" API is the following:

```

static int HID_BPF_ASYNC(async_fun)(struct hid_bpf_ctx *hctx)
{
        bpf_printk("%s", __fun__);
        return 0;
}

SEC("syscall")
int probe(struct hid_bpf_probe_args *ctx)
{
        ctx->retval = HID_BPF_ASYNC_INIT(async_fun);
        return 0;
}

SEC(HID_BPF_DEVICE_EVENT)
int BPF_PROG(event_handler, struct hid_bpf_ctx *hctx)
{
        /* async_fun() can be called now, it's not a sleepable
         * function in this example
         */
        async_fun(hctx);

        /* but we can also delay the call by 10 ms */
        HID_BPF_ASYNC_DELAYED_CALL(async_fun, hctx, 10);

        return 0;
}

HID_BPF_OPS(xppen_ack05_remote) = {
        .hid_device_event = (void *)event_handler,
};
```

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/133
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/bpf/progs/hid_bpf_async.h | 219 ++++++++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/drivers/hid/bpf/progs/hid_bpf_async.h b/drivers/hid/bpf/progs/hid_bpf_async.h
new file mode 100644
index 0000000000000000000000000000000000000000..9ab5854342393f38f849cb39b83ae86c8b1d73a4
--- /dev/null
+++ b/drivers/hid/bpf/progs/hid_bpf_async.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * Copyright (c) 2024 Benjamin Tissoires
+ */
+
+#ifndef __HID_BPF_ASYNC_H__
+#define __HID_BPF_ASYNC_H__
+
+#ifndef HID_BPF_ASYNC_MAX_CTX
+#error "HID_BPF_ASYNC_MAX_CTX should be set to the maximum number of concurrent async functions"
+#endif /* HID_BPF_ASYNC_MAX_CTX */
+
+#define CLOCK_MONOTONIC		1
+
+typedef int (*hid_bpf_async_callback_t)(void *map, int *key, void *value);
+
+enum hid_bpf_async_state {
+	HID_BPF_ASYNC_STATE_UNSET = 0,
+	HID_BPF_ASYNC_STATE_INITIALIZING,
+	HID_BPF_ASYNC_STATE_INITIALIZED,
+	HID_BPF_ASYNC_STATE_STARTING,
+	HID_BPF_ASYNC_STATE_RUNNING,
+};
+
+struct hid_bpf_async_map_elem {
+	struct bpf_spin_lock lock;
+	enum hid_bpf_async_state state;
+	struct bpf_timer t;
+	struct bpf_wq wq;
+	u32 hid;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(max_entries, HID_BPF_ASYNC_MAX_CTX);
+	__type(key, u32);
+	__type(value, struct hid_bpf_async_map_elem);
+} hid_bpf_async_ctx_map SEC(".maps");
+
+/**
+ * HID_BPF_ASYNC_CB: macro to define an async callback used in a bpf_wq
+ *
+ * The caller is responsible for allocating a key in the async map
+ * with hid_bpf_async_get_ctx().
+ */
+#define HID_BPF_ASYNC_CB(cb)					\
+cb(void *map, int *key, void *value);				\
+static __always_inline int					\
+____##cb(struct hid_bpf_ctx *ctx);				\
+typeof(cb(0, 0, 0)) cb(void *map, int *key, void *value)	\
+{								\
+	struct hid_bpf_async_map_elem *e;				\
+	struct hid_bpf_ctx *ctx;				\
+								\
+	e = (struct hid_bpf_async_map_elem *)value;			\
+	ctx = hid_bpf_allocate_context(e->hid);			\
+	if (!ctx)						\
+		return 0; /* EPERM check */			\
+								\
+	e->state = HID_BPF_ASYNC_STATE_RUNNING;			\
+								\
+	____##cb(ctx);						\
+								\
+	e->state = HID_BPF_ASYNC_STATE_INITIALIZED;		\
+	hid_bpf_release_context(ctx);				\
+	return 0;						\
+}								\
+static __always_inline int					\
+____##cb
+
+/**
+ * ASYNC: macro to automatically handle async callbacks contexts
+ *
+ * Needs to be used in conjunction with HID_BPF_ASYNC_INIT and HID_BPF_ASYNC_DELAYED_CALL
+ */
+#define HID_BPF_ASYNC_FUN(fun)						\
+fun(struct hid_bpf_ctx *ctx);					\
+int ____key__##fun;						\
+static int ____async_init_##fun(void)				\
+{								\
+	____key__##fun = hid_bpf_async_get_ctx();			\
+	if (____key__##fun < 0)					\
+		return ____key__##fun;				\
+	return 0;						\
+}								\
+static int HID_BPF_ASYNC_CB(____##fun##_cb)(struct hid_bpf_ctx *hctx)	\
+{								\
+	return fun(hctx);					\
+}								\
+typeof(fun(0)) fun
+
+#define HID_BPF_ASYNC_INIT(fun)	____async_init_##fun()
+#define HID_BPF_ASYNC_DELAYED_CALL(fun, ctx, delay)		\
+	hid_bpf_async_delayed_call(ctx, delay, ____key__##fun, ____##fun##_cb)
+
+/*
+ * internal cb for starting the delayed work callback in a workqueue.
+ */
+static int __start_wq_timer_cb(void *map, int *key, void *value)
+{
+	struct hid_bpf_async_map_elem *e = (struct hid_bpf_async_map_elem *)value;
+
+	bpf_wq_start(&e->wq, 0);
+
+	return 0;
+}
+
+static int hid_bpf_async_find_empty_key(void)
+{
+	int i;
+
+	bpf_for(i, 0, HID_BPF_ASYNC_MAX_CTX) {
+		struct hid_bpf_async_map_elem *elem;
+		int key = i;
+
+		elem = bpf_map_lookup_elem(&hid_bpf_async_ctx_map, &key);
+		if (!elem)
+			return -ENOMEM; /* should never happen */
+
+		bpf_spin_lock(&elem->lock);
+
+		if (elem->state == HID_BPF_ASYNC_STATE_UNSET) {
+			elem->state = HID_BPF_ASYNC_STATE_INITIALIZING;
+			bpf_spin_unlock(&elem->lock);
+			return i;
+		}
+
+		bpf_spin_unlock(&elem->lock);
+	}
+
+	return -EINVAL;
+}
+
+static int hid_bpf_async_get_ctx(void)
+{
+	int key = hid_bpf_async_find_empty_key();
+	struct hid_bpf_async_map_elem *elem;
+	int err;
+
+	if (key < 0)
+		return key;
+
+	elem = bpf_map_lookup_elem(&hid_bpf_async_ctx_map, &key);
+	if (!elem)
+		return -EINVAL;
+
+	err = bpf_timer_init(&elem->t, &hid_bpf_async_ctx_map, CLOCK_MONOTONIC);
+	if (err)
+		return err;
+
+	err = bpf_timer_set_callback(&elem->t, __start_wq_timer_cb);
+	if (err)
+		return err;
+
+	err = bpf_wq_init(&elem->wq, &hid_bpf_async_ctx_map, 0);
+	if (err)
+		return err;
+
+	elem->state = HID_BPF_ASYNC_STATE_INITIALIZED;
+
+	return key;
+}
+
+static inline u64 ms_to_ns(u64 milliseconds)
+{
+	return (u64)milliseconds * 1000UL * 1000UL;
+}
+
+static int hid_bpf_async_delayed_call(struct hid_bpf_ctx *hctx, u64 milliseconds, int key,
+			      hid_bpf_async_callback_t wq_cb)
+{
+	struct hid_bpf_async_map_elem *elem;
+	int err;
+
+	elem = bpf_map_lookup_elem(&hid_bpf_async_ctx_map, &key);
+	if (!elem)
+		return -EINVAL;
+
+	bpf_spin_lock(&elem->lock);
+	/* The wq must be:
+	 * - HID_BPF_ASYNC_STATE_INITIALIZED -> it's been initialized and ready to be called
+	 * - HID_BPF_ASYNC_STATE_RUNNING -> possible re-entry from the wq itself
+	 */
+	if (elem->state != HID_BPF_ASYNC_STATE_INITIALIZED &&
+	    elem->state != HID_BPF_ASYNC_STATE_RUNNING) {
+		bpf_spin_unlock(&elem->lock);
+		return -EINVAL;
+	}
+	elem->state = HID_BPF_ASYNC_STATE_STARTING;
+	bpf_spin_unlock(&elem->lock);
+
+	elem->hid = hctx->hid->id;
+
+	err = bpf_wq_set_callback(&elem->wq, wq_cb, 0);
+	if (err)
+		return err;
+
+	if (milliseconds) {
+		/* needed for every call because a cancel might unset this */
+		err = bpf_timer_set_callback(&elem->t, __start_wq_timer_cb);
+		if (err)
+			return err;
+
+		err = bpf_timer_start(&elem->t, ms_to_ns(milliseconds), 0);
+		if (err)
+			return err;
+
+		return 0;
+	}
+
+	return bpf_wq_start(&elem->wq, 0);
+}
+
+static inline int hid_bpf_async_call(struct hid_bpf_ctx *ctx, int key,
+				     hid_bpf_async_callback_t wq_cb)
+{
+	return hid_bpf_async_delayed_call(ctx, 0, key, wq_cb);
+}
+
+#endif /* __HID_BPF_ASYNC_H__ */

-- 
2.47.0


