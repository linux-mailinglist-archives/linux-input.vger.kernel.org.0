Return-Path: <linux-input+bounces-8139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76A9D1E7B
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F24E1F2263E
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 02:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA4C136345;
	Tue, 19 Nov 2024 02:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="PE7jZPx+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="naEHQzAQ"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929633F7
	for <linux-input@vger.kernel.org>; Tue, 19 Nov 2024 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985011; cv=none; b=rdGOYTAannNuNKwgsYbYDQbnvmFBfC5NjZ8Bl5cgVTl/KhKkcqriDC5cmcr65eJtzL0Bk1EilgvOZdzH3z4NetciwB9b+Z6ACJimHMmAzFcm2G/w+9J7S5wJ+KO/7IaYru9tKu40KHTlE3ZS3FFqfHUlSQDDhEJ0Mz5RCnJEW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985011; c=relaxed/simple;
	bh=VS+P5G4LzFreLSJiYWEmvCgXVAX3yVsGE9n2tqFjH+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpLhLPuwClwGit7QMX+WResAnHDs1YrSbpV7Jt0R0LBKfdLnasgjZ16rG6m9PGvHLrF3QD5lywLBGZacYEXLJWo6D2P9v9H/XrgFvKR2CVV/Z9OIpZ1lJTblYWXm0mWLq0GAf4U758qOPFGvXmYfizMN6Wbcd4UVhAlvOWy/0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=PE7jZPx+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=naEHQzAQ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 6AF191140125;
	Mon, 18 Nov 2024 21:56:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 18 Nov 2024 21:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1731985007; x=1732071407; bh=7wp583BopO
	KYGt5AdLBQ++/tOzqpllnnpUq1+4strkk=; b=PE7jZPx+4/SjeHFcnm28eHe0sv
	LO3l9T9NboRXj5CdZTKtfXs60xpGkoI9FbKolF8l+NVKDoUeXRHjQDiB1HkU3R5B
	jv4ba58DGeRnIvX1w9kXbBYNsaKHOZkyFtLe9D7LGnxmtbAmqTrPcMGQmWlyM+Am
	7iGPur/XYiX2L0CsL935V32mGLJ3pSvgzUyL3oCx41giKQ97n307GncuyUiQ0lUa
	NUppGhfk93w1PU+/M5SaAgnjxr2nPoLtCNwON/2D6MTbtttPy78bg+DjP1PImiq4
	CCeLhL5BmnNrBfoqhYyDtziHtE+6ClJTmktNr3KvwyrabfBDtLP+ZFJ7Zo1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1731985007; x=1732071407; bh=7wp583BopOKYGt5AdLBQ++/tOzqpllnnpUq
	1+4strkk=; b=naEHQzAQT88h6eGRSfBmEHuI0jnqdV8GB9H34xJrAReoYp3SjZQ
	JpekrByyAYhjfdDDcbWVOSMn0bG5U09/UjU63BFXWnyiC+mT1ppUeYHIcVSlqcmv
	Rs8MwNQaYGTOAtcy71r7wIpiRA4rs9EsB3otsc3hzv12XlvsX77viVwErW9m0OLP
	A9VK5yDLVhj9O3MDjzbEZr/GhADgIPpK+P1sIYNZL8XEajDi8+49l0Tuf/PBpHe9
	R7n4Y81jF2xMFhdRrZU2haxNYmxRWuVLAF6fS3kATp8H3oaYzzr6CK1TpZnkNPtX
	hMzohWEETRFK1D/wZJbsCe1xbH8o/VA3VgA==
X-ME-Sender: <xms:b_47Z8x8KPrC28Mo3SzbqRTFv9njTThQb-VKgoeK5RVc4mtJigUk9Q>
    <xme:b_47ZwSHYh9KcKmkR5jUTvMB16TiSLjwaZ27eNt27kS3UH0lQakbEMttlFlwiP6a3
    ZkuihPXPOw7XzV1h30>
