Return-Path: <linux-input+bounces-11129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59422A6D2DC
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 02:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A3C188CCF6
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 01:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304E479F5;
	Mon, 24 Mar 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="uiqNJSNo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u+L0V146"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CA367;
	Mon, 24 Mar 2025 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742780510; cv=none; b=YBediygmzKi4c0kZHlYLz+Dj0WlO7x5M2Jegr1XiNVfehuLvmQevsU6JgnHZhuxR9J+XJtUFHslGEMzB8JOVYRZ4qTZ9DwIjd8Btmp4NH/rmC+eygMLQQwgamtroPvRyIKPAsnygRbOnIomTzFulLWbH+avFQVnkiXZT/6RmBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742780510; c=relaxed/simple;
	bh=hNUA8ajXEF3jCVz2tTKvjz2TXG3YLE3+en1hSJz4f5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiDnKnmaCWceOZnB0/je19HvzNHiTv2LJTDyARU0MlxE+brI278pGmR56W7Ky5cxIOJU4GTeXQoNzTOdEKiAruDn+/WgT3Pi8RjSgk1OjxIyIIlJPNwoFZnA9EQrLQDTgq+wIW63ctbLhH3jeVfSCMx50JOjByeDCYkQT51xCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=uiqNJSNo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u+L0V146; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id E26971381100;
	Sun, 23 Mar 2025 21:41:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Sun, 23 Mar 2025 21:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742780506;
	 x=1742866906; bh=scMdHBPZ6vxqc2HSxuk39OMIToy9t5zqjIDcVZ1lF1c=; b=
	uiqNJSNoUVxEQ26bQqgtsqkglWBs6asc25pHEWjBIsmsqG+eKYUOZsyl4Itz7HES
	iYP8SKoJfsXOMronyCH3YdO57kLMXIWn5WxDSA/GLoAhSE1P253dYOfFSv2XkSYv
	aKs3DMmAXf9fQlRcx6xQQfQ0afanFjLx/FhV4Kw0DdqO3xaCqJxQrKF40Div5hx6
	7197YVa4YfxRHuCTdhcty+qBlgmnOMkKGYoOd0YLdIjIHIVaQnhFLoAZYFzSf5+V
	FC4Yx9q2mjDiYQibY/RPwuZetzdj4bbIP4S2NzO47TFu0SHU1bpECZKBEC2wD2Ln
	fUOZd2UBr2Qb8xPcCX0bFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742780506; x=
	1742866906; bh=scMdHBPZ6vxqc2HSxuk39OMIToy9t5zqjIDcVZ1lF1c=; b=u
	+L0V146T5Szv+t/x0gfIf1AvZOdBzudx649nTh7S0+frElwKYmHpdkEAoVog0SuW
	eePtyagIeh3iZc1mJ33q+kKOT+vBMSLMSlLwO4pAwqOjyTjHaOaXWQbXn7QQ0EG6
	1L1WTnKTb//0N2HP85rDfriDcNdsKgIMLCBFGFQ7Enz9C4fxTKTOFYm+zyAK4z+o
	EqkMnyddDMNvLFSi0lrvI4YfGffGzBj7DAgkdcl3VXzGio7gmINUvh0gTIN3JCuH
	EUhFPrfR715yt71X7kDiCDIj48/AWTdkC1SP0LrGSS/XPVxphhDGGzRPvkgM/HN3
	5CHbEnojivxqtmdbK/2aQ==
X-ME-Sender: <xms:WbjgZyXIqyfUn-3bKDlELZ_VkcF_CHQ9ArfOpxVMa0qqp3dThfWWFw>
    <xme:WbjgZ-mRBxqFgAayvnxhO775GyfGMQbLMuJ0PCoxQfGRoYrhbXNeIf4o9WtFAvf7X
    Y8gybxuBzsP8kuEMoY>
X-ME-Received: <xmr:WbjgZ2bOfGrJSfm4s8Yp9hfZgU7A0t0oZCZllH0EbMm1Y_hhATZKvL6Q1XzFKQSZkuXPsTkB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheekgeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:WbjgZ5XxfndmstQ103gs6YipU6cAU12Hep3KmJVWnE-nu7i-H5Uawg>
    <xmx:WbjgZ8l-uBVlQQmj5P-1VISDwa4saDe4CNLLP4fsjgT938F_eCjCZA>
    <xmx:WbjgZ-ctqbHDngBg8qFslnJiJh9QtabtaH0Q1VDSHpt9M8IocP9LZA>
    <xmx:WbjgZ-Gm17nv31L2GwxgZcSxYYoUWwjlNEG9cAg0RCBFH2b-d2ZVVA>
    <xmx:WrjgZ24cNAHX91OS066CezgpYMOk4ZQDze_pQCBLe1htB_itbE98K1hh>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 21:41:42 -0400 (EDT)
Message-ID: <deeb4946-dd66-4a82-a8f0-5e8b1751899e@ljones.dev>
Date: Mon, 24 Mar 2025 14:41:40 +1300
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
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/25 00:41, Antheas Kapenekakis wrote:
> On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
>>
>> This short series refactors the Ally suspend/resume functionality in the
>> asus-wmi driver along with adding support for ROG Ally MCU version checking.
>>
>> The version checking is then used to toggle the use of older CSEE call hacks
>> that were initially used to combat Ally suspend/wake issues arising from the MCU
>> not clearing a particular flag on resume. ASUS have since corrected this
>> especially for Linux in newer firmware versions.
>>
>> - hid-asus requests the MCU version and displays a warning if the version is
>>    older than the one that fixes the issue.
>> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
>> version is high enough.
>>
>> *Note: In review it was requested by Mario that I try strsep() for parsing
>> the version. I did try this and a few variations but the result was much
>> more code due to having to check more edge cases due to the input being
>> raw bytes. In the end the cleaned up while loop proved more robust.
>>
>> - Changelog:
>>    + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>>      - Adjust warning message to explicitly mention suspend issues
> 
> How did the testing go with this one, especially with mcu_powersave 0?

Appears to be good. Checked a few reboots with powersave off - it is 
setting on as I expect every time. Did modules unload/load also. And 
tested with it set off after boot plus suspend resumes.

Very much hope this is the end of that particular saga, and with 
bazzites help we can hopefully get everyone on November MCU FW or later, 
then finally remove the hack completely this year.

A small side note - I expect ASUS to fully reuse the X hardware, or at 
least the bios/acpi/mcu-fw for that new windows handheld they've doing, 
so fingers crossed that they actually do, and there will be nomore 
suspend issues with current kernels plus this patch.

Cheers,
Luke.

>>      - Use switch/case block to set min_version
>>        - Set min_version to 0 by default and toggle hacks off
>>    + V3
>>      - Remove noise (excess pr_info)
>>      - Use kstrtoint, not kstrtolong
>>      - Use __free(kfree) for allocated mem and drop goto + logging
>>      - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>>      - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>>        correct the message.
>>    + V4
>>      - Change use_ally_mcu_hack var to enum to track init state and
>>        prevent a race condition
>>
>> Luke D. Jones (2):
>>    hid-asus: check ROG Ally MCU version and warn
>>    platform/x86: asus-wmi: Refactor Ally suspend/resume
>>
>>   drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
>>   drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>>   include/linux/platform_data/x86/asus-wmi.h |  19 +++
>>   3 files changed, 222 insertions(+), 41 deletions(-)
>>
>> --
>> 2.49.0
>>


