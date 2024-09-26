Return-Path: <linux-input+bounces-6781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D6987AC8
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 23:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799C31F229DD
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 21:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D16186E25;
	Thu, 26 Sep 2024 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="P4tdH4wi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TmEvA/tg"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8CD4D8C8;
	Thu, 26 Sep 2024 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387123; cv=none; b=DYqBDMhI/Uj+5lNoKFX7abm82+f5OpGTgBLacPcy4Kg0TvJ0LZwZQAd2EPimKqRWk8QyARbpvXMi0BhaVb2pPvkUvr6KUm+oDmDJboDLXpChkXdjNT7QHAnrWmAEax0QBsE3rDol4UQcDkgrd+b0kMlUIbSbTvn4YzRgI7u2kdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387123; c=relaxed/simple;
	bh=kuuY6JKW7eCRAbjK0FmIotT68Z+CpdMYmpA6ixyzeRo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QlMmJ9XHkGKxOcs9jcUUG/NzVx0bs0cDd42BXFqjLG6chBxsu8y6QSmsChyB/3NCM55+INCb4ylVQ/DREitjAYGcwxC/z/8aiChjnIAc6/NEf8lKb8lm064JQlcwRIhRZNyM+DAVgkuJx2imqMmJ6bthZq64hp6jOl12xr48VWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=P4tdH4wi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TmEvA/tg; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2EB1D11401D0;
	Thu, 26 Sep 2024 17:45:19 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 17:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727387119;
	 x=1727473519; bh=MT4PMWS9/hI/rlztWLWtJtxuPvGz8xYeHFlyPYjZlcs=; b=
	P4tdH4wixGOl/fsO5fDymohgO568tUrgHulJ+vcAgWddlEUIKyqfABk7VDp4Ut2x
	OgQqazmQsx8Jx153Y0fwDbP5vA6qdiopUCAXzXzXmxSR5w6G+Y85D4oOMpMqvrqL
	DpsEgEfM5DMReaCVnmMt7WkEdgNjb4E5zxOPgyZiZYWLsPI2+5tKOSphJqFRTUl7
	EQJIQPsjD5sK2nSioCEtgglAhNNY/VBf6/qpdK9P7qVUccPDPJSBkO5dU7yGREE1
	hyVW/edWsHMpuoeClWhcG0nFPqlohe34KmnmGz6UTtSUrjZS8sk1T76tkO5NW1MH
	DwkFNpHu1vHQ0PoTOj4gPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727387119; x=
	1727473519; bh=MT4PMWS9/hI/rlztWLWtJtxuPvGz8xYeHFlyPYjZlcs=; b=T
	mEvA/tgIPhbMjEKie2/DLij/dblcPoFa9ksAVjP4C93yGapKxkkPGYwUaciuVqTB
	EhtR9AsjFXpnVZZRbRHnjFRbufvSaC7ag8ol5ZByi2XRJvk3FLIbEqbBQUJIy/yO
	bQPSyBCDcW5qfoQIs/iFWBYua5gux9/7o+tJpyys3Pl1bFDONtO7pnXE19p4oPxo
	cy0MsdhQgYQ8gejUYCG3epMk2Bg5/WSg1LByP70rmvOlzRwofFKjzRH+58ar/cDZ
	tbERH6BC9tUZ6oRBA6XeqEcbEe0MkCpiMWrbJOTDzX7LZy1A4bRG+vAJ3HYL4T1S
	V2YbnMAIio1Lvnp+9V4Iw==
