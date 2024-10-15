Return-Path: <linux-input+bounces-7398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370D99E37E
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5A61F241BF
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 10:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51F41E3786;
	Tue, 15 Oct 2024 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="fSawCpc6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IO6ZS/Uj"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E71E2841;
	Tue, 15 Oct 2024 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986961; cv=none; b=RU3EIPm/7ma0oNo3UlbiAa4zVSKtnCKUJdt0ZFBdNJHOMs7yIBYWx+DIJ3jafT4atrQg+RijdC3NQzsOrEHl3FYEeJqhvZUulANtHUsguLR5X5ItlqJdFEBThN3cRq+YCoHulgD+m6RQ0kFEL2ipibPg/6SBakeMJm6xqqZWdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986961; c=relaxed/simple;
	bh=e/rNaI2oPtIgL6xcYyWnLvsQkvnuctXf8PjP48TaVRA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gKEr7HlvNrWhd183wJVtp62QW11i5pT9jxByEOdgF+GtDLF55+Qmh3n4eY/pOHSlKyD4qdbH6rOx4Y4yIUlUGpFC2UfvxxFvwAEscydnxkD7K1pPGEBJoEoPBYjlm3EK70L0/G5VdAaEoC4iwzdkVohO/Quw7oM7upBhdTL/yTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=fSawCpc6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IO6ZS/Uj; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 37059138034D;
	Tue, 15 Oct 2024 06:09:18 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Tue, 15 Oct 2024 06:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728986958;
	 x=1729073358; bh=QzEMDpMMmY/WtmgU3DpHFajDSeKbnI9145m7YXl7kys=; b=
	fSawCpc6JYq+pg8SRLbHcKgTqjbs3p8so5SweF/dVRszCtKIPGNi07ex29Azcp3X
	MEq0gMVSvr22Y9fYGlyhDXIRvy8v/2gHwJzqehzG+sDoBPQEjQMqPJfEl76/9iNf
	Wce1FVemgSeyMcOI9gE/y1vgiTtrZBKAPReV5AksQDNPtc6KJ0XAhE1sKDQ3P5fy
	B5Beg/cb8kyzaLwSmPvC+6gnb1RmksV8zq4s/qNnTWSCg3tiXiLr+oQYljA1Afkx
	UTjT1BK7/OomkL+yeZbz1HkXAdtLOyiuWjqhhH821D8LLdjN2+2Bmrgh48XbHS0D
	Otc3gDoAH/JOR9ptjsWO0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728986958; x=
	1729073358; bh=QzEMDpMMmY/WtmgU3DpHFajDSeKbnI9145m7YXl7kys=; b=I
	O6ZS/Uj5r8CCkAe8jNNNGe3Zo2eARABwcgN5nTyYRNTzBWlDpCzgaND82SIZuwTS
	wx/gbTcE/z0M1LFRV5NUIItUQTSaym2lfJcKEoRABukBkT2WIcrlRpgRcR7si5jL
	gZ9Y8tc4fzb2PU19BAvk7oZ7hWi0XFu0se5hgKG5oTevaE7vR9UP/Mhy/wKaFR/G
	//PaRRaEEUDJl1U5rz+SqQ9M1E+wDGSrlGkB08ByHBanO9HqH9ZEFD2kqvc3GwhI
	ZJt+bdeNBOjqycJJwbCKURz5BXids9HoWIIl/UspA1VoN/92xg8B/r1QErf3tBLW
	Lw6YBYcmir97dIg9oZeqw==
X-ME-Sender: <xms:Tj8OZ99u8Pxn99ruk6eMMPnKPUscGaHd4raevtaGmUYNzpgwiOlobA>
    <xme:Tj8OZxurhZVKtFWPjdxeJkdN7nRtQmETdqghHi5ghUWehrb6LLGtmAWtN-CjSY-Nd
    1MIFYsggktTAB6MJ7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeevteelkeefueeuleejveetueetvefggfeuledvhfdv
    gedvheelfeelkefhgfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhho
    nhgvshdruggvvhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhuphgvrhhmudeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Tj8OZ7B06N_tJzFMOcqe_nbq52dg5N49qlxiv8iAGhCPH_NnV_SwQw>
    <xmx:Tj8OZxc786WosMY7bn2Vwe28W_jChupn_4CYW79uaKbLDkwGmj9qHw>
    <xmx:Tj8OZyOXHtfN7xixASXow3HXnES62OoOS2Xm8az3nisDFqlpLzzy7w>
    <xmx:Tj8OZzlo-kKYzGKLaTWxS-u1WJeI49gvJoP1X3Ey7ZYkg7xlnBZYCg>
    <xmx:Tj8OZ-BJY6KdsczupYLOiCoWpWHQl9m-Okb8FVUP3ypX1azJOAg3sbxC>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EC4373360077; Tue, 15 Oct 2024 06:09:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Oct 2024 12:08:57 +0200
