Return-Path: <linux-input+bounces-2114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DB86AC6D
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 12:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBEA61C21987
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 11:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626D312BEAB;
	Wed, 28 Feb 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2+SL82W"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C712AAE6
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709118101; cv=none; b=PWtE7YCQlddpw2AP/ZDmjpATWASeJhAazRLick4YWEiJUBlx72FaVaBBGqid+iJrX4JAxJ04E7F6NV2geJVrl23gXyUQBtKHkngKLscTHOpDn4uVPJM4fy2DLfaARZKISCKlcIJloUyf1sQxlZzlJgy/sPzQXcevq2kHHvKs8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709118101; c=relaxed/simple;
	bh=8OgkdCAnRjKaw3j4wSYcHFa/xxgMjTCLQm7+X/e43Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBYAkZ33PN4nIpDKDhjVpEpdqKr23qRT7u+8J1TdvYoT9o98RwnS9Qg2I7UQfCQap70ZYU4Uea4eREefeCT+wBDwkc5xPn3KQi5T/SuS7ybFvJLmW0VYa/1209nbxcd09hIVyy4j/0oYVViAQTzj2yFvh10N46BAKE9PpTHjRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2+SL82W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709118098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHUgioFTWud+yVu8FFp4Z9cGICZSxHxVkQZdXkVKoZc=;
	b=D2+SL82WvSHLJ1dVq1XVDX1hBr7rGoggsxClyk1BmcHnrW/8WiRA6T9Hml3PukRuvMKbjT
	Tqqc7NKU2o4i3/reYgLquOOGYgeXxrR0WHAPTSUynvJKcVo/WUrpDevYrH8hJ0XJINw3bi
	r2MVrnObelOXG8fc7rRX2HNxHfrsbUA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-DC1epmx6PnaTDkZyw8l-Ng-1; Wed, 28 Feb 2024 06:01:37 -0500
X-MC-Unique: DC1epmx6PnaTDkZyw8l-Ng-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56618452b5eso1872879a12.1
        for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 03:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709118096; x=1709722896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHUgioFTWud+yVu8FFp4Z9cGICZSxHxVkQZdXkVKoZc=;
        b=bbocdJrBvboBsPzww5hGNOQKGeSitgP6pJixkroWbuWmEkfdE0us5I2T2ZVtR+h9gF
         Xy+dxeJh60In31SOSDAHlGqnqMNV7MnCXcUiziuKklp4FtzAq6awJzrc5UyIITBeznno
         6z+XI/3YW7J0wRNR+FEMBRMIdc0mozbMPVV83Kebp3A131OdyyMq9q0Cn7hn4UE4ubX5
         dXF70skDYzs5oYs4mXmElWJiSNbBe6s7RXtkLjoNEis7GOaBghjxzmpCCcbz9mkr8+KQ
         zSbEjBiLdmenolssSWZYXrDwzPBL9GUEZmp80uxozF3iXEZkI7vpp0WD4u8oiRCZ4EqS
         PtGw==
X-Forwarded-Encrypted: i=1; AJvYcCUZhhxXpE3hW6OVP+1Bi3BMtrMbXupxL3BhyxtQ19LEza08/1ObJ+r2eFzPsRv1y+/U+HPERAfOtpQb/Hq+NajeUkUvBG+LU0NagBw=
X-Gm-Message-State: AOJu0Yxc/JY81k/k4y7gxXc3cQtXuojMJhyktPRzQFdNWV5F30teNLHf
	gP7clVtUsPWrFnNbybXKmNaEl7QR7tUPvqINfZAVulUwA6dUflSgQvdJfzh5Et1LO39jvt05Apb
	J9yS0Uxix1W4l0o24zZc6zII4ge1Y94hOKI6XIJidHs+ojYyP61/3+pCtraNbzOhZYPSI/5qAWK
	NdQzRGjqz0Tdi2E0yovXiMC2ux7rnnzjQ2P08=
X-Received: by 2002:a17:906:1450:b0:a3f:c6a6:3b79 with SMTP id q16-20020a170906145000b00a3fc6a63b79mr8267007ejc.6.1709118095857;
        Wed, 28 Feb 2024 03:01:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAWI5m4fiH4ALLfFYlhSHwy5bFWy63vFpnGQNng4cv4hRI1z/LUykHqlS5EudRuxJtWXmdgW+znCdtAHZdRn8=
