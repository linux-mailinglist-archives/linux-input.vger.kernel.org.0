Return-Path: <linux-input+bounces-5412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C334694B1C3
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 23:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0601F23681
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 21:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318F21494AB;
	Wed,  7 Aug 2024 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIprcto/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E5148857
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723064826; cv=none; b=LZC9hsTXUP88EqoDYi049JRozXrZGkAPw4AaiIyGOa7T+tLX/lGRqtZyql+kF8eYvii+bm2ZEchXVhsvIiCcZqlmuL9TzMX323/kdPyrVqDndjGJ/UQM/7M6HOdeXWJz1D0kNu+wS7RCylzSjN4SkRVpjresSSyxMBtRWxxEoGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723064826; c=relaxed/simple;
	bh=rVTAd5dLFVHNyW1T/o5+eAqcsXP63LTd0XwxmUB+FEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REPoeizWrVFxsLlsKyMjrtiapJIs5L8xdJLhryBHbPfi16qsmsYEy96JN5hS6Of88i9NqK8QU3ueFLs2+TzTxWoTSUbmsxXn5GR/vBh9d+Hc+5hfjH0FvKFEJ+3ctspTk69smxuL4czQECacy7q2qpoxRua+XXBJ0oTmnno3kWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIprcto/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso281829a91.1
        for <linux-input@vger.kernel.org>; Wed, 07 Aug 2024 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723064824; x=1723669624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aapOLgUBcU6JBRyR5sj8ORmYgs90YROuASrHbu+jrV8=;
        b=ZIprcto/KwZdhgQu6YrdrNuPGhUW/jxqxuQeIwwnnl2SaKRtSq+AduqAnYb8NdngiF
         lGU7lMM1mhLV7wILx2ZwKa7tgsqTqk69vylhxwntcdJdmoD91C7XoSLKWOCKFH76eS7g
         O4zz2JOJgh6ClbNF6ZYxEPSdezAFm1Ie1A+2ayaw4kEoYLtHqtk6tIaWhKNqICEHhcw/
         d4Poq7m4dHdMd6tpPj/AAIRgIWNlQ6hXshxhCiwYL7pFEVWNphI0MAaSUIuYQYl27z3Z
         D8GP78vIsGBOIkGbygSgYBcDNfvkxAynazxxB/lELhYUigtZ2NepNNljqzwPTqMOoaAy
         RgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723064824; x=1723669624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aapOLgUBcU6JBRyR5sj8ORmYgs90YROuASrHbu+jrV8=;
        b=mxvlOiuHTkBkih19rdyHl40s5EKkx/Kr11o499r6Bbi3lEA77pFqpJPIhlcoPjTvn6
         HLJuSRv6P//FRoAmGBSy6s3odBMRz5V++3ed+drMMIMZKr1EosLtM1m1hbHpXavjx3qu
         yhZLY0HZTUDT8t9f6NKjzr5i5SFlFyxMlafo5x9HX7YvwMCE/9mIup0L0n7IwDS0qCTJ
         EEAwSkTxeNdzNkbVOZO2JKEcOkrLYDDZJzfqfB0l4Lzz7DFXoOv9r1ASTr2fYtlvSkhn
         jB6qCIIsuFGsDSuubFfJitWD9/5T4RexTij1EeXpTci3uPD/8XaEeyQHflfo++RPhxcI
         YRzA==
X-Forwarded-Encrypted: i=1; AJvYcCU+TfBT7J6u3qPfGJxacqNlvSEJAstiKp21pDXtTPbrAn1Q/3YBemYGZ6WDrXuBCBM+umgRMdATb0Ao3WmJGEYDMqfGdEsfuO/mssA=
X-Gm-Message-State: AOJu0YwE9wWZxfPdkJZiM+kuRFYlFy4T+fPWIXXmzmVE5tYeyyWWyeMb
	J5S3/vh8AEBi6IvkBPGpPmbTD1i0vi8iDVovCyr48pM75oD4mbOJ
X-Google-Smtp-Source: AGHT+IGoEi4Z6ZfPO7Y0P0ykGn9NVC0AQjXQV74GPs+o1SR97t97ojJZ1wipIfTdr4aRZjwG5QKUkw==
X-Received: by 2002:a17:90b:384:b0:2c9:815a:80cb with SMTP id 98e67ed59e1d1-2cff9444f23mr18446972a91.21.1723064823348;
        Wed, 07 Aug 2024 14:07:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:462:f8ab:4aca:ae3c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b36dd505sm2058415a91.33.2024.08.07.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 14:07:02 -0700 (PDT)
Date: Wed, 7 Aug 2024 14:07:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Wei Shuai <cpuwolf@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>, bentiss@kernel.org,
	linux-input@vger.kernel.org, oleg@makarenk.ooo,
	torvalds@linux-foundation.org
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <ZrPh9F5lhUKLLSQk@google.com>
References: <Zq1ypyDxAVQsjpjB@google.com>
 <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka>
 <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka>
 <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
 <ZrPEgZ9_ahKx2WTu@google.com>
 <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>

