Return-Path: <linux-input+bounces-12168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F90AABAA8
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 09:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2E5B7B395A
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F5B28ECC1;
	Tue,  6 May 2025 05:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPTViO+L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE5628D8D0;
	Tue,  6 May 2025 05:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509702; cv=none; b=d/tbNfI7fGffJg8gwo0gU0tVC0ZUGi2CYTHK5b7R90xCNv9VPg2rp7gvpk5F9+0D/+NRETCNusGrZbbeQCBSgqeuENC83qTCUpn2RWyGSI/MOdeQlvN/JTZVMiPrcZncU1WX8dv6clN6Azowy85WFH6FGzCel62TZQl27BrbEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509702; c=relaxed/simple;
	bh=fBhz3TeLREOj6BNct6p9r3lF/myOJZ1HQxrA2rUt7Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Betx0qOu0SBo7+sa8hgVXv1IJRIlhb3gfrXN3fpjXOxpHpX72B54qj7qd54buOUiJIZdFBDcJoTWtOH4tR0h4r7xiEy7+BHez4FRHGCsmsRtAnDDZ6jLbofBWWe2++cMGqpz9QtKlHzMgUKrC6DRXhHgAZt6rQ9jqtrRbwMTf/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPTViO+L; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a8fd40723so201377a91.2;
        Mon, 05 May 2025 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746509700; x=1747114500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoBYdJRqhWQWEJMIgGKn4nVohTAo0uQNQu0zxG+8hMU=;
        b=PPTViO+L7dKPc4UgMgkFlcTafoJHQwN70KTakfTuZ4VAKJLIG27tprUo0GlwIRfdTi
         RhQXaRHnGOPU7xnGbWh/d9Qd0uNfZIPQ3X+n5kKyr5nI+Gn18VLI/HapO16/lUVy8RU3
         /dQUcboFYgT+l+krhZQP0uz7eQXxAdXsDsZpB0A7t3p3q6chENhEXJz2kxyO+9ikHIQb
         8W8CLa2xtCQ5LyyVIRmz48YGDvtO9vB4QzlXgzapgtebbIAqe0GnKn5jngjtUkWurviy
         CjEc97TbeASiKlVG5kzn4+XKPlj/09nyF41+6j55eyAFkShQGE7X6VT65ab/JeM2PusL
         8pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746509700; x=1747114500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoBYdJRqhWQWEJMIgGKn4nVohTAo0uQNQu0zxG+8hMU=;
        b=PsLtJKrcM8OeMaw6yaeKLfTo6xGNhBnApRax6d0xxgk61CKbHEehLFh4Sj1pVXMgzz
         Un6qbstRBFjna0Qek9cuIduMr/SuPTiTJpkQikV8U8uAaiONonwY54hKPfNp8bGY0Jdp
         hapsWnHBQtp9rc+HPjyh2E8Rseq9CF9MXejewr6k1hmwXIGhvpSlCG2TTGQtxRP/K5mf
         wDGbAHjHDpVBwbMqNowVxqoKlC19xHkJ+cJlN4r8CwsYAMVuL5DFC0fzbT+kA+vpZWtC
         jl1IGyv3vLg5OWAlXUll2zKffjDEW3jdcYXtNHTT/gXa1fUNPZXX4DO1k7v9Sl9wgH3q
         Fpvw==
X-Forwarded-Encrypted: i=1; AJvYcCW3odoE/CWHiMeORWqCxOptyKa7aNDUPbCj7bj+0Kvtiqq8St4V17RZ55mCRXFYQI3HzOJCD0EGxvYiagU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SCsdo5QcEl2QJPQtEJS+/aFdIZxBTHfCeGjTJqoX+s+56JZK
	YfJ/CbXR16p/syq298kIbRtvQT45NfnccimzfA9HdeC4S75p2ucGWOW4KQ==
