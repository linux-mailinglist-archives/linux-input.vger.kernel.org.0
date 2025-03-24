Return-Path: <linux-input+bounces-11133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCB1A6D85F
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 11:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6501889F9F
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 10:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E9A25DB02;
	Mon, 24 Mar 2025 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="gbPC/B0K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EYuipvf5"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94679433A8;
	Mon, 24 Mar 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742812443; cv=none; b=B69wwULe5V9R9oB3gZ6TRqHodgjS1LEjnZT+gUthp9zvrGDrtDSg3CQwrWoJvpObH5UhsvKWi30VjjS3nXTqoJqifSB1xnrpNPSRC/jUB0uN3Yfj1+ibnTptJn68ETqZzaUGofuXEEPpSUArmMb9z8nFP+b8y5c7iGqMQA4YWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742812443; c=relaxed/simple;
	bh=MDaWS369zyU3ft/VPAGvF4/93oOsT0WshVGyyTRZSrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e03UIktGD3eaz6kfXMCRZnDP16terEWSkHFKhsm8F2TXO5eKCF3/YpDh8LLY5f53xm6c6l+JSQSe0RKSknrVHaIaKOh6AfairU8gS8cto7CC0FTwbouz5E/3UvU5LebIInExjTnqy6yPsDVXbD7G+O0dIE0YtiZHYFz9v1BNREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=gbPC/B0K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EYuipvf5; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3EC3125401BF;
	Mon, 24 Mar 2025 06:33:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 24 Mar 2025 06:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742812439;
	 x=1742898839; bh=EU6NpT9oUCnxAd5/BZlw3N/2VuBMArT0EOYmB1+ztpw=; b=
	gbPC/B0KKVvTVndlHSXDhXYKQZVRMjupHmAZgLQmT3x5q3I1NdTtsqyLPgx5JYWs
	1Ey2BWIoujmL7KoUSPHkokjthtEwQU9ERi3A+yntgtbixiFJl0BVPhNbyvCZevtL
	SQo2g1jOa2fs5c7jrNm+bEhURw+awiuRJ5ujZUoLaKTQOmRVCIxFmoHtc+SKiBHi
	uan6x0q438KHRG2ps3sywCmz6D41SCYGnIppOZijAtPQd9emvtU0B09BcM6z3g4Q
	5YIaJQxI3G0CPANDboHcKA72Pull3IdkNuTBwi6YwrFKDdXpnlDJvPI2sRT5MMMR
	o09Zab/haa1fzzWAqzMXgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742812439; x=
	1742898839; bh=EU6NpT9oUCnxAd5/BZlw3N/2VuBMArT0EOYmB1+ztpw=; b=E
	Yuipvf5Ljq4mxTggUARgnUqQbb1IZvwCjuhXS42u3h7tjOwRyJFXEvGDJi1siYXu
	PeMh6IAd3SdXuuO/8AUmicBGzPARCbBcUdhpujYSS2/V4NoqDpLHgRNIUraYWhCg
	H1DiTtLTOdT1MLv3GbPnKGY6IlTPw2JQIQTioo+dGfB34n6BQEc9+LQyRPu0xFwr
	vk1kwGZZw3CqbYidIjs/nAUWHzbOJK6SQguBjR7aUOS8NsmNh4mmxbE8T+gvXmnw
	vOQ6Wlkmz4XAjXMs4M8RhbNfll0jo0P1DfE3D6gJV0PMI2mTEHK0fHuJMKV7mUFF
	EbqUrgw/gRbo2j3ulzyBA==
X-ME-Sender: <xms:FjXhZ9MFyh1fzVLbftTUZMh25anBRDeITzUmqGysmhjREN2O5QSDEA>
    <xme:FjXhZ_8outC7TKMDUx8yeE5dhkNx3zV1GQEx_qGtfIU4bZvkTDgRrsBgTMzXOTbGd
    sdAkKPlXcRxXoDDNBc>
X-ME-Received: <xmr:FjXhZ8TmjATNuRQctBqAKf1YNU1PHn67HbKXHDombqDKx6tKe3IsKNQDsPhrG_sF5CH5FrX->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkff
    ggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepfdfnuhhkvgcuffdrucfl
    ohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    eigeekveevffelfedtieegudfhkeefudeuleduhfehfffhtdekhfekffefteduvdenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomh
    dprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgr
    rhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomh
