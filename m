Return-Path: <linux-input+bounces-6271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF496E657
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 01:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E71AB22869
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 23:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D86B17C991;
	Thu,  5 Sep 2024 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="sL2EwJdG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SHsSbN3a"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF65381B
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725579243; cv=none; b=VRA+5Hyrqrp1jfP5LNiEkMsRQjFd6u32lEf1octJImkSj/c0z/xWT0F44MJ5moe7pGsPUZl/BDIUPZaRL25Y3whPJLqLJ1Jqzw0yKXVNaxyWYalQm1W0EJCup3e6131St/FlQhzjyFKT8cvB4sda6Da8XioT50XrLKt+sYwptqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725579243; c=relaxed/simple;
	bh=hfvOw+OSNRBIZXd+WLUxTAvlzPzpVXuUFurPQJ1KXtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+DAqJETUnrKTQjZHeOd7yyAfhsRssbLx1umjVRTn8J3cTKfNxRUAaPTxPtQpoFsCSULRyUzzjM8a3u78JRQfSTEWy/pU8NNrY/TWus3NxgL2X9QthROHgHu4b3Xg64BqmEOTXMzANv6gLktuqA+OcVEcAeI3E9jKPNjGhwn7dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=sL2EwJdG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SHsSbN3a; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DEF2C1140213;
	Thu,  5 Sep 2024 19:33:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 05 Sep 2024 19:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1725579239; x=1725665639; bh=eTHkjCNFil
	Sxb6ROg6iEuj1TxuIt1mVUcxUQi79dgks=; b=sL2EwJdGa7fHOpDVrXpU0Pgh1s
	41z6DaStO5NzOwM1rsOee672LrY+kNvqY33GARVnrL/YCe8xgYr38U8t/bAsknoG
	esmO253ETBYqzCj8GuUgf93qkCNMLPfnwEcBXqYDxx6E8OV8SRfsN7JQ/nghzj8j
	mbS68ocUUOfYpOpD6CTGq1rfPKXG96d7nVzfscmh5Ox/rywtLppAoYf3sLtByN7G
	XTar6JVXyHJjSfl7Mu4gDc9sVO9YgPz/pi9rTha0vbjefW5uQqU91wWptWOSbIxI
	xtEkV4VGAxe99BV+l+UUlRBiFbdBaShQCGpnE8UKI6ejiWULfGdugYKj4Usg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725579239; x=1725665639; bh=eTHkjCNFilSxb6ROg6iEuj1TxuIt
	1mVUcxUQi79dgks=; b=SHsSbN3aZTCZSSAK/dM0EHa6If6e66+TshKp1ceXnH9D
	Gk0+34GJpymyYRnZuhX/DngFBS/gVCh0GILwDGf3ZTwhXCwZfdH+U7XSZUwzV6A0
	XoDxknNLMKdvv7HuS0tE5S4wKAdErNEB9s9VZ7aufu45nGmF1SMFNXO659vMFlml
	npFZ+hgoj2oT30Kwgyew7u+9xlWvtJhOSCAIm7JQfTYPi6ksKJApwRZhmFZJ6kDD
	hjHtPssz44+1kJUAuKIm9AN4csNSvtdelQK3o5aYGJMaSgIZ6Y+5p7UQ1EFe7Xbq
	LDnGOHHcA5xTclyC8w/9k3um3DnGBRIONZsXLljgiQ==
X-ME-Sender: <xms:5z_aZmd5_UocCSrjWQTd0eesI5D2l9ObHRM7lgy2dy5lkQwllxvSsw>
    <xme:5z_aZgNX6S2yDd0h7lUsTV-qFHxku5tGH92ZwY69KTJyHg-9NSzPHBxIu5MbfDjBq
    RgstW1UxhJg7Yylr2U>
