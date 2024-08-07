Return-Path: <linux-input+bounces-5402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B0949E2C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 05:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59A11C2116D
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 03:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA56F1A288;
	Wed,  7 Aug 2024 03:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="pTSsIbSm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F0kpIHHm"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84DB667
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723000375; cv=none; b=IgsmuUk1yhWb5O+vsiBluTEFxEJ82XSyznNK2sO9WFVSG0U8xR4LtafJGurqgtM0edINcOwzBoaQQYh0xXrmZCi/PO6T3qdrbkAdsNnswdYkHNGz2gHz9oLuYwe5ttA9nwAw0IjAU4urlHp7b6EnRzqR99QdfNreR2qXEtB404E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723000375; c=relaxed/simple;
	bh=0jmJadN2RpmOotY8odbfAJEHh7nZyGum1u6s91Odxzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ3AEnBoXVwRB6EcpqD1tBUI8rCfEAcHCIGoOiq/ZJLff+/z+jScbV2jkPK5FY1uuUwGgEGJrImxhVVj6NAFdH3PrWk+PX0JmWk9lM800VWFMjEgZqRP0EtjHsULZ1XV6c3yJ2r86keW0VObBw6KhSeUw3o4+fsjRc5NIs+yMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=pTSsIbSm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F0kpIHHm; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5A2931151A3F;
	Tue,  6 Aug 2024 23:12:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Aug 2024 23:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723000372;
	 x=1723086772; bh=QL8qfaIOVl/lFwNsqb096WbdYHYVYUGnKDfvqIEcUDk=; b=
	pTSsIbSmdfhI8Koi+YpgsXtAJwWhumMTbBn/hZsoo410ksP9dheva+gNA6q8jKlU
	kAYphJhlTguWQrDZn1JzUrHuoPk5kgGJmZ/hSYMvCug6TyrxAjvTDreBIh9wfEEg
	bIxIZ+A3bXGOnfgJCdU5SH0tCiETnb6kvPlS3lj0DXs6KKmZD5KO3So3hH3bdC6C
	JJa1bGsOCyGqY9iCnNjqH43OEW12WJB/PXZFvGPABBGjo4aYWvxzhFUZqIlB0RUI
	9xQanTIh4VLalx3uUS+dqpgNYI6F0BFIO5JRrXrtJe72D5OB4/E6UvmhStINKAId
	LTlTTzmdEvcSDM4HNeA3xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723000372; x=
	1723086772; bh=QL8qfaIOVl/lFwNsqb096WbdYHYVYUGnKDfvqIEcUDk=; b=F
	0kpIHHmz+nhsARRkKfeJQRV+Dc/KCJFTmbyrwkQpnCcDQrg4sPhVpO4K4Nw7Bfb8
	TXAjEJgraOWmmkYA6vUnKR8n24Ivh5xf6qids2fv2NkvcH2gq/6Nb9Bc/7ltZdbQ
	Az8DEX2mjQFAuiw0c5JNN/oM2mrvFJiLjcr+nyitzpHXo8yaYQVOaW1yVSM/W/Ld
	rhKltZwJB9ecEQczzvF3B+28ArknM/5GBldljRSZTnzhcOr67gdAgSX06Lu9Zywc
	h6+T2uK2bmfXvf6PsnBsX94VN4MtUyi/arH08HS5oQBJaeCM1f8zxck3X7imjjf4
	2ryYNmOOqbjZulrNqHQpw==
X-ME-Sender: <xms:NOayZkyQKoPKL4hgWJwneDB5ZBazF2CKSq3kYdSQ9u65iBPZMJsuQA>
    <xme:NOayZoTUyUz0yInFCG1VANNYWneqSPuPyKo509QH6Ojs0z_I639BLkTD7BpVLVKpI
    q-d-pvUbZa7fz68bmk>
X-ME-Received: <xmr:NOayZmVs7l8yceE6eYjTvDARqIfAlFnOqvBPbOyvXbPax7N1ZKiVfwNZYTDfDyns-84NFwm226o0HmpjFdyON2s-Lv1WcwIjWS1C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeelgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeejffeihfeivdffueehieeifeefieeugfeiffdtkedv
    leffteeilefgvdettddvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhu
    thhtvghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:NOayZihR5tXz_eBkx7S5FUnqaC3Db8GAuxDdP9S-wUqYh9csgyOKrA>
    <xmx:NOayZmBCHr34rvzgEmVpy_yKwZTELGKqFnjQlBDI1rQqnWHiD8osbA>
    <xmx:NOayZjIf66aUOflpX1R5-17g34JfqTntUK-mtVUDMDYbFif7u9SmxA>
    <xmx:NOayZtDF2OC8pCbKlj1sw-TVcMcbf0P1YQuoecKRmNfaAo6R8vAxyw>
    <xmx:NOayZo2gzDCkYoO0wzK-5_Xm3HjYyKNkBbqhZBVe4rXujEhGv9RkYOnU>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Aug 2024 23:12:49 -0400 (EDT)
