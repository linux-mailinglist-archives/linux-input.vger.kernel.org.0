Return-Path: <linux-input+bounces-5413-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972C94B3A8
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 01:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40B71B21B9C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 23:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDF5145FF5;
	Wed,  7 Aug 2024 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="mL9stDeb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mzLP6K1m"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1E2B9A1
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723073621; cv=none; b=AW6LDqeD7K8OX2WVIXzIg51qgypqCGiOpAXKTUMdxVMZ5X94vWO1YkYsLmKLcE90tOBILiUwE2Lel04c202Js6lGFpoAoavYsP3sLaOE91Mc6Xy0QUg58Po5LzecCOctpTRNVYshbiL9NPH6NiSjffcmNjibRcYtp/IhTuhVwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723073621; c=relaxed/simple;
	bh=VYzjsKZDRgspF7iNV5tuGVGh9W03zwZMPW88TyeaIVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+AykLFpwEYZQDAsQvQyjfQHzV0lNOyEe/myfYW1IZ7RdJOkDKmClU4KZ4bg8OV/o1S8+R7rm2PdFQef3fnGTKJFqM7vyxXFbG7MNmw1sh25kDmcWW9KzuQwh927jAEDCNrsP/aXbHha0GHk39pHri3oZR6QpcI7px3nzeU+NLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=mL9stDeb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mzLP6K1m; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6742E114AB45;
	Wed,  7 Aug 2024 19:33:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 07 Aug 2024 19:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723073618;
	 x=1723160018; bh=mXc5+oAkwEScnsADqHuGIAQBetEa/CEEPLcyvt8wr9Y=; b=
	mL9stDebB26SJMGkeqM2Fuss/xOKedi6Ypqalm2lV1HLHwuSx5mrYRr3TReW/gpc
	wzdwYs90CMhi9NskxzsULcOex7n/Crvxl9om8Wii4GMemwYXvwTvyQfyFsnswhJy
	XdRENXgGy0+kkDiRanU7Jf+EJH6eXpQr6n0FqBo3LIobBd2i4vMao1VVv6p0GCTS
	9MduyJp0V2DAYwcEd98UvQKagy3jn+FKrLEhspdzxl2EW/+HDGd/RrsqT3yFVtaP
	vmD2NeXZjQcx9cSl7NEtkJ0s9a8FrYuERf0ARj6bNa+6mV3KVl5McVJTSAUgGU3U
	3YcKe4PtVbgBqOiDtyp2dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723073618; x=
	1723160018; bh=mXc5+oAkwEScnsADqHuGIAQBetEa/CEEPLcyvt8wr9Y=; b=m
	zLP6K1mgR3AhusM3gG7gJdnhkR5yaJqK7V73j7AZnDaxQRmfxDflI2cBCrKosjOX
	ZO5sKpKaamKuxPm6PgD82mA1Z1v1Wet/5WDILWzOUOVEg2VoTMWik+64WJhjHkz7
	INHJCkxRRKmb1jirQQmRiLWa49KBhwvC6NWnXj4OA7QpNtYm1Uqz1gb1oplw720Q
	ikHuVOOgRBS4bZ5PKJjbdmRU+Cx3ULybVNpU4FwMCWsJIt0BGTj0HFShz776ztnp
	EWFwdHxKmiV50DMkbPYB1kHYWKu5dGREEe4QjeMotg2c3uiwI8Kmjbf7raaR9q6f
	wJgA0I7FecWUAYQBSaezg==
X-ME-Sender: <xms:UQS0Zp8LlBzh_bD41Nj4Wh6G91Lu9Ao3AAsCZtA9IAkKgWzLx92K2g>
    <xme:UQS0ZtvoAw5d2nxP6qZr9bbrcexmumHymgfiuL-vsgbS9g7FMtK9o99XOoqIAAXvF
    e7c8k_XbSY5CO-p3II>
X-ME-Received: <xmr:UQS0ZnA_IwYWRF-zcbd0ZOTL3tx9o1GRPjEj-oMB77y3RKriNLSDErklfMAsKqIvVCtbob4Y2lpfzJ4L4oal6e1FJ4TLFVTDh6fy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledugddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpedtledtjeduleevteehtdeijeefieejvddvhffgjedu
    jeevteeggedttdfhgeejueenucffohhmrghinheplhhkmhhlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:UQS0ZtcOJCjjPZpEQIQhOKF1w0BZPRuxUsHd1M8k7JWKT68PGtrcpw>
    <xmx:UQS0ZuM_J9l8xd1Ys_U_NvPZQfh_ARJdRj3sqYJHutbaosiMbTV89w>
    <xmx:UQS0ZvnBRvlx4mU25WuNLngVilFFbIIJts9_YtFYxLpkMwvWXoMKdA>
    <xmx:UQS0Zovej-eb9BoQbNzgsccK_h6pgt4tADtImDlGNIOoAP8HUrZhVQ>
    <xmx:UgS0ZtdfdSwFsfmn-KfyAg4LcYUr7Nq5QUUQX8aET60f1zO820boCvij>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 19:33:35 -0400 (EDT)
Date: Thu, 8 Aug 2024 09:33:30 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Wei Shuai <cpuwolf@gmail.com>, bentiss@kernel.org,
	linux-input@vger.kernel.org, oleg@makarenk.ooo,
	torvalds@linux-foundation.org
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240807233330.GA3686413@quokka>
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

note that evdev is not HID, you get evdev event nodes for any input
device that's supported, regardless what the underlying protocol is.
HID is the incoming protocol, evdev is the outgoing protocol and the
limitation is in the translation from one to the other because they're
not 100% identical.

if you want to use HID, you can access the device via the hidraw node
but then you also have to do all the actual HID parsing etc. yourself.
and openign the hidraw node which currently requires root (or for
gaming(-ish) devices on logind an active session).

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

It's basically accepted that we need a proper solution for the current
evdev restrictions and that has been the case for years. I recall
David's ABS_MAX2 patches from 11 years ago:
https://lkml.org/lkml/2013/10/2/632

So *something* needs to be done but adding things like BTN_TRIGGER_HAPPY
and extending the ranges and filling other bits in just kicks the can
down the road another few years until it gets even harder to fix because
now we have even more legacy software and hardware to worry about.

This really needs someone motivated enough to figure out what to do, but
that takes time and effort, at least the former of which is very much in
short supply. Either way, the best time to fix this was 10 years ago,
the second-best time is now :)

Cheers,
  Peter


> Yeas, 512 buttons MIGHT be doable, but the truth is, there are A LOT of devices
> with over 80 buttons (and BTN_TRIGGER_HAPPY range actually ends at button 57),
> over 140 though? Not so much, if any. Extending BTN_TRIGGER_HAPPY range by
> another 60 usages is just THE fix for current state of input. If it is just
> too ugly then I guess that's that. Sadly, it would seem that this issue
> won't be resolved for years in that case. 2030?
> 
> Though, at some point, there won't be any more space for new key codes and
> BTN_MAX will have to be increased no matter what.
> 
> At least I gathered some much needed info and insight. Still compiling my own
> kernel every time is not something I look for :/
> 
> Respectfully
> Tomasz

