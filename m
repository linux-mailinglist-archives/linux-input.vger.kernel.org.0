Return-Path: <linux-input+bounces-16920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B822D0C896
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 00:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0986E300C9B8
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 23:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB1633B6E9;
	Fri,  9 Jan 2026 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnON3o7B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511133A033
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001134; cv=none; b=QBiYpyZQjib6We7m3YYWPX+PcMginny/PnWBIwtASVdaui/8o+v23IUUlIn2QzDUxmEXV0zYvD4O/C0R4hdCxDuaHSQ0cI8lIDbniAPhlT3HiL9kw11yX4LISAmuwWR3hCJQCpWHFMCYDYMCc+6bRethBAC/JFLgUaRvFl3i0xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001134; c=relaxed/simple;
	bh=u7obPu1pBmzU0WGrbzd5pVmCa0nTdZyqTHXFpTUeBuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0y/mDWA+HdpwwcZgYCXoW0P4Wz1jyPmgwUcnJSH687sDpuYSa2qrZQwQcTKzHR4VV6utzvpJrqEItZtdLnPJX+doYfFuA2KEtdXKEsy81sscLB855LlA6e6bSAt/Y+t+EELobvbpYiUfHCNkjwuWSn5xpQ7WxxUVbI74ap24CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnON3o7B; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so703045b3a.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 15:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768001130; x=1768605930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCUQNo7mxSC8vkmePvOCKj2aGkP0nJSpQiMFJJI16iQ=;
        b=mnON3o7BDYo95GaLThE9HZXUSqSGXzDoLKWtVP/hyg38TB9pqkkBKaBODlinySZwLI
         RQrWKwftL0wUlS7qFju2TB0qWRPAt0929VH61Wc26hWwGblCHJHlgcCzNrOf2H0DTkCK
         FR/zKnROgIFgC2TrtjEPOqDmnyT713pyevyx9CI0z7rQmarIT0CqzSB7ghADjeJ0E+b6
         rvaS+U0xmp4v3NeHzbHU3p9NIcl9q3NmCpO7/jlETni92hYegzkFvFEmNCvKS0OU0l9Z
         XbrB4d9ZVDfVvSIsJJyfT1lyVGUxW+UBY38hidethHuVBuGQ3WMJmQsE3cGb/Q4aWwhc
         nelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768001130; x=1768605930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCUQNo7mxSC8vkmePvOCKj2aGkP0nJSpQiMFJJI16iQ=;
        b=UARPTQSYL6MTHysb4ZGG2bfpb7P84LkzakWTeP9usx3aMxddYH2Y8CRCfZ8e/iEVSB
         tC855zF24t+2l8tCnYJGd2D5Oei6Z3u6NJ6RVMHdhimErCTztVNXKKCLFceYhJhPvVWl
         UPGDxxT2i1SssvY/wXUOyOy/zHHWbvvQv5KylxqjvtUe/B57q6hxcTEyOb+eycfVgrup
         85eDqzyjTrE1dIUnG13tqeXX7F0mYVZu0cDWo0BJDk0QowrcCq9z9Ao3BZ9AIxlLVHIu
         VlO3W9Y05uarjVVZqO+yYS1sKgnWxnEfdxtBeyN1QoaLl1fvWwuoP0M3xFkAl+BJtH5C
         nGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWnAal9UGUGb7jR1hj2ZSxXg2qQzr/QYL55W9ujH2nLyoCWWoYUzqDJBn1R3DWFZhYKLIV3FQAjqrzfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwn4g+jBXFy32BWMIiOJJN0On063gmFd0Ls+QSkOayC5K7TGTZ
	BybuROlMc4X9amYnGYMV55+XfxWmF2W2a6DwhTpWIUlwXekXxIosk++nCF1QgQWut3j6lzm65VG
	lvL5TEISDbcnPeagOZjZjVZV1qN9RUww=
X-Gm-Gg: AY/fxX4aPvjW55UsgsNOW14BKjGTqr3c57mrYJJyAee/k73uOazquDSpN99GjB7/3C3
	W6IfImCDC9LtQ4GFx77nACR2ZfzKUaC3z7TrkvF8ruuZnHaRd3Lc/lGqLi9U23fwHvf/hBZNrM7
	fC/2OqYsWxLGIrs2idu/kRMlUSr6G0+PedyJ6o3WYHy0fAZIJxPVaXTqbUjA9sz/8G94m60tzTw
	2M/DmAvBYnE50p1Ouhzsd6J6Lwm8iBhREoC1Nlc3dQFfQbuHikn/HNn9WsChkg4+to7BQBLkbbK
	N7lddQR5
X-Google-Smtp-Source: AGHT+IHfdl0DFFsHTVhHGn4++xm9XHvLJknpf551hc1xetbMq7EEy0O5Y6tQKD9GLsiH/IFDZTNgO/HkHtmxCHtZE78=
X-Received: by 2002:a05:6a20:a10c:b0:366:5d1a:c736 with SMTP id
 adf61e73a8af0-3898f88f211mr9018589637.9.1768001130450; Fri, 09 Jan 2026
 15:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev> <20260109184852.1089786-6-ihor.solodrai@linux.dev>
