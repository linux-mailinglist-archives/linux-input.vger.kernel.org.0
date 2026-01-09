Return-Path: <linux-input+bounces-16907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB7D0BF07
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 19:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD81A3024265
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 18:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCEC363C51;
	Fri,  9 Jan 2026 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EA+Mr6LC"
X-Original-To: linux-input@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA152DC76D
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984608; cv=none; b=h3/oxuOe83nTBATb5NorKt4Oi6rfRIm0SjJH2a5N/nwxD8yASjlz1inNd+nnJsMDD+JLRfK/boTlgCZyiJijMsw3uDFOUJpF67ouzmLmc0cf8ga30bmjo77Acxh58WxZNtmpOhkuJJw02LyzYBAHwkmSvsX/Xu4dJSNjbrw035k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984608; c=relaxed/simple;
	bh=kNZDi4PouA5ysECu4OljUJ+SIqICtp/OzbMttetmQ0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnT8UCUYkL9dJ9irLMTYwvelyXmCvWRrh7ru+mzSq3r1HUNuJuNUNUMQBgo1yR1H60d1EXYS0UP2JN2FgZ06lTtm4toW/ZSUmeJlU2In0NO3p9kg4UyewK77lb2QN0Rqk7lYavJfA9GtbHj8f8luP0RMc0m3yMggUtd22mDHvws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EA+Mr6LC; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767984603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcYtpXxzyX/CMZF9iakQ3HFggQYBdT25wRsLTnOoPdM=;
	b=EA+Mr6LC2wzBX8R1oW/w4jlXkR2k3lgfgLtEZPv5w1xQJpUpIqdPWsU0Sunl+HtvdifhDs
	DJvR+qjMjvwluGdh3Hwwu7Y4fZdTEMuh4DCC5zZd3CkRmmURHoC82/dQAhY9hOwkdw9SPm
	7XTzyiDYyqNVLHk/N9YFJfjSkps1KKc=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Mykyta Yatsenko <yatsenko@meta.com>,
	Tejun Heo <tj@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: [PATCH bpf-next v1 10/10] bpf,docs: Document KF_IMPLICIT_ARGS flag
Date: Fri,  9 Jan 2026 10:48:52 -0800
Message-ID: <20260109184852.1089786-11-ihor.solodrai@linux.dev>
In-Reply-To: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add sections explaining KF_IMPLICIT_ARGS kfunc flag. Mark __prog
annotation as deprecated.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 Documentation/bpf/kfuncs.rst | 44 +++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
index 3eb59a8f9f34..b849598271d2 100644
--- a/Documentation/bpf/kfuncs.rst
+++ b/Documentation/bpf/kfuncs.rst
@@ -232,7 +232,7 @@ Or::
                 ...
         }
 
-2.3.6 __prog Annotation
+2.3.6 __prog Annotation (deprecated, use KF_IMPLICIT_ARGS instead)
 ---------------------------
 This annotation is used to indicate that the argument needs to be fixed up to
 the bpf_prog_aux of the caller BPF program. Any value passed into this argument
@@ -381,6 +381,48 @@ encouraged to make their use-cases known as early as possible, and participate
 in upstream discussions regarding whether to keep, change, deprecate, or remove
 those kfuncs if and when such discussions occur.
 
+2.5.9 KF_IMPLICIT_ARGS flag
+------------------------------------
+
+The KF_IMPLICIT_ARGS flag is used to indicate that the BPF signature
+of the kfunc is different from it's kernel signature, and the values
+for implicit arguments are provided at load time by the verifier.
+
+Only arguments of specific types are implicit.
+Currently only ``struct bpf_prog_aux *`` type is supported.
+
+A kfunc with KF_IMPLICIT_ARGS flag therefore has two types in BTF: one
+function matching the kernel declaration (with _impl suffix in the
+name by convention), and another matching the intended BPF API.
+
+Verifier only allows calls to the non-_impl version of a kfunc, that
+uses a signature without the implicit arguments.
+
+Example declaration:
+
+.. code-block:: c
+
+	__bpf_kfunc int bpf_task_work_schedule_signal(struct task_struct *task, struct bpf_task_work *tw,
+						      void *map__map, bpf_task_work_callback_t callback,
+						      struct bpf_prog_aux *aux) { ... }
+
+Example usage in BPF program:
+
+.. code-block:: c
+
+	/* note that the last argument is omitted */
+        bpf_task_work_schedule_signal(task, &work->tw, &arrmap, task_work_callback);
+
+An exception to this are kfuncs that use __prog argument, and were
+implemented before KF_IMPLICIT_ARGS mechanism was introduced:
+  * bpf_stream_vprintk_impl
+  * bpf_task_work_schedule_resume_impl
+  * bpf_task_work_schedule_signal_impl
+  * bpf_wq_set_callback_impl
+
+These are allowed for backwards compatibility, however BPF programs
+should use newer API that omits implicit arguments in BPF.
+
 2.6 Registering the kfuncs
 --------------------------
 
-- 
2.52.0


