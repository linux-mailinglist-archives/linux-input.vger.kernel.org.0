Return-Path: <linux-input+bounces-4208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84F9008E5
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E4E1C21A64
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 15:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B077019A2B3;
	Fri,  7 Jun 2024 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmcuHK1k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB92199EB2;
	Fri,  7 Jun 2024 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774119; cv=none; b=TeBAIRgOFVPtTZDUmWTzRP9odB9W5WzBERuw2r407uw1fXLb4nu3/cnyBUPzlR5g5G2Fv6dKBHwxy2KNm1QU+oIKX7MuihGrUXMNGgIaB7VLZLnr7SLUQiSEv3dc20YyGTy3LFyOgex0aqsnti8XB0Pu7/kjvVxv/pa2zPFXxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774119; c=relaxed/simple;
	bh=6h2NKLKHLsHtGbZwuOXe/UKpTShMMcqmoIWFtogMsDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iH1GyaGqtm9rXNnbkIHwLa3ddNaJ6oq5an4UchovbkRHrmQzGF0m/nixjfusBH5mZUslkymHDgl2vxpcXLDWDW0byMd2iqkU2XT9XILyzQEW3Btx2Rno2MUxv3QUMFQn2/ttj7Cc5oPyz1qctCO7GeGZZ0w8wQfxHdjMQ8tidZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmcuHK1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46424C4AF0A;
	Fri,  7 Jun 2024 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717774119;
	bh=6h2NKLKHLsHtGbZwuOXe/UKpTShMMcqmoIWFtogMsDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AmcuHK1kmxH1RmIN92xbdV2nnkLTXzAaLurOGOldccxZCcMjIXGEZdOq+Tgzn+X+o
	 IAN78jVJX4uQauC0ualX2jatrKK+MFU936EHAC0L2yIrLSpTwsSY3jGRLV6YFe0+1a
	 XcsXLYuOCV5sfnXOYXy6WF8j/02nDEdxae1FPNqUpxDlDSOEVENicUP+fR5+Xngbpv
	 hO+Ra1A3l7Rix5i1JHerMas8alrIbzpF1vrThsY4IU6SSBMbXr34IvObYIlrXmR4LN
	 CAT5emIEYLNnRA9+U7/cdhBDQifYtWPwmGXUsTnoHR4tkTP+IAcV7GyMClUU5jHqoP
	 IzDR7t7umo8xw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Fri, 07 Jun 2024 17:28:23 +0200
Subject: [PATCH HID v2 03/16] HID: bpf: implement HID-BPF through
 bpf_struct_ops
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-hid_bpf_struct_ops-v2-3-3f95f4d02292@kernel.org>
References: <20240607-hid_bpf_struct_ops-v2-0-3f95f4d02292@kernel.org>
In-Reply-To: <20240607-hid_bpf_struct_ops-v2-0-3f95f4d02292@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717774109; l=17278;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=6h2NKLKHLsHtGbZwuOXe/UKpTShMMcqmoIWFtogMsDo=;
 b=TIvTC4C6pdN8MZybG792wVWs6aFx4xYtHCedJC71MPMSxHc58KbF9Gk72Tlaqo9eNHfvc40/u
 pHmmSyCPdd6DeMBnzeDv+tVteu8eIHsYKbw4lmSmYqXiTDvGZewbDz/
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

We do this implementation in several steps to not have the CI failing:
- first (this patch), we add struct_ops while keeping the existing infra
  available
- then we change the selftests, the examples and the existing in-tree
  HID-BPF programs
- then we remove the existing trace points making old HID-BPF obsolete

There are a few advantages of struct_ops over tracing:
- compatibility with sleepable programs (for hid_hw_raw_request() in
  a later patch)
- a lot simpler in the kernel: it's a simple rcu protected list
- we can add more parameters to the function called without much trouble
- the "attach" is now generic through BPF-core: the caller just needs to
  set hid_id and flags before calling __load().
- all the BPF tough part is not handled in BPF-core through generic
  processing
- hid_bpf_ctx is now only writable where it needs be

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

---