X-ME-Received: <xmr:5z_aZngWq_ieVdS-0Vt65iTK51vOBq7sVQW9x6bIQknBxNRGaB1uqw7eKWiWBEIVKXR4eaVL20HOLtb1yvE7BxK8rIAY7ji9TUuL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeitddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudff
    hfevheejffevgfeigfekhfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihh
    ohdqthdrnhgvthdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhk
    ohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihhllhgvrhhtohhfuhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepsggvnhhjrghmihhnrdhtihhsshhoihhrvghssehrvg
    guhhgrthdrtghomhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepphhinhhglhhinhhugiesghhmrghilhdrtghomhdprh
    gtphhtthhopehtrghtshhunhhoshhukhgvrdhtohgsihhtrgesfigrtghomhdrtghomhdp
    rhgtphhtthhopehskhhomhhrrgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:5z_aZj_Ni6K9Pa7EmTMSM9pyl43K_fasVkbAXxXj0lFTH7Y6qcxdTg>
    <xmx:5z_aZivCROTSq5ghE-cikMcYpH6Ux5uGg6BVJIzgEsuDSHq3MH-YsA>
    <xmx:5z_aZqHqQ8JkMQQIZUu1ai5OSR_LO_URIEbGYLFbi_BasaRGnZPtig>
    <xmx:5z_aZhMewRhSbsaMBj1VBxB4hEl9qLfj8es4XKfCxEp90qhxr6Xp3g>
    <xmx:5z_aZjHJjDLsQZVcyDLfpoV8n5szc_BSccW0uOYc1gh09PCLn59L4qtX>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 19:33:56 -0400 (EDT)
Date: Fri, 6 Sep 2024 09:33:43 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, "Gerecke, Jason" <killertofu@gmail.com>,
	linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ping Cheng <pinglinux@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [RFC PATCH] HID: wacom: Stop mangling tool IDs
Message-ID: <20240905233343.GA1511771@quokka>
References: <20240903182633.870892-1-jason.gerecke@wacom.com>
 <nycvar.YFH.7.76.2409051045470.31206@cbobk.fhfr.pm>
 <73s746uhpe7d6dazdve43s7s63t46dr5a2dtwh5json6wywrdi@soh7iqmzgtuj>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73s746uhpe7d6dazdve43s7s63t46dr5a2dtwh5json6wywrdi@soh7iqmzgtuj>

On Thu, Sep 05, 2024 at 11:01:58AM +0200, Benjamin Tissoires wrote:
> On Sep 05 2024, Jiri Kosina wrote:
> > On Tue, 3 Sep 2024, Gerecke, Jason wrote:
> > 
> > > From: Jason Gerecke <jason.gerecke@wacom.com>
> > > 
> > > In ancient times, an off-by-one-nybble error resulted in the Wacom
> > > driver sending "mangled" tool IDs to userspace. This mangling behavior
> > > was later enshrined into a function so that devices using the then-new
> > > generic codepath could share the same broken behavior. The mangled IDs
> > > have not historically been a major problem for userspace since few
> > > applications care about the exact numeric value of the IDs. As long as
> > > the IDs were unique it didn't much matter. Some programs (cross-
> > > platform and remote-desktop applications in particular) /do/ rely on
> > > the IDs being correct, however.
> > > 
> > > This patch rids the driver of the mangling behavior.
> > > 
> > > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > > References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
> > > References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
> > > ---
> > > I'd like to get the opinion of the kernel maintainers on making a
> > > change like this at some point in the future. There are _very_ few
> > > userspace uses of these IDs (primarily: drivers, compositors, and
> > > tablet control panels) and my plan is to update those bits and then
> > > give some time for the changes to roll out to users before re-
> > > submitting this for real. I don't expect any kind of breakage since
> > > we'll be taking our time with the rollout and userspace needs to
> > > have handling for "unknown" IDs anyway (since Wacom periodically
> > > releases new pens).
> > 
> > As you are in control of the whole ecosystem anyway (because it's Wacom 
> > specific), I don't see it as particularly problematic.
> > 
> 
> Yeah, same here. And that change doesn't impact the basic functionality
> of the styluses: they'll still be handled properly as pointers, but only
> the configuration panel IIUC. Peter mentioned about some slight
> differences in libinput which shouldn't impact the users as well IIRC.

Assuming libwacom is updated (and used) before this happens in the
kernel, then there won't be a difference in libinput behaviour at all.
And that's the plan for this anyway, have libwacom updated well before
the kernel update ships.

Otherwise, the only difference in libinput will be that it is treated as
an unknown stylus. Those default to capabilities matching the kernel
evdev codes (i.e. "everything") whereas a known stylus will only
initialize capabilities that the stylus actually has. IOW you may get a
libinput_tablet_tool that e.g. claims to support rotation and has a
wheel when it doesn't. Not the end of the world either.

Cheers,
  Peter

