Return-Path: <linux-input+bounces-12016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9753A9DAD9
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 15:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B099E1BC0AD7
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 13:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C30A3AC1C;
	Sat, 26 Apr 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSiYylpS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4F12B73;
	Sat, 26 Apr 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672416; cv=none; b=At8aoJt8vhSaMMlKEkaLT79RtCSjB0Tcwrs/N1sSWnJ+JcziABCsi7aDtDvZPuz+KTJb+dmOqjnzOHDzj6wImy6Nr/CYGAAPXvR/6hV/L0AYuussT6TtMxSHu6gRd/Ytig7hvwRBgYMWti/9ltQsA/PKbPcpozRRuRmDOy9y2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672416; c=relaxed/simple;
	bh=8lzPKSvLL4xki+UzGTVEQf754K7mp3zBbel/pXCugbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctwCC81eSunxlG3w+20csBbAi/yWm7cfObXsjeIcHbO8rku7eCu2/6bGCTeffnh+i48KsJTLlEOXEq8NCDgPpAL6yKWSveDyyaSjbQ58Iom2OrR+L0dolaLOtSQPW6PXceX29f7VDhfJfumXZMg4YVWjYOAAPFSLRX9cX6SqNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSiYylpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9175FC4CEE2;
	Sat, 26 Apr 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745672414;
	bh=8lzPKSvLL4xki+UzGTVEQf754K7mp3zBbel/pXCugbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SSiYylpSkUnY4vU6FWLD53bdXMb8K4/xbF7keJtMniGrZGt2QiNuvhYRbGDO/HQUN
	 vlYEBODjW3cBYi96AG3GAj90UeBQ1b7HILIdpyE3fL44wJ/DfVgelqT7PbruguU+J9
	 qZ2U865ygnV6yy/ww/ig75AMri4siLaNKsthxbx/+Rl5n1LHdB+CDWY+JUrGd6hNCv
	 K5AGmSzjgDuRNqQjaf2x6Pm1zhIPciPP4aMUdhTJO1ekR8r+ZYxEVMFMS6pZIrBvRM
	 zFvnbjkA+zbB9MLt+ygHX2RpPDJXrHyd/SdOzCg6rcPd4QB6W/RNHhgArjHZuxXLo8
	 ub2zW177r8Nxw==
Message-ID: <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
Date: Sat, 26 Apr 2025 08:00:09 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aAyWFI+o/kU9hDVs@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/26/25 03:15, Pavel Machek wrote:
> On Fri 2025-04-25 11:29:48, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>> to lock the screen. Modern hardware [2] also sends this sequence of
>> events for keys with a silkscreen for screen lock.
>>
>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>> emitted by driver to META + L.
> 
> Fix gnome and kde, do not break kernel...

I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?

That's going to break modern hardware lockscreen keys.  They've all 
obviously moved to META+L because that's what hardware today uses.

That's also what earlier versions of my series tried to change just 
amd-pmf over to use, but Armin Wolf said this should be done in the 
input subsystem for all drivers instead.

> 									Pavel
> 
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
>> index dfeace85c4710..983e3c0f88e5f 100644
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
>> @@ -2134,6 +2147,13 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
>>   
>>   	switch (type) {
>>   	case EV_KEY:
>> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
>> +		if (code == KEY_SCREENLOCK) {
>> +			__set_bit(KEY_L, dev->keybit);
>> +			__set_bit(KEY_LEFTMETA, dev->keybit);
>> +			break;
>> +		}
>> +#endif
>>   		__set_bit(code, dev->keybit);
>>   		break;
>>   
> 


