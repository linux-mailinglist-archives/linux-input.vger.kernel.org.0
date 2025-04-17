Return-Path: <linux-input+bounces-11819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF9A91B81
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 14:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0A61682C5
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 12:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2787E23AE7C;
	Thu, 17 Apr 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R25X+7HL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE483233126;
	Thu, 17 Apr 2025 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891361; cv=none; b=dHHOrAjkxswh2Hv2GMa2RmJjK9wX3yh4fTL3d77kzKzqQJM2szU6fbTPpOU05yBIgg3cQDfpmtjepHNJ6snTeISsUMsg8jrSmudyk7ZtRcevM+f/O+B8OGF1CWuknYp2cMtJNB6MsX2dJO4cGVa2DfRG1HXbz86Dz0uh0IkBaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891361; c=relaxed/simple;
	bh=ETJagbOOXP2BonGVzZfEgxqHeNpE2T6R8uNA00WJ9bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvpsFMbjwVQK7n0nyMEPCDG3Z2ggqmFc3E9Nk2lieIbrHiycFg6d0MOHQHarZr4dvLm5Ag7pjLlHhth97iW/LnvMd4FE8pFHqX+tH0T3Lw/9ERkDcqQMpNaAdhjAe3qh1F20Z7HT6PdifL6MjUrPYTooQxr1JLMrXhZ45kTLuEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R25X+7HL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F841C4CEEA;
	Thu, 17 Apr 2025 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744891360;
	bh=ETJagbOOXP2BonGVzZfEgxqHeNpE2T6R8uNA00WJ9bs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R25X+7HLu4h8lsLnxPQH9AUpCHFrjoyZ8ftDZimv3JoeCv7dMeB+8n0yydvjLk+5h
	 HlSj0spgD8M5RFQGhBcQgllBBgSYSTDGl0vZ8l0proq7sIjDZ2npaDSgsM6KhedwnF
	 I3FpxU8NXmGS8FCmqJQJigHzTv3nXhSG8OoLhHD1eddrZlkBgIkAnnAwfXhxRyt7IV
	 zHQdJskUp5us+zItvy2WbIHUQw7pAvz0YqVbZ3/5pJZhLjDVyxqJBYELJRR0tqzf1C
	 /5TR1vyM4vtfPiEqmHlIxoXFz+6/pFUHWO0Cz9FILdXSW8jT3/zYuApQjtVANVZ9Xm
	 1NLVPcNLrM/Cw==
Message-ID: <eb9a50c0-6bbe-4fcb-af30-bfddf6a00619@kernel.org>
Date: Thu, 17 Apr 2025 07:02:38 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250417013722.435751-1-superm1@kernel.org>
 <b9d8244a-df90-4bd2-bfd4-3539b4ad6d5e@redhat.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <b9d8244a-df90-4bd2-bfd4-3539b4ad6d5e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/25 05:48, Hans de Goede wrote:
> Hi Mario,
> 
> On 17-Apr-25 3:37 AM, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>> to lock the screen. Modern hardware [2] also sends this sequence of
>> events for keys with a silkscreen for screen lock.
>>
>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>> emitted by driver to META + L.
>>
>> Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
>> Link: https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166 [2]
>> Suggested-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v3:
>>   * Emulation in the input core instead
>>
>>   drivers/input/Kconfig |  8 ++++++++
>>   drivers/input/input.c | 19 +++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
>> index 88ecdf5218ee9..ffb4163fe315f 100644
>> --- a/drivers/input/Kconfig
>> +++ b/drivers/input/Kconfig
>> @@ -174,6 +174,14 @@ config INPUT_APMPOWER
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called apm-power.
>>   
>> +config INPUT_SCREENLOCK_EMULATION
>> +	bool "Pass KEY_SCREENLOCK as META + L"
>> +	help
>> +	  Say Y here if you want KEY_SCREENLOCK to be passed to userspace as
>> +	  META + L.
>> +
>> +	  If unsure, say Y.
>> +
>>   comment "Input Device Drivers"
>>   
>>   source "drivers/input/keyboard/Kconfig"
>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>> index dfeace85c4710..08a857cea0c5d 100644
>> --- a/drivers/input/input.c
>> +++ b/drivers/input/input.c
>> @@ -370,6 +370,13 @@ void input_handle_event(struct input_dev *dev,
>>   	}
>>   }
>>   
>> +static void handle_screenlock_as_meta_l(struct input_dev *dev, unsigned int type,
>> +					int value)
>> +{
>> +	input_handle_event(dev, type, KEY_LEFTMETA, value);
>> +	input_handle_event(dev, type, KEY_L, value);
>> +}
>> +
>>   /**
>>    * input_event() - report new input event
>>    * @dev: device that generated the event
>> @@ -392,6 +399,12 @@ void input_event(struct input_dev *dev,
>>   {
>>   	if (is_event_supported(type, dev->evbit, EV_MAX)) {
>>   		guard(spinlock_irqsave)(&dev->event_lock);
>> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
>> +		if (code == KEY_SCREENLOCK) {
>> +			handle_screenlock_as_meta_l(dev, type, value);
>> +			return;
>> +		}
>> +#endif
>>   		input_handle_event(dev, type, code, value);
>>   	}
>>   }
>> @@ -2134,6 +2147,12 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
>>   
>>   	switch (type) {
>>   	case EV_KEY:
>> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
>> +		if (code == KEY_SCREENLOCK) {
>> +			__set_bit(KEY_L, dev->keybit);
>> +			__set_bit(KEY_LEFTMETA, dev->keybit);
>> +		}
> 
> Shouldn't there be a "break;" inside the if?
> 
> Since KEY_SCREENLOCK events will never get reported when
> CONFIG_INPUT_SCREENLOCK_EMULATION is set, I think it would
> be netter to not set it in dev->keybit ?
> 
> Regards,

This is something I wasn't sure about.

I was worried there might be other parts of the kernel that check for a 
capability of a specific keycode and conditionalize behavior.

If that isn't a concern yes I could add a break into this block in the 
next version.

> 
> Hans
> 
> 
> 
> 
>> +#endif
>>   		__set_bit(code, dev->keybit);
>>   		break;
>>   
> 


