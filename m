Return-Path: <linux-input+bounces-6121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36396AD69
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 02:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F02286A6C
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 00:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB347E1;
	Wed,  4 Sep 2024 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="uUMbtg4X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YuTDvr3J"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC7646
	for <linux-input@vger.kernel.org>; Wed,  4 Sep 2024 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725410228; cv=none; b=T0Xr+qAMHoUbHbcWCBzjG3porDqkaMDMS8NFD6YWGpG7sQj3X7rIWF/HzBVcrO4fIFA8tA7bfGeAWFKpjEJZ4m3mZIriHeefFxQy9704hDz6SUMgqi8MvdtTFYSGZGOpDhmBgVVbh/uGV+/dh+JzmN16NGwclPGXYbdfu1Oqt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725410228; c=relaxed/simple;
	bh=+OgSMCWSZcTEyyni1j7zOjHjrtIh46PmJw5vb6R93IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRtso+IyBcZzGAg92mTbDrLP3APwUnb33094hBQP3KgFhHkBx0ya8qnjzEUgQ2DwFs9AFksp1jAuziGJjaXrWLe6+i4YA7367JywqIMVMR5Y0xBHORCE1un5wAYRGPNbIk3J7xm4PqiTfzMKoBqJ7NiDa+rmO6Gr7C2cB5+ghEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=uUMbtg4X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YuTDvr3J; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5973D11401AB;
	Tue,  3 Sep 2024 20:37:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Sep 2024 20:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1725410225; x=1725496625; bh=2rgwUhNazR
	6DdDiLmw+BaXmMVOVh0mA5sB7JSHpZPXA=; b=uUMbtg4X6FsGS2MusqlaKnaf4g
	73Dk7vBwpknWoRymE/e+0iLHWuaA+V+Z4uYBGBybIxqHEDZ2mSxgpPTWRbI78xFt
	RkDvks/BxgGJJvLH6R+u1PeVXGU5cLLy5COw3wG6qovvwm43S6L4k2LjggwUhYKG
	HHllT+jzF/MiTPIp9djhfIVkGuKLJtva+s1U5FKSjc1Vn8PeLZNzsXG67vI+szp2
	JDCBjQeEb93U925c/gXCdFUv0FdUUc4TDz99KfVXf23G8bDmBk76QCFLnCkbmcFe
	rCRcgqLZ6Ar6luVqsQW8rfUQ25IdstFXA09LgcH81SnIjIKAW68JAHu4hiMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725410225; x=1725496625; bh=2rgwUhNazR6DdDiLmw+BaXmMVOVh
	0mA5sB7JSHpZPXA=; b=YuTDvr3Jh8gjkibrWb1QAkNSaeio00qJD0jVBcVzAFNb
	fUTxxPOpmbzxN2OoW8ArWzvD3Y1TIyt6pbdm9eNMNTgEPE1Ch/v1dSjk66S6flpF
	AfcOlXlx6wGc76lSVAwe45mMMHlG9Q4d2KfAOnqVBzbepu9Rma3z37qKXYWOJAdk
	b5XIVzCXVt/pUUHMbJsEHeQVmSqvyeLyv5yQycB0ruKfAIfqL0Pl7/5fmY9n3eft
	iOrXyCEoDUmnt3iD0Ygo2S2FCUcuLFJIX5xxJm0atOqSnpNznoJecXjYugm+7sy2
	Lr/ghka3DJuVB2zWpqSYV4EcZPIbfJd2ymbVjgcgoQ==
X-ME-Sender: <xms:savXZq_FZKAg1O8ng45ma9-1uvgbFNfknfJajMMarZa0v5CFPmzYEQ>
    <xme:savXZquBzRtX4_AJ_GWI6tpMvacIeuTcn-agn0zHabrVboNwpv-TwHla8yFX5wIl0
    A_kWeZKleqcwgAxjD4>
X-ME-Received: <xmr:savXZgAwBESsXmFGptcF_5Uhp0ZGJu9D383dvC4LFIckrb1xBVTw4qE2W5MqqM8yTmY0fMm-Osc3Hz_RuaU7FPSWPL2PgltXkcH9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudff
    hfevheejffevgfeigfekhfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihh
    ohdqthdrnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehkihhllhgvrhhtohhfuhesghhmrghilhdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsg
    gvnhhjrghmihhnrdhtihhsshhoihhrvghssehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorh
    hokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhinhhglhhinhhugiesghhm
    rghilhdrtghomhdprhgtphhtthhopehtrghtshhunhhoshhukhgvrdhtohgsihhtrgesfi
    grtghomhdrtghomhdprhgtphhtthhopehskhhomhhrrgesghhmrghilhdrtghomhdprhgt
    phhtthhopehjohhshhhurgesjhhoshhhuhgrqdguihgtkhgvnhhsrdgtohhm
X-ME-Proxy: <xmx:savXZifcyz1yVFzFQW0Y64ZzhG-y-jPeZAjDdvzuWSC48f468Nx1uQ>
    <xmx:savXZvOKz3m7XPaTiHosPkp95YiNLHg5p9QlmA43pMfxPuXdJlTptA>
    <xmx:savXZskXH6d8GgCswGdtKqf3L32XzIKfTyR4nUlXBmDu8nxWuBIFcA>
    <xmx:savXZhtIhcVqpV6FTEbNZYUNQR_XmDRl1X62sYgqPOmbuFBgTQ7_FA>
    <xmx:savXZgHASjMQBm-2I5L7aXlhiTtyOc4euAyjmDv1HI7fpQgKP9q8Vces>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 20:37:01 -0400 (EDT)
Date: Wed, 4 Sep 2024 10:36:49 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: "Gerecke, Jason" <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ping Cheng <pinglinux@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [RFC PATCH] HID: wacom: Stop mangling tool IDs
Message-ID: <20240904003649.GA1105191@quokka>
References: <20240903182633.870892-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903182633.870892-1-jason.gerecke@wacom.com>

On Tue, Sep 03, 2024 at 11:26:33AM -0700, Gerecke, Jason wrote:
> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> In ancient times, an off-by-one-nybble error resulted in the Wacom
> driver sending "mangled" tool IDs to userspace. This mangling behavior
> was later enshrined into a function so that devices using the then-new
> generic codepath could share the same broken behavior. The mangled IDs
> have not historically been a major problem for userspace since few
> applications care about the exact numeric value of the IDs. As long as
> the IDs were unique it didn't much matter. Some programs (cross-
> platform and remote-desktop applications in particular) /do/ rely on
> the IDs being correct, however.
> 
> This patch rids the driver of the mangling behavior.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
> References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
> ---
> I'd like to get the opinion of the kernel maintainers on making a
> change like this at some point in the future. There are _very_ few
> userspace uses of these IDs (primarily: drivers, compositors, and
> tablet control panels) and my plan is to update those bits and then
> give some time for the changes to roll out to users before re-
> submitting this for real. I don't expect any kind of breakage since
> we'll be taking our time with the rollout and userspace needs to
> have handling for "unknown" IDs anyway (since Wacom periodically
> releases new pens).

Just to show my support :)
Acked-by: Peter Hutterer <peter.hutterer@who-t.net>

Cheers,
  Peter

