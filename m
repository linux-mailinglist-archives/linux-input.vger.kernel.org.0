Return-Path: <linux-input+bounces-16769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3700DCEEF45
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 17:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24613016197
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 16:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8992BD035;
	Fri,  2 Jan 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RC6OrM7O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF12BD02A
	for <linux-input@vger.kernel.org>; Fri,  2 Jan 2026 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767370758; cv=pass; b=tNa2fSXz2qYa1hyYSmJdrbmDihs6c6uUfxPr/2hYy+5XDr0NqA/L+IpDg2acq3WQnY4unTkVjkgYCN3pBa5446DWxsFMoP9CQOJ1Tzel/TimWR6DAkeCblKzn4UY977CyZa5MpcWNULetBTDfwM+e2hiKt1kvCyO31ixnOEOCdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767370758; c=relaxed/simple;
	bh=3zUPHsmFXLRLRWZxrqxoS8IggoZhxzhMACoAYfeLcu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPml78x2CrnnhBsz2YMLHi/QsjspVe9Fkp6SBq5ZUVnknUx6bqxYDDTTAf1aQAvA6jV12ONTWG1/VsqmXSitmbMJnFJeE/wuCkFXJa+ZkwO42Fpn9hjhJhY0x+3U1BmB9oacIXRoGKEG+THvMEQb96SxqfOIIis8xnnuAGtprFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RC6OrM7O; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f3018dfc3so38827615ad.0
        for <linux-input@vger.kernel.org>; Fri, 02 Jan 2026 08:19:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767370756; cv=none;
        d=google.com; s=arc-20240605;
        b=QOce9aQR1tq5fixOJ783I0nk0JFvv9n26fjuogC/Mad2CKZ7kO1G8HQLdIqcdDHjLl
         o5bwiHWJA6k31RWi/XqNGqj1QQ1SXF+h/wxkM22Iwd92OOIuLZM6oPIfYHpXIAIutoLd
         4BoZh/WlongkEdQRxlriK+PoW33GG82Jb14xiwGcaRxlRl/X0Jyy7Ob3dLBxEobBFaKq
         eTnnEs0L6f76+78cfm02OIeGVkOhgqNz5ZrBRhz/Qgp8Y+2GwV2guxA8hytuVc/xdP3Q
         ZlaqkNC63J9XBshwa2zCXmATfiYCPE8ijkE6mQRodkYCgaT0waP0NDIRGWujXACFiptk
         Kzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
        fh=NQVmUDyBnHmj5fqKWNe0znksuzx4uWkskNMdnrfUFik=;
        b=FYFJjQK7pzjB0fhLXMu841jbS1Tbb7wfu4sN0JY5lMoyQceh4V/VVwljeTvyzBYJud
         XKs95CEpkRqJtgYLFg6EpiaYZejEfxsLaN5Rv8OveaqbfJCDrkSfeyUXxvUdkGI3Qcjn
         /F3y5KaM6DpP4T0rriTgob0x6ZsuyrBLF7mtfN/jH6gMgVzqMOW/pkYIImNFqI8+d91b
         hFUrXmJycSGLupm4ldvxTxF1PsDhnaP+O1of03U6tZLWdH/q1RLG7z/G8Mt66hnRJ7yL
         fz5iMDUdx++chRZanswakMZB1RZAJxqpDbkrD2wtbiUdbomSFRFuJulOOv+H55zTGUC0
         cXeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1767370756; x=1767975556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
        b=RC6OrM7O0cVMQCXffp7Y+tRu3KxyP//w1wjt29LedET926XUxE99AlK58/Y9l6s5RX
         tfZhN08MGiYvxmwh7ivaAwr/YzDhtnOSkAeNdL4CpRI1iSnUREFY/qCii2U5MhE3U6ru
         8SeY5SpByufn07hJLrwMSgQVqWkL4KElX6wcBt6NKYHHMK06eVR5NTpBfI3TrymzaqIZ
         TX/S3suwPgQqMM8HrEE4oXLab9RgnrKSh2ZavkJY54tlvvtaBTWBqdGLB1zgUMhkQpds
         fDs9neGR/7x+bttUhqouOuP+Jod6O3o+loQQ8FwuaPXetu6Xh6OJ+qnMLLq8RJXzSxy+
         9Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767370756; x=1767975556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPr557U2HvOHmBjLr/Ni2LmdX/a30qSDiDUWeBgkK/Y=;
        b=WKgqCfgSa+QRPWtjBJVTGwjOATiAPh+4K9NcXC9gyU8yWiwgC5lajtGtGZ/GBhf5gQ
         o0YsMLyYSkEwiN3DP8YJIhySNrAEJuB8NDBEDXZClz+6sPeZNsMewqz4bp4hBVko46sf
         Q/a/uVPgQwJtWMF+ohKJ9pmC4ah1bj8SgDE/veKDNeC66Cp18K6sVGfTXSaTlkxTFddM
         /YQP7si8jA0NhhqVa8m2N1DN0F4zKVrmOlBaAQiv4mLoneR4oM5ktb8+qhzdOaX5Bphv
         N898JJ3zUlrbfzUM9s0VWknKCbA+oRIr5G2ZLAjZfrdvdGV7Dls7huwvX1zSQ3QmYeaF
         +wZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5M/66DgSiQScr948Ojlwo5beEZNr27eYwyk9vplULnBhxU8eSmWMzrr0Lzzmumi8zvFPfj1KC3dTDyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVdlGsTGXAmtT39ICP97LzNct5PAhDDNwqnpRNe9mytofaUZN
	PCPwzSzVhIzbqJ+IhvHZBFnPnq7psO3aWORg4dqLBdxXGgZ1GokOBOHfqGv6YDZzxeIH1sYHSFn
	DtN9BHJSixpaB4Jq7aeE5HIvA1qUsmeoiWdv+2JrD+A==
