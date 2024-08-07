Return-Path: <linux-input+bounces-5404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1564949F0C
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 07:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522F71F210E9
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 05:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DC6B647;
	Wed,  7 Aug 2024 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="cfiPxX7W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MZpNWt80"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD342AAA
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723007839; cv=none; b=AOg4eMGQ+Z3SKz7U3vNXfGM/EcvBDAvM+vxFZwutbZ59SKEPG3EYGH3ISOKGefxsBXmyLHYMukzt8LCfkul3Ic8tSZ4dDvvg/K53U28Q0gecweuf8yEyA2Jw8y9rcJpgM+mxTN4OC9AGAQuQzhNP8q5IE+k+RhtLMrsIbk0Fit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723007839; c=relaxed/simple;
	bh=dTd/jfJhAPyjZ8ajfCFKpBy6pdbjpzSti1L1jSIEi4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw0ufzkMW9UjvIscvdyzJoZ60hlUPmhPFNfE/ebZrWjvqtjm1heurKQFvZZzKAYCcyUWv+sUJGvmNkdLCNvqgVeFoQwnMlYwC7QXUYMq8yhadLD+43168qAbla97vzvvX3byRELw5cvdU7znBsECEPXoYreDqGdxeJA4PKPtb5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=cfiPxX7W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MZpNWt80; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7CE6F114816C;
	Wed,  7 Aug 2024 01:17:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 07 Aug 2024 01:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1723007836; x=1723094236; bh=JVI+0XOnty
	BZTAQ9l/D/tp7gTUTHh144AcdqVc15To4=; b=cfiPxX7WhTUT8hgqtVlrS2sB8t
	sYkvVy8OeI8kLokywjTwGjLf5G8elW46leVV5iBnev2Nc2GI0odfCG4pTHvOgvVc
	rUlxQleBYL20jdCIYUWebOCx13QusBSLdewjHA14uOPmddw1zrVWLBziXoHbgS2Y
	LEXovU+1mj88BGuUv6c3+yd9pbaKue0NZlhJ8fni8n7ccFKjf6npwk63K7o2sxo4
	Gm18wbfXsij4FjklUrPlpGPN2N8kUzZN7ukx0Oux+Ku6ZE/H4OZygQwwvKEsZ8Z6
	D7Aa1GGJ1PpGPKeSbeV0+ENDKW6JnRdYiFpxee3rwJ9L/21TBlajF2eX/wbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723007836; x=1723094236; bh=JVI+0XOntyBZTAQ9l/D/tp7gTUTH
	h144AcdqVc15To4=; b=MZpNWt80uGs9tpkdTlASdRut1qCYv5yvFrZG0qVErZDh
	DO2ylgrCerKhrrsrttW0Jm2HIKDwfFfwCLMHOgtLSpdA6VmJUNIhkth0zcetXF4J
	SeTNpGh+8GD97Hw9iqvUuNqQW3e2Y8IBf8/hEC3V5DuUEoIGSun6eon/8g/zanzA
	Xf3UKrSZxU/DNvjOYKxYRnCEaZH7HfVarHKwtpYPxPVuEFgX8jWnABj6iJJse49m
	CVdDjqDWZuEc2J7LLFNP/Hav78gfT3WFAmkbLfCglud+ucb+zHUupu5lXUgYt9+0
	zLHsmJKL4QxJnglGogGGVUB4xr0iceFTXU7DBqFSKg==
X-ME-Sender: <xms:WwOzZlhU7zvQ7Qh_Ri0tgYbKW-YP0QOMdUqzmLOKwKgTd1uXaWi63A>
    <xme:WwOzZqAVxOMx78Wk1hEkXtW7Yak9BUt1DO-5-vEiTwYhqJZmjXyodT5llIvW5ZWGX
    CHp1wJ18U7rtkdqmmA>
X-ME-Received: <xmr:WwOzZlFNy8w9GIRwstJ4SKYMcGWmVNgndXofiWuC0PPamkwh6ePUjOdfFXd0ZBR5q9YLgN3jZcecLZpEyi1jPiXf4NBLoCwb-xJR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeelgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepkedvkeegheefjefgvddufffhveehjeffvefgiefgkefh
    udeifedugfetudfgtefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtpdhnsggp
    rhgtphhtthhopedt
