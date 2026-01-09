Return-Path: <linux-input+bounces-16916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBED0C63A
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 22:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 851373026BED
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 21:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1504933F368;
	Fri,  9 Jan 2026 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StnXoUL9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D533EB02
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995410; cv=none; b=N0noqXrhKDHCszXWi5KerMlNix7QV6542s68xJ1r+TLIqzHcX8+Y6lfC3JzlzyJKqLcw+fjWbq9SALmRda4+vhoCxQSBwtRUfUPgwwYNm9wP1nhftWlh6jd8zkL9Br0lbmRmH+xKjJOxdv9FP6xq6AcvoUj0XxoKv1bEps4VuT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995410; c=relaxed/simple;
	bh=mBMSWquYxXBQQw52dfRLKavEQ3650dPnys2FBUwMDww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEEPTXPogBIgClL3F2/1crr57G1CerHlMEjXcQTcWrzdGSkxmBQwYmxfHhSBWIYnu23M9L7T/ngeZ5vpKWqPRaBaDeXYHZYxcxBcE/CNnTr/H2MKn5LiyDvGsU5d6XgseHQhwtKc3Uth8GDlAixcAbsxAkShfiAC+ynam+ZBPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StnXoUL9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3980257f8f.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 13:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767995406; x=1768600206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl2jfUOFQFw9ZFM/F9NwPFBQh1GrXlHRzkKM76uazgM=;
        b=StnXoUL9YIMvTjkNGsUF1yeyVpEi4B08aYmprhpYsokcO1p0CpqjeS1HKyvHoGgZE2
         kn/ZvEJtnqfShyhTMo3U1cBWBJHiw6U64mNAeXuj433P7ZZxuu7H/JT25MzGQN8aEee7
         XrBreFULSSUDXY5ggGSYbefnIFtWAggM0QWjPPmdxGdj03R/aZmytiiGE4F0Z/Z0p+TQ
         CYMcLqeTrmXRGGauxOdAqD84xJgGIi/83EsAVatM1qjDpqQjsMkJav91yCFtCuuPkOZN
         EXnOI+v8uYhLJGQLdl7pK+UKXpAXkuod7CM3eBMw7FReH8OkQBDwBSZla9rHlBci1KfY
         m3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767995406; x=1768600206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yl2jfUOFQFw9ZFM/F9NwPFBQh1GrXlHRzkKM76uazgM=;
        b=pd0hy3hfZP574H17mjQOVUorIUcGGERuRTrs68ItykGi4mGKmGOpCytrrDFP4palJo
         V1yRDEVaGYyvC8jEhx9SlVDVi49iuv71YQHI+qHUvq7X8Lek0kbvz4kTfFsQKpjDRxEm
         quypJ1/he2KmGL/EotlXMZsTxQs5weSNQK6MMOmpqTXWM3vYXrG5hU5fuq6ywqOucaox
         3aBh33RdAXOk4LYw+CRJbW2D9tSrxas/cCvIJtR8NsNH4zeJULcihITAQsmUJ+4qJwQt
         8UFHxYOm4a507gOZlianKUWwl06Sfp7vH90BNDAiJNhbqO8tY2RmWwIT6e1GDC3Tdzis
         CR5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcoGFNYEkBUR8TTJatDCcq0D34cPAw07a0n4gSsdBrwPGwwdBnRDpEPMTsm7zVWbPLLIS/l728tbtrvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybCLsgBFhE6kWKKpwrBhHrTcv0R1c8rwguGxcTEMCstIEYA9vV
	j/JNEIj8p+a5ybWmov6Xjssmite8nlOniDGSAtoOw7ZCLbnSVtB5t8u+wJQjilP974+EbbyE6Gf
	orBqDzkIw0Yq+rFJQKpwF7wKyXCrinzc=
X-Gm-Gg: AY/fxX7uCrv32vvmD7KJkkMd3/jQ+C1s6QCyhi+a3pk5b5EsmEszocHLYWdOTJibZOL
	okRV1JMNzMVdPyLNCXrthp/FJIEtb6kzEkfCW+vdPnsRNM3ZK0Oi3qRagW/Cc2+mm7jm10fVP0y
	TLB0eN3FwkiBuiWZNStlfHPxm4bjzjE4bYbX4bbXYQ8A5xkU4Egwb/jV4T5GU8+dT3unhk9D9Dw
	ndHzicMWdilzDprbdyEHzrvdiRpmlWrhtSVPQ/SieYGP7bBzzetVygOpMjGY/7xZOVBhg1s0YaY
	LdmIQHw+b4ce6XD34ue5aDU0dH+K
