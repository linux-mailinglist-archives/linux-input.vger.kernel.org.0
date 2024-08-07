Return-Path: <linux-input+bounces-5403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4F949EC5
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 06:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26C8AB21412
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 04:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433332AD16;
	Wed,  7 Aug 2024 04:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIwbgszs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8D1C14
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 04:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723003950; cv=none; b=gWPQvh+nLiaBrn7mOqSh89911gEcoUPddqpToeupEKcCIT00/F2cKJIrrj3aB3VlrvpEJ6xmjIXqVhB2it64FSmDv+UuJeq3yqqHQSsA4l4zr04yxejvn+b07Urz7AvN1aMpCP94GQE6cKynRFFfU3UUbcgBcIhZj/y2WtWaOIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723003950; c=relaxed/simple;
	bh=CtSMbRe+2+rqpbCg33o7delBFaDHJD8r570CeySx5xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIbkLyEwTbUXo95BuBCbSg6L7ye6V0WtlSW1ZqdqfsaPX8B/5mb+RWMHi6D4YkezN0ZLDEZvtrd33qxCLPlz1H4Ph7IWq9DFdUyEjdUQsVnxQ63m7l9tTL63DIINFB5KUgOgT9/dB9d51GaGH3rpGluwO/eEscZabxbMBvwbrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIwbgszs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so374445a91.0
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2024 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723003948; x=1723608748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMmNYIVPw4qIlNnJRIWzRv8FPpPml0d7RcgzxHAbkik=;
        b=KIwbgszsskTNOMrGsb8fL6L8bjRDiq/5ncSsCRm1fNZ76RF+MuXZVYMnjglD5Gb2kO
         SMzbwgQARwWpKB2zwDtGoiWfBrAmMpgaB/T5W2co1UO7kyzVIjp70G+63KvWxPATSVAv
         bHH0MGmMECM0edsyKrzCDzuo4oOsf7sNEd6sE9BSA7rf04EbmlMfBYIHBCNDbl+11/qX
         LLEjOW/Usq1IKKF23GXTvl5tL7BA8LSm3O3VwGcWeOosFrhCUf0M35lypoZM6FRIPSyW
         AcypdOJEjf3/7UYrX5HG7T4qbEVtkje81eyMfwzBC7EUrBr786dJeJ1G4QUquAcAdf5N
         LF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723003948; x=1723608748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMmNYIVPw4qIlNnJRIWzRv8FPpPml0d7RcgzxHAbkik=;
        b=H5ANyUE9KcSYdkwmIguEKtrKD4mr/+2gin8ebS2yfhWYzPQGxt46+2t7OnyQMO4qh8
         e0xyq3XW8PAFT5G290hwzZbtvAmkrWt2UcyoI0AbkW+LkteoLhJH9SpsHih4RSuXpNY9
         bOKEKcCq6HRKHVl9QgwwHQh2AnlIW3u8pvJyfvbArI5t20XF2hLaaQGSJS2Jm/jOWGYD
         dFAm9DnbwNQpPmFVt8Dcu0el63AYxgypO5P+kBA9gnkWcaJbAK0VnMu1Skku4HDsb1mY
         +AM5Dz2Q4hKyjyTJhdazhpPLdGXukylO49qytx7j37P9O5PAT6elWmeFKNShEUc2P7DZ
         5BnA==
X-Forwarded-Encrypted: i=1; AJvYcCXnjKxLCehpb6yYEjYZbVVFVzdVqf9Y+4vzVvjb9sN/z6VQPq4kGcPzxcJw+L6s5cuY2ZhoEFiD5f8lA8iUG7FPj0OsEachlrllJvE=
X-Gm-Message-State: AOJu0Yw6bDqdhDlKKnR5NJJyn5Yk+Ii2VuQGD55SEnZd5H00WtgE1H7Y
	fahV4Tkvd5rdhycNvz4PzUeEEXOvkDuLV8EYfj1YngbYMmSPzJdZ
X-Google-Smtp-Source: AGHT+IHD/ptm6M7LiDl+CbrveIc7Iz2UVZRPyg4NZw5IOHvFCSxXx+OnFob5JMV0Ivue7tjufBp4EA==
X-Received: by 2002:a17:90a:4d82:b0:2cb:50b8:e59d with SMTP id 98e67ed59e1d1-2d1b2d53424mr1549187a91.12.1723003947457;
        Tue, 06 Aug 2024 21:12:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5e0f:b2bc:fc41:27a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b36dd55csm354541a91.29.2024.08.06.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 21:12:27 -0700 (PDT)
Date: Tue, 6 Aug 2024 21:12:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	bentiss@kernel.org, linux-input@vger.kernel.org, cpuwolf@gmail.com,
	oleg@makarenk.ooo
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <ZrL0KD9yDnfHMbL-@google.com>
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com>
 <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807031245.GA3526220@quokka>

