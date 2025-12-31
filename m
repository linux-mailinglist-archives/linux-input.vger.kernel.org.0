Return-Path: <linux-input+bounces-16758-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7BCEC738
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 19:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54CF03020CCE
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 18:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEABF2FBDE6;
	Wed, 31 Dec 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfLzlWNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10425785D
	for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767204842; cv=none; b=by9Z+89DbiH6MRwXPPuSj2Zp0wMBXcy7tKjt5MSisA/UITIcceByu+ZPmjs3Ky+7S2WzXVs+VXGrHefaT8jsFcQZ8oHY4GpCsvyynKHre8ph/XGeRGrpMscFBUYp+0JO1ozKybenEXNkC0M46ASB1aC2RkdewLtzxTAmLxQDnsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767204842; c=relaxed/simple;
	bh=l0LRvl1kqcmBpJ+oiXL+hUtJD8MnLQw7yRd+cy/68MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzIzLYWgVIZVNNJkn/jfaWHeel5ooymMhfxobosUClQCIxvoMmbeIoi3NxrhubIwNd1sRWE5wgIR6Uo8TUVWGo25+l3PcuVN10F36qfmZ2tvuK9O0iyjNBnD6EVkVhp7UdQg/FQSyblA/n4wa5jupca6f6qRgy0cJymjDe7d16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfLzlWNU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso5461413f8f.2
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767204839; x=1767809639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80wuQlyFH/FTtp28IkHfYhaeWqE7rS7z6vp3Trh+jc4=;
        b=OfLzlWNU9tNh19lSAgaTDAAozHeFHEju+uWNAjP9QTUwb8+5hd+Nq9C8dAiR0RPdYg
         J2czUTeqjfPVMQ4ePBDiPsfUjuCNlI2iAxFhljFDCeoTJ5vDlXEsrqi8GN7n0iQKa483
         YmLoaPgSHLGADSqNRv6rmSRSB+8oHnY6/hy3v82ss0yvfk6125AncvXKghhsQCzenEuJ
         drtwjRNp8bU1+aDi+7jqdM8/bS5plGkyolcMmSD9xvY/2jhlaG5q+eyFZ71S98AHJlmE
         uQwtrCw9PU9u8SsPUsfe7ZLdrwA1qQpB6YMJJPwY1HzSzWxPQ0CllxHFZ/sYcgwVaXVz
         J4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767204839; x=1767809639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80wuQlyFH/FTtp28IkHfYhaeWqE7rS7z6vp3Trh+jc4=;
        b=iB1fDgaE3uKv/4R/5ooisIrB+W5BoxB3d0eeuZ8KTlGlnwpohpwY4kpIfqc5rY9lPw
         wRzcGpSHxCnht+mgvEvt/1dUZ62Vv0lP15Ru+yRKpA7RMh34KcPEvm2u7bTsGrQC5RiZ
         soEFur4hFsU503K+wNc4qwKDTN/Vn/CfV5OGwXeml2Zfv6xmHZorkebRe3vdgQXswYyr
         OUQXjITrCjeWIrwhwUeJABHrD65hxuS6ix/bj9bzBKkA5RhIwaMMmUNogUcw8W0tBOed
         pm+4YTNVJrOYXMn7yGO+4imCTKZlPF+BW5V9F5rQvqdvmTg9YobFeE9xPIYRaophtYQb
         CZPA==
X-Forwarded-Encrypted: i=1; AJvYcCX/vXq87GjnUUiMCjtADqitaA1R1+R9O16KTxCh6YsTfqqm/gIwsyUpJu5FS3MBRe3LBZ3cXG5p2Hts+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNv7J7pd9JAqLd5F7Ol1rrPP/zNJc/nYJGHIYtU8E8Cjn5or5B
	Nhb2Kyun1kS6YZcFTtkmvmyLwvAH/EJYpHyrUbuIoCqHEU0bsnFfU5/nhOb1QixB2FvFvjukcNP
	bGsJRqvTsvM2zDLt3Zg6LFh2Gwj67868=
X-Gm-Gg: AY/fxX5k6CCkJJpUkfG33leVutPLBZY9vkL/FkizInfx01ZIqBIQNILH8/fIbiZc+Xg
	WKmZS/cW7IybbVZhiwlADPv7v0P4dISN66oMsOj6WbmtTexAe7zH1vagND+L3hs55pgNsAyPBd+
	TD+LZzRKz+jrrEaToDmpjVsSAGfsAfy5QRoXZLxD3BFNBvn9DK6FsZfTs8jg4Mk7QjERcMl8OPx
	3t0iHFOfv/jEago+XRwfKG+I1EHkHgIn5qhDQk+gqMQAleaV6kKGjA/ov6qUnUzlCHd9m1bBulp
	YgOBlSkvzvBKVZuCrCtxiJzsZ2nT
X-Google-Smtp-Source: AGHT+IE7rn8UGO5FxmIqC7DPe8kHIdUtmNgCuEKioyalqiNjU4yifPpIQxEAl6/RRsYuU+/knbKXbX9dpW9nJ6ADD+Y=
X-Received: by 2002:a05:6000:611:b0:431:3ba:1188 with SMTP id
 ffacd0b85a97d-4324e4c70e5mr40336157f8f.3.1767204838828; Wed, 31 Dec 2025
 10:13:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231173633.3981832-6-csander@purestorage.com>
 <e9a1bd633fb4bb3d2820f63f41a8dd60d8c9c5e3c699fa56057ae393ef2f31d0@mail.kernel.org>
 <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
In-Reply-To: <CADUfDZpSSikiZ8d8eWvfucj=Cvhc=k-sHN03EVExGBQ4Lx+23Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 31 Dec 2025 10:13:47 -0800
X-Gm-Features: AQt7F2oHF_qxr3_KPJ-VT5eeYhG4tvvvWKJxtIn11KSC3ODYIcBGmV1QpWm3ri0
Message-ID: <CAADnVQKXUUNn=P=2-UECF1X7SR+oqm4xsr-2trpgTy1q+0c5FQ@mail.gmail.com>
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

On Wed, Dec 31, 2025 at 10:09=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Wed, Dec 31, 2025 at 10:04=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
> >
> > > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/t=
ools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > index 90c4b1a51de6..5e460b1dbdb6 100644
> > > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> >
> > [ ... ]
> >
> > > @@ -1275,7 +1275,7 @@ bpf_testmod_ops__test_return_ref_kptr(int dummy=
, struct task_struct *task__ref,
> > >       return NULL;
> > >  }
> > >
> > > -static struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > > +static const struct bpf_testmod_ops __bpf_testmod_ops =3D {
> > >       .test_1 =3D bpf_testmod_test_1,
> > >       .test_2 =3D bpf_testmod_test_2,
> >
> > Is it safe to make __bpf_testmod_ops const here? In bpf_testmod_init(),
> > this struct is modified at runtime:
> >
> >     tramp =3D (void **)&__bpf_testmod_ops.tramp_1;
> >     while (tramp <=3D (void **)&__bpf_testmod_ops.tramp_40)
> >         *tramp++ =3D bpf_testmod_tramp;
> >
> > Writing to a const-qualified object is undefined behavior and may cause=
 a
> > protection fault when the compiler places this in read-only memory. Wou=
ld
> > the module fail to load on systems where .rodata is actually read-only?
>
> Yup, that's indeed the bug caught by KASAN. Missed this mutation at
> init time, I'll leave __bpf_testmod_ops as mutable.

No. You're missing the point. The whole patch set is no go.
The pointer to cfi stub can be updated just as well.