X-Gm-Gg: ASbGnctvpbiOTPrwA3ajqeAlS40BrvX5BucDha+lMvEGpM8BFD5HLwRkfFqv/fvPN6L
	p3fjaVLSfONSzJ7WkznmxEaxliaMPKL0SwdB1H7nqxGxkQ4DFivACleh9sgbw8ch6iVx/gGKxx5
	He5nv+WqAgk9puNLrLMSacSeQFN0zg4ofoIyV0q85e/PLosVwPbvaYSntEHABQse0yz80/yQKLB
	uDm3vmypr1Vs7BIm5EEPDpTSEaNoDLo9e9xtPDpW6sqpTxFsX9o1xl504mnjVhbaxV69eP17CpU
	LgAgUHuOI67YXfn1do7CwIBcfZDZq90qzznQ0r4rhg==
X-Google-Smtp-Source: AGHT+IEnwh8oI67CzBg/8sE+2gZeXjP9pEIdgeF0f56sxvWXxcVOFEQnOsVR/j4KwRWJCZbhp2bMUQ==
X-Received: by 2002:a17:90b:2786:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a7bb0891fmr3362129a91.0.1746509699872;
        Mon, 05 May 2025 22:34:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17ab:9e47:29ba:57e6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522a77dsm64788615ad.177.2025.05.05.22.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:34:59 -0700 (PDT)
Date: Mon, 5 May 2025 22:34:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit
 buffer
Message-ID: <2blm4mirspwgcukwnybfgqhiozhtkcqjl2e7g2onxp6ms4ex4a@l4jayj4i6fti>
References: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
 <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>
 <aBBdFoBbdl8GI6da@surfacebook.localdomain>
 <aBTOMzlitljoDAob@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTOMzlitljoDAob@smile.fi.intel.com>

On Fri, May 02, 2025 at 04:52:51PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 29, 2025 at 08:01:10AM +0300, Andy Shevchenko wrote:
> > Mon, Apr 28, 2025 at 04:30:13PM -0700, Dmitry Torokhov kirjoitti:
> > > On Tue, Apr 22, 2025 at 09:56:45PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > +		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
> > > > +			     psmouse->ps2dev.serio->phys);
> > > > +		if (n >= sizeof(priv->phys2)) {
> > > > +			psmouse_err(psmouse,
> > > > +				    "failed to prepare path to the trackstick device\n");
> > > > +			error = -E2BIG;
> > > > +			goto init_fail;
> > > 
> > > So you just broke touchpad of some poor guy who had it working just fine 
> > > for many years. For maximum impact you should add BUG() or panic()
> > > here.
> > 
> > Ha-ha. You know that your speculation most likely so far from the truth.

If your code is not a noop that is precisely what happened.

> 
> And actually what you are telling about is not true at all. If the device was
> working it means that the file node name is not cut, and hence this patch won't
> anyhow change this behaviour. Otherwise, provide an example which can fail this
> and still be working in the user space.

"phys" is not a name of a device node. It is a string available via
/proc/bus/input/devices, sysfs /sys/class/input/input<N>/phys and also
EVIOCGPHYS ioctl. A driver is free to not set it at all and everything
will be working fine.

Actually, input devices themselves to not have device nodes, it is evdev
interface that provides /dev/input/event<N>.

> 
> > > In all seriousness, it is OK to have truncated phys, rarely anyone looks
> > > at it and if we get a report of it being truncated then we can consider
> > > addressing the size (or we can decide to live with it truncated).
> > 
> > In all seriousness, while I agree on the statement, the 4 drivers in Input
> > subsystem break the build. It's the biggest obstacle now to enable WERROR=y,
> > which is default, builds on `make W=1`. So, I already gave you chance to fix,
> > instead I hear nothing back for a months (to be precise 2 months and a day
> > passed from my first attempt that you didn't like), the problem still exists.
> > Please, address this the way you like.
> 
> For the reference, the first approach:
> https://lore.kernel.org/r/20250228121147.242115-1-andriy.shevchenko@linux.intel.com
> where I also asked about this one, ano got no answer.

Sorry I was busy with other projects.

> 
> I really don't want to try anything new as it seems a big pushback to whatever
> I propose. So, please consider fixing the issues rather sooner. I will be more
> than happy to test.

Have you considered that this warning is bogus and it should be disabled
instead? Or maybe GCC should see if there are followup writes to the
same buffer before emitting the warning? 

Thanks.

-- 
Dmitry