X-ME-Received: <xmr:b_47Z-VsUckuS8xL9DatswOWF2CDp3CAJfduB-I0G72ylJetNJUciH9aAfb7xnoM6RR_OFMEcijQIKRUjmGEZlwU1-DohmyIYCoJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedugdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrh
    esfihhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepffeggfdtgeeutefftdekfeev
    feelhfduieefvdfghfegieehtefhgefgkeelleefnecuffhomhgrihhnpehmihgtrhhosh
    hofhhtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtpdhnsggprhgtph
    htthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegumhhithhrhidrthho
    rhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsggvnhhjrghmihhnrdhtihhsshhoihhrvghssehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmphgvrghrshhonhesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:b_47Z6iHgB19cVlSPT0u0vP7POVGCoh5PQVx5d2QExuktX5exbTH2A>
    <xmx:b_47Z-B2vgSPeB-cCSTOpqLayGW8w4EL1xuu6RffziKw3eJnd1remQ>
    <xmx:b_47Z7J5THvxJxO7SVzvZZ52oNBdaDUNiyaWhh8W5Xpovj-UIB6GbQ>
    <xmx:b_47Z1BOmzO7tT6j6NNost_3FCojYgsq_EwU1EAFzgjFxQIKf4ULZg>
    <xmx:b_47Z17oKXqDFDDymJ_Ok9Rh9mnwNhmqqDekqUxJzkrNihM7HlTAYQUN>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Nov 2024 21:56:45 -0500 (EST)
Date: Tue, 19 Nov 2024 12:56:06 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@gmail.com>,
	linux-input@vger.kernel.org, Mark Pearson <mpearson@squebb.ca>
Subject: Re: [RFC PATCH] input: Add "AI Assistant" key
Message-ID: <20241119025606.GB2078515@quokka>
References: <20241118231014.GA2011625@quokka>
 <Zzv5sRu7lgEEP7aZ@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zzv5sRu7lgEEP7aZ@google.com>

On Mon, Nov 18, 2024 at 06:36:33PM -0800, Dmitry Torokhov wrote:
> Hi Peter,
> 
> On Tue, Nov 19, 2024 at 09:10:14AM +1000, Peter Hutterer wrote:
> > Not to be confused with KEY_ASSISTANT which is for Siri/Cortana/...,
> > this one is the Copilot key.
> 
> So my understanding is that Copilot is a successor of Cortrana. Why do
> we need another assistant key? Do we expect to have multiple
> assistants being available on device, each with its own key?

Ah, I didn't realise copilot replaces cortana, I thought they'd be
co-sharing since we can't possibly have too many AI features these days.
I did find an official-looking statement:
https://support.microsoft.com/en-au/topic/end-of-support-for-cortana-d025b39f-ee5b-4836-a954-0ab646ee1efa
Quick google says Siri gets Apple AI shoved onto/into/at instead of
being replaced, and there's only one Google Assistant^WBard^WGemini.

I doubt we'll see multiple assistants on the same device so I think
KEY_ASSISTANT should be fine then, thanks. Sorry about the noise.

> > Unfortunately Microsoft requires that the Copilot key sends
> > Win+Shift+F23 so this is merely a placeholder for now. Eventually we
> > may see hardware that actually sends a custom key code for this.
> > 
> > Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > ---
> > Note: this is really just an RFC, happy to change the name (which is not
> > great given we have KEY_ASSISTANT already), the value, anything. The
> > purpose of this patch is simply to scope if this is something worth
> > pursuing.
> > 
> > As above, because of the MS specs I don't see any (MS-compatible) HW
> > sending that particular key in the immediate future. But since userspace
> > is expected to implement the functionality via the Win+Shift+F23 we'll
> > need a new keysym for this in XKB anyway.
> > 
> > If the kernel plans to add a keysym for this we can happily re-use that,
> > otherwise we'll need to define our own but that means some manual
> > attention if we do get a kernel keycode later.
> 
> There's nothing in the HID spec yet, is there?

Not that I'm aware of, I checked the current HUT RRs but it's not listed
there.

Cheers,
  Peter