X-Gm-Gg: AY/fxX5q25Wzg0zX6LuDRazus6pF049OTDnvCrHCk7TPPlf3GgVVkrtgcORSvUVGatF
	btldUgIb93ur3O2u3Zx0qGYtit7TcgpoLG8fQ/tqi3SI0k+pAHJU9aDl0vhPWEdDTRMz/RjPTpP
	g6De3rzPec8wgM5Fz59EP9g4xSebKk7JluOWWCwD/EHL9VQv6v4+1StVbgO10tD3uJiCzSIkrWL
	t3pw65TA/bpggJTAM0pUw2cTIhpZ+9000Y9Cn3lFDtAC6FIQPLjvLKev++UTCv0TWL0Mw7G
X-Google-Smtp-Source: AGHT+IF/IKaol6q06drc0jUZGfDObMCMgUc7sJGF0Pzcwx7Y3zyiL6BNsG9paslEQz3RmfOfMLaSPRZ7OEsv3ldvgtU=
X-Received: by 2002:a05:7022:6194:b0:11d:faef:21c2 with SMTP id
 a92af1059eb24-121722b44b3mr21225084c88.2.1767370755580; Fri, 02 Jan 2026
 08:19:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
 <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
 <CADUfDZq5Bf8mVD9o=VHsUqYgqyMJx82_fhy73ZzkvawQi2Ko2g@mail.gmail.com> <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
In-Reply-To: <CAADnVQJ0Xhmx0ZyTKbWqaiiX7QwghMznzjDL1CNmraXM4d+T7A@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 2 Jan 2026 11:19:02 -0500
X-Gm-Features: AQt7F2oEXplVk5UGATVc_njCcDbZ0oTjVxxZL8Y_v3dZVS7iVDarJ5ogQAkD16Y
Message-ID: <CADUfDZppy2CQjZ9La=RcBL5XeKY66Eq7Rr1JD6byuip_GPrMEg@mail.gmail.com>
Subject: Re: [PATCH 5/5] selftests/bpf: make cfi_stubs globals const
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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

On Wed, Dec 31, 2025 at 6:10=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Dec 31, 2025 at 4:28=E2=80=AFPM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > On Wed, Dec 31, 2025 at 10:13=E2=80=AFAM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Wed, Dec 31, 2025 at 10:09=E2=80=AFAM Caleb Sander Mateos
> > > <csander@purestorage.com> wrote:
> > > >
> > > > On Wed, Dec 31, 2025 at 10:04=E2=80=AFAM <bot+bpf-ci@kernel.org> wr=
ote:
> > > > >
> > > > > > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod=
.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > > > > index 90c4b1a51de6..5e460b1dbdb6 100644
> > > > > > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > > > > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > @@ -1275,7 +1275,7 @@ bpf_testmod_ops__test_return_ref_kptr(int=
 dummy, struct task_struct *task__ref,
> > > > > >       return NULL;
> > > > > >  }
> > > > > >
> > > > > > -static struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > > > > > +static const struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > > > > >       .test_1 =3D bpf_testmod_test_1,
> > > > > >       .test_2 =3D bpf_testmod_test_2,
> > > > >
> > > > > Is it safe to make __bpf_testmod_ops const here? In bpf_testmod_i=
nit(),
> > > > > this struct is modified at runtime:
> > > > >
> > > > >     tramp =3D (void **)&__bpf_testmod_ops.tramp_1;
> > > > >     while (tramp <=3D (void **)&__bpf_testmod_ops.tramp_40)
> > > > >         *tramp++ =3D bpf_testmod_tramp;
> > > > >
> > > > > Writing to a const-qualified object is undefined behavior and may=
 cause a
> > > > > protection fault when the compiler places this in read-only memor=
y. Would
> > > > > the module fail to load on systems where .rodata is actually read=
-only?
> > > >
> > > > Yup, that's indeed the bug caught by KASAN. Missed this mutation at
> > > > init time, I'll leave __bpf_testmod_ops as mutable.
> > >
> > > No. You're missing the point. The whole patch set is no go.
> > > The pointer to cfi stub can be updated just as well.
> >
> > Do you mean the BPF core code would modify the struct pointed to by
> > cfi_stubs? Or some BPF struct_ops implementation (like this one in
> > bpf_testmod.c) would modify it? If you're talking about the BPF core
> > code, could you point out where this happens? I couldn't find it when
> > looking through the handful of uses of cfi_stubs (see patch 1/5). Or
> > are you talking about some hypothetical future code that would write
> > through the cfi_stubs pointer? If you're talking about a struct_ops
> > implementation, I certainly agree it could modify the struct pointed
> > to by cfi_stubs (before calling register_bpf_struct_ops()). But then
> > the struct_ops implementation doesn't have to declare the global
> > variable as const. A non-const pointer is allowed anywhere a const
> > pointer is expected.
>
> You're saying that void const * cfi_stubs; pointing to non-const
> __bpf_testmod_ops is somehow ok? No. This right into undefined behavior.
> Not going to allow that.

How is that undefined behavior? Wouldn't the following be UB by the
same reasoning?

void takes_const(const int *x);

void f(void)
{
        int not_const =3D 123;
        takes_const(&not_const);
}

A const-qualified pointer type just prevents that pointer from being
used to mutate the memory it points to. It doesn't guarantee that the
memory it points to is marked readonly.

