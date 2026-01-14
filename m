Return-Path: <linux-input+bounces-17076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF378D1BE25
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 02:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F12E3021068
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 01:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CFE207A38;
	Wed, 14 Jan 2026 01:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N81vBgDO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B27F1DF970
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352767; cv=none; b=fipSDY95SgpkdevC65RCBeJhSs0faYYrT41rrml1I1PSccq90M2iO3rhleur+/7+B2Zit/buNKi8eJzZTrX0cG37wOkrU7T2gtvs05DOWf6vrQ5RRyEOpIuYydxu6ZHroOKNaGQkRnGUAbV/WhMk9nSTqcJhKcCfBazlu1YTltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352767; c=relaxed/simple;
	bh=F0MA++L1zSE6cZA/Gd+u1+s2DraR/NZOJLoDeRsNESw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQw4HPzYD99Cup9DMD2nHdJmuO4aHOKdaVlzgEcuQzINHq5YNqZyjiwRvyVhJNRctzSyx6iA1lfHyTwj2I0NnUGHX0PDJ3dc7noJF8bQIoynXrfD7WHR+XkH7fgPy+zYfiP4nKv3FFv+/wV8MbicGSkuTyjNH4gSuHw4eAUd7wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N81vBgDO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso6274916a91.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 17:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768352765; x=1768957565; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c3zz/uR4XC6DTt4ifQZ0dcMHOsCy5LDTuF26jxx7ZX8=;
        b=N81vBgDOidwbWegdOLTzxZRlkJsuRzkf2m1Ac3RyTnuoid5sGLxIr8Kp/N6U+lX+9L
         gpYjaJIsFOHcjh3hXfIjkcVoZRaHkz3EHcr60ybtpC6kHCBG+FQeT+nmIagQOF75ZjrV
         S/0GIxlRNzM0qtuMy76aY9Mw8WgqwvB2gS23FGcuVBtrHxZljQ2tQ+bbW06VrK6u/0yW
         VoeY5pCZ1w7AKNKK2HHc3LmZVARxb3PGrwpml3BbTxtdTC6TusHyd5H7QvhLzuoDnqyQ
         Zy8s3+/RqlVjnIKkyKKXb+jOpb2g4gprhwM9yjO9ki96PEamrCw7C9X6Ma+QBShSPf+i
         D9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768352765; x=1768957565;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3zz/uR4XC6DTt4ifQZ0dcMHOsCy5LDTuF26jxx7ZX8=;
        b=V4YzA4smQbPULRWctcBlxOUucvIGA40hRs+bgXBQ1SOEfTNq6QppbQ9eF2EcDY04vO
         8q0hXWjFNFWcnYxTvi3PUvqMAHeXvZmuxZoTkftf/ntKsBXga/t+KDRfQwlljdBMMdWc
         6LUAftDQXpuEUs08XnxCUGs5ujLStl+dooe2REP1uRNR8heQfGs/AaJ+eSBjpglTrYRn
         lulCr/wfiwqG43gF5v85uth1uQib3WC7gbtAPUuD1cCzduaa1AoZVoJdov5Xs4ogbCHe
         2IfAbWFhAMaHql+sHpFj33IyAhR21tG6bNRMDAx+Abq3WINOR1RTpS2t6aGTj1V43AbH
         pKig==
X-Forwarded-Encrypted: i=1; AJvYcCVZre+VduRF4mWrm7JTeJVOPUSCgw0kwF7BO8oPgiYrjAZb4ww7y28GU44rgoicUS2XE6UiEmbg+pgHgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGP+rdOwtPsn4HLiMshbXG+GaJUnOHxfMYXYAm6jRDKpjX2+3
	VIJzgeGceGrIjHoKHKoLdRCaY8/TT5m1FZ/tPPw8M92Yea2hOMLpKFWT
