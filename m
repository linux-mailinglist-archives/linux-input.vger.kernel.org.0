Return-Path: <linux-input+bounces-5328-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1E9474B4
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 07:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454721F212C4
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 05:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C76A63A;
	Mon,  5 Aug 2024 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="n5liebwy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jnRn/LAH"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0930639
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722836094; cv=none; b=nTA7RpnAIgC8fqySgDyXFMNz8BPodXW8c8THENHAFEsTWqm9N8wjyKcBNlVpfpOhWDsL8gF2d5RfFMTUYk0Er6Vkfuk49UaoxlCAHVCDhEzJh9TEyeo+Z5Fp4lcycEa1J6Jjo8lqZxw0Qg0xvwBM+EFGVgcqDxPf3r53fVfXi4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722836094; c=relaxed/simple;
	bh=J/HIVwVwpXTm8XqA1GMJ5j3gkFnDNNC4PX6nYsuA20w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdoM6CLefP+xG6Fods4QyrxcWOGr4gD7J9SdS3HPjRcwojKYe5MpyzSf8raEnWsRQ7ba+XzDR8sNIPWVFaTHzOt/T5uFALuZT9zs42mitN/AORQ3WnpHpuVvGZOUvhWQ+rBgo07PvLKRJI7+SMCvzcPAtUgvmhXoVUROmJSYBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=n5liebwy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jnRn/LAH; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E67D31151E5A;
	Mon,  5 Aug 2024 01:34:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute8.internal (MEProxy); Mon, 05 Aug 2024 01:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722836090;
	 x=1722922490; bh=wSvEY1mP4Mr0zE0bhj3eK9DR/9jzeek6zr7EgseqQvA=; b=
	n5liebwy65W/OswwNauvmJ4OOQp4slLiCmfOLVrbymlPwh6wd81u/YIdRdI9ZRVu
	EOid2l0VYodhtVNnLcLnWkFLYtH6hv258t918ykPdKZgujOddQN6Z0dhTLkbF08D
	SCsB2ZRbiub49pRJDUvphGe0aJGhqmPcuDw9hBZglf35GZKOeidrTW3Isqd6B1aA
	Jdhu4mwjggAOnKFE2jzHXZHnD1smYcCEcYEo53qg+0FTbdSasZQkcF0ady17c2fi
	Q9LxG588reJ7m6ovoq2bfkDx+u6LTbiPG6m1ZeUiRHyfk+c8Be5jreKFxKwNKC21
	FGwNG/jlt/WFHiVDpj1Tvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722836090; x=
	1722922490; bh=wSvEY1mP4Mr0zE0bhj3eK9DR/9jzeek6zr7EgseqQvA=; b=j
	nRn/LAHS3y0JRh28QD6fUj0HHtm05Qjzv0qz+709sq+A5mZe52PMee+oEzaqXYRn
	kBjULiW3cHylqi4ru4/DV1Lw8KjS1PYqFe3mUA8RCvKmRjoPbh82TbIC1pM/jEL5
	/R5ZQ+PjeL8jLbASs4EwAALkSDb6ltFriJ5p3STcC6s5AC/YZhaNa/brttti6shY
	rTSxkgBETmK3gOmr6ungdOex+0xMDu5XpqXobb9ym4pMWsHH0HQtqsbwB96gfETv
	VT2KGVmAcViDfDgZECUV1gsQ5ZgI8Di9CBPsIQVcnE++LhdB2rESoWhiqXaaUTAU
	wvCBKGn1o1HCtJZP7H9vw==
X-ME-Sender: <xms:emSwZoIiZNliuLkLoRVyX5i9dEfQhdAuGN0KPv9pmkUbqIGMKv0oAw>
    <xme:emSwZoKZcVrsuax6aMCLKDXqHNA1febp9hcmt0eCPM3NbegrBBIAO2ClmaKGSKLYl
    yV1rFqCTkF8NpDdsiE>
X-ME-Received: <xmr:emSwZouAgcmRsxehcp20BygGKPhtmj25WlHSR1YJDqG-oBdgGpdcwAsxNemBkgCxr9zhUbKqRFZyHojoY9jyto9vobqICGTmgry7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeehgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeevheeitdejgfdvfffhueekveffgeehueelteetheef
    vedtuefhuefhtefhvdehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvthdpnhgs
    pghrtghpthhtoheptd
X-ME-Proxy: <xmx:emSwZlYJqHQYPqh6Ej9DCQ9LWQVtBjCLcsV0vul9xhkbFmhZXEYCpQ>
    <xmx:emSwZvYBew_d7I9OI_vP9XOPD7xGXCkWK7KIsBgJljnfI0plYPk-Tg>
    <xmx:emSwZhB20b6w6tQ8PHRmQ2fZUjmm_0ryo2ESaVt-zyJKahPn24IotA>
    <xmx:emSwZlY2n5hjLpoTylqNWpUnMSyXmoOwx5aytr-vC8765oaCvQ73Sg>
    <xmx:emSwZuX5pCgobl-pHjUTsRgff3cUsIb8r9VGfaFlZsqZjxV_2AVnHjSY>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Aug 2024 01:34:48 -0400 (EDT)
