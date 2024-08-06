Return-Path: <linux-input+bounces-5398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F1949718
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 19:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A092D1F219DC
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 17:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D0A59164;
	Tue,  6 Aug 2024 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3VyM8pC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0E46444
	for <linux-input@vger.kernel.org>; Tue,  6 Aug 2024 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966622; cv=none; b=P4CrrgeYmX0q/8cVoYO0/qEcTf0gQd11y3PWevjfHaLoaiwCfSj2qnqLDJ3z46m7dRN0xXA8PccpujyCRfwIrNBcadrXQAvErPxUHz0e6lvTYbOvWnjuyFXlFv4jVGeyUmz9nNezhF0X05rqz/v/UF1saH8ObZIE2w5poSOhs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966622; c=relaxed/simple;
	bh=CF4CvQg4FD2WP4oDnJ63garVFIDEYc1E1RKTcQW6wkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cU2ozjzAxuamvvOg76YaWLfC637zk0CMvM+8hx5gSqlean3/oHWUgYb5E+lfXKB4jshPTCXPCsIrgiSqKk489L/aGi1ATWcVtL69R9bbs+Pny2dRsyauCAU7YhXW1Pe/vGbQUeUYTq6jZ8UIqaMKEEKEojRml+P2siry0Ub2cRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3VyM8pC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso1299562a12.1
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2024 10:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722966619; x=1723571419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV+AhTZRBwWNTqevvZonxzRRUAsP0Ku4NKqfT2et9bg=;
        b=W3VyM8pCzgZycJK+/BioKm62DTGRVn9T6Gsvy/vZ6u1KvCYUH+9VA7A+8m0kSkmd9Q
         54DXQrWUyOcOBIH4vqoW50lWf5RKeJQDcpOpQoxY7lRLktvUZdskE1SNqFyJUZzIVjvl
         P/PHUbUaGQWsB5KNmvxqfApbxyvQ0iyGjxRZtV0XUNYlrg/F+v6xXzG5PB7fH6fjsyGl
         sYI2WBUffJPHkxN1AAM2Xz1Y11Il5ulWYFKd/PPLVdPSRKNl0V+myQUIr0z9ncKdIkHz
         Cq3C9n9Xuulay+1rx37D7FOReqKhPEyUFTuHzTjlHMVg6kduwh/RpNR4eiBNwHi7VjrX
         gC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966619; x=1723571419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV+AhTZRBwWNTqevvZonxzRRUAsP0Ku4NKqfT2et9bg=;
        b=BfJO2BCWQedmjx0vX9F6MS5H/H+sboZ3ZA5dKIUSh9pBV+i47t8/gQoCRLi3SMnKgF
         Fw+/raXVqUMbXPf59oxry1mXHVuljZrH/7dthzRuiHpg9iNrrRQlImAmaKlbaUp0sQpZ
         F81Z7xEW53I2mBH6JoDKlLMjyQ7IzIl4upS92x1ygRwCMITmq+Fj8AEDvsbgFGiY3bbq
         r44XyIuU59WsplMuyvciSFvnRDWjGPdYGSOF4Rw02N0yPOvoj+CXr6Y90dVo67dCQE3e
         eEbZTXrQevStS34mHoTuv+zGhu/SuNFQFZ2Ra41FEfl/fks27skyILzWSoL4NveWTZpD
         nDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDxV+RHJUzcoPK2BN1Y4996d4SxGAAVjsiR8uEK641fJHaDGExSKa8Xm6ncR25M8dvHK7zqM7P1ZM+0YyRdmJlcZPygZuyEhc557g=
X-Gm-Message-State: AOJu0Yy13Wvz604MqaeZ2JF/D2rBspCHtiqSmOauvxfHbmdCwZrg3jub
	a9tUxb3wdGC0eWF2J4hke0onvk8p73egYsayghCs2QGmhskO1fbUteYmwCHlXMGte2dVZnri5A6
	8pypYfeWTwZIYCwN9/vWs7sNqShQ=
X-Google-Smtp-Source: AGHT+IFCDwjkB2WqHAg8RrVF/Ybkaj+LJorQiVuHVDdwVSQITe6OJW9mXxFNeAs+f7JN4RR8GTck8M1c2jCwZkaUQnI=
X-Received: by 2002:a05:6402:331:b0:5a2:2654:7fd1 with SMTP id
 4fb4d7f45d1cf-5b7f59e04d9mr9650653a12.36.1722966618492; Tue, 06 Aug 2024
 10:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com> <20240805053445.GA3149961@quokka>
In-Reply-To: <20240805053445.GA3149961@quokka>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Tue, 6 Aug 2024 19:50:07 +0200
Message-ID: <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, bentiss@kernel.org, 
	linux-input@vger.kernel.org, cpuwolf@gmail.com, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Aug 2024 at 07:34, Peter Hutterer <peter.hutterer@who-t.net> wrot=
e:
>
> On Fri, Aug 02, 2024 at 04:58:31PM -0700, Dmitry Torokhov wrote:
> > Hi Tomasz,
> >
> > On Fri, Aug 02, 2024 at 10:09:40PM +0200, Tomasz Paku=C5=82a wrote:
> > > Hi. I can't seem to shake the feeling I'm being ignored here. I would=
 love to
> > > get some input from you Dmitry, as this is an issue that was raised a=
 few
