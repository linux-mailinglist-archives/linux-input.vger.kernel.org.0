Return-Path: <linux-input+bounces-17077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A3D1BF25
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 02:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60DD33011A49
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 01:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCAC2E1F02;
	Wed, 14 Jan 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fplx9l7m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660E62E0402
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354514; cv=none; b=g7CY9UtJtdRKX5NOhbHqjfVVtx1eU0ktfC9dC5jA5kj4t3/uwJKSmErUywLIvVsFfAX1ozu4n1H5t2fsQ/22nsCf483NcNcsiWrmi2JGLqy+86J4Q5wewEgSkkbNxlD4Beex5QldDYXfMa+c9aw/BHWn3PDLvIbNo3L0gsfr6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354514; c=relaxed/simple;
	bh=0PILchQj3J76ZAr261KJtaEQ2QxT7WEQn+1Ge6Oxu6A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVzY3OVgVpe5mMpTbZPCZuiDqsXTOAvuQKH6kjuofFO/2FPbACe6uEP4a8YQO6pf/6VObW1Walat2L1AvNNVmejTKo0iOSj5l0q+dGA8qWCmGnbYKxn+iRXeTNm2ZSYJl+444bkwEjzj/qG4I6yL1lZxNobeJxtRscUtV7UrGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fplx9l7m; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f1bc40b35so88884915ad.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 17:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768354512; x=1768959312; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ieZaHREaNUdn6zv47XqVz3diRO7gdSg8y8kBpzF75Sk=;
        b=Fplx9l7mxDdNLK29OA1kIVFJuNMtbZxtldMkWzcWsDk4IvMbeAgRaymG+x3XoBDSRG
         2xyuDZ4fkhFOyrbvgLh7eq9xfUtoy6jR0D/YB/AClyB4tPYpP3m7yCgdSmlFfThYv4IG
         Z8gRB3Tj/qNcWYyMahGSuMgRaQ5RMqUtw9RcJHEaMBtH08wDNCrNKYzC4AutoD/RqJxI
         uG6/G7xxtlAVvw7Qyx14vMbwQxs193/965CtNjdFYnVGoFZJFIXiFw6JgOmswiIZu4nS
         EtZMjyPx+PyH1/7ezlXeiJnE6eg26aODGCnH6g7mFXK8anTz2VndAdJrk/3FDosavZRN
         AvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768354512; x=1768959312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ieZaHREaNUdn6zv47XqVz3diRO7gdSg8y8kBpzF75Sk=;
        b=ez5GGdrIfNaVcD2aaXLfZDvP88LAb+cxHKw0N1x0fVD65yIwu86PS53etuvQ/aUVEw
         CmMQkW57c4Le5uiWaZNZtL3WCdMakgTkFZ5CxC6OI5Wd5WR5NOhYD8NpevbArbbsY9lB
         aCy7HL7Y0CEAQdunzc7TBezgT6jZK0fyNqJXJCMsYKMtESyaqTdEI2a6AXFziDGkt5li
         1Mfw/N6uU1lfCaEevilBMf4Lwy1mXipAK6++dvjIF2Dz4MTMEnA/k1cgCu5tPY4lDOyt
         Ay2wReRWvA2EDHDExs43uPFo/yFCL2xijSTR8IbfoVyUZSrUaH1+984mVGPXFfyXDSnf
         y//g==
X-Forwarded-Encrypted: i=1; AJvYcCXcRLSW+ValzmMrGj5Z5z20srIjnEup22GBlqRR+k+bpdnfqFX6HJHUnJYxuf8bwD4VtPaebs+xsDk8ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92PrUnOVsi0ZrYB/NNKcfZq8HvPnKrwi39gbmRdjnXZRQ4/dF
	Y1Ro+x94e4hNwxYTKviwDv1mbDBoSRC0HvyuEpnCk5dFs4lJu1krxS8Z