Date: Wed, 7 Aug 2024 13:12:45 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, bentiss@kernel.org,
	linux-input@vger.kernel.org, cpuwolf@gmail.com, oleg@makarenk.ooo
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240807031245.GA3526220@quokka>
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com>
 <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>

On Tue, Aug 06, 2024 at 07:50:07PM +0200, Tomasz Pakuła wrote:
> On Mon, 5 Aug 2024 at 07:34, Peter Hutterer <peter.hutterer@who-t.net> wrote:
> >
> > On Fri, Aug 02, 2024 at 04:58:31PM -0700, Dmitry Torokhov wrote:
> > > Hi Tomasz,
> > >
> > > On Fri, Aug 02, 2024 at 10:09:40PM +0200, Tomasz Pakuła wrote:
> > > > Hi. I can't seem to shake the feeling I'm being ignored here. I would love to
> > > > get some input from you Dmitry, as this is an issue that was raised a few
> > > > times throught the years and many times, it was left to wither, even with
> > > > proper patches submitted and the reasoning explained.
> > > >
> > > > One might think of this as trivial, but this is kind of an ancient limitation
> > > > and we ought to improve linux HID compatibility, especially since this is
> > > > such an "easy" fix but still has to propagate throught the linux world.
> > > >
> > > > If I'm stepping out of the line, or something is really worng with my
> > > > intention here then please let me know, but I know at least in 2020 there
> > > > was a similar push to change this and  after Wei Shuai explained his reasons
> > > > he was similary ignored.
> > > >
> > > > Me? I just got a new Moza wheel and it too uses button above 80 so I can't
> > > > make proper use of it :)
> > >
> > > Sorry, I must have missed Wei's email and I was just trying to figure
> > > out what to do here...
> > >
> > > I understand that we have a limitation in the input layer for the number
> > > of keys/buttons to support, but I wonder if input layer is the best way
> > > of going through here. For the long time I was against an "anonymous" or
> > > programmable buttons in the EV_KEY space. The reason is that we want
> > > userspace to not care what device emits an event and act solely upon
> > > what that event is. I.e. if a device emits KEY_A it should not matter if
> > > it is an external USB keyboard, or internal PS/2 one or maybe it is
> > > Chrome OS matrix keyboard connected to an embedded controller with it's
> > > own protocol. Same goes for KEY_SCREENLOCK and others. Yes, we do have
> > > multiple usages called "trigger happy" but I am not really happy about
> > > them.
> >
> > ftr though it's mostly obvious, this effectively moves all key
> > configuration into the kernel, doubly so for devices that are fully
> > programmable with no specific meanings (the XKeys devices are the oldest
> > ones that I'm aware of that don't work that way).
> >
> > IOW, this approach works for semantic keys but not at all for anything
> > that's really just one key out of many with no real distinguishing
> > features otherwise.
> >
> > OTOH it has saved us from having to ship keyboard models like XKB used
> > to do in userspace.
> >
> > > Additionally extending keys space is not free, we need to allocate
> > > bitmaps, historically we run into issues with uevents being too big,
> > > etc, etc.
> > >
> > > I wonder if we can consider following alternatives:
> > >
> > > 1. Can we go through HID (/dev/hidraw) instead of input layer? I do not
> > > think we will see such devices connected over anything but HID (BT or
> > > USB).
> >
> > HID is currently unsuitable for two reasons: we don't have EVIOCREVOKE
> > for hidraw (I need to dust off that patch from years ago). And the
> > desktop input stack (i.e. libinput + compositors) doesn't handle that
> > use-case either, our key events are currently tied to EV_KEY codes.
> > Can be worked around, just needs a fair bit of effort that without a
> > HIDIOCREVOKE (and logind integration) isn't worth starting.
> >
> > But at least for these devices - libinput already doesn't handle
> > joysticks/gaming devices so I can easily ignore those too and let those
> > be punted to the application :) Which means the ioctl is all we need for
> > now?
> >
> > > 2. Can we consider using something other than EV_KEY? For example we
> > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > transmitting key number and state of keys that do not have pre-defined
> > > meaning. Here we are losing event deduplication and ability to query
> > > full keyboard state, but I wonder how important that is for the devices
> > > in question.
> >
> > The same problem rears its head in the EV_ABS and EV_REL range, so
> > fixing it for EV_KEY doesn't necessarily fix it for those.
> >
> > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > updates in the same frame without an SYN_MT_REPORT equivalent.
> >
> > but (and this is not fully thought through) if we are ok with dropping
> > value 2 key repeat values we can make the input_event.value a bitmask,
> > so we can have EV_KEYMASK / KEYMASK_00, KEYMASK_32, .... so for buttons
> > 1, 2 and 32 down you'd send
> >         EV_KEYMASK / KEYMASK_00 / 3
> >         EV_KEYMASK / KEYMASK_32 / 1
> >         SYN_REPORT
> >
> > This should be nicely map-able from HID too. Would also work
> > for EV_MSC / MSC_PROG_KEYMASK if you don't want a new type.
> >
> > Other random idea, even less thought out: have a marker bit/value that
> > designates anything in a certain range as "merely numbered'. Not sure
> > how to do that but that would make it possible for non-mt devices to
> > re-use the limited abs range for something else.
> >
> > Cheers,
> >   Peter
> 
> Hmm, these all sound like good ideas. I'm net yet very well versed in the whole
> linux kernel input stack, but looking at it, it seems that it does need an
> overhaul in the coming years.
> 
> But I have some questions. This patch only adds another 65 possible buttons/
> undefined usages. Would it really pose such an issue? 0x2ff already is quite
> a big number (767). I don't think another 65 would really break the bank here.
> 
> > Additionally extending keys space is not free, we need to allocate
> > bitmaps, historically we run into issues with uevents being too big,
> > etc, etc.
> 
> Is it related to Linux kernel or outside software? Is linux generating some
> kind of bitmaps? I'm not aware of such thing.

