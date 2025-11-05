Return-Path: <linux-input+bounces-15882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6AC33F70
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 06:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86A87349F3E
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 05:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63351DFF0;
	Wed,  5 Nov 2025 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i495pQSx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736C2F29
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762319096; cv=none; b=lBaYGTTZ4/Dy5mxQeeX2F3BKh2+mepocScIgVulIp66SFGildeSEstg1ugQFm+pXLi5+oueNm1W9CRYd8ZGRa48g2OCXgokNdwWpZ953NYSHWvXO2Oq7fVV/vJJgSc1P0lcD6bWVd0EPb+meJ189qHXnnV0CenRSYjCVhkv30vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762319096; c=relaxed/simple;
	bh=2vXHsmYrLvO/DjfMYmdQ0ti7LyUlQnr+hxus5KcOBfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GynKGNMayNuaGPH7OUbR+rySax4gCJvx8rXgPcO/ZkgUhSeujPpgx00j+WNVQpzWQyWHcaxdM83d0lmsxjLF8wwfxZqx6a7JIAwk8r8hbT2fbGkRsqZnTZg+ymZOOcOXNIJ6o59GUyXpxhyKZEc7mDs7Cam847XBcgJfPPW7y/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i495pQSx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29524abfba3so50197495ad.1
        for <linux-input@vger.kernel.org>; Tue, 04 Nov 2025 21:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762319094; x=1762923894; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yisCq3UqZN62qqAw3yfdDX30b5GuoCsmMegKsB9+RwE=;
        b=i495pQSx9IVIzGpFOtOHAroUILIg66Yytuh2o1NxKHjb508CM6/RzfZ06FbVPDQkr+
         ljVuW9rixfTWTSA5OS4qyY+3+UjtwVCtwi7mNI8htyI9ivR6S7NAsvUdqexx8YDagY2Z
         52lOTHcyi3Buax7vL2ZE+6+KmK0TjAAPwXCEVxkLOoo/DyRdtuQQceG1JjyGqG+rszgL
         o0VxIP9PRHuBiV7Pa5jy6bX/IP6gwRCgtYUtL4J1j4hdKolzWDo2dmOCQQ8Zx0JAgrDD
         iGpGRwggxWVz9JjNEzLpEn71qta8KYPCneF7vCNwu+XgPqPLo68p5SaYR6ZUFxNzUy0G
         HVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762319094; x=1762923894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yisCq3UqZN62qqAw3yfdDX30b5GuoCsmMegKsB9+RwE=;
        b=sVfUUXx+naqsYZMevNm0JoS/opD8jG+jBEcdn1WNnkYyeDIFrpnLbdcQ28tFCljm2n
         jacP4sVa2l/TUEIKvnmL41zF4NL9a2yze80X6XQiJYbrUczV9yN0btk9REeIavY5TToO
         eEGXHFBYUWPD8UCQUUUJCwMSFe6nGW02l4FFjsJ/Hd6vMYMT2Sa8uoOwRIXEp7OyOHVU
         mVL4IB9MkRqC3PtAH2iqXiUkqz2AY9fiOLb/PT6Hy+Puu0l2mQ0OZx5qTENCh6CMBILx
         bM+7iMg3NgCm8tDEb+fku164TUXFXW5KJeRQ50PkncKNGO+xR5zuwaFa4udrzLLQJB+u
         dZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqqHqFbAlTqlW/KCx9dr2f/qRtqfKfrfKiEtReFjt/006EGPNdJQ8DMaz/xM4Hs3byICGXGX82JmxFsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFBfAS+PUZuvXlyXfHmGwnpdw+T4MKWnQ43XYoRYVJauCNjlM
	ry8JedEnjPI8d0DH4H41+92C5B7Yh9EYbELtBF6Gfq3ckFkdH1+1r34A
X-Gm-Gg: ASbGnct7pLCiORlKMhxR8JqkJ/lodTN6UFF0FA2opbc3Dqs4ZkRkDDUUPg119CW0ano
	qqZHq+4uBNkP1gx+7+SbzyxER8v3ax1bhz6y1vTHoVw1nOOy+NXycH53JvaS5L7HG0S39i1eHoF
	8LUY5fU3Bi8MPo/ECAedWeNcfv2HsVYnjQaCTHUJsRaPWoKbEv+kZWEpnI2cg8mJk4e6pOicoe6
	XlSbnvybJvbjJCZ4REKpiQ4ZE5w1sY/67UHldOwL82qvHL8OE460rI2sauYqV+Nn9HRGAnlipOT
	ovyQ+pV9+8bHvW1CeHEhaoztDWFsUcD0XgV8k07Q1qWYR+Qb6iqyyyFs4wzh9KkQUJ3QXLsV987
	N8xwl+klQVXGAQweuHukHAMqoRwrefpCY/gzIEyjoqS0gs7d7WLkPLclrppUF8Hv7Ecd7r92kUU
	L+dwqh1smjxvGwOPFDPj/o3nrZ+TU2HasANzoLbymdiw==
