Return-Path: <linux-input+bounces-15884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 395BDC34086
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 07:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 093E24E78FF
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 06:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F3A2BE7AF;
	Wed,  5 Nov 2025 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="vkuw5WQJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SRjH57sT"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81A34D383;
	Wed,  5 Nov 2025 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762322801; cv=none; b=M2lSVASgNQRBXlBzbVcL7fXL6YHtA/nFUfRXUt6j/WOsbPkvK70uxT30sUBtZ+iEJya7lTe+owXxgK91pmmouQiwhcW0k2Vjy7MpokRR2HZfvA48tkwHRkk4K7ySVWaayHUv7oCjg3egnZhV7VVQbSCbVlhEmjtDOy1H3lYq9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762322801; c=relaxed/simple;
	bh=qAsXPQ8tPOYOrXJQ+JhV+X3Go8QN3AZCEU3AG+kB7uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2X7vjrkdvvGzogfmbtTO5s2s4KvFjchMidMfD5zEIMQQ/PQ4B+bxb6ejH+iVwKybONTU6tLVijST6q1WRucERWhqbUHyX3DrQoETcqt66f/pcBpTbg2/+ZEgwNi2XFNt4EyewH+aC0lmPAHAz6JdEixzkufMMJQsXuFrvUFEHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=vkuw5WQJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SRjH57sT; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 740071D0016A;
	Wed,  5 Nov 2025 01:06:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 05 Nov 2025 01:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1762322798; x=1762409198; bh=Uo/zdGm8+c
	RvE/8H7Cf5eMs2BH9++xthPjBsEvZkuvo=; b=vkuw5WQJRvKETLhyZwKaP++/LU
	Gl7hHaqY3hT6HyDxWVB/gl0Cwyu0ImpDss3BdYdS43dZQ3KVzrk3D9BAE1Fbh6yF
	R6M1ilClvIj+bl3nChk1GFYcIAqZNltJjwhhd6FABbHKeqCwqmI7AGDzW5YJ0Eeu
	hiDbY3s10kmioQSzYJz3/4FmFVDRD9AKmCRz4VpohdIPsC8vX17IMgIaEA5eJFml
	+9EtQ5tGxT2nSKOutl/1nYuDdz4g12LRmwNofk7cnYHOLrndbX/SO0ZA7uiHGaV1
	2CoLFrg0XbcwJ3G92tFlBKoNQLMlB04TPr6iZYSG0a9Ig98ULbCDzWDXdeGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762322798; x=1762409198; bh=Uo/zdGm8+cRvE/8H7Cf5eMs2BH9++xthPjB
	sEvZkuvo=; b=SRjH57sTvxV3NgG67XAJ2R4CiCqAV0fnkRk4NRbpk6pz+3wekfG
	PXV9O/3hfgigUwgZU1OKi9niFqIByx8ZwV2gHqueVuOfO6FHpSHBUtPtCdt//QK9
	cGRTSglt3V3chAx9n8A3i1yrKzYhbejiL9TPe/iaEpDqZmwaIX5/Aw8YJz4B3jxi
	xAUCCMMw8sYsxwWxIncP3q4uc+e19P6c97khtExDPfJ6+VA3OvfkJ1SXnUpt2RFC
	haq5Yyo9hC4cV3EOWpY3CUWdFCsWQb4ETUYF2dKxqhBHzC90l+gma2oHoy2l5bX0
	BOAXQAf3OXi+8IJGOQJjVXq7PwOsl3chbkg==
X-ME-Sender: <xms:bekKaQmYoPboJ4lrQ1tF5j_GI2PaJBSFaXuYIz2SYB1uFA6cXhzR7w>
    <xme:bekKaX-jQ2zACrZXqcOcSN2sV15jbKce5UXRAe2eYhMXpkwdTpXKaEcsNF3ijKLDM
    iERTY9JKyBHu2RND25N6Xh8E1r6bePbkSumixhsSMdl5e2emXhB8nI>
X-ME-Received: <xmr:bekKaeLEXYIoDiEnjDLAdbwNIVT3PBWy4JVDOo4aQQOrtJ4aoStQcL3R1ogO13DgYivGb985DCtiDTFEgVkZUNqxP6yGiijmrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeefudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudffhfevheejffevgfeigfekhfdu
    ieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvthdpnhgspghr
    tghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegumhhithhrhi
    drthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhguvghnohhsvges
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    rhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheprhihuggsvghrghessghithhmrghthh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:bekKacheko_TuNKEXY8n0vOd-B12WyVlM7YtgZR_ObLDQCZiYXaDZA>
    <xmx:bekKaa8syu_Tcf6jB7-yrGWt6k2QsVy8q34WNgVNc8nej_JM8RT_sA>
    <xmx:bekKaRPg-xUvLTdAtriSWy3WeXi8-KlbCJM4I7aoccYLZqP7kIGHWw>
    <xmx:bekKaeCE_Utfzz-ZMMq7UoHIrqT3fPsqlDNOpM5hdefD87jm4MjTYQ>
    <xmx:bukKaf44TMl8lVL2fblallwNYaCNrMvQnVCSWuZ8GRd48n2-slFIN2F0>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 01:06:33 -0500 (EST)
Date: Wed, 5 Nov 2025 16:03:33 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: input: expand
 INPUT_PROP_HAPTIC_TOUCHPAD to all pressure pads
Message-ID: <20251105060333.GA2615904@quokka>
References: <20251030011735.GA969565@quokka>
 <20251031041245.GA1316325@quokka>
 <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>

On Tue, Nov 04, 2025 at 09:09:09PM -0800, Dmitry Torokhov wrote:
> Hi Peter,
> 
> On Fri, Oct 31, 2025 at 02:12:45PM +1000, Peter Hutterer wrote:
> > Definition: "pressure pad" used here as all touchpads that use physical
> > pressure to convert to click without physical hinges. Also called haptic
> > touchpads in general parlance, Synaptics calls them ForcePads.
> > 
> > Most (all?) pressure pads are currently advertised as
> > INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> > by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> > commit 20ccc8dd38a3 ("Documentation: input: define
> > ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> > provide this information.
> > 
> > In userspace it's thus impossible to determine whether a device is a
> > true pressure pad (pressure equals pressure) or a normal clickpad with
> > (pressure equals finger size).
> > 
> > Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> > INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> > have support for userspace-controlled effects. Let's expand that
> > definition to include all haptic touchpads (pressure pads) since those
> > that do support FF effects can be identified by the presence of the
> > FF_HAPTIC bit.
> > 
> > This means:
> > - clickpad: INPUT_PROP_BUTTONPAD
> > - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> > - pressurepad with haptics:
> >   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC
> 
> Should we maybe rename it to INPUT_PROP_PRESSURE_TOUCHPAD? We are within
> a release of introducing it, so we should be able to rename it without
> much fallout.

I'd be happy with a rename too. Want me to send a patch for that or do
you want to rename it locally during applying?

Cheers,
  Peter

