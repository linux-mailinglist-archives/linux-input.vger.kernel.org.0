Return-Path: <linux-input+bounces-5601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47D953E9A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 02:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26374289479
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 00:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A3E1A288;
	Fri, 16 Aug 2024 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="j0ZdMCuI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pMLFj+MB"
X-Original-To: linux-input@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4570B667
	for <linux-input@vger.kernel.org>; Fri, 16 Aug 2024 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723769916; cv=none; b=joEWXLiZazlM1Hr6n/FsJh/M8AZTyTpirfdkCr/6FxY/OK7M2u0Ek3t1r6rC2uaLi5SeDsZSvSg0u7JBREvXrTX1m9jwBtiqrpMg+/ULseXfhldehE4a/TCz3yTdzKsXdzcmCI7+b0HDD0ime318in4hR7akOc9tB9nNcDGNO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723769916; c=relaxed/simple;
	bh=S7XMRvXIUYEPxSHQr9MUwTQkYHmXalFvKuclLuYkCbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6WqdJ3rqRTEMi0x+XnFgLX+svzCQYS9FgBUrMfZRz+xQgycVR0ON/jvwaXhZJspO4wXI2IYJh/2mWVy4aZU7UtsyUyYFrnago/IA+4oioCxyX4DvYLfCNeKpuDHsew/0PVYQAmbhgWEnCe3l6wIDxugpckJQKQEcCk6ONQhmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=j0ZdMCuI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pMLFj+MB; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id CB1CA138FACF;
	Thu, 15 Aug 2024 20:58:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 15 Aug 2024 20:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723769913;
	 x=1723856313; bh=5VWCpwy78wAF+9FZNNwZ9Xx9tR3lCufa/ZGTqtmtyWs=; b=
	j0ZdMCuIzEv1Az0/yowsHRxbOKAYIgCxr69k6r1M0Jof3wuvC16NNKBC1lZk98fO
	H8MBMl4s657Mfcy00MABB256+Oh1Od2rQC7FNjeo0o8u6csaXx6SDY9i3mAE/zs2
	QFm0Etzs90sLSXVDrmwtD48N9ajwTkLjHohz0aRNBFp5sjfUZOQDHZBTudc4rwUd
	No9IXK31SW0+mDoZKZd0uCDCdKhHld4OW3SWb2ghVQb6J8H8cT73BKg9uervBp3X
	76Zo3By/+k/kPPDB3ZfRiohZSsuElVwJWN8uE/fOC8T6SjqVOZW4o9vZWof3jZ4k
	v1Uu/yxU2hDCuk+bryQISw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723769913; x=
	1723856313; bh=5VWCpwy78wAF+9FZNNwZ9Xx9tR3lCufa/ZGTqtmtyWs=; b=p
	MLFj+MBe5jrOq0Q23BGAtr9nHaWFFCDL3s65c3So5cJe2i6DKjY9f6WTZi3XTgTq
	PKIis7W7fCm93PVAH4CpeUGIcoDXiczNEdjYdClCgTk+qo13qfNGSZ5UDTs4++q4
	Uxpt0Rc/FZ1KX9nLUapwGIOirLNP9CB9HnhZV/wGIf+sX3ZF069Bg9azzJT2uv3i
	GKM5ls6boXhDSMgej5nN9KuPFM+LfTuVqbyiALTAy8JBWDzSFlw7cIINvffiDlfL
	fpLbTzi1nYfUeD0l8SPkjQjW4Rwt4DZ8Z2mJSwABqKCBu6abFxI/9HgE9X95FNjK
	HwxdgwLurrxuHgj3nzKMA==
X-ME-Sender: <xms:OaS-Zve-wd7Zywb2RUYyovBtG-yFzGvFHm5TOT2QVqB4lJXzkGmlIg>
    <xme:OaS-ZlNVum-33Zo9i7eR2fuMYWjlsseCsVHJ2Ll5vc2-s10E5fmWC73rZxQUkPIMP
    rcGY1QOiE4eau6PSaA>
X-ME-Received: <xmr:OaS-Zog-45Q5o6FB2W3Tevaj3U4aYZSF0IeM1-KxY2otFpS_bvWFSVQpDVtEPX16d7CsJJoFb1vKuHtqFLSg9mesaeu4rkfD5hWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrh
    gvrhesfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepveehiedtjefgvdffhfeu
    keevffegheeuleetteehfeevtdeuhfeuhfethfdvheefnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseif
    hhhoqdhtrdhnvghtpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtohhmrghsiidrphgrkhhulhgrrdhofhhitghjrghlnhihsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtg
    homhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epohhlvghgsehmrghkrghrvghnkhdrohhooh