> > > times throught the years and many times, it was left to wither, even =
with
> > > proper patches submitted and the reasoning explained.
> > >
> > > One might think of this as trivial, but this is kind of an ancient li=
mitation
> > > and we ought to improve linux HID compatibility, especially since thi=
s is
> > > such an "easy" fix but still has to propagate throught the linux worl=
d.
> > >
> > > If I'm stepping out of the line, or something is really worng with my
> > > intention here then please let me know, but I know at least in 2020 t=
here
> > > was a similar push to change this and  after Wei Shuai explained his =
reasons
> > > he was similary ignored.
> > >
> > > Me? I just got a new Moza wheel and it too uses button above 80 so I =
can't
> > > make proper use of it :)
> >
> > Sorry, I must have missed Wei's email and I was just trying to figure
> > out what to do here...
> >
> > I understand that we have a limitation in the input layer for the numbe=
r
> > of keys/buttons to support, but I wonder if input layer is the best way
> > of going through here. For the long time I was against an "anonymous" o=
r
> > programmable buttons in the EV_KEY space. The reason is that we want
> > userspace to not care what device emits an event and act solely upon
> > what that event is. I.e. if a device emits KEY_A it should not matter i=
f
> > it is an external USB keyboard, or internal PS/2 one or maybe it is
> > Chrome OS matrix keyboard connected to an embedded controller with it's
> > own protocol. Same goes for KEY_SCREENLOCK and others. Yes, we do have
> > multiple usages called "trigger happy" but I am not really happy about
> > them.
>
> ftr though it's mostly obvious, this effectively moves all key
> configuration into the kernel, doubly so for devices that are fully
> programmable with no specific meanings (the XKeys devices are the oldest
> ones that I'm aware of that don't work that way).
>
> IOW, this approach works for semantic keys but not at all for anything
> that's really just one key out of many with no real distinguishing
> features otherwise.
>
> OTOH it has saved us from having to ship keyboard models like XKB used
> to do in userspace.
>
> > Additionally extending keys space is not free, we need to allocate
> > bitmaps, historically we run into issues with uevents being too big,
> > etc, etc.
> >
> > I wonder if we can consider following alternatives:
> >
> > 1. Can we go through HID (/dev/hidraw) instead of input layer? I do not
> > think we will see such devices connected over anything but HID (BT or
> > USB).
>
> HID is currently unsuitable for two reasons: we don't have EVIOCREVOKE
> for hidraw (I need to dust off that patch from years ago). And the
> desktop input stack (i.e. libinput + compositors) doesn't handle that
> use-case either, our key events are currently tied to EV_KEY codes.
> Can be worked around, just needs a fair bit of effort that without a
> HIDIOCREVOKE (and logind integration) isn't worth starting.
>
> But at least for these devices - libinput already doesn't handle
> joysticks/gaming devices so I can easily ignore those too and let those
> be punted to the application :) Which means the ioctl is all we need for
> now?
>
> > 2. Can we consider using something other than EV_KEY? For example we
> > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > transmitting key number and state of keys that do not have pre-defined
> > meaning. Here we are losing event deduplication and ability to query
> > full keyboard state, but I wonder how important that is for the devices
> > in question.
>
> The same problem rears its head in the EV_ABS and EV_REL range, so
> fixing it for EV_KEY doesn't necessarily fix it for those.
>
> MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> updates in the same frame without an SYN_MT_REPORT equivalent.
>
> but (and this is not fully thought through) if we are ok with dropping
> value 2 key repeat values we can make the input_event.value a bitmask,
> so we can have EV_KEYMASK / KEYMASK_00, KEYMASK_32, .... so for buttons
> 1, 2 and 32 down you'd send
>         EV_KEYMASK / KEYMASK_00 / 3
>         EV_KEYMASK / KEYMASK_32 / 1
>         SYN_REPORT
>
> This should be nicely map-able from HID too. Would also work
> for EV_MSC / MSC_PROG_KEYMASK if you don't want a new type.
>
> Other random idea, even less thought out: have a marker bit/value that
> designates anything in a certain range as "merely numbered'. Not sure
> how to do that but that would make it possible for non-mt devices to
> re-use the limited abs range for something else.
>
> Cheers,
>   Peter

Hmm, these all sound like good ideas. I'm net yet very well versed in the w=
hole
linux kernel input stack, but looking at it, it seems that it does need an
overhaul in the coming years.

But I have some questions. This patch only adds another 65 possible buttons=
/
undefined usages. Would it really pose such an issue? 0x2ff already is quit=
e
a big number (767). I don't think another 65 would really break the bank he=
re.

> Additionally extending keys space is not free, we need to allocate
> bitmaps, historically we run into issues with uevents being too big,
> etc, etc.

Is it related to Linux kernel or outside software? Is linux generating some
kind of bitmaps? I'm not aware of such thing.

Peter's idea seems sane BUT doesn't address the real crutch here. A lot of
software uses (directly, or indirectly) KEY_MAX define to outright cap the
number of buttons read from a given HID device. From the top of my head,
SDL2/3 does this, Firefox as well.

When it comes to undefined usages, software already deals with that without
issues. For years we had this undefined range above TRIGGER_HAPPY_40 from
0x2e8 to 0x2ff. SDL returns "Undefined" name, evtest marks these as "?" BUT
this doesn't impare the use of such buttons in the slightest. These simply
show up as buttons 58-80.

All in all, we've had people using this patch (but increasing KEY_MAX to a
whopping 0x4ff) for the past few years with no adverse effects. I've been
using a custom Linux kernel with this patch on my Arch machine since about
May, and didn't notice anything, even when compiling with debug flags and
following and filtering dmesg.

So here's the thing I'm most curious about. Is this something, you'd just
want to resolve differently, to make it nicer and more logical, or is this
really something that would break everything and doing it in this way will
never be allowed/merged? That would make a lot of us sad :(

Thanks, and cheers
Tomasz

