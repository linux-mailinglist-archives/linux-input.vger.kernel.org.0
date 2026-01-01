Return-Path: <linux-input+bounces-16761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFACECC3E
	for <lists+linux-input@lfdr.de>; Thu, 01 Jan 2026 03:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81F813014A14
	for <lists+linux-input@lfdr.de>; Thu,  1 Jan 2026 02:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE62C298987;
	Thu,  1 Jan 2026 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/OVexLt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC928AAEB
	for <linux-input@vger.kernel.org>; Thu,  1 Jan 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233455; cv=none; b=uiLCLFHVK9FBOxk5n7hkpbblpPu2f9BYvmkhMKTrvFyniSj3mv/OU3tDajge4Tp11FtzaVsWsmROBF0nczu2UgBVBLR34Fx56RgOITUeMnsNZjt5y8wK45V7yGK2c+4P0bNYke8lFNAnVxlsLu3DNzhaNr2cvhOdbDUHNzL4xAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233455; c=relaxed/simple;
	bh=qqizFew/kTOzewLvL59xdtHtP4J/gkIe7g4rCO241Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnnmNkDQJt3o+8ygDrip12MXZ/4Fu82pmbOc6VFKormSvdjT8fMaFI/pcqnq3A1KJ2QvDJ2UjCqFGI0lZq7j2K0YtuyNQlJVC0Ogp5Dou+wwpwpquavYh06LaDk2szk/xgObTjD6dMvc5WmphhT116TxFG3VC2exXMRzOyWb5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/OVexLt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so10963675e9.3
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 18:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767233451; x=1767838251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2EkUzQ6sigBd+WWV5Hcl6Vcy/jBU7DTMqVQsenR/Xo=;
        b=P/OVexLtkAJL/ji/IYpg+cnW6NzdWDUSRp8Pqik1QtPmS/aI9qBe63lt/ZK4hnmsth
         FXIHJi77ybxplKrxGUFKykkq77JbH1CLGWJINYQ+wHQ45kpk2UwoCg3D1CHM4jOrfsBb
         tkgj8W6Kqu8JZYCI8Dgvf/cg5pkF+tDwdIikC6sCJlyvD8VcAqiEqItzGtvZTCuYkYrb
         yFBjPVXMljpbfsi/ZePaHGVG4gsHTS1l4+LCnA0pvQBhbkrYfU7JYIjAgmrNp7jVL+Sg
         nRgdCYJ2nefi+pYDd2aREqonc+kT0rg0ZZInMTa9f9rZrTVxR1aFN89c/eiD13eRC/nD
         wY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767233451; x=1767838251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L2EkUzQ6sigBd+WWV5Hcl6Vcy/jBU7DTMqVQsenR/Xo=;
        b=dqHwTatH0mZan9Sk+G1WA5cRIiSMLkAdzDdypoVPzL8R/J8HK/kvfQs0tx9BN2ReFx
         S2X4In+NWrUIe9ThKvhceQ/kye0KybhmGL0YY4itWHG2KSumpOtSmxbZdyDeVlURQSt5
         Fo4hsc7kL/e0TO8xIRb5hvGTAVyQGSaWNeEnitUOCKOpEmkotoG+bpu0JqPMIs4qVjY/
         gj6Xrp+k9S5ozxux4ZXRhBRzhVMkWs3PT016tLBmLYMxtcZh43P5MRqeLkANlClvm4Ya
         rQ/fax+KND4A3XQFknJKujXHAkbNsE1S6r5OACKDoRTbIy65DtQhfUaSyjfueeS701qM
         F9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWY2T2c861ziLna4t9QOWtwJjy9/jvGE4hAv/IBuah1w5Xy+KCmhburt82w2k43lup1Mqekcoegv87I9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/O13aw+vtLrt7AfBKB1O3uJJ6m39F+gw0fIPhA5N9qhmSRww
	6BUsZjWLOiz4LS/oPGyZTWGfjvMvAkyK/N4WX6lSiiZ3Yfythd3mMwN87MUV3HuBow0mWVFue/K
	6q9v/KmlBMs9x7kzRd/3CqIykSRNi6g0=
