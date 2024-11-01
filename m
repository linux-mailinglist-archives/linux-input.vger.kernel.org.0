Return-Path: <linux-input+bounces-7832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB69B90F0
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 13:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05EC62815F8
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 12:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A63F19D088;
	Fri,  1 Nov 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rYS1Ra6q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29A19CC2F
	for <linux-input@vger.kernel.org>; Fri,  1 Nov 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462982; cv=none; b=K/pSZ0l4m/4AFPP/MZVxPynZtgsU2T83kLauLpCX8CkgOt7nnbBm5xoOudNcbw+ifpu+kjrVw+AY0/kOFrmbjEs6EYz95sv0AN1s0Hd6yiv8NOVijRNLz2aLqrr0A2pnuppfevyxaGl3LmaaxsPhmtKtMkdHDCrgNb056+SAU6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462982; c=relaxed/simple;
	bh=l1Tx/Mqp1DVL84/pLx+PjPiMjamTKbGhAoU3aGACmdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daGmsZ19zTlYOUmcfRHRDXF6bbr3yPelpNkx2zkmfm6A+zUt/KSwKbNybIMNEscgI130rv6kM2TAd3+ZUw1zGZN9Kdi9SE5iz25HM/Ca0FXY7CzNVl2BwDLjTHDjmZkLsbGkduU0gtXZkLiTji+aRoH6Bl3QIM2yT6ZK2HFUAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rYS1Ra6q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e59746062fso1579965a91.2
        for <linux-input@vger.kernel.org>; Fri, 01 Nov 2024 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730462979; x=1731067779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hw06b8/XBSAITLf2piQYNBwQQ0z9h7/JKyFJjuUl/c=;
        b=rYS1Ra6qLcWy8HlgezBz/IzF/W872EW+td12irG9Nz9NpMuCSnNBYkM8THoRqdZ8Wt
         3wlKtquHaoYZzezYvrbtDt5IubVOnYeZngj3JL+GEu0nCVbLjCSqxxPDdO+zDZQcUDI/
         EhfMw6YaJAm8WzeYj7Sq9F0/V+rkC818WkN35pAipXnlC9XF0dixmexsvElWj5OIs9lT
         Pm2/x50KiU6r6tpVzyOrq6T5HxjK+KrgFYu7kEb4kAVj1uXN11mrefL9ew4G4L1EPJNS
         zwgOxz6R8bLx9MW3EYrOxLaKNWesw1abyXJ5s8uZBfzS9r0KumH2q8dbrO6LMD1YAg7n
         mABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462979; x=1731067779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Hw06b8/XBSAITLf2piQYNBwQQ0z9h7/JKyFJjuUl/c=;
        b=b4R4uieqTNg/QEIkuNUwunB5CjXztbSFxNsyM3/W5n6ZEavpi795c3YzSdDNsupjWL
         dL/L2WLUtUg4MB7Ep3rVxgZjhEeRv/LaWYGfpNOXnbulFP6yZll61GKCn3JF/7zcuSvv
         6JZnti0HvV6wIYgZWp/vWA0FuhLRKtgXGDNH5kjOoOiCF//MIYYTwVXMRnXdgVMFAxLB
         LgvnJ+8D6HmQN8I+rRBNC4Xz57uHKVOTqyQmHiUDcrBMH3C9HFE6SB2RyrQtKJobAoBx
         +URlQSs0KA7Mr95C6wqB/TxB2Acd6koO/EzR4tJykg//VVcSphqYuDR4vXpNqJXoF1r0
         E4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYsTZa3UBcg/+E/1bQ2aNhD1FLkDejlNs912/wZbyzETfiqD8u2SovCx88NV2lzqHXu9fLjHRJg8Nbgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb5WmgndkexIk0bp7phXYLB/dVjGzn+fbDuYo+65jNe8qz0t8f
	bGZdBLVzTqjUvMiBCmwc8Dtk1tuHDPps9G//KRWxukSq1lJNWl10SsCPsXptQca9YZub5DNBOaF
	j2FclIZ+hoJ0Fv6y4b0wt3RDZ8WOHVqxuFv/MHWVZIUENvsn2hPYe
X-Google-Smtp-Source: AGHT+IF5RsxrkU7RnBDrWCERFHp/phaVhnDnjzEPKD1Zfn0ZTcAn+P8iVv9SsYXnTvR1ARVmNpRkdcYvTanyF6RTtt8=
X-Received: by 2002:a17:90b:2f03:b0:2e2:8995:dd1b with SMTP id
 98e67ed59e1d1-2e93c1591e5mr8521696a91.3.1730462979114; Fri, 01 Nov 2024
 05:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c6b63e97-6839-4beb-bb94-e5914837a041@lucifer.local>
 <6723b31e.050a0220.35b515.0165.GAE@google.com> <2928b6e8-3928-411d-82b8-6b17be266deb@lucifer.local>
 <CANp29Y6OdSOrP4q+1QL9bZU7SnDkMvmSAkFAGM0VqX9gwnZghg@mail.gmail.com> <2023ed50-9aa4-4bc9-8283-82a84c55bc36@lucifer.local>
