Return-Path: <linux-input+bounces-11813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5576A90D5C
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 22:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B7C57AF529
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 20:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53691234966;
	Wed, 16 Apr 2025 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rC7K6Xcb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E4233703;
	Wed, 16 Apr 2025 20:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836209; cv=none; b=usH/7NFnzmjE38oDw5nM3sCA+Ww+KmZLLW2ZmSHyJcttq8OYWfNTgRmp4CbQ4AScOWUQBZ2wQ4pHUVPM4GoK+8mQ1gAqr87z75YQ69shdTTGFBqZdBkbwaI4bBjhgcW9epg3AQ+Zj1gWs2xhQ+OfKw7jNfkf7nTnev6BGRIVd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836209; c=relaxed/simple;
	bh=zGeasa8yh7TvL+Z6S1rNVwaaw7P4CJofVtkAXYnoLEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bH8zPoxk8dwRw5UVCDGesdcoEa2dOdv1ijwyV4IauCLgvsxAEqppJYr/GFRzkCr1WJAW8xTyWvCD8Ia6VEUcJEtZdzyon1Y5PTUumKX400UHQCFtBuXmOxFAmHj6pcCNZ81dTJZ4a+LyeozJwyC5yN7Lz0OO89iyszEy3WUQBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rC7K6Xcb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6174C4CEE2;
	Wed, 16 Apr 2025 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744836208;
	bh=zGeasa8yh7TvL+Z6S1rNVwaaw7P4CJofVtkAXYnoLEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rC7K6XcbqNZ0sN7Ne2A7xHznlA+3Wx12X2gxBPa6ehrmVn/jrs5GZhykP79z7qhNo
	 Rysqfp6vu14R69UW6g8gtQI9TRloKf4ZAn+KZk7j+LS/Nff8NHrboSTtW4+gcDX5vW
	 HRskFbvS+5u0xlKoXHBhmxxyeK9DD6aOMjmy1j4dHqO1RcFPbmFYq3WDuXL/hArv33
	 UM3EotzAPJCoW+kyKVVBzvZ7gvYoWGxmOhfXSRynnv8aDuoI1cmdgFpAsJCyhj0whS
	 w1EIPIuzgdzkHq15rqwqyNXyFUH5k2yIll0dio4bpJsxLFk7j4RmUvhuyW66Nsk+9e
	 PyaxDYBLXjZww==
Message-ID: <cebf59f2-5d81-41f9-8c4f-d51fcb514f86@kernel.org>
Date: Wed, 16 Apr 2025 15:43:26 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: Add a helper for reporting a screen lock key
 sequence
To: Armin Wolf <W_Armin@gmx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250407152705.1222469-1-superm1@kernel.org>
 <7bb43fb5-83dd-4531-b835-77a8e937f54b@gmx.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <7bb43fb5-83dd-4531-b835-77a8e937f54b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/2025 3:39 PM, Armin Wolf wrote:
> Am 07.04.25 um 17:27 schrieb Mario Limonciello:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>> to lock the screen. Modern hardware [2] also sends this sequence of
>> events for keys with a silkscreen for screen lock.
>>
>> Introduced a helper input_report_lock_sequence() for drivers to utilize
>> if they want to send this sequence.
>>
>> Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts- 
>> in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
>> Link: https://www.logitech.com/en-us/shop/p/k860-split- 
>> ergonomic.920-009166 [2]
>> Suggested-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/input/input.c | 20 ++++++++++++++++++++
>>   include/linux/input.h |  2 ++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>> index ec4346f20efdd..dfeace85c4710 100644
>> --- a/drivers/input/input.c
>> +++ b/drivers/input/input.c
>> @@ -508,6 +508,26 @@ void input_copy_abs(struct input_dev *dst, 
>> unsigned int dst_axis,
>>   }
>>   EXPORT_SYMBOL(input_copy_abs);
>> +/**
>> + * input_report_lock_sequence - Report key combination to lock the 
>> screen
>> + * @dev: input device
>> + *
>> + * Key combination used in the PC industry since Windows 7 for 
>> locking display
>> + * is META + L. This is also used in GNOME and KDE by default.
>> + * See https://support.microsoft.com/en-us/windows/keyboard- 
>> shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
>> + */
> 
> Hi,
> 
> maybe it would make more sense to have the input subsystem transparently 
> translate between KEY_SCREENLOCK and this
> special screen lock sequence. This way there would be no room for 
> regressions as people could enable/disable this
> behavior via Kconfig.

Wouldn't all drivers that emit KEY_SCREENLOCK still need to be modified 
to have support to emit KEY_LEFTMETA and KEY_L?

Wouldn't that mean conditional code in every single driver based on the 
Kconfig?

Is that worth it?

> 
> Thanks,
> Armin Wolf
> 
>> +void input_report_lock_sequence(struct input_dev *dev)
>> +{
>> +    input_report_key(dev, KEY_LEFTMETA, 1);
>> +    input_report_key(dev, KEY_L, 1);
>> +    input_sync(dev);
>> +    input_report_key(dev, KEY_L, 0);
>> +    input_sync(dev);
>> +    input_report_key(dev, KEY_LEFTMETA, 0);
>> +    input_sync(dev);
>> +}
>> +EXPORT_SYMBOL(input_report_lock_sequence);
>> +
>>   /**
>>    * input_grab_device - grabs device for exclusive use
>>    * @handle: input handle that wants to own the device
>> diff --git a/include/linux/input.h b/include/linux/input.h
>> index 7d7cb0593a63e..16f7bef12f1c1 100644
>> --- a/include/linux/input.h
>> +++ b/include/linux/input.h
>> @@ -492,6 +492,8 @@ void input_set_abs_params(struct input_dev *dev, 
>> unsigned int axis,
>>   void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
>>               const struct input_dev *src, unsigned int src_axis);
>> +void input_report_lock_sequence(struct input_dev *dev);
>> +
>>   #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)            \
>>   static inline int input_abs_get_##_suffix(struct input_dev *dev,    \
>>                         unsigned int axis)        \


