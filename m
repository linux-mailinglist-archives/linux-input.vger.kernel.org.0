Return-Path: <linux-input+bounces-17149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210CD3873B
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 21:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C533B302EC5F
	for <lists+linux-input@lfdr.de>; Fri, 16 Jan 2026 20:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CDF3A7F5F;
	Fri, 16 Jan 2026 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TFDtfVTU"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59D3A4F2F
	for <linux-input@vger.kernel.org>; Fri, 16 Jan 2026 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594707; cv=none; b=U/836lecA5qtKD78LvXa+cH26pNDqenfsnvVYAMk3QtfumBHIBhluNDP89IpqAzvhOu1TSC3qsMtvyw/mf1D+/MldNmFsKvZMSE7IBFfqxkDp+icqpZkUREYOJb9O2iwQk+9u1kfJtbl/DnY97GP7KDd5dQfgnnYouUL+dcaMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594707; c=relaxed/simple;
	bh=qenoQogq89G2cTNXDnLixTWZqS10Czig+sw2NHrxL8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3oSJ3yQGKrHGdyFPFn3H8895LeSEWaBsDT0Qq/GG91WPUy0+OlzJ6vVMtosnW/gvb5no0C/viPnY/t5mTeo6dEJy3C1UO13Kziyo6MYpLtUakkUBAwv7Uh1brmB4l0k3LLFVfSHVUzz96S3JIxIpkJdwGTWKc76z1VwVw0LTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TFDtfVTU; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768594701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxpuRAc9cdYDyka/2Lt8vnO2Bn4+YQY3rKrMJRNLA8U=;
	b=TFDtfVTUf5WiGQIBQvoVHEUqYI1fVIeW/nxX20XwH5TtGNFnn1JnFD4tUT1ay8vdSAheFo
	76uzBI7fBw8hSafL7V9LRx59mX+fBsqwsrU33FTHHNL4KshhbJhrE9zU3+Qk3mEcifjt5T
	kEWvUczDP2xZ29/6/rcLitzX017Ss3k=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Mykyta Yatsenko <yatsenko@meta.com>,
	Tejun Heo <tj@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: [PATCH bpf-next v2 12/13] bpf: Remove __prog kfunc arg annotation
Date: Fri, 16 Jan 2026 12:16:59 -0800
Message-ID: <20260116201700.864797-13-ihor.solodrai@linux.dev>
In-Reply-To: <20260116201700.864797-1-ihor.solodrai@linux.dev>
References: <20260116201700.864797-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Now that all the __prog suffix users in the kernel tree migrated to
KF_IMPLICIT_ARGS, remove it from the verifier.

See prior discussion for context [1].

[1] https://lore.kernel.org/bpf/CAEf4BzbgPfRm9BX=TsZm-TsHFAHcwhPY4vTt=9OT-uhWqf8tqw@mail.gmail.com/

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 kernel/bpf/verifier.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c2abf30e9460..5f2849ea845c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12211,13 +12211,6 @@ static bool is_kfunc_arg_irq_flag(const struct btf *btf, const struct btf_param
 	return btf_param_match_suffix(btf, arg, "__irq_flag");
 }
 
-static bool is_kfunc_arg_prog_aux(const struct btf *btf, const struct btf_param *arg);
-
-static bool is_kfunc_arg_prog(const struct btf *btf, const struct btf_param *arg)
-{
-	return btf_param_match_suffix(btf, arg, "__prog") || is_kfunc_arg_prog_aux(btf, arg);
-}
-
 static bool is_kfunc_arg_scalar_with_name(const struct btf *btf,
 					  const struct btf_param *arg,
 					  const char *name)
@@ -13280,8 +13273,8 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 		if (is_kfunc_arg_ignore(btf, &args[i]))
 			continue;
 
-		if (is_kfunc_arg_prog(btf, &args[i])) {
-			/* Used to reject repeated use of __prog. */
+		if (is_kfunc_arg_prog_aux(btf, &args[i])) {
+			/* Reject repeated use bpf_prog_aux */
 			if (meta->arg_prog) {
 				verifier_bug(env, "Only 1 prog->aux argument supported per-kfunc");
 				return -EFAULT;
-- 
2.52.0


