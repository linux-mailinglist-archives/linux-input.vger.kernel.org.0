Return-Path: <linux-input+bounces-13928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DFB218EB
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 01:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92780423F95
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 23:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F8E23B611;
	Mon, 11 Aug 2025 23:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="P6bPxZ9i"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67A239E9A
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953265; cv=none; b=asdefhTTsHy28t7ptAvsmTxU0GW5iDHmRv7bCmdIqoonsomolshCws+gz0h6gbJSdCb6s+EnW9C6WAY/DmtyvjHOPMPzD7ClIYqbkuhEu1zTYkrAWeuiIz7eK+wy/1jTE8o2n5Nljl8iCNmLHwmUBO/nSIriLvz0UeYjphmeUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953265; c=relaxed/simple;
	bh=z+D4e6Aozl/oQgKMP0PtGZtHXCoAwBeOuMgV/OxJ6Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwcvLxQ+9j8D6pScWqcyCXtryISrJgeEp273t+NCO9Z5z+Q+/4bxt8Nc24/zNaPzuWHZ+UWoj5pgyTRpiKH3SQlQBZfIg0/ypWvU7X58+Lwid8tUpDZ5znwNrQqWSgqRfWc/+HrAMYKLJGgmskXc1+dMn4lDnlAb9v38yI44/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=P6bPxZ9i; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754953257; bh=z+D4e6Aozl/oQgKMP0PtGZtHXCoAwBeOuMgV/OxJ6Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P6bPxZ9iretZdRKH/39HPDDZpanRMK7Lsd/nav9xIef+trllDEKgfYeALy0r8igGp
	 YgsY/c3y0S1oH9AnJNMdb9JytsNv1zLYPQnCQla6BkOq1bRUBuwQ0iiXIZhoVYUz+g
	 DTRKAnAdZFnVX4IF7VhXN50FzSpqiVW6p467SEIlOqRgm5eRwXeb1yLnD7hSbfyidW
	 +Alvbr2UyGC2lgcgRv8/dS+hCF/897Kr7aQTTFu2A4DzyBOni35AhCHIRqP1W4MxQb
	 nNncLILvdnsLvC83oZXoqfuGM6AN32UkOn/sunzUmMucRmQjjpTqqfCrG5cQIEAtcQ
	 XoRU+TeVP98Iw==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 4259CA023;
	Mon, 11 Aug 2025 16:00:57 -0700 (PDT)
Message-ID: <ebc9cbba-1dab-4ef2-828f-b0952ad51c4c@endrift.com>
Date: Mon, 11 Aug 2025 16:00:56 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] Input: Add ABS_CLUTCH, HANDBRAKE, and SHIFTER
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
References: <20250808043017.1953101-1-vi@endrift.com>
 <20250808043017.1953101-4-vi@endrift.com>
 <vh75qh4qit5dgq6jfwgdtpuwrjy6znifzmtwt5r6yuu5r5wxqn@5bwy7ygwvybe>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <vh75qh4qit5dgq6jfwgdtpuwrjy6znifzmtwt5r6yuu5r5wxqn@5bwy7ygwvybe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/11/25 3:56 PM, Dmitry Torokhov wrote:
> On Thu, Aug 07, 2025 at 09:30:10PM -0700, Vicki Pfau wrote:
>> Add new absolute axes for racing game controllers
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> ---
>>  drivers/hid/hid-debug.c                | 16 +++++++++-------
>>  include/uapi/linux/input-event-codes.h |  3 +++
>>  2 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
>> index 264eefaed08fb..534df8e4082da 100644
>> --- a/drivers/hid/hid-debug.c
>> +++ b/drivers/hid/hid-debug.c
>> @@ -3505,13 +3505,15 @@ static const char *absolutes[ABS_CNT] = {
>>  	[ABS_RY] = "Ry",		[ABS_RZ] = "Rz",
>>  	[ABS_THROTTLE] = "Throttle",	[ABS_RUDDER] = "Rudder",
>>  	[ABS_WHEEL] = "Wheel",		[ABS_GAS] = "Gas",
>> -	[ABS_BRAKE] = "Brake",		[ABS_HAT0X] = "Hat0X",
>> -	[ABS_HAT0Y] = "Hat0Y",		[ABS_HAT1X] = "Hat1X",
>> -	[ABS_HAT1Y] = "Hat1Y",		[ABS_HAT2X] = "Hat2X",
>> -	[ABS_HAT2Y] = "Hat2Y",		[ABS_HAT3X] = "Hat3X",
>> -	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
>> -	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
>> -	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
>> +	[ABS_BRAKE] = "Brake",		[ABS_CLUTCH] = "Clutch",
>> +	[ABS_HANDBRAKE] = "Handbrake",	[ABS_SHIFTER] = "Shifter",
>> +	[ABS_HAT0X] = "Hat0X",		[ABS_HAT0Y] = "Hat0Y",
>> +	[ABS_HAT1X] = "Hat1X",		[ABS_HAT1Y] = "Hat1Y",
>> +	[ABS_HAT2X] = "Hat2X",		[ABS_HAT2Y] = "Hat2Y",
>> +	[ABS_HAT3X] = "Hat3X",		[ABS_HAT3Y] = "Hat3Y",
>> +	[ABS_PRESSURE] = "Pressure",	[ABS_DISTANCE] = "Distance",
>> +	[ABS_TILT_X] = "XTilt",		[ABS_TILT_Y] = "YTilt",
>> +	[ABS_TOOL_WIDTH] = "ToolWidth",
>>  	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
>>  	[ABS_MISC] = "Misc",
>>  	[ABS_MT_SLOT] = "MTSlot",
>> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
>> index 08cb157ab5936..195139e895ffb 100644
>> --- a/include/uapi/linux/input-event-codes.h
>> +++ b/include/uapi/linux/input-event-codes.h
>> @@ -859,6 +859,9 @@
>>  #define ABS_WHEEL		0x08
>>  #define ABS_GAS			0x09
>>  #define ABS_BRAKE		0x0a
>> +#define ABS_CLUTCH		0x0b
>> +#define ABS_HANDBRAKE		0x0c
>> +#define ABS_SHIFTER		0x0d
> 
> We have BTN_GEAR_UP and BTN_GEAR_DOWN, can they be used?

The controller reports absolute values, not relative. If it were relative, BTN_GEAR_UP and BTN_GEAR_DOWN might make sense.

That said, I've been rethinking how to do mapping on both the wheel and flight stick, so I'm probably going go back to the drawing board on those. Feedback would still be nice, but I think the only one of these that might be mergeable as is is patch 1 (patch 2 was made against 6.16 by accident and does not apply to master). The shifter on Windows presents as individual buttons, one per gear, which is weird...but it's what games expect. Likewise, the dial presents as two buttons for the two relative values. I thought these methods were nonsensical (and I still do), but for compatibility reasons it might be better.

> 
> Thanks.
> 

