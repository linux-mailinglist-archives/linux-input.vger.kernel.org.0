Return-Path: <linux-input+bounces-14415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67258B3F9ED
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 11:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C298D1A813B5
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 09:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1FE20E6E1;
	Tue,  2 Sep 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwuKd8GO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EF17A2E6;
	Tue,  2 Sep 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804452; cv=none; b=g5BfB5qvN9hsuo0L6jx/309E1z6xFei7he8BklKfT1t5GfxrLcEUS2bDyHvXhX+4fb0NgVtrbLYCq0O67nEpCy3myayf/QRqntI7ik/cRgrswVWwAVNmXYEPs3/IEKMb6jn3OLc/jaVOrqV1OPC7mhRrvmVZvJtM8adEGzd5SmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804452; c=relaxed/simple;
	bh=fyASv9DDlEreOAJ7ggTKbN4f6xVspjzit+/ZqWOGsaQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tLd8Yyktm61IPghv3zFtQY/4NrOIPsAlB032vYZuzXXc+olD8luQURrZouAQRoDPq8Y0tQKfKGE26BtrDjMWan25Wg0i7qsOfRDs6Lha6FvZctCie3d8dPWsV29OOmUuSprkCrzlrwa45cDoe2RgivyFK/uUy6MtdVptH0eBxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwuKd8GO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF3DC4CEF5;
	Tue,  2 Sep 2025 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756804452;
	bh=fyASv9DDlEreOAJ7ggTKbN4f6xVspjzit+/ZqWOGsaQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JwuKd8GO/DHHV78zca9wV9Wr8qIWpyabzyAvO5PhIuAHMuWXOhyYJq6L/vE1Co0rH
	 EWhM+jRX/OaF2ppxZbwBIGdlGMqSjmqczVfYyZcoSQ+jD56Fi1duQsQAVQbhrx/KkQ
	 dvtKrr4q8adNOdYUqZxd9JTVGMF/f1SfxH+Co57v2Pe5XKCDaysvOai5EgKZDil6JK
	 XQXMWBXEKdn3YoucH+HcBy4vm/XFnG6aPf4QyaobMvkBRsoI36HBvATE9aueOpWnAY
	 zcuMSMrZuwZmHUDHv0jv5seX2gRvQ9tTkjBzu5ScHt1rmASvblKNsUqAMzgKLAAqBM
	 p5M5ccxUtorxQ==
Message-ID: <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
Date: Tue, 2 Sep 2025 11:14:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
From: Hans de Goede <hansg@kernel.org>
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2-Sep-25 11:07 AM, Hans de Goede wrote:
> Hi Leo,
> 
> On 31-Aug-25 9:51 PM, Leo L. Schwab wrote:
>> On Sun, Aug 31, 2025 at 03:01:12PM +0200, Hans de Goede wrote:
>>>> +static const u16 g13_keys_for_bits_js[] = {
>>>> +	/* Joystick buttons */
>>>> +	/* These keybits are at bit indices 33, 34, and 35. */
>>>> +	BTN_BASE,	/* Left side */
>>>> +	BTN_BASE2,	/* Bottom side */
>>>> +	BTN_THUMB,	/* Stick depress */
>>>> +};
>>>
>>> You are using this 33 offset hardcoded below, maybe
>>> at a #define for this, e.g. :
>>>
>>> #define G13_JS_KEYBITS_OFFSET	33
>>>
>> 	Noted.
>>
>>> g13_keys_for_bits_js[] is contiguous so no need
>>> for this if (g13_keys_for_bits_js[i]) test.
>>>
>> 	Noted.
>>
>>>> +	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
>>>
>>> I do not believe that this IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)
>>> is necessary, led_classdev_notify_brightness_hw_changed() has a static
>>> inline replacement when CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set,
>>> so you can just call it unconditionally.
>>>
>>> This is already called unconditionally in other places of the code.
>>>
>> 	I was actually bit by this in the first two revs by the build bot.
>> If CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not enabled, the field
>> `cdev.brightness_hw_changed`, referenced a bit further down, does not exist,
>> and causes a build failure.
>>
>> 	My first attempt at #ifdef-ing around it led to another build bot
>> warning about `hw_brightness_changed` being defined but not used.  Then I
>> leanred about `IS_ENABLED()`, which is evidently now preferred over `#ifdef
>> CONFIG_`, and nicely isolated the whole block, so I went with that.
> 
> Ah I see. Yes if you do need to do a CONFIG check then using IS_ENABLED()
> is good.
> 
> But I'm afraid that the underlying problem here is the use of
> cdev.brightness_hw_changed this is really only meant for led-class.c
> internal use.
> 
> The idea of cdev.brightness_hw_changed is that it stores the last
> value set by the hw.
> 
> But in the mean time that value may have been overwritten by software.
> 
> I think that you will fail to call led_classdev_notify_brightness_hw_changed()
> (you can add a debug print to check) if the following happens:
> 
> 1. Brightness set to 255 (RGB 255,255,255) through sysfs
> 2. State toggled to off by backlight control button, brightness is now 0
> 3. Brightness set to 255 (RGB 255,255,255) through sysfs
> 4. State toggled to off by backlight control button, brightness is now 0
> 
> In this case the second hw-button toggle will not call
> led_classdev_notify_brightness_hw_changed(), since cdev.brightness_hw_changed
> still has the 0 value from last time.
> 
> I also see that you use TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF
> for the brightness value send to led_classdev_notify_brightness_hw_changed()
> but I would expect the hw to restore the previous brightness on a toggle
> from off -> on through the button? So then that should be send.
> 
> And you also never update cdev.brightness and use the cached 
> struct lg_g15_led.brightness in lg_g13_kbd_led_get(). This means that
> after a hw toggle of the backlight reading the brightness from sysfs
> will show the wrong (old) value.
> 
> I think that instead what you need to do is create a
> lg_g13_leds_changed_work() mirroring lg_g15_leds_changed_work()
> but then only for the leds[0] instead of using the for loops.
> 
> Combined with caching the keybit 23 value (1) and then when
> keybit 23 changes value queue the work.
> 
> This will also allow you to drop the:
> 	
> 	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED))
> 
> but that is just a side effect. The most important thing here
> is to:
> 
> 1. Correctly update the cached brightness after hitting the toggle button
> 2. Compare the new brightness against the previous cached brightness to
>    determine if led_classdev_notify_brightness_hw_changed() should be called,
>    rather then using the possible stale cdev.brightness_hw_changed
> 3. Pass the actual new brightness to
>    led_classdev_notify_brightness_hw_changed() and not LED_FULL.
> 
> Note I see that lg_g13_get_leds_state() does 2 USB transfers,
> when running from the work we only need to get the backlight
> state and not the macro keys state. So either give it a parameter
> whether it should update the macro-keys or not; or split it into
> 2 functions, calling both functions from 
> lg_g15_get_initial_led_brightness() and only calling the one
> for the backlight from lg_g13_leds_changed_work().
> 
> Regards,
> 
> Hans
> 
> 
> 
> 1) You can just init the keybit23 cache at 1 since I think the bl always
> starts on, eating the cost of possibly running the work one time too many
> on the first key press if the bl was turned off before the driver probes.

p.s.

Hmm, I wonder if this device is maybe more like the G510, where
once the BL is turned off it simply ignores any updates send
from the PC? See lg_g510_leds_event() where we restore the cached
values when the bl is toggled on so that any changes done in sysfs
get applied when the bl is turned back on through the button on
the keyboard. In this G510 case no brightness_hw_changed events
are send. Although I'm not entirely sure why, we could still do
that and get notifications on the on/off press.



