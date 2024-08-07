Return-Path: <linux-input+bounces-5410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3C94B039
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 21:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA28284C3B
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 19:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868D213D25E;
	Wed,  7 Aug 2024 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErqE8FZ7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F513D265
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 19:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723057288; cv=none; b=lYxVNO7T7ohXW/ZkVhUcLsgg1hTCWe131DwDKm1TQ/l4pT6tmrX/K3YY6qUjbf8JnhEBXM51OATJj+oKB7IZ85YJQTRvhFRMSQlok+vhuZd4ybCOvl3iy/LwbGAV3BMpGoSdSVoCFMzoRd1ON6r/PbTzKiWiDtGOxCpxpugSU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723057288; c=relaxed/simple;
	bh=wtKeXTwGyJyQbV2k33hy6/UTmq93bgowAGUl4Tm6dAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qm+Py/zn1g2XQ6k41r4W87+8mrLczZ0lfhPAlUd/Xxmq012oqlQpSUHXOzCN/TNl+CFG9oS7xENx5gHw+ooUskaNiYCWI5bRrtSCJJR6yatUPi07x+GDMl17ttNhidUkSAr/oWCINoCUxiTUo4xUt1Lg0+cQY09rzNkgsYHy2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErqE8FZ7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd6ed7688cso2554905ad.3
        for <linux-input@vger.kernel.org>; Wed, 07 Aug 2024 12:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723057286; x=1723662086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dcv5DC7xppn9ZMcZFryOTdoZjxJz0S3ic4odf1PYRrI=;
        b=ErqE8FZ7YqfPtEiuOQX86whQhWHK7Yzq3y/nAtUJvaNtG9h3oOD7hImhdsbGpg9DeI
         Zfo2xv2+17YcEiYjU8YNRjDTcGS4naY9B9Zn+lDDn0Kh7lMBGQM0/Kex+71zBb39Q093
         BTaKg2dYF8zGEo7+RBjYCIzGE4JaAF9tkhKaZJucxKfVzFE44q27f5/V3AmeWd3n8FKJ
         EC61VmczB9Q7bM9fQLCJPaz+A+2b4q0UOVO1mi2enQyOyTOeUqsmXzhuiuqI9eD0SNsS
         rdWx4vqKY+b70b3hIzB2VJ5PpZvTvAsRZ1x2i/XMoggS8uY0P6uhxqscUYadBDWCBpl0
         WCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723057286; x=1723662086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcv5DC7xppn9ZMcZFryOTdoZjxJz0S3ic4odf1PYRrI=;
        b=TO3NDmo43SPok0LWaYO+no7agJ2qEEmHjW0vJCI30xG4eMTLZf2XaWr+VWoCyFLRgz
         13lGilQn7PnhEIBeNHElHL7of4x3jbsaqk+vqr6VNZ4vUqjUalHfn4qzeAtCNL7791Bb
         R1sieXx8om60kIYCYa2CPDaQ2L9s8htyH//u3l14P4Jvi69Njhn4z5AFlxswoe8bt46T
         wPoeMBHjb1BO8rW1/bHA0xwbtPpB9DQS62UBCHicBzcnYdiDCJKNaYxW5Bgmiadvxw3a
         cdr2TjXz4mQMl1AmLwSw4gM8bdktrdhByS9DIfkQyW72DZ8Nliz28PCVHF0YePHprXAa
         7ycA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Tdb+PFQXYbSmGJLG8NonR+rLlDK9Msu59Ro2vfpViJjYhxE2reZxuw4hjnBvWzgHEJu5Jxtnk53E+av74Xtr0et1GQopdNYeO9w=
X-Gm-Message-State: AOJu0YzWCsKsTJN2AhPoVXEL3jJeFBEylHPx7GPg3X+1dVvqlTccfDTg
	2fOOkT/6FCXm6J4GqRGTVLGsfMGJ5TJmkE9n8qssFJ4lJQOsYaLD
X-Google-Smtp-Source: AGHT+IEt3LmITb/jipdhYiVsUV6eFU8QRvp2kGb/05DkvrdE+iOjesCnASE20Vbo/TWzC4j0Uuoqow==
X-Received: by 2002:a17:903:120c:b0:1fb:37fa:fedb with SMTP id d9443c01a7336-1ff5723bc3amr216379075ad.10.1723057285777;
        Wed, 07 Aug 2024 12:01:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:462:f8ab:4aca:ae3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5a473sm110576355ad.106.2024.08.07.12.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:01:24 -0700 (PDT)
Date: Wed, 7 Aug 2024 12:01:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wei Shuai <cpuwolf@gmail.com>
Cc: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>, bentiss@kernel.org,
	linux-input@vger.kernel.org, oleg@makarenk.ooo
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <ZrPEgZ9_ahKx2WTu@google.com>
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com>
 <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka>
 <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka>
 <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>