X-Gm-Gg: AY/fxX4aaMAtcdAIO1eL0KJqET9U90GOYvXIQRXyL62U+9sQc47kfNCkl00e1Ghzfbv
	JKqpyGIws/rmxH7pOVojqfOI+uBCYyGaf1ImEhjie/r9IyO0czY2F9ktiirwL+8tBMFtsMiMRpq
	qykJArgqVvXma+ht7Z/tMisUmKz2yBmPYBWUOOekhR/NJim2z+u7A2GQtmVIYNhN7mQ8CHApXjV
	tvnsHAzFK8MQ1TvzmY6fUPZmTi6atDjtT/9l6c/atYTlFL2JJMkfYgPQx+57BDflymRoutp+Sh9
	axISjk9csS1I//84YQ5z7glTTAGL8zHjfqogRatXJRQJQAXjVHLK1pg/0dJy7L4IwfHeHoL/W8F
	7jlsUsIhWWGoaK9d9zfCjELH4jRTr9xMparZV5D5X8k8J0ByF27ZtuKg4SUguWACStZ88YLyqcV
	gXacBd1xTvPqLHiapTAP68apFm/iUKwG3ATJ64WEAL
X-Received: by 2002:a17:902:d58a:b0:2a1:5d2:2e45 with SMTP id d9443c01a7336-2a599e7cc41mr11109465ad.59.1768354512488;
        Tue, 13 Jan 2026 17:35:12 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492fsm89974945ad.98.2026.01.13.17.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:35:12 -0800 (PST)
Message-ID: <b4a760ef828d40dac7ea6074d39452bb0dc82caa.camel@gmail.com>
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
Date: Tue, 13 Jan 2026 17:35:09 -0800
In-Reply-To: <c7e2a776-52f9-46ad-8422-3a9202bbd9f1@linux.dev>
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
	 <20260109184852.1089786-4-ihor.solodrai@linux.dev>
	 <952853dd064d5303a7e7ec8e58028e9ee88f2fad.camel@gmail.com>
	 <93ecdc25-aa5e-485b-8ff4-a9db3b585861@linux.dev>
	 <c7e2a776-52f9-46ad-8422-3a9202bbd9f1@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 15:48 -0800, Ihor Solodrai wrote:

[...]

> A follow up after a chat with Eduard.
>=20
> This change in check_kfunc_call() appears to be working:
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 092003cc7841..ff743335111c 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -13958,8 +13958,11 @@ static int check_kfunc_call(struct bpf_verifier_=
env *env, struct bpf_insn *insn,
>                 regs =3D branch->frame[branch->curframe]->regs;
> =20
>                 /* Clear r0-r5 registers in forked state */
> -               for (i =3D 0; i < CALLER_SAVED_REGS; i++)
> -                       mark_reg_not_init(env, regs, caller_saved[i]);
> +               for (i =3D 0; i < CALLER_SAVED_REGS; i++) {
> +                       u32 regno =3D caller_saved[i];
> +                       mark_reg_not_init(env, regs, regno);
> +                       regs[regno].subreg_def =3D DEF_NOT_SUBREG;
> +               }
> =20
>                 mark_reg_unknown(env, regs, BPF_REG_0);
>                 err =3D __mark_reg_s32_range(env, regs, BPF_REG_0, -MAX_E=
RRNO, -1);
>=20
> https://github.com/kernel-patches/bpf/actions/runs/20975419422
>=20
> Apparently, doing .subreg_def =3D DEF_NOT_SUBREG in mark_reg_not_init()
> breaks zero-extension tracking somewhere else.  But this is not
> directly relevant to the series.
>=20
> Eduard, Alexei, any concerns with this diff? Should I send a separate
> patch?

Imo this is acceptable to land this series but follow up investigation
is definitely needed. Either there is a bug and mark_reg_not_init() is
called in a context where upper 32-bits are still significant, or zero
extension related code can be improved to avoid patching in some cases.

Additional context for other reviewers, Ihor did two experiments:
- added '.subreg_def =3D DEF_NOT_SUBREG' to mark_reg_not_init(),
  which resulted in selftests failure;
- added '.subreg_def =3D DEF_NOT_SUBREG' as above, which worked fine.

Meaning that code in check_kfunc_call() is not a culprit.

