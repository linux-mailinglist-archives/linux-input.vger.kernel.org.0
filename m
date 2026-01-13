Return-Path: <linux-input+bounces-17058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78170D1A6EC
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 17:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78DFD302BF45
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBBF34EEED;
	Tue, 13 Jan 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1lLNe1x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F531A04E
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323364; cv=none; b=Ym9MhX4fljUPasQ74+YvfC5mZtzI7n35IsEVGbXi5dzktE3zXBf199ayst081zFV5vfkr29jea1e2oaoNzlK1jqa2sEeE1EffL8TAK7WZzKEthgz1+KTebhXISYZOUBhv6FBpdjzR+Zlwx7exUdaGI/0rFLd7zFX+vrGqWz3xE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323364; c=relaxed/simple;
	bh=AYJEviHMdEId3t6NVCqtgofmR91OvzaBv4PrGb355Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gs4qEc0z9gLspVgIn3QA1zvhHWyzynYAG7ST0KCA37dyjOqlH4LXsHLUcXEpx8Dy+yv9VUeehHDA19UNXh3E9bFu/GjHqUWiS00n+uIatKgwPc2jnr3TyrYDV9NO0idR5t99dA3tl9jnSzOlcfPgOEBymdA/BRXAi3cxx65/KFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1lLNe1x; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so5956660a91.1
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323363; x=1768928163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c72nseukprRkDnD6LRooG/wsQ7/nXs6s0pp5X/yGXVE=;
        b=D1lLNe1xGes0sEt0DpQ90Cxz4s6XvYhWKWTjPDbCl7RpoTNBPLfB2a4W/13eB3hq+L
         oK+mMg3PlBCC16HAPsRJfAqzg4aUbgK/Pc0vetvOLVYlZMpXA4Ct0jlFRsvRydon3cEj
         58ZzIgHb/JXB7HvZ6mAjs2ZUi4LiXorD7VPr7fbRlHopI7kitx6obY5CrGulQFOSyaN5
         BxxXxKOXxvKSR2dIeBPXtKM+fd0kP8RshpANaH+wSjhM3pGcjZ7PDzvrF2HeRxMU4VMp
         pwWMb+FWq1XEZ9G+Hayv4OvrsbDJIVoMtEpXeHnBkTWgLqZzUz+h/KT2cqrAI/5S/UxY
         22ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323363; x=1768928163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c72nseukprRkDnD6LRooG/wsQ7/nXs6s0pp5X/yGXVE=;
        b=X1+nReKvnKmB6e35WwqtLDPrxl5uRo71zziqxGxl5IRb1Q3HYeazUjkgCCRscVxpma
         YVeHteVmEjmSXxpCU3svJ6bW89CL5+7i/OWYk8lvpbZaC1NoVW51P/iNvKoC6BO42VAy
         CIWO9z/ksn227rY189B62VrpeDKRLv82jek4MoX2mSUpw3Izdg+m3lDdJFX6Mx4fo3Gr
         3nm+iqZ0QaxV6RssYoqNlYhAx6b19F8cwgvNJVQ35My0mvAGIGmGbVptZ9z/1hTA2fI6
         Q85IxYYBvRX4Bq7oQgs8hm7BFvPpnXendW6aRxKbkoW/kpIjOBqkCFi+VAa+7qqgWymY
         tbQg==
X-Forwarded-Encrypted: i=1; AJvYcCWv4eNg0CM6ccair7WNdX642kwR1ZC4BO/CP3UY6t2SRFCbvIQknCP7muO0iF/S0nwx7Jk4rM5eiJQr9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUn8gW+QwEdjSxPZc8J7PLcnvW2IEKHrJjW3t9uMoQgAq4Rgv
	8wPQD3IIRfaoZd7cZftfhxhwt4aS3O7k4Y+N5EK8IbcZxB1bSzXlOYZoMW2ZAs3gt0WKigpcKp9
	KxOFUBt5Jp77Ok4Ob6SyeCtvDDiT5aU8=
