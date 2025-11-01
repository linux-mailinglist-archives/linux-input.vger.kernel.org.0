Return-Path: <linux-input+bounces-15860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6126C28270
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 17:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 876EF4E03D2
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 16:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE87261E;
	Sat,  1 Nov 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDGe7pDO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A419049B
	for <linux-input@vger.kernel.org>; Sat,  1 Nov 2025 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762014244; cv=none; b=auFYejxdzDmRVvBYLgaqMEI2r+al5/YRJw1HKC8KsqrR9/3iKhlafLL8xgEzsk5eMpvhZaK+CEZ0co8+6HW8f0S+1anB7BWHiXGZtK0LYyYZKGXXEv/yWuIXF1q6tdaRtAV0ZdSrxLOzwvHqol+H7xUgh4/4XLhxV6p8YNYO70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762014244; c=relaxed/simple;
	bh=mR7delN8CF4iSg7GE6bra8DK4Vyc0QblLn7ucNYgd2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNAIGHCJrPL8aQOlmsLjv+m8ISn2Ry6B0/68GqNJhnV85k4MzZajVwrhcaRN+5T2TtDVsJBmcrM0aOJIY3pBeEZbBtFyJHoaFfTzfYy8TIXQXHl5rv6kzV6j0mnpRzOV2YKw8vbLQoj0QtDm0JnDYO4oNxlqqC7D/hIZUHETk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDGe7pDO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3408c9a8147so1813608a91.0
        for <linux-input@vger.kernel.org>; Sat, 01 Nov 2025 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762014243; x=1762619043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR7delN8CF4iSg7GE6bra8DK4Vyc0QblLn7ucNYgd2Y=;
        b=QDGe7pDOyqYuQky0K1kdlk1DrdXLQmSEdELK3K6gxDYLI+CRRUquKYcuKtvMhGakM1
         sPO5dJZnv/r6cuEYxGcT/v1id0/hoqPF/I8Jh9QzBN63LMiWDty/FnoykJgCai3t4BsU
         euXF/HeHQF30RuiKP5jOXa3yh0yUCJn94g6t/CVYmyIMbamWkMD+jIc23DOaafdhssEK
         4jJkPdL5pp0QpSUg/z+9DG0prVGxJthJwtsfN+jDP+mnNWqevy96i4t+3jbzUSZukNV3
         2p6qXrlhnThT4bA7CJpnskXKdPo1LIPh4RMfRffqaCp3LBvZ9qTgQNAJBhpbkpJDml90
         UKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762014243; x=1762619043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR7delN8CF4iSg7GE6bra8DK4Vyc0QblLn7ucNYgd2Y=;
        b=g3APn7YvjZSdVcwBN2wOKQZLeedz661cyoyi1iSifYOq3KGpEK6Q3u1YRPWfZj/ah/
         vv72othojhh4YCgM1SYrqAVt7Nfj4TpWEffncHJRyZ27/3yIgHkwzTxpJH0v5ebd7lsq
         EWE1DmcukN3eCdts59yhsPAhl5iN517lX04o403yNVaE9io18I7DREE23JhDuFzsblC1
         9A3/lY7T85mtxRHgXELCxOrnEJB9+YFvAzpBgNmyJMwpsJmiwdStsaRCSDciEHTm7puO
         vo4K2q0DPi35TC76OrHpaTYxHCwPVKzMIxhSZMgVXYHCRRwH7zS36HH4Hq51LEesZTPf
         pbOg==
X-Forwarded-Encrypted: i=1; AJvYcCUzAVmdA82lBX5nXKjqfuX58s3/Qb/dyHVDnqy/3PSzF8L9UfjoAS/6hwa2e5d87qm4yXs4E9R8YxZeTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6aKbadzTgacLH4TIv0zfgwIqOOeXJvh3Bsox28G8HucpBCP9u
	F4xYe3JbHuJHyLVxgpizuY8wRwztZmst5gtAGEJrLtIyFmsnxLPhuu0Kh5JZKN8YmqhVRc/DNeP
	ElKRYgcrMdjw19E7fZN8uwaLtK2L4OMnMhQzfwZM=