On Wed, Aug 07, 2024 at 10:22:13PM +0200, Tomasz Pakuła wrote:
> On Wed, 7 Aug 2024 at 21:01, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Aug 07, 2024 at 04:42:56PM +0800, Wei Shuai wrote:
> > > yes, agree. either way, will be a revolution.
> > >
> > > At least, for me as X-Plane flight simulator gamer, a small change in
> > > expanding the key max number can make my device work immediately
> > >
> > > Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com> 于2024年8月7日周三 14:23写道：
> > > >
> > > > On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t.net> wrote:
> > > > >
> > > > > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > > > > > > 2. Can we consider using something other than EV_KEY? For example we
> > > > > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > > > > > > > > transmitting key number and state of keys that do not have pre-defined
> > > > > > > > > > meaning. Here we are losing event deduplication and ability to query
> > > > > > > > > > full keyboard state, but I wonder how important that is for the devices
> > > > > > > > > > in question.
> > > > > > > > >
> > > > > > > > > The same problem rears its head in the EV_ABS and EV_REL range, so
> > > > > > > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > > > > > > >
> > > > > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > > > > > > > > updates in the same frame without an SYN_MT_REPORT equivalent.
> > > > > >
> > > > > > I do not think that frame notion is that important for keys. It is
> > > > > > typically important for a pointing device state.
> > > > >
> > > > > true, I remember a conversation years back that frames aren't
> > > > > consistently implemented in keyboard drivers anyway which is the reason
> > > > > libinput sends (most) EV_KEY events immediately instad of waiting for a
> > > > > SYN_REPORT.
> > > > >
> > > > > > > > All in all, we've had people using this patch (but increasing KEY_MAX to a
> > > > > > > > whopping 0x4ff) for the past few years with no adverse effects. I've been
> > > > > > > > using a custom Linux kernel with this patch on my Arch machine since about
> > > > > > > > May, and didn't notice anything, even when compiling with debug flags and
> > > > > > > > following and filtering dmesg.
> > > > > > > >
> > > > > > > > So here's the thing I'm most curious about. Is this something, you'd just
> > > > > > > > want to resolve differently, to make it nicer and more logical, or is this
> > > > > > > > really something that would break everything and doing it in this way will
> > > > > > > > never be allowed/merged? That would make a lot of us sad :(
> > > > > >
> > > > > > We need to figure out not only how to handle your class of devices, but
> > > > > > also allow extending number of keys that do have certain semantic
> > > > > > meaning. Peter raised a lot of questions that we need to answer.
> > > > > >
> > > > > > But I wonder, these devices with large number of buttons that do not
> > > > > > have predefined meaning - do they have to be a single input device? Can
> > > > > > we create N input devices if we exceed the "trigger happy" range, all of
> > > > > > them mapping to "trigger happy"? That would mean that userspace would
> > > > > > keep track of key assignment on per-device basis.
> > > > > >
> > > > > > We already split HID devices on per-apllication (not userspace but HID
> > > > > > application) basis, and also when there are several USB interfaces.
> > > > >
> > > > > Honestly, I'd vote against this.
> > > > > re-combining input devices into a single device in userspace is a pain.
> > > > > The split per application in HID is mostly fine because they're
> > > > > usually physically different devices but I recently ran into the issue
> > > > > with the uclogic drivers where various features are split across
> > > > > event nodes. Thse devices have the ring on one event node, the buttons
> > > > > on another, etc. Nothing in (my) userspace is currently set up for this
> > > > > and it'd require a major rework in many places to be able to handle this
> > > > > properly. And it requires that rework in every userspace stack, possibly
> > > > > special-cased on a vendor id. In the end it was easier (re-)writing BPFs
> > > > > to get the expected event node behaviour than dealing with the split.
> > > > >
> > > > > A device that arbitrarily splits makes this even more difficult - which
> > > > > one of the event nodes has buttons 1-20 and which one has 21-40? We'd need
> > > > > some other magic somewhere (e.g. hiding in uniq) and some digging around
> > > > > in udev to figure out which ones are part of the same device.
> > > > >
> > > > > I'd rather not go with a simple-for-now solution that makes everything
> > > > > in userspace more complicated, forever.
> > > > >
> > > > > Cheers,
> > > > >   Peter
> > > >
> > > > Yes, I would also say splitting is, unfortunately, out of the question, because
> > > > of the intended use-case of joysticks and other gaming devices. Most games do
> > > > not handle multiple inputs and only allow for one device to be set up at the
> > > > same time. This means, any buttons not present on the first device would simply
> > > > be inaccessible and the end result would be the same as now.
> >
> > So how does this work with, for example, DualShock controllers. IIRC
> > they are split into several sub-devices, such as game controller itself,
> > accelerometer piece, and touchpad piece.
> 
> Touchpad is easy as it's just a generic mouse. It just works as any other mouse.
> Accelerometer can be dealt with Steam input/or maybe emulator that supports
> gyro. But TBH, many games would just not support both gyro and buttons for
> this reason. Fortunately, most games that actually need this gyro functionality
> would be emulated as they're most likely Nintendo titles.
> 
> >
> > > >
> > > > It seems like we're stuck between a rock and a hard place, but at least one
> > > > thing makes this easier. Even if a new usage shows up, it doesn't really
> > > > matter for games and especially sdl. Given button must just work, and it's
> > > > designated usage is of no concern. For all intents and purposes, it's just a
> > > > random name that may or may not show up in the binding settings.
> > > >
> > > > Moreover, all these usages are lost in the proton translation layer, and most
> > > > games are played with it's help nowadays. For the Windows games behind wine,
> > > > these buttons don't have any special meaning and just have numbers.
> >
> > They however do have meaning for the rest of the system. SDL clients are
> > not only ones who listen to input events, so if we extend the "button
> > happy" range we will not be able to use it for anything else, like Peter
> > said.
> >
> > If you do not care about meaning of the events sent out by the kernel
> > then maybe you can "grab" the device (EVIOCGRAB) and completely override
> > the keymap? Will that will work for you?
> 
> Wouldn't that defeat the whole point of input devices being HID compliant, if
> any device that wants to exceed this button range, has to have it's own driver?

No, not really. EVIOCGRAB is an ioctl on evdev, as well as
EVIOCGKEYCODE_V2 and EVIOCSKEYCODE_V2. If you do not care about meaning
the kernel assigns to the buttons you can remap usages to whatever
(maybe withing the range of 0x160 - 0x2ff) using EVIOCSKEYCODE_V2, and
use EVIOCGRAB to stop events being delivered to anything but your
application (so the rest of the system is not confused).

These are existing userspace APIs that SDL can use.

> 
> >
> > > >
> > > > While I understand that a new usage might show up someday, I wonder how
> > > > likely it is in the near future.
> >
> > dtor@dtor-ws:~/kernel/work $ git log --oneline --since=01-01-2024 -- include/uapi/linux/input-event-codes.h
> > 22d6d060ac77 input: Add support for "Do Not Disturb"
> > 0c7dd00de018 input: Add event code for accessibility key
> > cfeb98b95fff Input: allocate keycode for Display refresh rate toggle
> >
> > 3 new ones since the beginning of the year.
> >
> >
> > > > TRIGGER_HAPPY range was added about 20 years
> > > > ago? For me, as a 27 year old it seems like a lifetime ago.
> >
> > 2010 so only 14 years ;)
> >
> > > >
> > > > I guess my point is that if we were to increase these button ranges in ANY
> > > > different way than increasing this limit, we would still need massive movement
> > > > to get all the software to handle these new cases, if they ever would actually
> > > > care/have resources to do so.
> >
> > Yes, but this is the right thing to do. Otherwise next year you will
> > create a joystick with 512 buttons and we will be back to square one.
> > After all we though that 40 extra buttons should be more than enough,
> > and we were wrong.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Wouldn't that defeat the whole point of input devices being HID compliant, if
> any device that wants to exceed this button range, has to have it's own driver?
> 
> I just about understand your reasoning, but I assume this would actually take
> years to implement across userspace, not mentioning first we would need work
> to happen inside kernel, and that would take another bunch of time as this
> isn't a priority to just about anyone who would have the actual knowledge to
> come up with a sane solution. Not mentioning the fact, that just having BTN_MAX
> defined in the first place would rear it's ugly head.

