Return-Path: <linux-input+bounces-16991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE4D14342
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09E33300B360
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B996374170;
	Mon, 12 Jan 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN7OMXNY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE5374166
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236970; cv=none; b=K+6+Jm7GpVNvRC6VjiTD0PwXdU/EQVCXu0cZfgCTvIQySelHMFVpUjiUf4oM2FCXyiLbZDHpKJNQv9RqJoUqsmjs703GOAY/VEf93yiVuc4LF5ZnGXjd09VkIZMn1c9Ufet+583hadR+tvwwj8JLx+Xxlr7VYFKVcDXOdpF65bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236970; c=relaxed/simple;
	bh=wC5EYvrli+B4rkBJk8LAcz/nVx1foABD/QgvBsjbnmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAtyk1WFh/kl/AHLfVSiHBhXxwyjbvSaGe00SZeKcSJPP1JYj61IlW9OPuDRBUzfb4iUJTka5fLYxd/ZJefjYHP/P5EQLKvtR+7j7Qt2/9M9LgYlzAfe6HiwPa93WNHz7lgt/lKBybiTWEJCeOT6ttivm2kpjJ0gh9AAxh6aIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UN7OMXNY; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so4192435a12.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 08:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236969; x=1768841769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze4qHmASAwrj5Onk0qJN7LV+EYaF4QvTW/sipsaAIXs=;
        b=UN7OMXNYOUW/Ndssw1KamjFltN5wkSY/n4xtgw6zloVnT/miEz46OkXX8i/Xjw1wos
         RZWgXEHiFljEoBn4xi7u6sujsu1Tn1z9dapxsC9qrky9XVEmnKMRIjSvvrSqAaM6kosg
         BYvlH/X4MNa7o2LL3ZJdzlBeDuQdxN+TPE0iZWtql5ILfxf7BvpopoX4HcPG+MUrrlL/
         tkm95J4EWwm6nlikFIgx3QmPU4rMXF4YHo2+hk/+Yc8xvHSpyoDRRv6c1sa9osAHzOjC
         pMdKVvK1Zl2TZfgab1VZZErX2dPgQsddnNbXMJjvuLCTh9qGOiPF8S4Xj0qKpzyIvNIT
         WreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236969; x=1768841769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ze4qHmASAwrj5Onk0qJN7LV+EYaF4QvTW/sipsaAIXs=;
        b=OUc1RUIOfo3QPI7dOAa04Gbsb8zbKu0l3iCGdniEWVnC8Q9WG42khDvzb5NwWaShGR
         XsBBxNQWdwJdZN7GDFZxoH2z9dBy34jqefgvgEmdlzFJi19fiyTwsRntR0iy8t0wxpEY
         5rZZdGNObXHXkFbeDpQwxiSec65+ohTfwIBzaqRftTiP/B3Col+cEVur8OkgzqkizrHJ
         c08xiyMXwy7CGTbTmBHZhmHmW/24mhl3Z7g2ClxRG04IlOkstWGBG5mldDjKHn6RrIOW
         qVwSPY1oMTMyBJjPVQkiebf66zbTYxe1DIA8CeUR1t7YCdbf55vYQy+VTbXIUbKcpliL
         40Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXdpdxJnKi8DuERQYBRljtqqiGCjamCzBAI2O/oUmyOqkAgFl4RTSL4PEKrVUUWeo1O0p5wtmi7dRoY/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGlkrzZG8/0jgE3pZLh7Mh5MbBUyUN39bDX8e/1fnV3ISspkau
	9sYwfZ1MqCzzuP/92ihPy1nsDD1IjKt3h146sP1nwdMHN3EbmQ/j7Zf9HpBz++CPMI2iaUo5oVZ
	TbGQE/IyRHffctfYZFUIbORE6dlTxMqI=
X-Gm-Gg: AY/fxX7sqm4tHYHqYOAFNksX1UbGXNF0+J44it3j5qVthIaXJ9HV3iNbCvRyZAFkCPF
	1qSa1Cm7Tgny1cLia5QPdNCm+aai4+X2XuwJ9LGGbdiemHCXiR3zpxzKWZDxl4lW77sSp9+ix0D
	OKG7/RgUqzK++F30jgiQErDY/mw/1HeyVrIBUX6/rjv7bpAU9CJRqEtERGvvzQuw4lzYf4/67fW
	lUAhWdRs+jvySAa8mv9vfriXpcsEDBn7l215JY9M5WDwMuf+RQQPKO2A3YyfW0RXP1+OUnZ+aPk
	4R9b/VVfOSE=
X-Google-Smtp-Source: AGHT+IHrl/h2Ots2lgfpUAoGNkMmDwh476efMYwDJDQbJX4X9du6cARVeJ6bq2ED4dzJ/HJjrt1rMcohWTQdUM88iQ4=
X-Received: by 2002:a17:90b:4c43:b0:34a:b8fc:f1d8 with SMTP id
 98e67ed59e1d1-34f68ceadd1mr19111550a91.37.1768236968660; Mon, 12 Jan 2026
 08:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
 <20260109184852.1089786-6-ihor.solodrai@linux.dev> <CAEf4BzZfuqpdwghCZ_TJJyt3Dm=xCBJLz3H0bbtabgToNV7V+A@mail.gmail.com>
 <32fe65fa-ecfb-4cba-bd0c-61155bca637b@linux.dev>