On Wed, Aug 07, 2024 at 01:12:45PM +1000, Peter Hutterer wrote:
> On Tue, Aug 06, 2024 at 07:50:07PM +0200, Tomasz Pakuła wrote:
> > On Mon, 5 Aug 2024 at 07:34, Peter Hutterer <peter.hutterer@who-t.net> wrote:
> > >
> > > On Fri, Aug 02, 2024 at 04:58:31PM -0700, Dmitry Torokhov wrote:
> > > > Hi Tomasz,
> > > >
> > > > On Fri, Aug 02, 2024 at 10:09:40PM +0200, Tomasz Pakuła wrote:
> > > > > Hi. I can't seem to shake the feeling I'm being ignored here. I would love to
> > > > > get some input from you Dmitry, as this is an issue that was raised a few
> > > > > times throught the years and many times, it was left to wither, even with
> > > > > proper patches submitted and the reasoning explained.
> > > > >
> > > > > One might think of this as trivial, but this is kind of an ancient limitation
> > > > > and we ought to improve linux HID compatibility, especially since this is
> > > > > such an "easy" fix but still has to propagate throught the linux world.
> > > > >
> > > > > If I'm stepping out of the line, or something is really worng with my
> > > > > intention here then please let me know, but I know at least in 2020 there
> > > > > was a similar push to change this and  after Wei Shuai explained his reasons
> > > > > he was similary ignored.
> > > > >
> > > > > Me? I just got a new Moza wheel and it too uses button above 80 so I can't
> > > > > make proper use of it :)
> > > >
> > > > Sorry, I must have missed Wei's email and I was just trying to figure
> > > > out what to do here...
> > > >
> > > > I understand that we have a limitation in the input layer for the number
> > > > of keys/buttons to support, but I wonder if input layer is the best way
> > > > of going through here. For the long time I was against an "anonymous" or
> > > > programmable buttons in the EV_KEY space. The reason is that we want
> > > > userspace to not care what device emits an event and act solely upon
> > > > what that event is. I.e. if a device emits KEY_A it should not matter if
> > > > it is an external USB keyboard, or internal PS/2 one or maybe it is
> > > > Chrome OS matrix keyboard connected to an embedded controller with it's
> > > > own protocol. Same goes for KEY_SCREENLOCK and others. Yes, we do have
> > > > multiple usages called "trigger happy" but I am not really happy about
> > > > them.
> > >
> > > ftr though it's mostly obvious, this effectively moves all key
> > > configuration into the kernel, doubly so for devices that are fully
> > > programmable with no specific meanings (the XKeys devices are the oldest
> > > ones that I'm aware of that don't work that way).
> > >
> > > IOW, this approach works for semantic keys but not at all for anything
> > > that's really just one key out of many with no real distinguishing
> > > features otherwise.
> > >
> > > OTOH it has saved us from having to ship keyboard models like XKB used
> > > to do in userspace.
> > >
> > > > Additionally extending keys space is not free, we need to allocate
> > > > bitmaps, historically we run into issues with uevents being too big,
> > > > etc, etc.
> > > >
> > > > I wonder if we can consider following alternatives:
> > > >
> > > > 1. Can we go through HID (/dev/hidraw) instead of input layer? I do not
> > > > think we will see such devices connected over anything but HID (BT or
> > > > USB).
> > >
> > > HID is currently unsuitable for two reasons: we don't have EVIOCREVOKE
> > > for hidraw (I need to dust off that patch from years ago). And the
> > > desktop input stack (i.e. libinput + compositors) doesn't handle that
> > > use-case either, our key events are currently tied to EV_KEY codes.
> > > Can be worked around, just needs a fair bit of effort that without a
> > > HIDIOCREVOKE (and logind integration) isn't worth starting.
> > >
> > > But at least for these devices - libinput already doesn't handle
> > > joysticks/gaming devices so I can easily ignore those too and let those
> > > be punted to the application :) Which means the ioctl is all we need for
> > > now?
> > >
> > > > 2. Can we consider using something other than EV_KEY? For example we
> > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > > transmitting key number and state of keys that do not have pre-defined
> > > > meaning. Here we are losing event deduplication and ability to query
> > > > full keyboard state, but I wonder how important that is for the devices
> > > > in question.
> > >
> > > The same problem rears its head in the EV_ABS and EV_REL range, so
> > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > >
> > > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > > updates in the same frame without an SYN_MT_REPORT equivalent.

I do not think that frame notion is that important for keys. It is
typically important for a pointing device state.