X-Gm-Gg: AY/fxX7Lx1/1gzdyqtpMiIy+f2s0S6uMxGkazWkS304rKacRUq43RNcg5twSes4r07a
	5m9fWEuIKs0c7mfaHCrvNKYmKxOBqNz8OuLYDjXD8NDGIqdfMlEQn6wXExJAKaSopRMxmMdh7AJ
	NhjV+2XBc5XuyiBFm+BdlR8dhh/9X/HZNaP60CugsvDWKXINnlCDg0vZlzm5C6/3ZWPFEKXiXIp
	cDVGK4s76AFikc/f3ZxeMV409wIpwGxwSy6/lqFCff50OlEY8bObTjl12cyKWB7TIZ4wVe0oVqe
	CGl25YR3ApI=
X-Google-Smtp-Source: AGHT+IFIxoxup+hrHccZ24WU/oG6KH1/tlBu9GncLXzEEHkAImvk2s72E3X925uVOOnlVXa8GmYeNCaescJi731vjMo=
X-Received: by 2002:a17:90b:164d:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-34f68b9a10amr24614223a91.12.1768323362464; Tue, 13 Jan 2026
 08:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
 <20260109184852.1089786-5-ihor.solodrai@linux.dev> <CAEf4BzYcZ5pLCvfn8uWiKCjpBXBw9dxR_WZnKxVz1Bhf96xOGg@mail.gmail.com>
 <2ea17ba8-3248-4a01-8fed-183ce66aa39c@linux.dev> <CAEf4BzYuchyyw9M6eQo0Gou=09PcM-o_Ay7D8DM1gDitiG6Tbg@mail.gmail.com>
 <5bcd3bb1-6ed0-4ad8-9de8-46385de908cb@linux.dev>
In-Reply-To: <5bcd3bb1-6ed0-4ad8-9de8-46385de908cb@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 13 Jan 2026 08:55:47 -0800
X-Gm-Features: AZwV_QiWPztxopPzkBqdMF_fg2QqJyPvVgk72TVzCvEI2gyDpEwwqi72d41vchE
Message-ID: <CAEf4BzYfdrteD95CPs_P9gqaxCvOKmk99J=m18uS1CpqeFuyew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 04/10] resolve_btfids: Support for KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 5:49=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 1/12/26 8:51 AM, Andrii Nakryiko wrote:
> > On Fri, Jan 9, 2026 at 5:15=E2=80=AFPM Ihor Solodrai <ihor.solodrai@lin=
ux.dev> wrote:
> >>
> >> [...]
> >>>>
> >>>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btf=
ids/main.c
> >>>> index df39982f51df..b361e726fa36 100644
> >>>> --- a/tools/bpf/resolve_btfids/main.c
> >>>> +++ b/tools/bpf/resolve_btfids/main.c
> >>>> @@ -152,6 +152,18 @@ struct object {
> >>>>         int nr_typedefs;
> >>>>  };
> >>>>
> >>>> +#define KF_IMPLICIT_ARGS (1 << 16)
> >>>> +#define KF_IMPL_SUFFIX "_impl"
> >>>> +#define MAX_BPF_FUNC_REG_ARGS 5
> >>>> +#define MAX_KFUNCS 256
> >>>> +#define MAX_DECL_TAGS (MAX_KFUNCS * 4)
> >>>
> >>> can't we get that from include/linux/bpf.h? seems like
> >>> resolve_btfids's main.c include internal headers just fine, so why
> >>> duplicate definitions?
> >>
> >> Hi Andrii, thank you for a quick review.
> >>
> >> Including internal include/linux/btf.h directly doesn't work, which is
> >> probably expected.
> >>
> >> resolve_btfids is currently built with:
> >>
> >> HOSTCFLAGS_resolve_btfids +=3D -g \
> >>           -I$(srctree)/tools/include \
> >>           -I$(srctree)/tools/include/uapi \
> >
> > so I don't know if that will solve the issue, but I don't think it
> > makes sense to build resolve_btfids using tools' version of includes.
> > tools/include is mostly for perf's benefit (maybe so that they don't
> > accidentally take some kernel-internal dependency, not sure). But
> > resolve_btfids is built for the kernel during the kernel build, we
> > should have access to full kernel headers. Try changing this and see
> > if build errors go away?
> >
> >>           -I$(LIBBPF_INCLUDE) \
> >>           -I$(SUBCMD_INCLUDE) \
> >>           $(LIBELF_FLAGS) \
> >>           -Wall -Werror
> >>
> >> If I add -I$(srctree)/include option and then
> >>
> >>     #include <linux/btf.h>
> >>
> >> A bunch of build errors happen.
> >>
> >> AFAIU we'd have to create a stripped copy of relevant headers in
> >> tools/include first.  Is that what you're suggesting?
> >
> > see above, the opposite -- just use -I$(srctree)/include directly
>
> Andrii,
>
> I made a low-effort attempt to switch away from tools/include and it
> looks like too much trouble. See a sample splat below.
>
> I think the issue is that resolve_btfids uses a couple of inherently
> user-space things (stdlib, libelf), which themselves may include
> system headers. And there is actually a difference between the kernel
> and tools/include headers. For example, check
>
>   ./include/linux/rbtree.h
> vs
>   ./tools/include/linux/rbtree.h
>
> Maybe we can make it work (with our own local tools/include?), but it
> doesn't look worth it for just a couple of constant #define-s.
>
> Let me know if I am missing something.