What do you mean? If we go to separate event namespace then what KEY_MAX
would have to do with it?

> 
> Yeas, 512 buttons MIGHT be doable, but the truth is, there are A LOT of devices
> with over 80 buttons (and BTN_TRIGGER_HAPPY range actually ends at button 57),

No it ends at BTN_TRIGGER_HAPPY40. The rest are reserved and may be used
in the future for something else.

> over 140 though? Not so much, if any. Extending BTN_TRIGGER_HAPPY range by
> another 60 usages is just THE fix for current state of input. If it is just
> too ugly then I guess that's that. Sadly, it would seem that this issue
> won't be resolved for years in that case. 2030?

Would it take that long to teach SDL about new event types (EV_BTN that
Peter suggested or MSC_KEY* pairs)?

Can we also talk again about the exact use case we need to solve. It is
not a random Steam game that will make use of tens or hundreds of
keys/buttons and only support a single input device. Don't you already
have to deal with let's say racing wheel and pedals being separate
devices?

I feel we are talking about pretty specialized hardware and pretty
specialized applications and that is why I was wondering if using HID
instead of input would not be a better choice here.

> 
> Though, at some point, there won't be any more space for new key codes and
> BTN_MAX will have to be increased no matter what.

Yes, but the growth is slower than 60+ keycodes at time, especially if
they to not carry any meaning but rather just placeholders.

Thanks.

-- 
Dmitry