> > >
> > > but (and this is not fully thought through) if we are ok with dropping
> > > value 2 key repeat values we can make the input_event.value a bitmask,
> > > so we can have EV_KEYMASK / KEYMASK_00, KEYMASK_32, .... so for buttons
> > > 1, 2 and 32 down you'd send
> > >         EV_KEYMASK / KEYMASK_00 / 3
> > >         EV_KEYMASK / KEYMASK_32 / 1
> > >         SYN_REPORT
> > >
> > > This should be nicely map-able from HID too. Would also work
> > > for EV_MSC / MSC_PROG_KEYMASK if you don't want a new type.
> > >
> > > Other random idea, even less thought out: have a marker bit/value that
> > > designates anything in a certain range as "merely numbered'. Not sure
> > > how to do that but that would make it possible for non-mt devices to
> > > re-use the limited abs range for something else.
> > >
> > > Cheers,
> > >   Peter
> > 
> > Hmm, these all sound like good ideas. I'm net yet very well versed in the whole
> > linux kernel input stack, but looking at it, it seems that it does need an
> > overhaul in the coming years.
> > 
> > But I have some questions. This patch only adds another 65 possible buttons/
> > undefined usages. Would it really pose such an issue? 0x2ff already is quite
> > a big number (767). I don't think another 65 would really break the bank here.
> > 
> > > Additionally extending keys space is not free, we need to allocate
> > > bitmaps, historically we run into issues with uevents being too big,
> > > etc, etc.
> > 
> > Is it related to Linux kernel or outside software? Is linux generating some
> > kind of bitmaps? I'm not aware of such thing.
> 
> Recent example I recall is this:
> https://lore.kernel.org/lkml/ZjAWMQCJdrxZkvkB@google.com/t/

Yes. Also we present input device capabilities in sysfs and /proc and
potentially other places.

> 
> > Peter's idea seems sane BUT doesn't address the real crutch here. A lot of
> > software uses (directly, or indirectly) KEY_MAX define to outright cap the
> > number of buttons read from a given HID device. From the top of my head,
> > SDL2/3 does this, Firefox as well.
> 
> fwiw, anything based on libevdev which is at least libinput +
> xf86-input-synaptics/evdev are similarly capped.
> 
> > When it comes to undefined usages, software already deals with that without
> > issues. For years we had this undefined range above TRIGGER_HAPPY_40 from
> > 0x2e8 to 0x2ff. SDL returns "Undefined" name, evtest marks these as "?" BUT
> > this doesn't impare the use of such buttons in the slightest. These simply
> > show up as buttons 58-80.
> 
> ftr, evtest marks anything as ? that doesn't have a define added to
> evdev. libevdev does the same but at least it automates the process
> based on the kernel header file.
> 
> But my main gripe here is that, for better of worse, the keycodes
> are semantic - an unknown code isn't "button N" because in the next
> kernel version it may be e.g. KEY_VOLUME_MAX and unless you special-case
> every client that wants to use your device, this hurts. At
> least the trigger happy is reserved to never be anything else.

Exactly.

> 
> Likewise, once released your device will now *always* have to send
> KEY_VOLUME_MAX for button 3 because changing that will break everyone
> special-casing your device.
> 
> We have existing instances like this: BTN_BACK and BTN_FORWARD are not
> actually forward/back because decades ago X decided physical buttons 4
> and 5 have that role - so BTN_SIDE/EXTGRA are mapped to back/forward and
> BTN_FORWARD/BACK are mapped to whatever comes next (also note: X and
> thus the rest of userspace has back/forward whereas the kernel has
> forward/back).
> 
> libevdev (and thus libinput/xorg drivers) have special casing for
> ABS_MT_SLOT - 1 to detect "fake" multitouch devices that just run up
> from the ABS_MISC range.
> 
> etc. etc.
> 
> Cheers,
>   Peter
> 
> PS: and re-reading the above I realised it would also be relatively
> trivial to add EV_BTN. That could (maybe?) even run parallel to EV_KEY
> in the same frame so that button 8 becomes something like:
> 
> 	EV_KEY BTN_FOO 1
> 	EV_BTN 8 1
> 	EV_SYN SYN_REPORT
> 
> Which means that userspace becomes a "if EV_BTN is present, ignore the
> EV_KEY in the same frame" though that gets a bit trickier if we have
> more than one per frame.
> 
> 
> > All in all, we've had people using this patch (but increasing KEY_MAX to a
> > whopping 0x4ff) for the past few years with no adverse effects. I've been
> > using a custom Linux kernel with this patch on my Arch machine since about
> > May, and didn't notice anything, even when compiling with debug flags and
> > following and filtering dmesg.
> > 
> > So here's the thing I'm most curious about. Is this something, you'd just
> > want to resolve differently, to make it nicer and more logical, or is this
> > really something that would break everything and doing it in this way will
> > never be allowed/merged? That would make a lot of us sad :(

We need to figure out not only how to handle your class of devices, but
also allow extending number of keys that do have certain semantic
meaning. Peter raised a lot of questions that we need to answer.

But I wonder, these devices with large number of buttons that do not
have predefined meaning - do they have to be a single input device? Can
we create N input devices if we exceed the "trigger happy" range, all of
them mapping to "trigger happy"? That would mean that userspace would
keep track of key assignment on per-device basis.

We already split HID devices on per-apllication (not userspace but HID
application) basis, and also when there are several USB interfaces.

Thanks.

-- 
Dmitry