On Wed, Aug 07, 2024 at 04:42:56PM +0800, Wei Shuai wrote:
> yes, agree. either way, will be a revolution.
> 
> At least, for me as X-Plane flight simulator gamer, a small change in
> expanding the key max number can make my device work immediately
> 
> Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com> 于2024年8月7日周三 14:23写道：
> >
> > On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t.net> wrote:
> > >
> > > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > > > > 2. Can we consider using something other than EV_KEY? For example we
> > > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > > > > > > transmitting key number and state of keys that do not have pre-defined
> > > > > > > > meaning. Here we are losing event deduplication and ability to query
> > > > > > > > full keyboard state, but I wonder how important that is for the devices
> > > > > > > > in question.
> > > > > > >
> > > > > > > The same problem rears its head in the EV_ABS and EV_REL range, so
> > > > > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > > > > >
> > > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > > > > > > updates in the same frame without an SYN_MT_REPORT equivalent.
> > > >
> > > > I do not think that frame notion is that important for keys. It is
> > > > typically important for a pointing device state.
> > >
> > > true, I remember a conversation years back that frames aren't
> > > consistently implemented in keyboard drivers anyway which is the reason
> > > libinput sends (most) EV_KEY events immediately instad of waiting for a
> > > SYN_REPORT.
> > >
> > > > > > All in all, we've had people using this patch (but increasing KEY_MAX to a
> > > > > > whopping 0x4ff) for the past few years with no adverse effects. I've been
> > > > > > using a custom Linux kernel with this patch on my Arch machine since about
> > > > > > May, and didn't notice anything, even when compiling with debug flags and
> > > > > > following and filtering dmesg.
> > > > > >
> > > > > > So here's the thing I'm most curious about. Is this something, you'd just
> > > > > > want to resolve differently, to make it nicer and more logical, or is this
> > > > > > really something that would break everything and doing it in this way will
> > > > > > never be allowed/merged? That would make a lot of us sad :(
> > > >
> > > > We need to figure out not only how to handle your class of devices, but
> > > > also allow extending number of keys that do have certain semantic
> > > > meaning. Peter raised a lot of questions that we need to answer.
> > > >
> > > > But I wonder, these devices with large number of buttons that do not
> > > > have predefined meaning - do they have to be a single input device? Can
> > > > we create N input devices if we exceed the "trigger happy" range, all of
> > > > them mapping to "trigger happy"? That would mean that userspace would
> > > > keep track of key assignment on per-device basis.
> > > >
> > > > We already split HID devices on per-apllication (not userspace but HID
> > > > application) basis, and also when there are several USB interfaces.
> > >
> > > Honestly, I'd vote against this.
> > > re-combining input devices into a single device in userspace is a pain.
> > > The split per application in HID is mostly fine because they're
> > > usually physically different devices but I recently ran into the issue
> > > with the uclogic drivers where various features are split across
> > > event nodes. Thse devices have the ring on one event node, the buttons
> > > on another, etc. Nothing in (my) userspace is currently set up for this
> > > and it'd require a major rework in many places to be able to handle this
> > > properly. And it requires that rework in every userspace stack, possibly
> > > special-cased on a vendor id. In the end it was easier (re-)writing BPFs
> > > to get the expected event node behaviour than dealing with the split.
> > >
> > > A device that arbitrarily splits makes this even more difficult - which
> > > one of the event nodes has buttons 1-20 and which one has 21-40? We'd need
> > > some other magic somewhere (e.g. hiding in uniq) and some digging around
> > > in udev to figure out which ones are part of the same device.
> > >
> > > I'd rather not go with a simple-for-now solution that makes everything
> > > in userspace more complicated, forever.
> > >
> > > Cheers,
> > >   Peter
> >
> > Yes, I would also say splitting is, unfortunately, out of the question, because
> > of the intended use-case of joysticks and other gaming devices. Most games do
> > not handle multiple inputs and only allow for one device to be set up at the
> > same time. This means, any buttons not present on the first device would simply
> > be inaccessible and the end result would be the same as now.

So how does this work with, for example, DualShock controllers. IIRC
they are split into several sub-devices, such as game controller itself,
accelerometer piece, and touchpad piece.

> >
> > It seems like we're stuck between a rock and a hard place, but at least one
> > thing makes this easier. Even if a new usage shows up, it doesn't really
> > matter for games and especially sdl. Given button must just work, and it's
> > designated usage is of no concern. For all intents and purposes, it's just a
> > random name that may or may not show up in the binding settings.
> >
> > Moreover, all these usages are lost in the proton translation layer, and most
> > games are played with it's help nowadays. For the Windows games behind wine,
> > these buttons don't have any special meaning and just have numbers.

They however do have meaning for the rest of the system. SDL clients are
not only ones who listen to input events, so if we extend the "button
happy" range we will not be able to use it for anything else, like Peter
said.

If you do not care about meaning of the events sent out by the kernel
then maybe you can "grab" the device (EVIOCGRAB) and completely override
the keymap? Will that will work for you?

> >
> > While I understand that a new usage might show up someday, I wonder how
> > likely it is in the near future.

dtor@dtor-ws:~/kernel/work $ git log --oneline --since=01-01-2024 -- include/uapi/linux/input-event-codes.h
22d6d060ac77 input: Add support for "Do Not Disturb"
0c7dd00de018 input: Add event code for accessibility key
cfeb98b95fff Input: allocate keycode for Display refresh rate toggle

3 new ones since the beginning of the year.


> > TRIGGER_HAPPY range was added about 20 years
> > ago? For me, as a 27 year old it seems like a lifetime ago.

2010 so only 14 years ;)

> >
> > I guess my point is that if we were to increase these button ranges in ANY
> > different way than increasing this limit, we would still need massive movement
> > to get all the software to handle these new cases, if they ever would actually
> > care/have resources to do so.

Yes, but this is the right thing to do. Otherwise next year you will
create a joystick with 512 buttons and we will be back to square one.
After all we though that 40 extra buttons should be more than enough,
and we were wrong.

Thanks.

-- 
Dmitry