In-Reply-To: <2023ed50-9aa4-4bc9-8283-82a84c55bc36@lucifer.local>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 1 Nov 2024 13:09:24 +0100
Message-ID: <CANp29Y58o0O8jTSP_SpBLVp7VK0bM4Svo7jBNZgDpv=s1DWJqQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in brk (2)
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, jannh@google.com, liam.howlett@oracle.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	Alan Stern <stern@rowland.harvard.edu>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:11=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Nov 01, 2024 at 12:02:25PM +0100, Aleksandr Nogikh wrote:
> > Hi Lorenzo,
> >
> > On Thu, Oct 31, 2024 at 5:59=E2=80=AFPM 'Lorenzo Stoakes' via syzkaller=
-bugs
> > <syzkaller-bugs@googlegroups.com> wrote:
> > >
> > > +Alan re: USB stalls
> > >
> > > On Thu, Oct 31, 2024 at 09:41:02AM -0700, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot has tested the proposed patch and the reproducer did not tri=
gger any issue:
> > > >
> > > > Reported-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > > > Tested-by: syzbot+7402e6c8042635c93ead@syzkaller.appspotmail.com
> > > >
> > > > Tested on:
> > > >
> > > > commit:         cffcc47b mm/mlock: set the correct prev on failure
> > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/akpm/=
mm.git/ mm-hotfixes-unstable
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1304a63=
0580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6648774=
f7c39d413
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D7402e6c80=
42635c93ead
> > > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils=
 for Debian) 2.40
> > > >
> > > > Note: no patches were applied.
> > > > Note: testing is done by a robot and is best-effort only.
> > >
> > > OK this seems likely to be intermittant (and unrelated to what's in
> > > mm-unstable-fixes honestly) and does make me wonder if the fix refere=
nced
> > > in [0] really has sorted things out? Or whether it has perhaps help
> > > mitigate the issue but not sufficiently in conjunction with debug thi=
ngs
> > > that slow things down.
> > >
> > > Because we keep getting these reports, that mysteriously don't occur =
if we
> > > re-run (or hit other code paths), they seem to hit somewhat arbitrary=
 parts
> > > of mm, and because CONFIG_DEBUG_VM_MAPLE_TREE is set we spend a _long=
_ time
> > > in mm validating trees (this config option is REALLY REALLY heavy-han=
ded).
> > >
> > > I note we also set CONFIG_KCOV and CONFIG_KCOV_INSTRUMENT_ALL which i=
sn't
> > > going to make anything quicker if the USB gets laggy.
> >
> > These are necessary for coverage-guided fuzzing. Though when we find
> > and run reproducers, we don't actually set up /dev/kcov, so I guess
> > the impact of coverage callbacks here is not that significant here.
> > CONFIG_KASAN is likely slowing down things much more.
> >
> > >
> > > I'm not sure if there's a human who can help tweak the config for the=
se
> > > hardware-centric tests at Google? At least tweaking the RCU stall tim=
e
> > > anyway?
> >
> > We currently set:
> >
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D100
> > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=3D21000
> >
> > The expedited RCU timeout was limited to 21 seconds up to some time
> > ago, but I guess now we can safely increase this number as well. I'll
> > send a PR with syzbot config updates.
>
> Ah thanks, just sent a reply immediately prior to receiving this :)
>
> Maybe worth setting CONFIG_RCU_EXP_CPU_STALL_TIMEOUT to 0 so it matches t=
he CPU
> stall timeout? At least for builds that also set heavy debug options like
> CONFIG_DEBUG_VM_MAPLE_TREE?

Oh, that's even simpler than I thought it would be, thank you!
I've sent https://github.com/google/syzkaller/pull/5455, it will come
into effect in a few days.

--=20
Aleksandr

>
> Cheers, Lorenzo
>
> >
> > --
> > Aleksandr
> >
> > >
> > > In any case this continues not to look likely to be an actual mm issu=
e as
> > > far as I can see.
> > >
> > > In [0] we were stalled in a validate call which would align with the =
idea
> > > that perhaps we were just dealing with a very very big tree and getti=
ng
> > > slow down that way.
> > >
> > > Cheers, Lorenzo
> > >
> > > [0]:https://lore.kernel.org/all/967f3aa0-447a-4121-b80b-299c926a33f5@=
rowland.harvard.edu/
> > >