Recent example I recall is this:
https://lore.kernel.org/lkml/ZjAWMQCJdrxZkvkB@google.com/t/

> Peter's idea seems sane BUT doesn't address the real crutch here. A lot of
> software uses (directly, or indirectly) KEY_MAX define to outright cap the
> number of buttons read from a given HID device. From the top of my head,
> SDL2/3 does this, Firefox as well.

fwiw, anything based on libevdev which is at least libinput +
xf86-input-synaptics/evdev are similarly capped.

> When it comes to undefined usages, software already deals with that without
> issues. For years we had this undefined range above TRIGGER_HAPPY_40 from
> 0x2e8 to 0x2ff. SDL returns "Undefined" name, evtest marks these as "?" BUT
> this doesn't impare the use of such buttons in the slightest. These simply
> show up as buttons 58-80.

ftr, evtest marks anything as ? that doesn't have a define added to
evdev. libevdev does the same but at least it automates the process
based on the kernel header file.

But my main gripe here is that, for better of worse, the keycodes
are semantic - an unknown code isn't "button N" because in the next
kernel version it may be e.g. KEY_VOLUME_MAX and unless you special-case
every client that wants to use your device, this hurts. At
least the trigger happy is reserved to never be anything else.

Likewise, once released your device will now *always* have to send
KEY_VOLUME_MAX for button 3 because changing that will break everyone
special-casing your device.

We have existing instances like this: BTN_BACK and BTN_FORWARD are not
actually forward/back because decades ago X decided physical buttons 4
and 5 have that role - so BTN_SIDE/EXTGRA are mapped to back/forward and
BTN_FORWARD/BACK are mapped to whatever comes next (also note: X and
thus the rest of userspace has back/forward whereas the kernel has
forward/back).

libevdev (and thus libinput/xorg drivers) have special casing for
ABS_MT_SLOT - 1 to detect "fake" multitouch devices that just run up
from the ABS_MISC range.

etc. etc.

Cheers,
  Peter

PS: and re-reading the above I realised it would also be relatively
trivial to add EV_BTN. That could (maybe?) even run parallel to EV_KEY
in the same frame so that button 8 becomes something like:

	EV_KEY BTN_FOO 1
	EV_BTN 8 1
	EV_SYN SYN_REPORT

Which means that userspace becomes a "if EV_BTN is present, ignore the
EV_KEY in the same frame" though that gets a bit trickier if we have
more than one per frame.


> All in all, we've had people using this patch (but increasing KEY_MAX to a
> whopping 0x4ff) for the past few years with no adverse effects. I've been
> using a custom Linux kernel with this patch on my Arch machine since about
> May, and didn't notice anything, even when compiling with debug flags and
> following and filtering dmesg.
> 
> So here's the thing I'm most curious about. Is this something, you'd just
> want to resolve differently, to make it nicer and more logical, or is this
> really something that would break everything and doing it in this way will
> never be allowed/merged? That would make a lot of us sad :(
> 
> Thanks, and cheers
> Tomasz