X-Gm-Gg: ASbGncvYADqkuOL9xXjwEgmf9y0AYJPpzcAxkLP9rEr9r0d1/8Wg+iktlVPlX1DP2PZ
	mEqW/MA35WqZCknU/hnZ9PjST52qaRJmsjkSvN3mpSZFD7Rmhw8ONqA0HwjpgXW9GLmz4nbg7ic
	E4Du8SG9KuRpxhtD5HYqKTtnQ/i+Eo5vgV8reatxCWsRFXN1BFfWnAgOUWu8jWHq5wnpeJ/tguC
	R+mR1jb179RpR/Oi3Cn9lj7+4a6RVQZ/D+sBtz4QPJisiInOFvj64FgKIfos8Sbbjw+aZzBzZXP
	+lEkMWVY57JOXDmw/R0=
X-Google-Smtp-Source: AGHT+IFdbDMeGn+dZFS9/a1VzfGp+r7Q00kKmjmD2yRMDGPQ+pBaYQdV6Ohd2shKR/HiLX0BfpYUdBE3wCrpnyZBBT4=
X-Received: by 2002:a17:90b:1c81:b0:340:29a3:800f with SMTP id
 98e67ed59e1d1-3404ac93ee4mr13423807a91.15.1762014242565; Sat, 01 Nov 2025
 09:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702034740.124817-1-vi@endrift.com> <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
 <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com> <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
In-Reply-To: <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
From: Cameron Gutman <aicommander@gmail.com>
Date: Sat, 1 Nov 2025 11:23:51 -0500
X-Gm-Features: AWmQ_bmkn8lD0Zko8xKS91Uc3GzjXc-dCeTZ6ZfR-cVZ-1M2gXE21VdupT_z2VE
Message-ID: <CAAfxzZ1xJC2QRms4RMS54JCbieupt7XmxO6bwZc0vnx0thT4Yg@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to BTN_DPAD_*
To: Vicki Pfau <vi@endrift.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 12:52=E2=80=AFAM Vicki Pfau <vi@endrift.com> wrote:
>
>
>
> On 10/31/25 8:18 PM, Cameron Gutman wrote:
> > On Sun, Jul 27, 2025 at 3:23=E2=80=AFAM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >>
> >> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
> >>> Since dance pads can have both up/down or left/right pressed at the s=
ame time,
> >>> by design, they are not suitable for mapping the buttons to axes. His=
torically,
> >>> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, =
and before
> >>> that as mouse buttons. However, BTN_DPAD_* exists for this and makes =
far more
> >>> sense than the arbitrary mapping it was before.
> >>>
> >>> Signed-off-by: Vicki Pfau <vi@endrift.com>
> >>
> >> This unfortunately changes existing mappings, but I guess new events a=
re
> >> better than old ones...
> >>
> >> Applied, thank you.
> >
> > Unfortunately this mapping change caused major userspace breakages.
>
> This is unfortunate, however,>
> > I think it needs to be reverted.
> >
> > [0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-controllers=
-d-pad-is-now-wrong-and-how-to-fix-it
> > [1]: https://github.com/libsdl-org/SDL/issues/14324
> > [2]: https://github.com/libsdl-org/SDL/pull/14339
>
> None of these pages suggest reverting the changes. The blog post suggests=
 that these mappings are correct, and that the libraries need to be fixed. =
Reverting it is mentioned as an absolute last case scenario. The SDL issues=
 say they need more testing, not an outright reversion.

Breaking userspace is the #1 thing we cannot do as Linux kernel developers.

The fact that it broke enough people to get a blog post is reason
enough to revert.

>
> Reverting this is solely reverting to an old, uncomfortable status quo in=
stead of actually fixing the things that broke. If this gets reverted, pres=
umably more stuff will ship this broken code that will break if we ever fix=
 this issue again, instead of things getting progressively fixed.
>

The "broken" 360 wireless mapping has been used since wireless adapter
support was first implemented in 2008 [0].

There's decades of software out there that already has workarounds for
these devices that we must not break.

We can send the proper button codes for new controllers, but I think
we have to leave existing devices alone.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D99de0912be6f384fc31c8e8e7ba0850d0d670385

> The abandonware being broken is unfortunate, but things like Steam Input =
exist specifically to work around issues like that.
>

This isn't just breaking abandonware. It's breaking the *latest*
releases of SDL2 and SDL3.

We cannot depend on third-party software like Steam Input to avoid
breaking userspace,
nor can we depend on distros to update their SDL versions in lockstep
with the kernel.

> >
> >>
> >> --
> >> Dmitry
> >>
>
> Vicki
>