changes in v2:
- drop custom enum hid_bpf_attach_flags (use BPF_F_BEFORE instead)
- fix member offset in .ops_init_member()
---
 drivers/hid/bpf/Makefile             |   2 +-
 drivers/hid/bpf/hid_bpf_dispatch.c   |  52 +++++++-
 drivers/hid/bpf/hid_bpf_dispatch.h   |   4 +
 drivers/hid/bpf/hid_bpf_jmp_table.c  |   3 +
 drivers/hid/bpf/hid_bpf_struct_ops.c | 247 +++++++++++++++++++++++++++++++++++
 include/linux/hid_bpf.h              |  65 ++++++++-
 6 files changed, 364 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/bpf/Makefile b/drivers/hid/bpf/Makefile
index cf55120cf7d6..1cb3f31e9335 100644
--- a/drivers/hid/bpf/Makefile
+++ b/drivers/hid/bpf/Makefile
@@ -8,4 +8,4 @@ LIBBPF_INCLUDE = $(srctree)/tools/lib
 obj-$(CONFIG_HID_BPF) += hid_bpf.o
 CFLAGS_hid_bpf_dispatch.o += -I$(LIBBPF_INCLUDE)
 CFLAGS_hid_bpf_jmp_table.o += -I$(LIBBPF_INCLUDE)
-hid_bpf-objs += hid_bpf_dispatch.o hid_bpf_jmp_table.o
+hid_bpf-objs += hid_bpf_dispatch.o hid_bpf_jmp_table.o hid_bpf_struct_ops.o
diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index c8bb79ce2354..7216c3c7713d 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -58,6 +58,7 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type
 		},
 		.data = hdev->bpf.device_data,
 	};
+	struct hid_bpf_ops *e;
 	int ret;
 
 	if (type >= HID_REPORT_TYPES)
@@ -70,9 +71,25 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type
 	memset(ctx_kern.data, 0, hdev->bpf.allocated_data);
 	memcpy(ctx_kern.data, data, *size);
 
+	rcu_read_lock();
+	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
+		if (e->hid_device_event) {
+			ret = e->hid_device_event(&ctx_kern.ctx, type);
+			if (ret < 0) {
+				rcu_read_unlock();
+				return ERR_PTR(ret);
+			}
+
+			if (ret)
+				ctx_kern.ctx.retval = ret;
+		}
+	}
+	rcu_read_unlock();
+
 	ret = hid_bpf_prog_run(hdev, HID_BPF_PROG_TYPE_DEVICE_EVENT, &ctx_kern);
 	if (ret < 0)
 		return ERR_PTR(ret);
+	ret = ctx_kern.ctx.retval;
 
 	if (ret) {
 		if (ret > ctx_kern.ctx.allocated_size)
@@ -122,7 +139,10 @@ u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *s
 
 	memcpy(ctx_kern.data, rdesc, min_t(unsigned int, *size, HID_MAX_DESCRIPTOR_SIZE));
 
-	ret = hid_bpf_prog_run(hdev, HID_BPF_PROG_TYPE_RDESC_FIXUP, &ctx_kern);
+	if (hdev->bpf.rdesc_ops)
+		ret = hdev->bpf.rdesc_ops->hid_rdesc_fixup(&ctx_kern.ctx);
+	else
+		ret = hid_bpf_prog_run(hdev, HID_BPF_PROG_TYPE_RDESC_FIXUP, &ctx_kern);
 	if (ret < 0)
 		goto ignore_bpf;
 
@@ -150,7 +170,7 @@ static int device_match_id(struct device *dev, const void *id)
 	return hdev->id == *(int *)id;
 }
 
-static struct hid_device *hid_get_device(unsigned int hid_id)
+struct hid_device *hid_get_device(unsigned int hid_id)
 {
 	struct device *dev;
 
@@ -164,7 +184,7 @@ static struct hid_device *hid_get_device(unsigned int hid_id)
 	return to_hid_device(dev);
 }
 
-static void hid_put_device(struct hid_device *hid)
+void hid_put_device(struct hid_device *hid)
 {
 	put_device(&hid->dev);
 }
@@ -205,7 +225,7 @@ static int __hid_bpf_allocate_data(struct hid_device *hdev, u8 **data, u32 *size
 	return 0;
 }
 