From: "Luke Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Jiri Kosina" <jikos@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>
Message-Id: <a4c97b6a-9a79-4310-a37a-bf927b9ab924@app.fastmail.com>
In-Reply-To: <20240930000046.51388-1-luke@ljones.dev>
References: <20240930000046.51388-1-luke@ljones.dev>
Subject: Re: [PATCH v6 0/9] platform/x86: introduce asus-armoury driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all, did I have anything left to do on this series? I'm quite certain I've covered everything now.

Cheers,
Luke.


On Mon, 30 Sep 2024, at 2:00 AM, Luke D. Jones wrote:
> TL;DR:
> 1. introduce new module to contain bios attributes, using fw_attributes_class
> 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
> 3. remove those in the next LTS cycle
>
> The idea for this originates from a conversation with Mario Limonciello
> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>
> It is without a doubt much cleaner to use, easier to discover, and the
> API is well defined as opposed to the random clutter of attributes I had
> been placing in the platform sysfs.
>
> There is some discussion on-going regarding the way tuning knobs such as
> the PPT_* should work with platform_profile. This may result in the creation
> of an extra profile type "Custom" to signify that the user has adjusted
> things away from the defaults used by profiles such as "balanced" or "quiet".
>
> Regards,
> Luke
>
> Changelog:
> - v1
>   - Initial submission
> - v2
>   - Too many changes to list, but all concerns raised in previous 
> submission addressed.
>   - History: 
> https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
> - v3
>   - All concerns addressed.
>   - History: 
> https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
> - v4
>   - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch 
> series
>   - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
>   - Split the PPT knobs out to a separate patch
>   - Split the hd_panel setting out to a new patch
>   - Clarify some of APU MEM configuration and convert int to hex
>   - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
>   - Fixup cyclic dependency in Kconfig
> - v5
>   - deprecate patch: cleanup ``#if`, ``#endif` statements, edit kconfig 
> detail, edit commit msg
>   - cleanup ppt* tuning patch
>   - proper error handling in module init, plus pr_err()
>   - ppt tunables have a notice if there is no match to get defaults
>   - better error handling in cpu core handling
>     - don't continue if failure
>   - use the mutex to gate WMI writes
> - V6
>   - correctly cleanup/unwind if module init fails
>  
> Luke D. Jones (9):
>   platform/x86: asus-wmi: export symbols used for read/write WMI
>   hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
>   platform/x86: asus-armoury: move existing tunings to asus-armoury
>     module
>   platform/x86: asus-armoury: add panel_hd_mode attribute
>   platform/x86: asus-armoury: add the ppt_* and nv_* tuning knobs
>   platform/x86: asus-armoury: add dgpu tgp control
>   platform/x86: asus-armoury: add apu-mem control support
>   platform/x86: asus-armoury: add core count control
>   platform/x86: asus-wmi: deprecate bios features
>
>  .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
>  drivers/hid/hid-asus.c                        |    1 +
>  drivers/platform/x86/Kconfig                  |   21 +
>  drivers/platform/x86/Makefile                 |    1 +
>  drivers/platform/x86/asus-armoury.c           | 1093 +++++++++++++++++
>  drivers/platform/x86/asus-armoury.h           |  257 ++++
>  drivers/platform/x86/asus-wmi.c               |  189 ++-
>  include/linux/platform_data/x86/asus-wmi.h    |   22 +
>  8 files changed, 1564 insertions(+), 37 deletions(-)
>  create mode 100644 drivers/platform/x86/asus-armoury.c
>  create mode 100644 drivers/platform/x86/asus-armoury.h
>
> -- 
> 2.46.1