Date: Mon, 5 Aug 2024 15:34:45 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <20240805053445.GA3149961@quokka>
References: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ>
 <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zq1ypyDxAVQsjpjB@google.com>

On Fri, Aug 02, 2024 at 04:58:31PM -0700, Dmitry Torokhov wrote:
> Hi Tomasz,
> 
> On Fri, Aug 02, 2024 at 10:09:40PM +0200, Tomasz Pakuła wrote:
> > Hi. I can't seem to shake the feeling I'm being ignored here. I would love to 
> > get some input from you Dmitry, as this is an issue that was raised a few
> > times throught the years and many times, it was left to wither, even with
> > proper patches submitted and the reasoning explained.
> > 
> > One might think of this as trivial, but this is kind of an ancient limitation
> > and we ought to improve linux HID compatibility, especially since this is
> > such an "easy" fix but still has to propagate throught the linux world.
> > 
> > If I'm stepping out of the line, or something is really worng with my
> > intention here then please let me know, but I know at least in 2020 there
> > was a similar push to change this and  after Wei Shuai explained his reasons
> > he was similary ignored.
> > 
> > Me? I just got a new Moza wheel and it too uses button above 80 so I can't
> > make proper use of it :)
> 
> Sorry, I must have missed Wei's email and I was just trying to figure
> out what to do here...
> 
> I understand that we have a limitation in the input layer for the number
> of keys/buttons to support, but I wonder if input layer is the best way
> of going through here. For the long time I was against an "anonymous" or
> programmable buttons in the EV_KEY space. The reason is that we want
> userspace to not care what device emits an event and act solely upon
> what that event is. I.e. if a device emits KEY_A it should not matter if
> it is an external USB keyboard, or internal PS/2 one or maybe it is
> Chrome OS matrix keyboard connected to an embedded controller with it's
> own protocol. Same goes for KEY_SCREENLOCK and others. Yes, we do have
> multiple usages called "trigger happy" but I am not really happy about
> them.

ftr though it's mostly obvious, this effectively moves all key
configuration into the kernel, doubly so for devices that are fully
programmable with no specific meanings (the XKeys devices are the oldest
ones that I'm aware of that don't work that way).

IOW, this approach works for semantic keys but not at all for anything
that's really just one key out of many with no real distinguishing
features otherwise.

OTOH it has saved us from having to ship keyboard models like XKB used
to do in userspace.

> Additionally extending keys space is not free, we need to allocate
> bitmaps, historically we run into issues with uevents being too big,
> etc, etc.
> 
> I wonder if we can consider following alternatives:
> 
> 1. Can we go through HID (/dev/hidraw) instead of input layer? I do not
> think we will see such devices connected over anything but HID (BT or
> USB).

HID is currently unsuitable for two reasons: we don't have EVIOCREVOKE
for hidraw (I need to dust off that patch from years ago). And the
desktop input stack (i.e. libinput + compositors) doesn't handle that
use-case either, our key events are currently tied to EV_KEY codes. 
Can be worked around, just needs a fair bit of effort that without a
HIDIOCREVOKE (and logind integration) isn't worth starting.

But at least for these devices - libinput already doesn't handle
joysticks/gaming devices so I can easily ignore those too and let those
be punted to the application :) Which means the ioctl is all we need for
now?

> 2. Can we consider using something other than EV_KEY? For example we
> could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> transmitting key number and state of keys that do not have pre-defined
> meaning. Here we are losing event deduplication and ability to query
> full keyboard state, but I wonder how important that is for the devices
> in question.

The same problem rears its head in the EV_ABS and EV_REL range, so
fixing it for EV_KEY doesn't necessarily fix it for those.

MSC_PROG_KEY/VAL pairs would make it difficult to send two button
updates in the same frame without an SYN_MT_REPORT equivalent.

but (and this is not fully thought through) if we are ok with dropping
value 2 key repeat values we can make the input_event.value a bitmask,
so we can have EV_KEYMASK / KEYMASK_00, KEYMASK_32, .... so for buttons
1, 2 and 32 down you'd send
	EV_KEYMASK / KEYMASK_00 / 3
	EV_KEYMASK / KEYMASK_32 / 1
	SYN_REPORT

This should be nicely map-able from HID too. Would also work
for EV_MSC / MSC_PROG_KEYMASK if you don't want a new type.

Other random idea, even less thought out: have a marker bit/value that
designates anything in a certain range as "merely numbered'. Not sure
how to do that but that would make it possible for non-mt devices to
re-use the limited abs range for something else.

Cheers,
  Peter