X-ME-Proxy: <xmx:WwOzZqQdlqOfYA4wAJOazujiDlqrlZY-IMWa8BT-u4kzebdNV7TWdQ>
    <xmx:XAOzZiy7_0wlhAD6glph2wvP7cdmmGbk_lM6d__YPyOOR90Itl7APw>
    <xmx:XAOzZg7WgsCa3fdGTAfLCC6Kc5MB5c5nX1CjbmUwc1x3rIFKtdi-Yw>
    <xmx:XAOzZnxJi28tKJyEU5GNAb8K-EW-sobWWeL8K5gQsgzABypuLPSyBg>
    <xmx:XAOzZpl_uvlXD9XlF3o0QEm3JNS-ObYps521FG8MOiNtGTRLS4coM1sf>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Aug 2024 01:17:13 -0400 (EDT)
Date: Wed, 7 Aug 2024 15:17:08 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	bentiss@kernel.org, linux-input@vger.kernel.org, cpuwolf@gmail.com,
	oleg@makarenk.ooo
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240807051708.GA3551201@quokka>
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com>
 <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka>
 <ZrL0KD9yDnfHMbL-@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrL0KD9yDnfHMbL-@google.com>

On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > 2. Can we consider using something other than EV_KEY? For example we
> > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > > > transmitting key number and state of keys that do not have pre-defined
> > > > > meaning. Here we are losing event deduplication and ability to query
> > > > > full keyboard state, but I wonder how important that is for the devices
> > > > > in question.
> > > >
> > > > The same problem rears its head in the EV_ABS and EV_REL range, so
> > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > >
> > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > > > updates in the same frame without an SYN_MT_REPORT equivalent.
> 
> I do not think that frame notion is that important for keys. It is
> typically important for a pointing device state.

true, I remember a conversation years back that frames aren't
consistently implemented in keyboard drivers anyway which is the reason
libinput sends (most) EV_KEY events immediately instad of waiting for a
SYN_REPORT.

> > > All in all, we've had people using this patch (but increasing KEY_MAX to a
> > > whopping 0x4ff) for the past few years with no adverse effects. I've been
> > > using a custom Linux kernel with this patch on my Arch machine since about
> > > May, and didn't notice anything, even when compiling with debug flags and
> > > following and filtering dmesg.
> > > 
> > > So here's the thing I'm most curious about. Is this something, you'd just
> > > want to resolve differently, to make it nicer and more logical, or is this
> > > really something that would break everything and doing it in this way will
> > > never be allowed/merged? That would make a lot of us sad :(
> 
> We need to figure out not only how to handle your class of devices, but
> also allow extending number of keys that do have certain semantic
> meaning. Peter raised a lot of questions that we need to answer.
> 
> But I wonder, these devices with large number of buttons that do not
> have predefined meaning - do they have to be a single input device? Can
> we create N input devices if we exceed the "trigger happy" range, all of
> them mapping to "trigger happy"? That would mean that userspace would
> keep track of key assignment on per-device basis.
> 
> We already split HID devices on per-apllication (not userspace but HID
> application) basis, and also when there are several USB interfaces.

Honestly, I'd vote against this.
re-combining input devices into a single device in userspace is a pain.
The split per application in HID is mostly fine because they're
usually physically different devices but I recently ran into the issue
with the uclogic drivers where various features are split across
event nodes. Thse devices have the ring on one event node, the buttons
on another, etc. Nothing in (my) userspace is currently set up for this
and it'd require a major rework in many places to be able to handle this
properly. And it requires that rework in every userspace stack, possibly
special-cased on a vendor id. In the end it was easier (re-)writing BPFs
to get the expected event node behaviour than dealing with the split.

A device that arbitrarily splits makes this even more difficult - which
one of the event nodes has buttons 1-20 and which one has 21-40? We'd need
some other magic somewhere (e.g. hiding in uniq) and some digging around
in udev to figure out which ones are part of the same device.

I'd rather not go with a simple-for-now solution that makes everything
in userspace more complicated, forever.

Cheers,
  Peter

