Return-Path: <linux-input+bounces-5457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D594C724
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 01:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB29B285CC3
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 23:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCAD15D5C3;
	Thu,  8 Aug 2024 23:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="qunEkyV5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KVQ8byg/"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14D1591F3
	for <linux-input@vger.kernel.org>; Thu,  8 Aug 2024 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723158015; cv=none; b=gClaHpYMREPPjkxjhcpysJTsHrfxCm+RsDoxobQitzncR5sA7crqSLh9eVzX+lG53fbX4ogB6GrhtEOsKxn1pb61yN7MdODmxI2Djw+ZWWAtmvXVwtKtJbY3ICjU7q5TmXvIDjnUQdTbK4T5aDIcAMjCjMbzgMpcFwNbKb/5SPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723158015; c=relaxed/simple;
	bh=gYmkQPByhTO/aHp076JxitausCFg/yIz78X2Q4j1RTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb23sExcCDw/cH7vYNC/KrlxvUuRrWSWxuzEazBziORii5k+VGXVKkHDuraUEMot6UznpRBSqrOsH5qwZY6xxbn0fCf9OFsKF+4MFUUlEsZTaba7zYJy2fuhFq3olzGuMXDB+hbdDj5z3MFS0clvKO4Kl2LjkP+Plzi5B8A8myk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=qunEkyV5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KVQ8byg/; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B3576114C02C;
	Thu,  8 Aug 2024 19:00:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Aug 2024 19:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723158012;
	 x=1723244412; bh=wEaSAs0LzgMl3QEXDA0dbuhoARoLNZ34CFnUMQqOlUY=; b=
	qunEkyV517NibtvZWk+uSEVlkdrLNsWJ+BQpelg2qiRE4VJTb89vL6+jaHz8+TNw
	3ycFU/652jMgmullqZfC+QT0SER/5mjDMuJhUWOg56BtOYBf/HUh8sv9sAdG75ei
	QOa3EheOQiyM1im9luxGqJv/YNJimSvmhaA1c+ZznCOJoyecBUc5ahrgKsh4s/Cc
	zIh07H5mFaD5mUBmaxkBTpiBoa/3hQfMMJw20La4+j7UAmkw5S1aU2ZrNe/V5dBM
	hl3+N0z1L93hc5lmcNwwBLd3VVaja5sgi7vtb3UmSWwxDCNoazJxtVFSYRUjlG0g
	c0thWuPYHF898MJj/2RACw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723158012; x=
	1723244412; bh=wEaSAs0LzgMl3QEXDA0dbuhoARoLNZ34CFnUMQqOlUY=; b=K
	VQ8byg/GnmHtmjNhfdJjEq8NBXSeDoem+dS7wb0tvM9nH4EzUlR8Npkzd1Ekxylw
	mcWA4EJDkkqRxKr/MaVS3UsFMHdi532tlpDI51vvIKxgM45/iuPQI2rvxM36Hz7V
	oTP0kAXPougIq6cfIiUZ41kzYsDsHPHF0zXyTnXixAFyLFwSDQfrzJJHzCORjn1Z
	97PE8c/9IbZSNozDKNFUcOqDopKmNYvVyVrT7/M4jqK8hdhnm3c/irzXX0rXl3Pg
	Ib6QXJsujGrIgVMWScvlqt/BYLyOdxcDKZtqhhmRVSVBVwFsz7zo2S4Qaqi/6uOQ
	3MQQc5Pdyn1bkU//FLBAg==
X-ME-Sender: <xms:_E21ZjmdkL60mQseKHiZ7vIzwc1iRU-NtdYtX-kTfKI-hfWgIOfkkA>
    <xme:_E21Zm1DVrfYIZN-z8T2zhiEFUYvbMQQhq2Slug5N5FszzwM9AoUidJEyjH0ufimB
    pSYcLgBG5eCJGQTmFk>
X-ME-Received: <xmr:_E21Zpr7KjYFAJdpNRkIUfzDjLOF9Yl66I4cohcNsm3OgaFeR0Iy5alNjS4aMiESFeARXKtMGAjDe0Is-8owPqMOs687E_Qc1uwr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleefgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeevheeitdejgfdvfffhueek
    veffgeehueelteetheefvedtuefhuefhtefhvdehfeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihh
    ohdqthdrnhgvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhomhgrshiirdhprghkuhhlrgdrohhfihgtjhgrlhhnhiesghhmrghilhdr
    tghomhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheptghpuhifohhlfhesghhmrghilhdrtghomhdprhgtphhtthhopegs
    vghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuh
    htsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghgsehmrghkrghr
    vghnkhdrohhoohdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnug
    grthhiohhnrdhorhhg