In-Reply-To: <32fe65fa-ecfb-4cba-bd0c-61155bca637b@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 12 Jan 2026 08:55:53 -0800
X-Gm-Features: AZwV_QgmknNkqO_SHLPrJvKc19a4KKDGobAbn9jxV56AYe0HDgtT9buX1KR3TPE
Message-ID: <CAEf4BzbbvZgam-3MBEh==T5Zb+TRKbqRwoFcObvD0B8vjXb2pA@mail.gmail.com>
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

On Fri, Jan 9, 2026 at 5:30=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> On 1/9/26 3:25 PM, Andrii Nakryiko wrote:
> > On Fri, Jan 9, 2026 at 10:49=E2=80=AFAM Ihor Solodrai <ihor.solodrai@li=
nux.dev> wrote:
> >
> > [...]
> >
> >> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/to=
ols/testing/selftests/bpf/test_kmods/bpf_testmod.c
> >> index 1c41d03bd5a1..503451875d33 100644
> >> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> >> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> >> @@ -1136,6 +1136,10 @@ __bpf_kfunc int bpf_kfunc_st_ops_inc10(struct s=
t_ops_args *args)
> >>  __bpf_kfunc int bpf_kfunc_multi_st_ops_test_1(struct st_ops_args *arg=
s, u32 id);
> >>  __bpf_kfunc int bpf_kfunc_multi_st_ops_test_1_impl(struct st_ops_args=
 *args, void *aux_prog);
> >>
> >> +__bpf_kfunc int bpf_kfunc_implicit_arg(int a, struct bpf_prog_aux *au=
x);
> >> +__bpf_kfunc int bpf_kfunc_implicit_arg_legacy(int a, int b, struct bp=
f_prog_aux *aux);
> >> +__bpf_kfunc int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, void=
 *aux__prog);
> >> +
> >>  BTF_KFUNCS_START(bpf_testmod_check_kfunc_ids)
> >>  BTF_ID_FLAGS(func, bpf_testmod_test_mod_kfunc)
> >>  BTF_ID_FLAGS(func, bpf_kfunc_call_test1)
> >> @@ -1178,6 +1182,9 @@ BTF_ID_FLAGS(func, bpf_kfunc_st_ops_test_pro_epi=
logue, KF_SLEEPABLE)
> >>  BTF_ID_FLAGS(func, bpf_kfunc_st_ops_inc10)
> >>  BTF_ID_FLAGS(func, bpf_kfunc_multi_st_ops_test_1)
> >>  BTF_ID_FLAGS(func, bpf_kfunc_multi_st_ops_test_1_impl)
> >> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg, KF_IMPLICIT_ARGS)
> >> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg_legacy, KF_IMPLICIT_ARGS)
> >> +BTF_ID_FLAGS(func, bpf_kfunc_implicit_arg_legacy_impl)
> >
> > (irrelevant, now that I saw patch #8 discussion, but for the future
> > the point will stand and we can decide how resolve_btfids handles this
> > upfront)
> >
> > I'm wondering, should we add KF_IMPLICIT_ARGS to legacy xxx_impl
> > kfuncs as well to explicitly mark them to resolve_btfids as legacy
> > implementations? And if we somehow find xxx_impl without it, then
> > resolve_btfids complains louds and fails, this should never happen?
>
> Eh... I don't like the idea of flagging both foo and foo_impl.
>
> If we use the same flag for legacy funcs, the flag becomes
> insufficient to determine whether a function is legacy or not: we also
> have to check the name (or something). This could be a different flag,
> but I don't like that either.
>
> For legacy kfuncs that we want to support, I don't think we have to
> enforce anything. We allow to use old API, and the new one if it's
> implemented.
>
> Are you suggesting to ban _impl suffix in names of new kfuncs?
> Fail build on accidental name collision?

This is super low probability, but yes, I was trying to avoid
accidental _impl-named functions to be reused. But as I said, I don't
believe this will happen in practice, so might as well just ignore
this, if you don't like KF_IMPLICIT_ARGS for legacy stuff.

>
> We could implement sanity checks like these as separate passes in
> resolve_btfids, for example.
>
> >
> >
> >
> >>  BTF_KFUNCS_END(bpf_testmod_check_kfunc_ids)
> >>
> >>  static int bpf_testmod_ops_init(struct btf *btf)
> >> @@ -1669,6 +1676,25 @@ int bpf_kfunc_multi_st_ops_test_1_impl(struct s=
t_ops_args *args, void *aux__prog
> >>         return ret;
> >>  }
> >>
> >> +int bpf_kfunc_implicit_arg(int a, struct bpf_prog_aux *aux)
> >> +{
> >> +       if (aux && a > 0)
> >> +               return a;
> >> +       return -EINVAL;
> >> +}
> >> +
> >> +int bpf_kfunc_implicit_arg_legacy(int a, int b, struct bpf_prog_aux *=
aux)
> >> +{
> >> +       if (aux)
> >> +               return a + b;
> >> +       return -EINVAL;
> >> +}
> >> +
> >> +int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, void *aux__prog)
> >> +{
> >> +       return bpf_kfunc_implicit_arg_legacy(a, b, aux__prog);
> >> +}
> >> +
> >>  static int multi_st_ops_reg(void *kdata, struct bpf_link *link)
> >>  {
> >>         struct bpf_testmod_multi_st_ops *st_ops =3D
> >> --
> >> 2.52.0
> >>
>

