Return-Path: <linux-input+bounces-11375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B257A76141
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 10:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987291888829
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C891D6188;
	Mon, 31 Mar 2025 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="rqK9kIMH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pON3xGSS"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C98157A5A;
	Mon, 31 Mar 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409165; cv=none; b=IdpuYss0z/IB/aEm08BM4OHa8w3iFlxaLvzr1sSxNXLuEE6w/5G2vSNhHqCMrYk2qpmTCBN6zkf1xhyV+BrMiQXGgRyRDAIdnemuaIe9lBSSmw+L2pCH5digqzsRJ6+wn90e/MUn5l/j4wMeCWyXRE+u+Y6HvmTyCaNSsd//558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409165; c=relaxed/simple;
	bh=VKpsShU8JGNPY8l5PiHA5rhT/O/+GXnA/39u76AHAmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVPfEYrPm2dTETl+PU5WF+ZzUtz/RbQYE8gB673zjMyjMUqIsnZJIXcqJvlU5oUGvSJQkqBE9DcdZ1vVdxW8xbQ3a2Lm1f2gc4HMUL+n3i5Ie0aFC0NI8bHcUHC6WmdRv2gT4qhzQdk+t0rgYNDrpjgnSABJA42cjMK40wvnv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=rqK9kIMH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pON3xGSS; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id EC6BD1140162;
	Mon, 31 Mar 2025 04:19:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 31 Mar 2025 04:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1743409161;
	 x=1743495561; bh=fTaRjGa+X6PXvXNTAGMTGrwv3uoMcdpPFD4H4RNhKBw=; b=
	rqK9kIMHbuMkUIeWdKqa4XPRRUGCSKLVXTAXTEMVaU/H4W61jS2rn/s7SofLNpth
	uOAEwTT5nurTrkpsR+QKdmytxZaWEilmEyfayFXhzmNX4/UOPN7z0/fLeszA8gQ8
	wFH2VlssNjnpIhsNsip3vDf6WffSAXzGy1X7L9WUegxlr087hAahfzCnp0jtQuFJ
	oL+xuUHgS6n2tciwso7XHWdeUPjnqX4fpEXQgVdCEKDk7H7KxFJyQCzlRrBKwH6k
	KGJhLQ6zSScdcTQpdxf8K+dZ916++bW5RDSwjRkfTjiO6vBnGG5/5RsqcVp+BP1Z
	ndlqR+bKMa4qFUGwN95dvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743409161; x=
	1743495561; bh=fTaRjGa+X6PXvXNTAGMTGrwv3uoMcdpPFD4H4RNhKBw=; b=p
	ON3xGSSEEUAatS+b1kKAsE+B/yjiGFUZ4NQZgDxwda9bqL8mS/MLAM3u+VY5tPQs
	7kdfNqm6eIVyIyRfiu///nv9Ggl7cs5qDMtDnrlxOgO4151/oxj4wAP6TimOa2FG
	jBJ+TdsBkuOlfPWHHYgwpvtl87dXfykoRyDUFGbFqLdIvz1vH9p8l1Ooy6gPfbxW
	A+saXD7dbhLCxAvWuAUjY0tQCNdsuvPDUOpCa6B5nmj32T7zCkzGQXrLwbwDHvK+
	8zhyBY3fLHL3IYecT7mKV/pToqPAPYx/EgU1WbERKK3BLfyzZ/uaJhF9UftlTS2p
	9zQq6Bl/Gtl9BZEnAuP6A==
X-ME-Sender: <xms:CVDqZ8NeT9ylyQ4UGKpVs_W5zasDGmG_kCpO5W_PCPdcxcXA8X2LUA>
    <xme:CVDqZy-nqNptqo6nct5cH1ptvvAVjSM8-hqeeYkj4kPNnc1VwfaVVo6Zb9DMFZWSs
    vKMbqhEeoVjxdd_uI8>