X-ME-Proxy: <xmx:_E21ZrnoNHEXHLeM6U2Q28sbAObuVvLsaiKyGztl1c1v88-inRuB8w>
    <xmx:_E21Zh0RbfHih5gdcEPu4y7bjqKeWb3p5jixcOvvbvEn8P-az03BgQ>
    <xmx:_E21ZqvzcjYkgH05scxADFVJ3sk-yN6aOFj2upRXk9-aByT6XNkz2w>
    <xmx:_E21ZlXzHtRhHiSVQo8ahB9y5TDTWHhWXu-UeZ0XaZMNEndz7Im8mQ>
    <xmx:_E21ZumCO5lGytN4HviWL4FVJ_okxblSgy5-ToCuTB_r3V2Qdzt1_JaC>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 19:00:09 -0400 (EDT)
Date: Fri, 9 Aug 2024 09:00:05 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Wei Shuai <cpuwolf@gmail.com>, bentiss@kernel.org,
	linux-input@vger.kernel.org, oleg@makarenk.ooo,
	torvalds@linux-foundation.org
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240808230005.GA4041272@quokka>
References: <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka>
 <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka>
 <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
 <ZrPEgZ9_ahKx2WTu@google.com>
 <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>
 <ZrPh9F5lhUKLLSQk@google.com>
 <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>

On Thu, Aug 08, 2024 at 09:46:09AM +0200, Tomasz Pakuła wrote:
> > No, not really. EVIOCGRAB is an ioctl on evdev, as well as
> > EVIOCGKEYCODE_V2 and EVIOCSKEYCODE_V2. If you do not care about meaning
> > the kernel assigns to the buttons you can remap usages to whatever
> > (maybe withing the range of 0x160 - 0x2ff) using EVIOCSKEYCODE_V2, and
> > use EVIOCGRAB to stop events being delivered to anything but your
> > application (so the rest of the system is not confused).
> >
> > These are existing userspace APIs that SDL can use.
> 
> But to remap a usage, it would still have to be in range to actually
> show up in evdev?

I think Dmitry meant that instead of having randomly sprinkled usages
you remap every single one sequentially from 1..N, effectively giving you
a KEY_MAX number of *physical* buttons. Then you treat them sequentially
instead of whatever the #define's name is.

> > What do you mean? If we go to separate event namespace then what KEY_MAX
> > would have to do with it?
> 
> I guess, in that instance it maybe would not matter, as legacy
> software would not
> be able to read the new namespace and KEY_MAX wouldn't even be considered
> there.
> 
> >
> > Would it take that long to teach SDL about new event types (EV_BTN that
> > Peter suggested or MSC_KEY* pairs)?
> >
> > Can we also talk again about the exact use case we need to solve. It is
> > not a random Steam game that will make use of tens or hundreds of
> > keys/buttons and only support a single input device. Don't you already
> > have to deal with let's say racing wheel and pedals being separate
> > devices?
> 
> SDL would be easy I think, but there are actually native linux games,
> and they, sadly
> have their own statically linked SDL versions. Well, nothing we can do
> about it really.
> 
> Simracing equipment supports dual mode operation more often than not, to
> combat the exact issues of multiple devices. Most of the time, it's recommended
> to connect everything through the wheelbase. Moreover, even if such devices are
> connected directly through USB, they can still define a lot of buttons
> just to keep
> the assignments the same. My h-pattern shifter does this, as even when used
> standalone, it sends its events in the 112-120 range.
> 
> The use case is I want to use every button that's available to me. My
> steering wheel
> has 5 rotary knobs, each has 12 states that appear as separate
> buttons. This means
> they alone define 60 buttons. And even If I wanted to use just one,
> the buttons don't
> even show up.

arguably, those knobs should be defined as an ABS_WHEEL with a range of
0-11 But now we're back at the "we're out of EV_ABS codes" problem which
is the older brother of the "we're out of EV_KEY codes" problem :)

> Currently additional buttons just overflow into the undefined range and stop at
> KEY_MAX, and that's why my first intention was to just increase this
> define, as it
> would be the fastest fix.
> 
> > I feel we are talking about pretty specialized hardware and pretty
> > specialized applications and that is why I was wondering if using HID
> > instead of input would not be a better choice here.
> 
> Just Racing simulators, Slight simulators, button boxes of any kind.
> Honestly, anything that would make it possible to define and receive
> buttons. I just wonder if it would be good to spinn off the whole joystick stuff
> so devices like that (gamepads, wheels, etc) would have their own subsystem.
> Current stuff could be kept for compatibility reasons, but this new component
> would take care of all the events, buttons, ranges. This would be a complete
> and singular source of "truth".

xkcd too many standards comic :)

Cheers,
  Peter