No, it's fine, no big deal, at least we know that it's not as simple.
Thanks for trying!

>
>
> $ make
>   INSTALL libsubcmd_headers
>   HOSTCC  /home/isolodrai/workspace/prog-aux/linux/tools/bpf/resolve_btfi=
ds/main.o
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:20:33: err=
or: conflicting types for =E2=80=98fd_set=E2=80=99; have =E2=80=98__kernel_=
fd_set=E2=80=99
>    20 | typedef __kernel_fd_set         fd_set;
>       |                                 ^~~~~~
> In file included from /usr/include/sys/types.h:179,
>                  from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/select.h:70:5: note: previous declaration of =E2=80=98fd=
_set=E2=80=99 with type =E2=80=98fd_set=E2=80=99
>    70 |   } fd_set;
>       |     ^~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:21:33: err=
or: conflicting types for =E2=80=98dev_t=E2=80=99; have =E2=80=98__kernel_d=
ev_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99}
>    21 | typedef __kernel_dev_t          dev_t;
>       |                                 ^~~~~
> In file included from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/types.h:59:17: note: previous declaration of =E2=80=98de=
v_t=E2=80=99 with type =E2=80=98dev_t=E2=80=99 {aka =E2=80=98long unsigned =
int=E2=80=99}
>    59 | typedef __dev_t dev_t;
>       |                 ^~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:25:33: err=
or: conflicting types for =E2=80=98nlink_t=E2=80=99; have =E2=80=98u32=E2=
=80=99 {aka =E2=80=98unsigned int=E2=80=99}
>    25 | typedef u32                     nlink_t;
>       |                                 ^~~~~~~
> In file included from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/types.h:74:19: note: previous declaration of =E2=80=98nl=
ink_t=E2=80=99 with type =E2=80=98nlink_t=E2=80=99 {aka =E2=80=98long unsig=
ned int=E2=80=99}
>    74 | typedef __nlink_t nlink_t;
>       |                   ^~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:31:33: err=
or: conflicting types for =E2=80=98timer_t=E2=80=99; have =E2=80=98__kernel=
_timer_t=E2=80=99 {aka =E2=80=98int=E2=80=99}
>    31 | typedef __kernel_timer_t        timer_t;
>       |                                 ^~~~~~~
> In file included from /usr/include/sys/types.h:130,
>                  from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/bits/types/timer_t.h:7:19: note: previous declaration of =E2=
=80=98timer_t=E2=80=99 with type =E2=80=98timer_t=E2=80=99 {aka =E2=80=98vo=
id *=E2=80=99}
>     7 | typedef __timer_t timer_t;
>       |                   ^~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:52:33: err=
or: conflicting types for =E2=80=98loff_t=E2=80=99; have =E2=80=98__kernel_=
loff_t=E2=80=99 {aka =E2=80=98long long int=E2=80=99}
>    52 | typedef __kernel_loff_t         loff_t;
>       |                                 ^~~~~~
> In file included from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/types.h:42:18: note: previous declaration of =E2=80=98lo=
ff_t=E2=80=99 with type =E2=80=98loff_t=E2=80=99 {aka =E2=80=98long int=E2=
=80=99}
>    42 | typedef __loff_t loff_t;
>       |                  ^~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:53:9: erro=
r: unknown type name =E2=80=98__kernel_uoff_t=E2=80=99
>    53 | typedef __kernel_uoff_t         uoff_t;
>       |         ^~~~~~~~~~~~~~~
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:115:33: er=
ror: conflicting types for =E2=80=98uint64_t=E2=80=99; have =E2=80=98u64=E2=
=80=99 {aka =E2=80=98long long unsigned int=E2=80=99}
>   115 | typedef u64                     uint64_t;
>       |                                 ^~~~~~~~
> In file included from /usr/include/stdint.h:37,
>                  from /usr/lib/gcc/x86_64-redhat-linux/11/include/stdint.=
h:9,
>                  from /usr/include/libelf.h:32,
>                  from main.c:68:
> /usr/include/bits/stdint-uintn.h:27:20: note: previous declaration of =E2=
=80=98uint64_t=E2=80=99 with type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99}
>    27 | typedef __uint64_t uint64_t;
>       |                    ^~~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:116:33: er=
ror: conflicting types for =E2=80=98u_int64_t=E2=80=99; have =E2=80=98u64=
=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99}
>   116 | typedef u64                     u_int64_t;
>       |                                 ^~~~~~~~~
> In file included from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/types.h:161:20: note: previous declaration of =E2=80=98u=
_int64_t=E2=80=99 with type =E2=80=98u_int64_t=E2=80=99 {aka =E2=80=98long =
unsigned int=E2=80=99}
>   161 | typedef __uint64_t u_int64_t;
>       |                    ^~~~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:117:33: er=
ror: conflicting types for =E2=80=98int64_t=E2=80=99; have =E2=80=98s64=E2=
=80=99 {aka =E2=80=98long long int=E2=80=99}
>   117 | typedef s64                     int64_t;
>       |                                 ^~~~~~~
> In file included from /usr/include/sys/types.h:155,
>                  from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/bits/stdint-intn.h:27:19: note: previous declaration of =E2=
=80=98int64_t=E2=80=99 with type =E2=80=98int64_t=E2=80=99 {aka =E2=80=98lo=
ng int=E2=80=99}
>    27 | typedef __int64_t int64_t;
>       |                   ^~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:138:13: er=
ror: conflicting types for =E2=80=98blkcnt_t=E2=80=99; have =E2=80=98u64=E2=
=80=99 {aka =E2=80=98long long unsigned int=E2=80=99}
>   138 | typedef u64 blkcnt_t;
>       |             ^~~~~~~~
> In file included from /usr/include/stdlib.h:394,
>                  from main.c:67:
> /usr/include/sys/types.h:192:20: note: previous declaration of =E2=80=98b=
lkcnt_t=E2=80=99 with type =E2=80=98blkcnt_t=E2=80=99 {aka =E2=80=98long in=
t=E2=80=99}
>   192 | typedef __blkcnt_t blkcnt_t;     /* Type to count number of disk =
blocks.  */
>       |                    ^~~~~~~~
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/ua=
pi/linux/stat.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:7,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/linux/types.h:266:34: er=
ror: expected =E2=80=98:=E2=80=99, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99=
, =E2=80=98}=E2=80=99 or =E2=80=98__attribute__=E2=80=99 before =E2=80=98*=
=E2=80=99 token
>   266 |         struct task_struct __rcu *task;
>       |                                  ^
> In file included from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/cache.h:6,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/time.h:5,
>                  from /home/isolodrai/workspace/prog-aux/linux/include/li=
nux/stat.h:19,
>                  from main.c:70:
> /home/isolodrai/workspace/prog-aux/linux/include/vdso/cache.h:5:10: fatal=
 error: asm/cache.h: No such file or directory
>     5 | #include <asm/cache.h>
>       |          ^~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [/home/isolodrai/workspace/prog-aux/linux/tools/build/Makefi=
le.build:86: /home/isolodrai/workspace/prog-aux/linux/tools/bpf/resolve_btf=
ids/main.o] Error 1
> make: *** [Makefile:81: /home/isolodrai/workspace/prog-aux/linux/tools/bp=
f/resolve_btfids//resolve_btfids-in.o] Error 2
>
>
> >
> > [...]
> >