-static int hid_bpf_allocate_event_data(struct hid_device *hdev)
+int hid_bpf_allocate_event_data(struct hid_device *hdev)
 {
 	/* hdev->bpf.device_data is already allocated, abort */
 	if (hdev->bpf.device_data)
@@ -592,14 +612,22 @@ static const struct btf_kfunc_id_set hid_bpf_syscall_kfunc_set = {
 
 int hid_bpf_connect_device(struct hid_device *hdev)
 {
-	struct hid_bpf_prog_list *prog_list;
+	bool need_to_allocate = false;
+	struct hid_bpf_ops *e;
 
 	rcu_read_lock();
-	prog_list = rcu_dereference(hdev->bpf.progs[HID_BPF_PROG_TYPE_DEVICE_EVENT]);
+	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
+		if (e->hid_device_event) {
+			need_to_allocate = true;
+			break;
+		}
+	}
+	if (rcu_dereference(hdev->bpf.progs[HID_BPF_PROG_TYPE_DEVICE_EVENT]))
+		need_to_allocate = true;
 	rcu_read_unlock();
 
 	/* only allocate BPF data if there are programs attached */
-	if (!prog_list)
+	if (!need_to_allocate)
 		return 0;
 
 	return hid_bpf_allocate_event_data(hdev);
@@ -623,12 +651,15 @@ void hid_bpf_destroy_device(struct hid_device *hdev)
 	hdev->bpf.destroyed = true;
 
 	__hid_bpf_destroy_device(hdev);
+	__hid_bpf_ops_destroy_device(hdev);
 }
 EXPORT_SYMBOL_GPL(hid_bpf_destroy_device);
 
 void hid_bpf_device_init(struct hid_device *hdev)
 {
 	spin_lock_init(&hdev->bpf.progs_lock);
+	INIT_LIST_HEAD(&hdev->bpf.prog_list);
+	mutex_init(&hdev->bpf.prog_list_lock);
 }
 EXPORT_SYMBOL_GPL(hid_bpf_device_init);
 
@@ -662,6 +693,13 @@ static int __init hid_bpf_init(void)
 		return 0;
 	}
 