X-ME-Proxy: <xmx:FjXhZ5vF5YB2Lu_hD6Y1eBpvQBBiEmeB8NRq5p0TC-ay5eVUjCYrOg>
    <xmx:FjXhZ1cphiLDqpiwJXR0xmRHAf1HrKSp5iwm2t9RmH2gh7PIBLCFLw>
    <xmx:FjXhZ11gXkuBKutrpwUK0yxg4XcI6cj9VfHu6fN57I53_x-I3sCEmw>
    <xmx:FjXhZx8nHNC8otTgLcLgBd7wJoXZKBkiDi3K42J9qLKBxa3j7Q92cQ>
    <xmx:FzXhZ0wIE4rgD6ONYk6c3tz-cC-qmCQiPQwy2jlJGGNZUJjLeEsWkT-N>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 06:33:54 -0400 (EDT)
Message-ID: <41bf9d87-be11-4814-bc3e-c6c9297e0cc4@ljones.dev>
Date: Mon, 24 Mar 2025 23:33:52 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 mario.limonciello@amd.com
References: <20250323023421.78012-1-luke@ljones.dev>
 <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
 <deeb4946-dd66-4a82-a8f0-5e8b1751899e@ljones.dev>
 <CAGwozwGPVJznyX4Vp5vNfb1JOP7AGoZV3vOkRwT_W=_0g+gkJQ@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGPVJznyX4Vp5vNfb1JOP7AGoZV3vOkRwT_W=_0g+gkJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/25 21:11, Antheas Kapenekakis wrote:
> On Mon, 24 Mar 2025 at 02:41, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 24/03/25 00:41, Antheas Kapenekakis wrote:
>>> On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
>>>>
>>>> This short series refactors the Ally suspend/resume functionality in the
>>>> asus-wmi driver along with adding support for ROG Ally MCU version checking.
>>>>
>>>> The version checking is then used to toggle the use of older CSEE call hacks
>>>> that were initially used to combat Ally suspend/wake issues arising from the MCU
>>>> not clearing a particular flag on resume. ASUS have since corrected this
>>>> especially for Linux in newer firmware versions.
>>>>
>>>> - hid-asus requests the MCU version and displays a warning if the version is
>>>>     older than the one that fixes the issue.
>>>> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
>>>> version is high enough.
>>>>
>>>> *Note: In review it was requested by Mario that I try strsep() for parsing
>>>> the version. I did try this and a few variations but the result was much
>>>> more code due to having to check more edge cases due to the input being
>>>> raw bytes. In the end the cleaned up while loop proved more robust.
>>>>
>>>> - Changelog:
>>>>     + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>>>>       - Adjust warning message to explicitly mention suspend issues
>>>
>>> How did the testing go with this one, especially with mcu_powersave 0?
>>
>> Appears to be good. Checked a few reboots with powersave off - it is
>> setting on as I expect every time. Did modules unload/load also. And
>> tested with it set off after boot plus suspend resumes.
> 
> Did you test suspends with mcu_powersave to 0 and rgb on? I had a few
> issues you can reference the previous version for and I want to see if
> you have them.
> 
> Even with powersave set to 1, the RGB does not fade anymore without the quirk

Yes I tested every scenario I could think of. I don't think the fade is 
something to worry about - seems like it happening at all previously was 
just due to suspend being held up for a bit longer and now that the hack 
is disabled for new FW, it relies fully on Linux suspend (async? 
Honestly it's never been fully clear how async it really is).

I'd rather the faster suspend/resume. And so far I've heard no 
complaints (although my userbase is smaller than bazzites).

Cheers,
Luke.

> Antheas
> 
>> Very much hope this is the end of that particular saga, and with
>> bazzites help we can hopefully get everyone on November MCU FW or later,
>> then finally remove the hack completely this year.
>>
>> A small side note - I expect ASUS to fully reuse the X hardware, or at
>> least the bios/acpi/mcu-fw for that new windows handheld they've doing,
>> so fingers crossed that they actually do, and there will be nomore
>> suspend issues with current kernels plus this patch.
>>
>> Cheers,
>> Luke.
>>
>>>>       - Use switch/case block to set min_version
>>>>         - Set min_version to 0 by default and toggle hacks off
>>>>     + V3
>>>>       - Remove noise (excess pr_info)
>>>>       - Use kstrtoint, not kstrtolong
>>>>       - Use __free(kfree) for allocated mem and drop goto + logging
>>>>       - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>>>>       - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>>>>         correct the message.
>>>>     + V4
>>>>       - Change use_ally_mcu_hack var to enum to track init state and
>>>>         prevent a race condition
>>>>
>>>> Luke D. Jones (2):
>>>>     hid-asus: check ROG Ally MCU version and warn
>>>>     platform/x86: asus-wmi: Refactor Ally suspend/resume
>>>>
>>>>    drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
>>>>    drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>>>>    include/linux/platform_data/x86/asus-wmi.h |  19 +++
>>>>    3 files changed, 222 insertions(+), 41 deletions(-)
>>>>
>>>> --
>>>> 2.49.0
>>>>
>>


