Return-Path: <linux-input+bounces-11158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032FDA6E74E
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 00:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E48F3A6A4C
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 23:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1781F1510;
	Mon, 24 Mar 2025 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="yvlgOJup";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dfiw2uem"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4E1BC9F4;
	Mon, 24 Mar 2025 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859849; cv=none; b=XESCngxiqPRxHyk23CprQuGGhEhsM09lJxk2bjpEJs9O+IeFhn4dQ4EOztf4r/e7MNZk6aKQo1qmdDd5xF5czBWTZzEElG8u55L9bfzNxybcXObQkD7vdy/zg42Pd68ZQehP0GJVe3bEEPjORJXdEKLHcBtXCKFG6k+SbH8n56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859849; c=relaxed/simple;
	bh=jePUKltdKVXhTc/lbLMM8CYtA4/6wap9X6IR6BtWxPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAJsqmnIWxZy5QiJFEIl9TKyKeGKgc55gbKaethePb1qyW54KBpVFUDaf+vZKTX/yOnca3VIAz5KCIZavv3uR7Vo6/YZtoEI4YBGLVMZ9IGVhuRXl2xp1jnvZoHHc8hiv65vTimfKqiIQPibHSUuWyHzFQjNHFSkD5BFqkea0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=yvlgOJup; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dfiw2uem; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BAFD8114011C;
	Mon, 24 Mar 2025 19:44:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 24 Mar 2025 19:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742859845;
	 x=1742946245; bh=Kohbe1k0LyBeROrqM6SzfTWm9ZZqmQnFiR0J0zWlaoY=; b=
	yvlgOJup0sXJDbXEjcdRRj//fEd0nCwqGbCd/Qt/192KgBOVJjXTUZWd9gDEDk8b
	EwIPXMLEz6aMyprrH0AFZH2qVEauuFyI1Enp8Y04TJaz7ACnMogmPkOtzUX9F8mg
	MENVltViobWcf9nqFEopjv1jUoujJaPp/nngilqkuOxtz4PDNpBKEJDWHfMZGoTj
	42Dj5coq8345FuS+Qsf5jpak2nHoPtE56TMX2QouS4+pvButbQa4DgoSW2mpGWTd
	niUqyFbBVk659fO81QRx3Fn/JASGBCKszs2Y8oKucjFUEMR0Wjt96/hVyqpZrS68
	grl/lGbIS79JzjqLQesyiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742859845; x=
	1742946245; bh=Kohbe1k0LyBeROrqM6SzfTWm9ZZqmQnFiR0J0zWlaoY=; b=d
	fiw2uemiQWi8gOVAY1hGFGN54JVnGGX9H6TMxrar0lXApQAgD5OsKjVR189QfXzi
	uuTRanF8cFHuE1KVoVIvuejIuo1YdjX4PDPdQ5A18OtCpQqzY4/kQChKQoYEVn1y
	LXylZRcrPKHVuHQYYCARTzBGSpEKjRcMMbu2sHo+bEmLYE+ap9ue+Z1pQVMbAZlZ
	8luRpmdE4yvwfspxemYyEPXvUWTuHJPjGMixFmXpMhxd5dKlPiFx2gOrYJhZbKmP
	VH5gc7Tqw02EasxhOGkT1vJqO9hXXqx4wQIZInXE5FQVeJM2kBLlZj7cKCRQgwHm
	O/ni9pEg0qmKYFCDD0tHw==
X-ME-Sender: <xms:Re7hZ21-2erjhbD3ndEA7FFmUw5TIOTnl_W7lXs7YtlqY5Fn4k_3-A>
    <xme:Re7hZ5HeosDZeiN9lYeZUl2m0CL301hOKHURL0gAgkZjTe0_twConJpKFIsyOfeyD
    tMoS-1n27fYK2sr75E>
X-ME-Received: <xmr:Re7hZ-5hWzw41D4sm72TQizH5NX5GKqQSV9TZiqLfLL8Eep7LYrlYefi4ldau29ZbvfoKGSf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieduuddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Re7hZ33yL73RQsF_JwIYZEYdaEnwgF-uJbGSKI2YVx5aVWXT7FpusQ>
    <xmx:Re7hZ5FRxs7A6GMAbiD6wYcjjMPD0LGRmZythxla5Lq8Cdhv_gyUqQ>
    <xmx:Re7hZw-dS6hOHTNNu3tr79auBX02Pv9geSLEnLGmhZwpv59Af8pcWg>
    <xmx:Re7hZ-nqvtViLGYjaU-qHrZ2l7OJxC_15KMcFo2ba0RhnfrPpR4cDw>
    <xmx:Re7hZ_ahfuGV3iYRkgecnP7OQ5j16mIETNz2nmxCr5UPiW96zIpMxEFY>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 19:44:01 -0400 (EDT)
Message-ID: <0badc4de-92c7-4de6-b609-cb0ea1ef50d7@ljones.dev>
Date: Tue, 25 Mar 2025 12:43:59 +1300
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
 <41bf9d87-be11-4814-bc3e-c6c9297e0cc4@ljones.dev>
 <CAGwozwGE0vVUEn=1pCakhcMZP8oT=9jzrYMNYM8RvBvE9Wq0WQ@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGE0vVUEn=1pCakhcMZP8oT=9jzrYMNYM8RvBvE9Wq0WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/25 03:46, Antheas Kapenekakis wrote:
> On Mon, 24 Mar 2025 at 11:34, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 24/03/25 21:11, Antheas Kapenekakis wrote:
>>> On Mon, 24 Mar 2025 at 02:41, Luke D. Jones <luke@ljones.dev> wrote:
>>>>
>>>> On 24/03/25 00:41, Antheas Kapenekakis wrote:
>>>>> On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
>>>>>>
>>>>>> This short series refactors the Ally suspend/resume functionality in the
>>>>>> asus-wmi driver along with adding support for ROG Ally MCU version checking.
>>>>>>
>>>>>> The version checking is then used to toggle the use of older CSEE call hacks
>>>>>> that were initially used to combat Ally suspend/wake issues arising from the MCU
>>>>>> not clearing a particular flag on resume. ASUS have since corrected this
>>>>>> especially for Linux in newer firmware versions.
>>>>>>
>>>>>> - hid-asus requests the MCU version and displays a warning if the version is
>>>>>>      older than the one that fixes the issue.
>>>>>> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
>>>>>> version is high enough.
>>>>>>
>>>>>> *Note: In review it was requested by Mario that I try strsep() for parsing
>>>>>> the version. I did try this and a few variations but the result was much
>>>>>> more code due to having to check more edge cases due to the input being
>>>>>> raw bytes. In the end the cleaned up while loop proved more robust.
>>>>>>
>>>>>> - Changelog:
>>>>>>      + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>>>>>>        - Adjust warning message to explicitly mention suspend issues
>>>>>
>>>>> How did the testing go with this one, especially with mcu_powersave 0?
>>>>
>>>> Appears to be good. Checked a few reboots with powersave off - it is
>>>> setting on as I expect every time. Did modules unload/load also. And
>>>> tested with it set off after boot plus suspend resumes.
>>>
>>> Did you test suspends with mcu_powersave to 0 and rgb on? I had a few
>>> issues you can reference the previous version for and I want to see if
>>> you have them.
>>>
>>> Even with powersave set to 1, the RGB does not fade anymore without the quirk
>>
>> Yes I tested every scenario I could think of. I don't think the fade is
>> something to worry about
> 
>  From my testing, I got it to flash random colors and not disconnect
> properly, so if you really want to remove it, you should make sure to
> test the version that disables the quirk properly first.

Like I said I have. This "random colours" sounds like a userspace issue 
such as the solid/static colour not having set/apply/save after it. 
There is zero in this patch to cause anything like that.

1` hour later: I'm currently doing a very heavy refactor of the 
hid-asus-ally driver and it looks like I've solved both the fade (a very 
noticeable improvement), and the random colour issue. I'll do my best to 
get this done by the middle of weekend (I'm UTC+12) so you can have a 
test - to save you some time I'll have your patch series on top with 
conflicts solved.

>> seems like it happening at all previously was
>> just due to suspend being held up for a bit longer and now that the hack
> 
> Yes, because Windows does not enter s0i3 instantly, so some devices,
> like the Ally units, like the Go S, rely on that for different
> purposes. 500ms is perfectly fine for both, and since it happens
> during suspend and not resume, provided that the screen has been
> turned off, it is transparent. (The Go S gets an APU hang due to very
> aggressive TDP tuning; a delay after the sleep entry call and
> userspace suspend lets the VRMs cool off a bit)
> 
>> is disabled for new FW, it relies fully on Linux suspend (async?
>> Honestly it's never been fully clear how async it really is).
> 
> The call is at the wrong place unfortunately. That's about it
> 
>> I'd rather the faster suspend/resume. And so far I've heard no
>> complaints (although my userbase is smaller than bazzites).
> 
> Have you deployed the V4 though? Because the behavior with the quirk
> is fine. WIthout, it is soso.

I have. I agree it was... meh. But the hid-asus-ally rewrite is solving 
a lot of issues now, and I'm thoroughly testing every scenario and 
applying a lot of lessons learned.

To be clear: Right now this current series is good. The issues 
encountered are solved in hid-asus-ally, so I'm comfortable with merging 
this upstream and I'll try crack on with the new driver.

>> Cheers,
>> Luke.
>>
>>> Antheas
>>>
>>>> Very much hope this is the end of that particular saga, and with
>>>> bazzites help we can hopefully get everyone on November MCU FW or later,
>>>> then finally remove the hack completely this year.
>>>>
>>>> A small side note - I expect ASUS to fully reuse the X hardware, or at
>>>> least the bios/acpi/mcu-fw for that new windows handheld they've doing,
>>>> so fingers crossed that they actually do, and there will be nomore
>>>> suspend issues with current kernels plus this patch.
>>>>
>>>> Cheers,
>>>> Luke.
>>>>
>>>>>>        - Use switch/case block to set min_version
>>>>>>          - Set min_version to 0 by default and toggle hacks off
>>>>>>      + V3
>>>>>>        - Remove noise (excess pr_info)
>>>>>>        - Use kstrtoint, not kstrtolong
>>>>>>        - Use __free(kfree) for allocated mem and drop goto + logging
>>>>>>        - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>>>>>>        - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>>>>>>          correct the message.
>>>>>>      + V4
>>>>>>        - Change use_ally_mcu_hack var to enum to track init state and
>>>>>>          prevent a race condition
>>>>>>
>>>>>> Luke D. Jones (2):
>>>>>>      hid-asus: check ROG Ally MCU version and warn
>>>>>>      platform/x86: asus-wmi: Refactor Ally suspend/resume
>>>>>>
>>>>>>     drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
>>>>>>     drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>>>>>>     include/linux/platform_data/x86/asus-wmi.h |  19 +++
>>>>>>     3 files changed, 222 insertions(+), 41 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.49.0
>>>>>>
>>>>
>>