+	/* register struct_ops kfuncs after we are sure we can load our preloaded bpf program */
+	err = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &hid_bpf_kfunc_set);
+	if (err) {
+		pr_warn("error while setting HID BPF tracing kfuncs: %d", err);
+		return 0;
+	}
+
 	/* register syscalls after we are sure we can load our preloaded bpf program */
 	err = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &hid_bpf_syscall_kfunc_set);
 	if (err) {
diff --git a/drivers/hid/bpf/hid_bpf_dispatch.h b/drivers/hid/bpf/hid_bpf_dispatch.h
index fbe0639d09f2..e52c43d81650 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.h
+++ b/drivers/hid/bpf/hid_bpf_dispatch.h
@@ -10,12 +10,16 @@ struct hid_bpf_ctx_kern {
 	u8 *data;
 };
 
+struct hid_device *hid_get_device(unsigned int hid_id);
+void hid_put_device(struct hid_device *hid);
+int hid_bpf_allocate_event_data(struct hid_device *hdev);
 int hid_bpf_preload_skel(void);
 void hid_bpf_free_links_and_skel(void);
 int hid_bpf_get_prog_attach_type(struct bpf_prog *prog);
 int __hid_bpf_attach_prog(struct hid_device *hdev, enum hid_bpf_prog_type prog_type, int prog_fd,
 			  struct bpf_prog *prog, __u32 flags);
 void __hid_bpf_destroy_device(struct hid_device *hdev);
+void __hid_bpf_ops_destroy_device(struct hid_device *hdev);
 int hid_bpf_prog_run(struct hid_device *hdev, enum hid_bpf_prog_type type,
 		     struct hid_bpf_ctx_kern *ctx_kern);
 int hid_bpf_reconnect(struct hid_device *hdev);
diff --git a/drivers/hid/bpf/hid_bpf_jmp_table.c b/drivers/hid/bpf/hid_bpf_jmp_table.c
index aa8e1c79cdf5..8a54ba447718 100644
--- a/drivers/hid/bpf/hid_bpf_jmp_table.c
+++ b/drivers/hid/bpf/hid_bpf_jmp_table.c
@@ -81,6 +81,9 @@ static int hid_bpf_program_count(struct hid_device *hdev,
 	if (type >= HID_BPF_PROG_TYPE_MAX)
 		return -EINVAL;
 
+	if (type == HID_BPF_PROG_TYPE_RDESC_FIXUP && hdev->bpf.rdesc_ops)
+		n += 1;
+
 	FOR_ENTRIES(i, jmp_table.tail, jmp_table.head) {
 		struct hid_bpf_prog_entry *entry = &jmp_table.entries[i];
 
diff --git a/drivers/hid/bpf/hid_bpf_struct_ops.c b/drivers/hid/bpf/hid_bpf_struct_ops.c
new file mode 100644
index 000000000000..9192c66cde20
--- /dev/null
+++ b/drivers/hid/bpf/hid_bpf_struct_ops.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ *  HID-BPF support for Linux
+ *
+ *  Copyright (c) 2024 Benjamin Tissoires
+ */
+
+#include <linux/bitops.h>
+#include <linux/bpf_verifier.h>
+#include <linux/bpf.h>
+#include <linux/btf.h>
+#include <linux/btf_ids.h>
+#include <linux/filter.h>
+#include <linux/hid.h>
+#include <linux/hid_bpf.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include "hid_bpf_dispatch.h"
+
+static struct btf *hid_bpf_ops_btf;
+
+static int hid_bpf_ops_init(struct btf *btf)
+{
+	hid_bpf_ops_btf = btf;
+	return 0;
+}
+
+static bool hid_bpf_ops_is_valid_access(int off, int size,
+					  enum bpf_access_type type,
+					  const struct bpf_prog *prog,
+					  struct bpf_insn_access_aux *info)
+{
+	return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
+}
+
+static int hid_bpf_ops_check_member(const struct btf_type *t,
+				      const struct btf_member *member,
+				      const struct bpf_prog *prog)
+{
+	u32 moff = __btf_member_bit_offset(t, member) / 8;
+
+	switch (moff) {
+	case offsetof(struct hid_bpf_ops, hid_rdesc_fixup):
+		break;
+	default:
+		if (prog->sleepable)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hid_bpf_ops_btf_struct_access(struct bpf_verifier_log *log,
+					   const struct bpf_reg_state *reg,
+					   int off, int size)
+{
+	const struct btf_type *state;
+	const struct btf_type *t;
+	s32 type_id;
+
+	type_id = btf_find_by_name_kind(reg->btf, "hid_bpf_ctx",
+					BTF_KIND_STRUCT);
+	if (type_id < 0)
+		return -EINVAL;
+
+	t = btf_type_by_id(reg->btf, reg->btf_id);
+	state = btf_type_by_id(reg->btf, type_id);
+	if (t != state) {
+		bpf_log(log, "only access to hid_bpf_ctx is supported\n");
+		return -EACCES;
+	}
+
+	/* out-of-bound access in hid_bpf_ctx */
+	if (off + size > sizeof(struct hid_bpf_ctx)) {
+		bpf_log(log, "write access at off %d with size %d\n", off, size);
+		return -EACCES;
+	}
+
+	if (off < offsetof(struct hid_bpf_ctx, retval)) {
+		bpf_log(log,
+			"write access at off %d with size %d on read-only part of hid_bpf_ctx\n",
+			off, size);
+		return -EACCES;
+	}
+
+	return NOT_INIT;
+}
+
+static const struct bpf_verifier_ops hid_bpf_verifier_ops = {
+	.is_valid_access = hid_bpf_ops_is_valid_access,
+	.btf_struct_access = hid_bpf_ops_btf_struct_access,
+};
+
+static int hid_bpf_ops_init_member(const struct btf_type *t,
+				 const struct btf_member *member,
+				 void *kdata, const void *udata)
+{
+	u32 moff = __btf_member_bit_offset(t, member) / 8;
+	u32 flags;
+
+	switch (moff) {
+	case offsetof(struct hid_bpf_ops, hid_id):
+		/* For hid_id and flags fields, this function has to copy it
+		 * and return 1 to indicate that the data has been handled by
+		 * the struct_ops type, or the verifier will reject the map if
+		 * the value of those fields is not zero.
+		 */
+		((struct hid_bpf_ops *)kdata)->hid_id = ((struct hid_bpf_ops *)udata)->hid_id;
+		return 1;
+	case offsetof(struct hid_bpf_ops, flags):
+		flags = ((struct hid_bpf_ops *)udata)->flags;
+		if (flags & ~BPF_F_BEFORE)
+			return -EINVAL;
+		((struct hid_bpf_ops *)kdata)->flags = flags;
+		return 1;
+	}
+	return 0;
+}
+
+static int hid_bpf_reg(void *kdata)
+{
+	struct hid_bpf_ops *ops = kdata;
+	struct hid_device *hdev;
+	int count, err = 0;
+
+	hdev = hid_get_device(ops->hid_id);
+	if (IS_ERR(hdev))
+		return PTR_ERR(hdev);
+
+	ops->hdev = hdev;
+
+	mutex_lock(&hdev->bpf.prog_list_lock);
+
+	count = list_count_nodes(&hdev->bpf.prog_list);
+	if (count >= HID_BPF_MAX_PROGS_PER_DEV) {
+		err = -E2BIG;
+		goto out_unlock;
+	}
+
+	if (ops->hid_rdesc_fixup) {
+		if (hdev->bpf.rdesc_ops) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+
+		hdev->bpf.rdesc_ops = ops;
+	}
+
+	if (ops->hid_device_event) {
+		err = hid_bpf_allocate_event_data(hdev);
+		if (err)
+			goto out_unlock;
+	}
+
+	if (ops->flags & BPF_F_BEFORE)
+		list_add_rcu(&ops->list, &hdev->bpf.prog_list);
+	else
+		list_add_tail_rcu(&ops->list, &hdev->bpf.prog_list);
+
+out_unlock:
+	mutex_unlock(&hdev->bpf.prog_list_lock);
+
+	if (err) {
+		if (hdev->bpf.rdesc_ops == ops)
+			hdev->bpf.rdesc_ops = NULL;
+		hid_put_device(hdev);
+	} else if (ops->hid_rdesc_fixup) {
+		hid_bpf_reconnect(hdev);
+	}
+
+	return err;
+}
+
+static void hid_bpf_unreg(void *kdata)
+{
+	struct hid_bpf_ops *ops = kdata;
+	struct hid_device *hdev;
+	bool reconnect = false;
+
+	hdev = ops->hdev;
+
+	/* check if __hid_bpf_ops_destroy_device() has been called */
+	if (!hdev)
+		return;
+
+	mutex_lock(&hdev->bpf.prog_list_lock);
+
+	list_del_rcu(&ops->list);
+
+	reconnect = hdev->bpf.rdesc_ops == ops;
+	if (reconnect)
+		hdev->bpf.rdesc_ops = NULL;
+
+	mutex_unlock(&hdev->bpf.prog_list_lock);
+
+	if (reconnect)
+		hid_bpf_reconnect(hdev);
+
+	hid_put_device(hdev);
+}
+
+static int __hid_bpf_device_event(struct hid_bpf_ctx *ctx, enum hid_report_type type)
+{
+	return 0;
+}
+
+static int __hid_bpf_rdesc_fixup(struct hid_bpf_ctx *ctx)
+{
+	return 0;
+}
+
+static struct hid_bpf_ops __bpf_hid_bpf_ops = {
+	.hid_device_event = __hid_bpf_device_event,
+	.hid_rdesc_fixup = __hid_bpf_rdesc_fixup,
+};
+
+static struct bpf_struct_ops bpf_hid_bpf_ops = {
+	.verifier_ops = &hid_bpf_verifier_ops,
+	.init = hid_bpf_ops_init,
+	.check_member = hid_bpf_ops_check_member,
+	.init_member = hid_bpf_ops_init_member,
+	.reg = hid_bpf_reg,
+	.unreg = hid_bpf_unreg,
+	.name = "hid_bpf_ops",
+	.cfi_stubs = &__bpf_hid_bpf_ops,
+	.owner = THIS_MODULE,
+};
+
+void __hid_bpf_ops_destroy_device(struct hid_device *hdev)
+{
+	struct hid_bpf_ops *e;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
+		hid_put_device(hdev);
+		e->hdev = NULL;
+	}
+	rcu_read_unlock();
+}
+
+static int __init hid_bpf_struct_ops_init(void)
+{
+	return register_bpf_struct_ops(&bpf_hid_bpf_ops, hid_bpf_ops);
+}
+late_initcall(hid_bpf_struct_ops_init);
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index a66103618e6e..c566421271e7 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -65,11 +65,12 @@ struct hid_bpf_ctx {
  * @HID_BPF_FLAG_INSERT_HEAD: insert the given program before any other program
  *                            currently attached to the device. This doesn't
  *                            guarantee that this program will always be first
- * @HID_BPF_FLAG_MAX: sentinel value, not to be used by the callers
  */
 enum hid_bpf_attach_flags {
 	HID_BPF_FLAG_NONE = 0,
 	HID_BPF_FLAG_INSERT_HEAD = _BITUL(0),
+
+	/* private: internal use only */
 	HID_BPF_FLAG_MAX,
 };
 
@@ -112,6 +113,64 @@ struct hid_ops {
 
 extern struct hid_ops *hid_ops;
 
+/**
+ * struct hid_bpf_ops - A BPF struct_ops of callbacks allowing to attach HID-BPF
+ *			programs to a HID device
+ * @hid_id: the HID uniq ID to attach to. This is writeable before ``load()``, and
+ *	    cannot be changed after
+ * @flags: flags used while attaching the struct_ops to the device. Currently only
+ *	   available value is %0 or ``BPF_F_BEFORE``.
+ *	   Writeable only before ``load()``
+ */
+struct hid_bpf_ops {
+	/* hid_id needs to stay first so we can easily change it
+	 * from userspace.
+	 */
+	int			hid_id;
+	u32			flags;
+
+	/* private: internal use only */
+	struct list_head	list;
+
+	/* public: rest is public */
+
+/* fast path fields are put first to fill one cache line */
+
+	/**
+	 * @hid_device_event: called whenever an event is coming in from the device
+	 *
+	 * It has the following arguments:
+	 *
+	 * ``ctx``: The HID-BPF context as &struct hid_bpf_ctx
+	 *
+	 * Return: %0 on success and keep processing; a positive
+	 * value to change the incoming size buffer; a negative
+	 * error code to interrupt the processing of this event
+	 *
+	 * Context: Interrupt context.
+	 */
+	int (*hid_device_event)(struct hid_bpf_ctx *ctx, enum hid_report_type report_type);
+
+/* control/slow paths put last */
+
+	/**
+	 * @hid_rdesc_fixup: called when the probe function parses the report descriptor
+	 * of the HID device
+	 *
+	 * It has the following arguments:
+	 *
+	 * ``ctx``: The HID-BPF context as &struct hid_bpf_ctx
+	 *
+	 * Return: %0 on success and keep processing; a positive
+	 * value to change the incoming size buffer; a negative
+	 * error code to interrupt the processing of this device
+	 */
+	int (*hid_rdesc_fixup)(struct hid_bpf_ctx *ctx);
+
+	/* private: internal use only */
+	struct hid_device *hdev;
+} ____cacheline_aligned_in_smp;
+
 struct hid_bpf_prog_list {
 	u16 prog_idx[HID_BPF_MAX_PROGS_PER_DEV];
 	u8 prog_cnt;
@@ -129,6 +188,10 @@ struct hid_bpf {
 	bool destroyed;			/* prevents the assignment of any progs */
 
 	spinlock_t progs_lock;		/* protects RCU update of progs */
+
+	struct hid_bpf_ops *rdesc_ops;
+	struct list_head prog_list;
+	struct mutex prog_list_lock;	/* protects RCU update of prog_list */
 };
 
 /* specific HID-BPF link when a program is attached to a device */

-- 
2.44.0