X-Google-Smtp-Source: AGHT+IFHFw3U5jwvoS2mi+xo2/c2miBuPUVAC3C9Sqd+nrAz/pS29nn2s4tmizjJ/rJ2/Rf8y0q9ZA==
X-Received: by 2002:a17:902:f684:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-2962acfd7e2mr34274365ad.11.1762319094369;
        Tue, 04 Nov 2025 21:04:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86b3:15ed:c006:18d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7a882sm45729975ad.109.2025.11.04.21.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:04:53 -0800 (PST)
Date: Tue, 4 Nov 2025 21:04:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Cameron Gutman <aicommander@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to
 BTN_DPAD_*
Message-ID: <rkua5gpwvwcs5nb7u6dvab7xlgkpghaw6cezk5mztdkrdc7zch@lwflpa5wfe2e>
References: <20250702034740.124817-1-vi@endrift.com>
 <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
 <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
 <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
 <CAAfxzZ1xJC2QRms4RMS54JCbieupt7XmxO6bwZc0vnx0thT4Yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAfxzZ1xJC2QRms4RMS54JCbieupt7XmxO6bwZc0vnx0thT4Yg@mail.gmail.com>

On Sat, Nov 01, 2025 at 11:23:51AM -0500, Cameron Gutman wrote:
> On Sat, Nov 1, 2025 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> >
> >
> >
> > On 10/31/25 8:18 PM, Cameron Gutman wrote:
> > > On Sun, Jul 27, 2025 at 3:23 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > >>
> > >> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
> > >>> Since dance pads can have both up/down or left/right pressed at the same time,
> > >>> by design, they are not suitable for mapping the buttons to axes. Historically,
> > >>> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, and before
> > >>> that as mouse buttons. However, BTN_DPAD_* exists for this and makes far more
> > >>> sense than the arbitrary mapping it was before.
> > >>>
> > >>> Signed-off-by: Vicki Pfau <vi@endrift.com>
> > >>
> > >> This unfortunately changes existing mappings, but I guess new events are
> > >> better than old ones...
> > >>
> > >> Applied, thank you.
> > >
> > > Unfortunately this mapping change caused major userspace breakages.
> >
> > This is unfortunate, however,>
> > > I think it needs to be reverted.
> > >
> > > [0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-controllers-d-pad-is-now-wrong-and-how-to-fix-it
> > > [1]: https://github.com/libsdl-org/SDL/issues/14324
> > > [2]: https://github.com/libsdl-org/SDL/pull/14339
> >
> > None of these pages suggest reverting the changes. The blog post suggests that these mappings are correct, and that the libraries need to be fixed. Reverting it is mentioned as an absolute last case scenario. The SDL issues say they need more testing, not an outright reversion.
> 
> Breaking userspace is the #1 thing we cannot do as Linux kernel developers.
> 
> The fact that it broke enough people to get a blog post is reason
> enough to revert.
> 
> >
> > Reverting this is solely reverting to an old, uncomfortable status quo instead of actually fixing the things that broke. If this gets reverted, presumably more stuff will ship this broken code that will break if we ever fix this issue again, instead of things getting progressively fixed.
> >
> 
> The "broken" 360 wireless mapping has been used since wireless adapter
> support was first implemented in 2008 [0].
> 
> There's decades of software out there that already has workarounds for
> these devices that we must not break.
> 
> We can send the proper button codes for new controllers, but I think
> we have to leave existing devices alone.
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99de0912be6f384fc31c8e8e7ba0850d0d670385
> 
> > The abandonware being broken is unfortunate, but things like Steam Input exist specifically to work around issues like that.
> >
> 
> This isn't just breaking abandonware. It's breaking the *latest*
> releases of SDL2 and SDL3.

I agree that keeping the old mapping is not great idea, especially if we
start having newer devices using new mapping while other devices use the
old one. However we can't really be breaking existing user setup and now
that we are aware of such breakages we have to react. I am open to
suggestions.

From my side I see a few options:

1. Introduce a module option, and allow controlling the behavior. Hope
distributions will flip it when updating to new version of SDL that can
hopefully handle this. Eventually flip the default to be the new
mapping.

2. Allow overriding mapping from userspace. Allow [main] user (SDL or
not) load an updated keymap if they desire to do so.

3. Maybe we can send both old and new events at the same time and let
consumers decide which ones to act upon? Eventually we can drop the old
mapping (maybe again having an option to use old one or implement option
2 and allow loading old mapping via udev or a utility).

4. ???

Thanks.

-- 
Dmitry