X-ME-Sender: <xms:79X1Zg1rk0Tq1_RgWZGDfCLKF_bPlSIys-_4LyEbTWtvvJ1FtDslaA>
    <xme:79X1ZrFe5OJ3hokQigm0d0A6-jyXZgDQQJ94L9MbZHMc1I5LTEYNIOad67VBS95sn
    lkS5ECgK2A7Zi76NwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfh
    rhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqne
    cuggftrfgrthhtvghrnhepveetleekfeeuueeljeevteeuteevgffgueelvdfhvdegvdeh
    leefleekhffgteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghs
    rdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegtohhrvghnthhinhdrtghhrghrhiesghhmrghilhdrtghomhdprhgtphhtthhopegs
    vghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    phhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:79X1Zo6v24iuw-6m6NpmFilthX9t7TxhFTcdSFU9Y9dhtcbDGFxt0A>
    <xmx:79X1Zp2_DuVFGf2Omdu6o27WBCmYA_MDjbwto7yWvZCqvEwg08nEeA>
    <xmx:79X1ZjFobs4e09weWAfyY-edqoS5f_bTShBy-SkYsl-YdAAX_iLhyA>
    <xmx:79X1Zi__sCJ-m-K8rT2jih8DCJF3X2JuMTPf8N9l9c3mscV_w9kieA>
    <xmx:79X1Zi33Vp_phd9tSClYlHxeqTjarEy_k--LL8m97HQmW5gWhtJFC1Iy>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE0DE3360077; Thu, 26 Sep 2024 17:45:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 09:44:58 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <e345d94c-6151-4e3f-96dc-7a4d167c8a58@app.fastmail.com>
In-Reply-To: <6a6ed991-ac15-4b2b-99b9-cd14314a98aa@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <6a6ed991-ac15-4b2b-99b9-cd14314a98aa@kernel.org>
Subject: Re: [PATCH v4 0/9] platform/x86: introduce asus-armoury driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024, at 2:50 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > his is the first major patch I've ever done with the intention of
> 
> s/his/This/
> 
> > introducing a new module, so it's highly likely I've made some mistakes
> > or misunderstood something.
> > 
> > TL;DR:
> > 1. introduce new module to contain bios attributes, using fw_attributes_class
> > 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
> > 3. remove those in the next LTS cycle
> > 
> > The idea for this originates from a conversation with Mario Limonciello
> > https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
> > 
> > It is without a doubt much cleaner to use, easier to discover, and the
> > API is well defined as opposed to the random clutter of attributes I had
> > been placing in the platform sysfs.
> > 
> > There is some discussion on-going regarding the way tuning knobs such as
> > the PPT_* should work with platform_profile. This may result in the creation
> > of an extra profile type "Custom" to signify that the user has adjusted
> > things away from the defaults used by profiles such as "balanced" or "quiet".
> 
> Yeah this is under discussion on my RFC patch series.  Based on the 
> outcome of that we can modify asus-armoury later on for it.

Perfect

> > 
> > Regards,
> > Luke
> > 
> > Changelog:
> > - v1
> >    - Initial submission
> > - v2
> >    - Too many changes to list, but all concerns raised in previous submission addressed.
> >    - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
> > - v3
> >    - All concerns addressed.
> >    - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
> > - v4
> >    - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
> >    - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
> >    - Split the PPT knobs out to a separate patch
> >    - Split the hd_panel setting out to a new patch
> >    - Clarify some of APU MEM configuration and convert int to hex
> >    - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
> >    - Fixup cyclic dependency in Kconfig
> > 
> > Luke D. Jones (9):
> >    platform/x86: asus-wmi: export symbols used for read/write WMI
> >    hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
> >    platform/x86: asus-armoury: move existing tunings to asus-armoury
> >      module
> >    platform/x86: asus-armoury: add panel_hd_mode attribute
> >    platform/x86: asus-armoury: add the ppt_* and nv_* tuning knobs
> >    platform/x86: asus-armoury: add dgpu tgp control
> >    platform/x86: asus-armoury: add apu-mem control support
> >    platform/x86: asus-armoury: add core count control
> >    platform/x86: asus-wmi: deprecate bios features
> > 
> >   .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
> >   drivers/hid/hid-asus.c                        |    1 +
> >   drivers/platform/x86/Kconfig                  |   22 +
> >   drivers/platform/x86/Makefile                 |    1 +
> >   drivers/platform/x86/asus-armoury.c           | 1051 +++++++++++++++++
> >   drivers/platform/x86/asus-armoury.h           |  257 ++++
> >   drivers/platform/x86/asus-wmi.c               |  185 ++-
> >   include/linux/platform_data/x86/asus-wmi.h    |   19 +
> >   8 files changed, 1520 insertions(+), 33 deletions(-)
> >   create mode 100644 drivers/platform/x86/asus-armoury.c
> >   create mode 100644 drivers/platform/x86/asus-armoury.h
> > 
> 
> 