X-Gm-Gg: AY/fxX77ZVQU4ntMBmT1ShXCwdLdIYB3kxUDJgBRUriVWIm+5DRPNvdvNv4g/P4tZ5K
	RdxHmj/pzXBj6ZsPqfhg4JEG01S7iAFwTLoxZziLpEQYpkpCFRKSXjmlwr26gpaL4zAGvRD6Qad
	N0rF53y47AyRiz3Su6hZg1mQA+aPMvLhL6HskUgshOVuzrJWgok2INyh1kYDq4TfQD+xYVmIK/5
	3/g2Amja4sU3GHD49fJyhhfMi6A6rLvxr+JLhUgkyhT6j8/3fA4aPL1RqaZvM6wlLP2naqX92O8
	UToiwgsuPeCHfqqN73kmezW7Ug+Wnbxka12e5sbjVEslk/Ihp8zsq9xmBpxvRJYxb5Zw9Kgz9lP
	pRh7YU/AXQoQDXGv9g/WPvbyWnpQzH0hKS+ZpN0Yj6IhLUs5ft5nXQ8FS55CiMIWONj1cfFvIlM
	Ku8pOMdfJjC9VT1BzEqzE7Xyz4ZSWzpsRc2UDZREF/
X-Received: by 2002:a17:90b:3890:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-3510913e139mr874413a91.32.1768352765322;
        Tue, 13 Jan 2026 17:06:05 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-351099d0913sm322048a91.0.2026.01.13.17.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:06:04 -0800 (PST)
Message-ID: <5027595d4eff50d423af8ebc5fecd6a0f7229d60.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 03/10] bpf: Verifier support for
 KF_IMPLICIT_ARGS
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, Alan
 Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina	 <jikos@kernel.org>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-input@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Tue, 13 Jan 2026 17:06:02 -0800
In-Reply-To: <aff8eeed-414c-49b3-b7f0-c8c328ed5199@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
	 <20260109184852.1089786-4-ihor.solodrai@linux.dev>
	 <18d9b15319bf8d71a3cd5b08239529505714dc96.camel@gmail.com>
	 <aff8eeed-414c-49b3-b7f0-c8c328ed5199@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 16:03 -0800, Ihor Solodrai wrote:
> On 1/13/26 1:59 PM, Eduard Zingerman wrote:
> > On Fri, 2026-01-09 at 10:48 -0800, Ihor Solodrai wrote:
> >=20
> > [...]
> >=20
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -3271,6 +3271,38 @@ static struct btf *find_kfunc_desc_btf(struct =
bpf_verifier_env *env, s16 offset)
> > >  	return btf_vmlinux ?: ERR_PTR(-ENOENT);
> > >  }
> > > =20
> > > +#define KF_IMPL_SUFFIX "_impl"
> > > +
> > > +static const struct btf_type *find_kfunc_impl_proto(struct bpf_verif=
ier_env *env,
> > > +						    struct btf *btf,
> > > +						    const char *func_name)
> > > +{
> > > +	char impl_name[KSYM_SYMBOL_LEN];
> >=20
> > Oh, as we discussed already, this should use env->tmp_str_buf.
>=20
> The env->tmp_str_buf size is smaller:
>=20
> 	#define TMP_STR_BUF_LEN 320
>=20
> *And* there is already a local char buffer of size KSYM_SYMBOL_LEN
> already in use in verifier.c:
>=20
> 	int bpf_check_attach_target(...) {
> 		bool prog_extension =3D prog->type =3D=3D BPF_PROG_TYPE_EXT;
> 		bool prog_tracing =3D prog->type =3D=3D BPF_PROG_TYPE_TRACING;
> 		char trace_symbol[KSYM_SYMBOL_LEN];
> 	[...]
>=20
> Since these are function names, the real limit is KSYM_SYMBOL_LEN,
> right?
>=20
> Sure >320 chars long kfunc name is unlikely, but technically possible.

320 is good enough, you'll be able to cover this:

kfunc_trace_long_descriptive_kernel_symbol_for_tracing_scheduler_memory_io_=
and_interrupt_paths_during_runtime_analysis_of_latency_throughput_and_resou=
rce_contention_on_large_scale_multiprocessor_linux_systems_using_bpf_and_kp=
robes_without_requiring_kernel_recompilation_or_system_restart_for_producti=
on_use_cases_v2x

But not this:

kfunc_trace_kernel_scheduler_and_memory_management_path_for_observing_task_=
lifecycle_events_context_switches_page_fault_handling_and_io_wait_states_wh=
ile_debugging_performance_regressions_on_large_multiprocessor_systems_runni=
ng_preemptible_linux_kernels_with_bpf_tracing_and_dynamic_instrumentation_e=
nabled_for_deep_visibility_into_runtime_behavior_and_latency_sensitive_code=
_paths_without_recompilation.

Should suffice, I think.

