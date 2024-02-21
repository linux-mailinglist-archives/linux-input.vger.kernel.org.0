Return-Path: <linux-input+bounces-2012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82C85E29E
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 17:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4C81F21A2E
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 16:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C11A811E2;
	Wed, 21 Feb 2024 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cUJWKrp5"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B698061A
	for <linux-input@vger.kernel.org>; Wed, 21 Feb 2024 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531632; cv=none; b=QoPgfM22Sazemg3JT10qGcLvRUZg2kDTTEZAckx2vGi/gsaXJ/1VoohMcyALuADhQ9QF6TsoYwrU2sC/zp7qRJAp2QAcvB9/pgw3yWb6qCZznucAHLEiK2Jt1rVr267F3tmaP+JHYKoGNLtLbCHf3IOYeARJtHMsVQgse88LmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531632; c=relaxed/simple;
	bh=dGmgF8qGHnx/mJYlpADnCFU8iTkJrq/0O6aXwei1tvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4jJD147UXp7JILxzaMKvAyUKNhRQV0ojI9XeDqm2O024MneWI66sLhkAaaIuSJKZNzYHCzuLHRuqhT7PFcTNwT1sMS0VTEEXFY5b/ThsS+F943mrtx8F0gAeSTpZh9dmP5zNfiZCrHMkTIerUGRu2xewQ4UTjgXO4VFhyf19GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cUJWKrp5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708531629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y30RSH8hthw/OYPhhhlk6+N/9nuxkhj3RC/Z3jCPafw=;
	b=cUJWKrp5FaJGVarLt8LVWwUAHBffFjeEPq1b8C+w11cdW8RzAIidgPO9mClgOx5f0K1y8p
	acup2CODzt56h2bokQfdLeZkGAGMO8xuacVB8CVuytbFWb+TrBJQAB+JqSpR9IGjXYPViv
	OdjQ4/pbDf0k5iJpSVxvKue5F2f/GBs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-ptCDjuYnMYmk1q0a-6wwuA-1; Wed, 21 Feb 2024 11:07:07 -0500
X-MC-Unique: ptCDjuYnMYmk1q0a-6wwuA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5642bbddd01so1723665a12.0
        for <linux-input@vger.kernel.org>; Wed, 21 Feb 2024 08:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708531626; x=1709136426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y30RSH8hthw/OYPhhhlk6+N/9nuxkhj3RC/Z3jCPafw=;
        b=BfF7XnMY1otjNZpXPRxEp+1tZWvO3VruftKtbgWI7fVOEwrBHgt96TcFryMHyRoGvX
         4Aa2IDZ72RUEFnsD2tHUk+PWLsG9w6CArZHg5J+EJtdCLh3Q40dPos+N0OQg0PxdZk36
         Lv5W6KTnJbPVXgdOC+fARAFQXi0lf4xKZOcabJsZzShIsvncu/nMmpQZNGJk13TijsTV
         0gHckGSIwksHS7MmsOqKAlBAEteSbD5G+/vwb55Y4fvhKgC9yx+4trcBz6694EG4Q4cm
         ox/m2ne1aTxRixuMa8Q2bQmG58Dawr4C1243VwUQKtpUNKqo/JwqKyYfRLXpOArO+PlV
         bcaw==
X-Forwarded-Encrypted: i=1; AJvYcCWXvNLMwcutBaLZRkQi75zVn7fOjPqLbW9OujZJzINsfKxd2SgAyNirsFuR7dig8MZqrpeSWFUNIBg92swEy0ZKIrPTALtBalsOYr0=
X-Gm-Message-State: AOJu0Yx47ogpZkbfBwcBLtiEuxD99zbOv3ImVdt5Z0X+7c8j6neyyq0i
	GR/7RwctQgnFE8+NWDABISnhkjTilQns7JgBSmsKjvGF9VqC6d8IYhlzSBpbVNqwxPCYKyUoWT+
	wudNJsWaUXk7zj0rrb49b6VjRuNB6GPZdmeVrlZd7YXLjlbnrrWjAeDbfMxZH0iGH328qtpDsOC
	06tk4LGOl9EH49T4SA1hnBd6gxgYSiNnfnONU=