X-ME-Proxy: <xmx:OaS-Zg88M2lbLEtfb3dRpulA-JaeltUd6XBGuq9dpX3Gym-xlBMuDw>
    <xmx:OaS-ZrvQ3W7G7KANhxVLJeh1MSkyFBv4Bx8cxV7Si0o6F5nIXBz2lQ>
    <xmx:OaS-ZvF9RJWOfbkzf-TnaBCVrdraPVoYh5bnodXrxr1iWU9p9YWZ2w>
    <xmx:OaS-ZiO3GaJksoXp3FFpwY7Xmy_VIrpo6Sh86YIfORTdHfGIlHaJiA>
    <xmx:OaS-ZhUgeigFWD3swPRDZtLICGVNSEl0nkbl89EA2iK3NUFZaCnSX8O2>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Aug 2024 20:58:31 -0400 (EDT)
Date: Fri, 16 Aug 2024 10:58:24 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, bentiss@kernel.org,
	linux-input@vger.kernel.org, oleg@makarenk.ooo
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240816005824.GA261867@quokka>
References: <20240807031245.GA3526220@quokka>
 <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka>
 <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
 <ZrPEgZ9_ahKx2WTu@google.com>
 <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>
 <ZrPh9F5lhUKLLSQk@google.com>
 <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>
 <CAFqprmxs3VxDofat584GBX09y-Z0Xwq0qy2GAO2VQryF6+RTaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqprmxs3VxDofat584GBX09y-Z0Xwq0qy2GAO2VQryF6+RTaQ@mail.gmail.com>

This one apparently slipped through,

On Thu, Aug 08, 2024 at 06:42:37PM +0200, Tomasz Pakuła wrote:
[...]
> I dug around the kernel some more, and have few ideas and questions I would like
> to pose, before I send out another patch and make a fool of myself.
> 
> 1. For the compatible solution, and I know this might sound
> sacreligious, but would it be at all considered ok, if joysticks could
> use the KEY_MACRO range?  Current behavior in hid-input.c is to just
> add (BTN_TRIGGER_HAPPY - 0x10) after 16 buttons.  KEY_MACRO range lies
> directly beneath TRIGGER_HAPPY so we would only replace
> BTN_TRIGGER_HAPPY with KEY_MACRO1. I know this is not their intended
> use, but their description says "Some keyboards have keys which do not
> have a defined meaning, these keys are intended to be programmed /
> bound to macros by the user"

iirc the hid-input.c behaviour is fallthrough behaviour rather than "we
explicitly map it to this", right?

Either way, the KEY_MACRO range has an explicit meaning and if you start
re-using this for something else it's the same problem as mentioned
elsewhere - you now expect all of userspace to encode those special
exceptions forever just to make the kernel patches a bit easier. That's
... not ideal ;)

> Binding buttons to do some actions sounds just like a dame controller,
> in a way :P I already tested this change and it enabled over 40
> additional buttons without the need to intervene in software. This was
> picked up by SDL, proton, firefox and basically
> everything, as these usages are obviously not crossing KEY_MAX.
> 
> To squeeze just a little bit more, we could utilize the BTN_0 to BTN_9
> range. I couldn't find their meaning, but I suppose the definition of
> a joystick/gamepad could be stretched to include these.

They're used by e.g. wacom tablets for the physical tablet buttons (not
those on the stylus but on the actual tablet). And their meaning is
basically "numbered buttons without an explicit meaning". Using those
will likely get your device tagged as tablet though, you'd need to
double-check what udev's builtin-input_id does to make sure otherwise
we'll have to quirk every device one-by-one.

Cheers,
  Peter
 
> 2. For the better, more scalable solution, your proposition from the
> start is the best one.
> I thought that overflowing buttons could be just hardcoded to one
> selected usage in
> hid-input.c. Be it BTN_MISC, BTN_JOYSTICK. Deduplication would make sure, they
> don't actually send any bogus EV_KEY events.
> 
> Let's take a look at usage setup in hid-input.c
> We can see that if a usage is from EV_KEY range, EV_MSC usage is always appended
> and it will send not only EV_KEY events, but EV_MSC MSC_SCAN events as well.
> 
> if (usage->type == EV_KEY) {
>     set_bit(EV_MSC, input->evbit);
>     set_bit(MSC_SCAN, input->mscbit);
> }
> 
> This sadly comes AFTER deduplication. It would probably be better to
> set it explicitly in the
> joystick/gamepad switch entry. MSC_SCAN already has a value that seems
> to depend on the
> button number, but a dedicated MSC_PROG_KEY would indeed be better
> suited for this, along
> with MSC_PROG_VAL, as you said, as MSC_SCAN and MSC_PROG_KEY would not contain
> it. Or maybe we could do some bit magic and send the state with the
> value. MSG could indicate
> state. This is a bit less self explanatory but we only need to handle one event.
> 
> Now, software such as SDL could be changed so it doesn't care about
> usages at all, and
> gets the button number from these two. A legacy path could be retained
> as detection could be
> based on the existence of these MSC_PROG_* events.
> 
> Cheers
> Tomasz