X-Received: by 2002:a17:906:1450:b0:a3f:c6a6:3b79 with SMTP id
 q16-20020a170906145000b00a3fc6a63b79mr8266966ejc.6.1709118095447; Wed, 28 Feb
 2024 03:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-hid-bpf-sleepable-v3-0-1fb378ca6301@kernel.org>
 <20240221-hid-bpf-sleepable-v3-8-1fb378ca6301@kernel.org> <55177311ccdc24a74811d4a291ee1880044a5227.camel@gmail.com>
 <pocfd5n6lxriqg7r6usyhrlprgslclxs44jqoq63lw734fjl2g@5kv4hjaux2fp>
 <9a35a53a1887fb664fd540ec7e272cb3ea63f799.camel@gmail.com>
 <CAO-hwJ+TGiLrc4De7htvKaSsMfQnZahK-zONAMNgUMYHEQb-7g@mail.gmail.com> <CAADnVQKrKzrvzu9NmcaDYGFYicqN--R5J6r--_J58gB0jic_NA@mail.gmail.com>
In-Reply-To: <CAADnVQKrKzrvzu9NmcaDYGFYicqN--R5J6r--_J58gB0jic_NA@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 28 Feb 2024 12:01:23 +0100
Message-ID: <CAO-hwJL_WAsOOJ5oScvNBbXwK=g3R_5S=PqUmNi5C156pcwgzQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next v3 08/16] bpf/verifier: do_misc_fixups for is_bpf_timer_set_sleepable_cb_kfunc
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 2:49=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Feb 27, 2024 at 8:51=E2=80=AFAM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, Feb 27, 2024 at 5:36=E2=80=AFPM Eduard Zingerman <eddyz87@gmail=
.com> wrote:
> > >
> > > On Tue, 2024-02-27 at 17:18 +0100, Benjamin Tissoires wrote:
> > > [...]
> > >
> > > > Hmm, I must still be missing a piece of the puzzle:
> > > > if I declare bpf_timer_set_sleepable_cb() to take a third "aux"
> > > > argument, given that it is declared as kfunc, I also must declare i=
t in
> > > > my bpf program, or I get the following:
> > > >
> > > > # libbpf: extern (func ksym) 'bpf_timer_set_sleepable_cb': func_pro=
to [264] incompatible with vmlinux [18151]
> > > >
> > > > And if I declare it, then I don't know what to pass, given that thi=
s is
> > > > purely added by the verifier:
> > > >
> > > > 43: (85) call bpf_timer_set_sleepable_cb#18152
> > > > arg#2 pointer type STRUCT bpf_prog_aux must point to scalar, or str=
uct with scalar
> > >
> > > Right, something has to be done about number of arguments and we don'=
t
> > > have a convenient mechanism for this afaik.
> > >
> > > The simplest way would be to have two kfuncs:
> > > - one with 2 arguments, used form bpf program;
> > > - another with 3 arguments, used at runtime;
> > > - replace former by latter during rewrite.
> >
> > It's hacky but seems interesting enough to be tested :)
>
> Too hacky imo :)
>
> Let's follow the existing pattern.
> See:
> __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
>
> __ign suffix tells the verifier to ignore it.
>
> Then we do:
> #define bpf_obj_new(type) \
>   ((type *)bpf_obj_new_impl(bpf_core_type_id_local(type), NULL))
>
> and later the verifier replaces arg2 with the correct pointer.

\o/ Thanks, it works :)

>
> > We also could use the suffix (like __uninit, __k, etc...), but it
> > might introduce more headaches than the 2 kfuncs you are proposing.
>
> Only one kfunc pls. Let's not make it more complex than necessary.
>
> We cannot easily add a suffix to tell libbpf to ignore that arg,
> since bpf_core_types_are_compat() compares types and there are
> no argument names in the types.
> So it will be a significant surgery for libbpf to find the arg name
> in vmlinux BTF and strcmp the suffix.

Yeah, I guessed so. Having a single #define is fine, especially given
that there are already a lot of them for the same purpose.

>
> >
> > >
> > > Could you please provide more details on what exactly it complains ab=
out?
> > >
> >
> > Well, there is a simple reason: that code is never reached because, in
> > that function, there is a `if (insn->src_reg =3D=3D
> > BPF_PSEUDO_KFUNC_CALL)` above that unconditionally terminates with a
> > `continue`. So basically this part of the code is never hit.
> >
> > I'll include that new third argument and the dual kfunc call in
> > fixup_kfunc_call() and report if it works from here.
>
> Something is wrong. fixup_kfunc_call() can rewrite args with whatever
> it wants.
> Are you sure you've added bpf_timer_set_sleepable_cb to special_kfunc_lis=
t ?
>

Yeah, but as I mentioned, I wasn't hacking at the correct place. I was
not doing the changes in the fixup_kfunc_call() but in the helper
processing, so that path was not hit.

But with your instructions it works.

I have a couple of changes to do and the selftests to add and the
series will be ready.

Cheers,
Benjamin