X-Gm-Gg: AY/fxX6U6YJ4TKhjhuQ70w2tgok/IVw6aZTRoWHOe8v4RKXFCWHYl5ZMXs+e1O/VcPr
	eqSfHXo6vw6YX3TnIrrA6YMSJop/4pW37NTKCk7T2EBV9G2WGvokZgEGkZ79AGySBr6qgB7Irsg
	E1u1NDU25odbMAXlP2Tyhw42KzgJWYN3LeEy5Vwmk3d8IlTUEsAInjXxbjKciN4plLOjYwSWVpH
	ABgWLpymSaehZGuICFg9TP3WeVoRJLcgICivsUUxSK/0k+hpk6tTn30tC3lB9HBBjbEZsDLRF34
	8aty2iGDF3xBBeOdZ9YzymdNZq6K
X-Google-Smtp-Source: AGHT+IH5ZrzzFT5UNwTZptN+H56qkFUXA/Ygb+yPt8+WPgM1uThdV3rrZmNHjr6UFJLqBPNEBxHVHfwADBRcBM115zY=
X-Received: by 2002:a05:600c:638d:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47d4c8f4972mr206282295e9.21.1767233450902; Wed, 31 Dec 2025
 18:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
 <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com> <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
In-Reply-To: <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 31 Dec 2025 18:10:39 -0800
X-Gm-Features: AQt7F2qPTzBBxIXi7mSFxblwdWM4pyxfhqUHnmv1AUlo2Ajz8HPFxUtnTVbWXLM
Message-ID: <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
Subject: Re: [PATCH 5/5] selftests/bpf: make cfi_stubs globals const
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: bot+bpf-ci@kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, "D. Wythe" <alibuda@linux.alibaba.com>, 
	Dust Li <dust.li@linux.alibaba.com>, sidraya@linux.ibm.com, wenjia@linux.ibm.com, 
	mjambigi@linux.ibm.com, Tony Lu <tonylu@linux.alibaba.com>, guwen@linux.alibaba.com, 
	Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, sched-ext@lists.linux.dev, 
	linux-rdma@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 4:28=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Wed, Dec 31, 2025 at 10:13=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Wed, Dec 31, 2025 at 10:09=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > On Wed, Dec 31, 2025 at 10:04=E2=80=AFAM <bot+bpf-ci@kernel.org> wrot=
e:
> > > >
> > > > > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c=
 b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > > > index 90c4b1a51de6..5e460b1dbdb6 100644
> > > > > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > > > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > >
> > > > [ ... ]
> > > >
> > > > > @@ -1275,7 +1275,7 @@ bpf_testmod_ops__test_return_ref_kptr(int d=
ummy, struct task_struct *task__ref,
> > > > >       return NULL;
> > > > >  }
> > > > >
> > > > > -static struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > > > > +static const struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > > > >       .test_1 =3D bpf_testmod_test_1,
> > > > >       .test_2 =3D bpf_testmod_test_2,
> > > >
> > > > Is it safe to make __bpf_testmod_ops const here? In bpf_testmod_ini=
t(),
> > > > this struct is modified at runtime:
> > > >
> > > >     tramp =3D (void **)&__bpf_testmod_ops.tramp_1;
> > > >     while (tramp <=3D (void **)&__bpf_testmod_ops.tramp_40)
> > > >         *tramp++ =3D bpf_testmod_tramp;
> > > >
> > > > Writing to a const-qualified object is undefined behavior and may c=
ause a
> > > > protection fault when the compiler places this in read-only memory.=
 Would
> > > > the module fail to load on systems where .rodata is actually read-o=
nly?
> > >
> > > Yup, that's indeed the bug caught by KASAN. Missed this mutation at
> > > init time, I'll leave __bpf_testmod_ops as mutable.
> >
> > No. You're missing the point. The whole patch set is no go.
> > The pointer to cfi stub can be updated just as well.
>
> Do you mean the BPF core code would modify the struct pointed to by
> cfi_stubs? Or some BPF struct_ops implementation (like this one in
> bpf_testmod.c) would modify it? If you're talking about the BPF core
> code, could you point out where this happens? I couldn't find it when
> looking through the handful of uses of cfi_stubs (see patch 1/5). Or
> are you talking about some hypothetical future code that would write
> through the cfi_stubs pointer? If you're talking about a struct_ops
> implementation, I certainly agree it could modify the struct pointed
> to by cfi_stubs (before calling register_bpf_struct_ops()). But then
> the struct_ops implementation doesn't have to declare the global
> variable as const. A non-const pointer is allowed anywhere a const
> pointer is expected.

You're saying that void const * cfi_stubs; pointing to non-const
__bpf_testmod_ops is somehow ok? No. This right into undefined behavior.
Not going to allow that.