X-Received: by 2002:a17:906:7f0e:b0:a3f:4a33:8112 with SMTP id d14-20020a1709067f0e00b00a3f4a338112mr1044404ejr.53.1708531626781;
        Wed, 21 Feb 2024 08:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU4eTPlizClIf0KjJt8QJlDiVbr8zCov6ZxhFgOKzHfX9uYPosMdqWZ4sbQtPG6AkyJmD/Xm3IdY1QDhuEqg4=
X-Received: by 2002:a17:906:7f0e:b0:a3f:4a33:8112 with SMTP id
 d14-20020a1709067f0e00b00a3f4a338112mr1044385ejr.53.1708531626473; Wed, 21
 Feb 2024 08:07:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-hid-bpf-sleepable-v2-0-5756b054724d@kernel.org>
 <20240214-hid-bpf-sleepable-v2-2-5756b054724d@kernel.org> <mth43jfjhwtatwfo3unefrze62opht3yklleblslyz2adc6p5p@wm3miaqhhtkt>
 <rhdu4st5tfabsdqs27ewhvdlwblhj2re4o56iz3fq3bsuokxxe@gtuqdjffj2hn> <i2womwfk2bvxh3h7ubmj2p4aqywci36hcfufuqflcusg73ilsq@chpndguq7bgu>
In-Reply-To: <i2womwfk2bvxh3h7ubmj2p4aqywci36hcfufuqflcusg73ilsq@chpndguq7bgu>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 21 Feb 2024 17:06:54 +0100
Message-ID: <CAO-hwJKz+eRA+BFLANTrEqz2jQAOANTE3c7eqNJ6wDqJR7jMiQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next v2 02/10] bpf/helpers: introduce sleepable timers
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[replying to both of your messages here]

On Wed, Feb 21, 2024 at 3:59=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Feb 16, 2024 at 10:50:10AM +0100, Benjamin Tissoires wrote:
> >  static bool is_rbtree_lock_required_kfunc(u32 btf_id)
> >  {
> >       return is_bpf_rbtree_api_kfunc(btf_id);
> > @@ -12140,6 +12143,16 @@ static int check_kfunc_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn,
> >               }
> >       }
> >
> > +     if (is_bpf_timer_set_sleepable_cb_kfunc(meta.func_id)) {
> > +             err =3D push_callback_call(env, insn, insn_idx, meta.subp=
rogno,
> > +                                      set_timer_callback_state);
> > +             if (err) {
> > +                     verbose(env, "kfunc %s#%d failed callback verific=
ation\n",
> > +                             func_name, meta.func_id);
> > +                     return err;
> > +             }
> > +     }
>
> All makes sense so far.
> Please squash all the fix and repost.
> It's hard to do a proper review in this shape of the patch.

Yeah, I was expecting a very quick "I know why you are crashing", not
a full review here.

> As far as rcu_read_lock/unlock that is done in callback...
> it feels buggy and unnecessary.

This rcu approach is indeed wrong, but there still needs to be some
locking if bpf_timer_set_callback() or bpf_timer_set_sleepable_cb() is
called while the work just started. I went with a semaphore in v3 as
it seemed lightweight enough there. Please shout if you disagree :)

Anyway, I've also dropped the flags in bpf_timer_init() in v3 to only
add BPF_F_TIMER_SLEEPABLE in bpf_timer_start().

V3 (not RFC) is coming.

Cheers,
Benjamin

> bpf prog and timer won't disappear while work is queued.
> array and hash map will call bpf_obj_free_timer() before going away.
>
> And things like:
> +       rcu_read_lock();
> +       callback_fn =3D rcu_dereference(t->sleepable_cb_fn);
> +       rcu_read_unlock();
> +       if (!callback_fn)
> +               return;
>
> is 99% broken. if (!callback_fn) line is UAF.
>