X-Google-Smtp-Source: AGHT+IEpNN2VtUtAub0I99rIc50Il63UXhoIXIO7xQkcbeKDdyOPhjh/6O//ElBqJPm/iBdeBYBhI/6PQzhggWV4zbA=
X-Received: by 2002:a5d:5d08:0:b0:430:f879:a0ee with SMTP id
 ffacd0b85a97d-432c378a075mr13975409f8f.5.1767995406380; Fri, 09 Jan 2026
 13:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
 <20260109184852.1089786-9-ihor.solodrai@linux.dev> <CAADnVQJDv80_T+1jz=7_8y+8hRTjMqqkm38in2er8iRU-p9W+g@mail.gmail.com>
 <b099a95e-5e69-4eeb-a2c9-9a52b8042a85@linux.dev> <CAADnVQ+_AmiwuupkVJTGyKY3KOp68GLuivs2LMEr0M_yaHPUUg@mail.gmail.com>
 <0c4d84ab-1725-45bc-9c1c-8bdc1f5fc032@linux.dev>
In-Reply-To: <0c4d84ab-1725-45bc-9c1c-8bdc1f5fc032@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 Jan 2026 13:49:55 -0800
X-Gm-Features: AZwV_Qg2PKLZpr1E2blvwzcDGguOO_nPvhlw-fT8WZOdgqaH2F_J59Sj-VuHinQ
Message-ID: <CAADnVQ+k-nbq-2PGRSPJDRZ3G9sp9zu3Owqsj7zqO_G+3OQEww@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 08/10] bpf: Add bpf_task_work_schedule_*
 kfuncs with KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 1:39=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> On 1/9/26 12:47 PM, Alexei Starovoitov wrote:
> > On Fri, Jan 9, 2026 at 12:02=E2=80=AFPM Ihor Solodrai <ihor.solodrai@li=
nux.dev> wrote:
> >>
> >> On 1/9/26 11:58 AM, Alexei Starovoitov wrote:
> >>> On Fri, Jan 9, 2026 at 10:50=E2=80=AFAM Ihor Solodrai <ihor.solodrai@=
linux.dev> wrote:
> >>>>
> >>>> +__bpf_kfunc int bpf_task_work_schedule_signal(struct task_struct *t=
ask, struct bpf_task_work *tw,
> >>>> +                                             void *map__map, bpf_ta=
sk_work_callback_t callback,
> >>>> +                                             struct bpf_prog_aux *a=
ux)
> >>>> +{
> >>>> +       return bpf_task_work_schedule(task, tw, map__map, callback, =
aux, TWA_SIGNAL);
> >>>> +}
> >>>> +
> >>>>  __bpf_kfunc int bpf_task_work_schedule_signal_impl(struct task_stru=
ct *task,
> >>>>                                                    struct bpf_task_w=
ork *tw, void *map__map,
> >>>>                                                    bpf_task_work_cal=
lback_t callback,
> >>>>                                                    void *aux__prog)
> >>>>  {
> >>>> -       return bpf_task_work_schedule(task, tw, map__map, callback, =
aux__prog, TWA_SIGNAL);
> >>>> +       return bpf_task_work_schedule_signal(task, tw, map__map, cal=
lback, aux__prog);
> >>>>  }
> >>>
> >>> I thought we decided that _impl() will not be marked as __bpf_kfunc
> >>> and will not be in BTF_ID(func, _impl).
> >>> We can mark it as __weak noinline and it will be in kallsyms.
> >>> That's all we need for the verifier and resolve_btfid, no?
> >>>
> >>> Sorry, it's been a long time. I must have forgotten something.
> >>
> >> For the *generated* _impl kfuncs there is no decl tags and the ids are
> >> absent from BTF_ID sets, yes.
> >>
> >> However for the "legacy" cases it must be there for backwards
> >> compatibility, as well as relevant verifier checks.
> >
> > I see.
> > I feel bpf_task_work_schedule_resume() is ok to break, since it's so ne=
w.
> > We can remove bpf_task_work_schedule_[resume|singal]_impl()
> > to avoid carrying forward forever.
> >
> > bpf_stream_vprintk_impl() is not that clear. I would remove it too.
>
> That leaves only bpf_wq_set_callback_impl(). Can we break that too?

Sounds like Benjamin is ok removing it.
So I think we can indeed remove them all.

> Then there won't be legacy cases at all. It was introduced in v6.16
> along the with __prog suffix [1][2].
>
> If we go this route, we could clean up __prog support/docs too.
>
> I think it's worth it to make an "all or nothing" decision here:
> either break all 4 existing kfuncs, or backwards-support all of them.

I don't see why "all or nothing" is a good thing.
It won't be "all" anyway.
We have bpf_rbtree_add_impl(), bpf_list_push_front_impl(), etc.
And those we cannot remove. sched-ext is using them.
Another few categories are bpf_obj_new_impl(), bpf_obj_drop_impl().
There are not __prog type, but conceptually the same thing and
KF_IMPLICIT_ARGS should support them too eventually.


> git tag --contains bc049387b41f | grep -v rc
> v6.16
> v6.17
> v6.18
>
> [1] https://lore.kernel.org/all/20250513142812.1021591-1-memxor@gmail.com=
/
> [2] https://lore.kernel.org/all/20240420-bpf_wq-v2-13-6c986a5a741f@kernel=
.org/
>
>