X-ME-Received: <xmr:CVDqZzTBt3h1nZzCucOfd3C17WU5mJpfX7W8vndnaNvyzFLh0-UxAJm_VvWsug0L2OLC9SM3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepgfehhfevvdekledvuddvteffhfeihfef
    leekledugfdvkeffgfevheellefgtefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprh
    gtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegtohhrvghnthhinhdrtghhrghrhiesghhmrghilhdrtghomhdprhgtphht
    thhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:CVDqZ0tnpfbNb_VDX9x82J74PLyTaYMnO3L-HeXusgLq8Fg3mkjv9g>
    <xmx:CVDqZ0choh7--CurMRBwqJEJGgWMsrUC4VP3KOXMfrPT4LiGrBmWGg>
    <xmx:CVDqZ42RSHVnGB2Z3tLa2ib1tbTVL81_NbVQIqQcqdqv5tXX-WB7RQ>
    <xmx:CVDqZ484RAnMHFJjpjVVrtc2sCL2h4GTwCkpKVsCv9UpOz5SNX5yIQ>
    <xmx:CVDqZ7xeaVlQNGWaDAgDDhGkIM_kQ5_-6adlCUHkbK3ZsXpOyVl0wnIF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 04:19:17 -0400 (EDT)
Message-ID: <11155669-5168-4460-aa4f-849b764a5ec2@ljones.dev>
Date: Mon, 31 Mar 2025 21:19:15 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
To: Antheas Kapenekakis <lkml@antheas.dev>, Jiri Kosina <jikos@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-10-lkml@antheas.dev>
 <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com>
 <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
 <43c4dd17-de34-804f-7080-b287ac4a0cac@linux.intel.com>
 <26s13395-1ro2-37o8-01q5-6r4p09p69174@xreary.bet>
 <CAGwozwHbZHk_eSe-ZEM6jYM2HC4GxwnUrreZSh=+xJrKquEi9g@mail.gmail.com>
Content-Language: en-NZ
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwHbZHk_eSe-ZEM6jYM2HC4GxwnUrreZSh=+xJrKquEi9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/03/25 21:39, Antheas Kapenekakis wrote:
> On Wed, 26 Mar 2025 at 12:00, Jiri Kosina <jikos@kernel.org> wrote:
>>
>> On Wed, 26 Mar 2025, Ilpo Järvinen wrote:
>>
>>> You don't need to "pause" for the merge window, in some subsystem
>>> there's mandatory pause during merge window but I find that unnecessary.
>>> I know people on pdx86 do review during merge window so no need to wait
>>> when working with patches related to pdx86. Just don't expect patches
>>> get applied during the merge window or right after it (the latter tends to
>>> be the most busiest time of cycle for me) :-).
>>>
>>> It's more about the frequency, how often to send a series which is
>>> relatively large. Large number of versions end up just filling inboxes
>>> (and patchwork's pending patches list) and we don't have time to read them
>>> all through so I suggest waiting like 3 days at minimum between versions
>>> when the series is large or complex to give time to go through the series.
>>>
>>> This is not a hard rule, so if there are e.g. many significant changes,
>>> feel free to "violate" it in that case.
>>
>> Exactly. I am unlikely to do much review during the merge window myself,
>> but I'll pick up the patchset and followup once the merge window is over,
>> so feel free to keep discussing and polishing it with me on CC :)
>>
>> Thanks,
> 
> I think we have reached a good point with this series. We can pick up
> again when you guys are ready.
> 
> I will switch gears and look a bit into msi-wmi-platform for the MSI
> Claw with Armin and we can revisit this come rc1.
> 
> Let's try to get through it early in 6.16 so that Luke can also do
> what he wants to with the Ally, and let's push the oxpec move as well,
> so I can get those two off my plate.

I see Ilpo and Jiri mentioned no need to pause development. But it does 
look like everything is in good state so far, and no doubt you might 
have some ideas after a few days (plus that did of helpful info asus 
dropped in my lap).

If you do anything significant and would like someone to test on a few 
variety of laptop please let me know privately and I'll do what I can.

Cheers,
Luke.

> Antheas
> 
>> --
>> Jiri Kosina
>> SUSE Labs
>>