In-Reply-To: <20260109184852.1089786-6-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Jan 2026 15:25:16 -0800
X-Gm-Features: AQt7F2qzahhwWoxdH0F1ChmrKpOGZlbkzZ4pxxwq63_4u0Nd-h9NKx5gelr7ptA
Message-ID: <CAEf4BzZfuqpdwghCZ_TJJyt3Dm=xCBJLz3H0bbtabgToNV7V+A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 05/10] selftests/bpf: Add tests for KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:49=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> Add trivial end-to-end tests to validate that KF_IMPLICIT_ARGS flag is
> properly handled by both resolve_btfids and the verifier.
>
> Declare kfuncs in bpf_testmod. Check that bpf_prog_aux pointer is set
> in the kfunc implementation. Verify that calls with implicit args and
> a legacy case all work.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  .../bpf/prog_tests/kfunc_implicit_args.c      | 10 +++++
>  .../selftests/bpf/progs/kfunc_implicit_args.c | 41 +++++++++++++++++++
>  .../selftests/bpf/test_kmods/bpf_testmod.c    | 26 ++++++++++++
>  3 files changed, 77 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/kfunc_implicit=
_args.c
>  create mode 100644 tools/testing/selftests/bpf/progs/kfunc_implicit_args=
.c
>

[...]

> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026 Meta Platforms, Inc. and affiliates. */
> +
> +#include <vmlinux.h>
> +#include <bpf/bpf_helpers.h>
> +#include "bpf_misc.h"
> +
> +extern int bpf_kfunc_implicit_arg(int a) __weak __ksym;
> +extern int bpf_kfunc_implicit_arg_impl(int a, void *aux__prog) __weak __=
ksym; // illegal

C++ comment

> +extern int bpf_kfunc_implicit_arg_legacy(int a, int b) __weak __ksym;
> +extern int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, void *aux__p=
rog) __weak __ksym;
> +
> +char _license[] SEC("license") =3D "GPL";
> +

[...]

> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 1c41d03bd5a1..503451875d33 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -1136,6 +1136,10 @@ __bpf_kfunc int bpf_kfunc_st_ops_inc10(struct st_o=
ps_args *args)
>  __bpf_kfunc int bpf_kfunc_multi_st_ops_test_1(struct st_ops_args *args, =
u32 id);
>  __bpf_kfunc int bpf_kfunc_multi_st_ops_test_1_impl(struct st_ops_args *a=
rgs, void *aux_prog);
>
> +__bpf_kfunc int bpf_kfunc_implicit_arg(int a, struct bpf_prog_aux *aux);
> +__bpf_kfunc int bpf_kfunc_implicit_arg_legacy(int a, int b, struct bpf_p=
rog_aux *aux);
> +__bpf_kfunc int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, void *a=
ux__prog);
> +
>  BTF_KFUNCS_START(bpf_testmod_check_kfunc_ids)
>  BTF_ID_FLAGS(func, bpf_testmod_test_mod_kfunc)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test1)
> @@ -1178,6 +1182,9 @@ BTF_ID_FLAGS(func, bpf_kfunc_st_ops_test_pro_epilog=
ue, KF_SLEEPABLE)
>  BTF_ID_FLAGS(func, bpf_kfunc_st_ops_inc10)
>  BTF_ID_FLAGS(func, bpf_kfunc_multi_st_ops_test_1)
>  BTF_ID_FLAGS(func, bpf_kfunc_multi_st_ops_test_1_impl)
> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg, KF_IMPLICIT_ARGS)
> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg_legacy, KF_IMPLICIT_ARGS)
> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg_legacy_impl)

(irrelevant, now that I saw patch #8 discussion, but for the future
the point will stand and we can decide how resolve_btfids handles this
upfront)

I'm wondering, should we add KF_IMPLICIT_ARGS to legacy xxx_impl
kfuncs as well to explicitly mark them to resolve_btfids as legacy
implementations? And if we somehow find xxx_impl without it, then
resolve_btfids complains louds and fails, this should never happen?



>  BTF_KFUNCS_END(bpf_testmod_check_kfunc_ids)
>
>  static int bpf_testmod_ops_init(struct btf *btf)
> @@ -1669,6 +1676,25 @@ int bpf_kfunc_multi_st_ops_test_1_impl(struct st_o=
ps_args *args, void *aux__prog
>         return ret;
>  }
>
> +int bpf_kfunc_implicit_arg(int a, struct bpf_prog_aux *aux)
> +{
> +       if (aux && a > 0)
> +               return a;
> +       return -EINVAL;
> +}
> +
> +int bpf_kfunc_implicit_arg_legacy(int a, int b, struct bpf_prog_aux *aux=
)
> +{
> +       if (aux)
> +               return a + b;
> +       return -EINVAL;
> +}
> +
> +int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, void *aux__prog)
> +{
> +       return bpf_kfunc_implicit_arg_legacy(a, b, aux__prog);
> +}
> +
>  static int multi_st_ops_reg(void *kdata, struct bpf_link *link)
>  {
>         struct bpf_testmod_multi_st_ops *st_ops =3D
> --
> 2.52.0
>

