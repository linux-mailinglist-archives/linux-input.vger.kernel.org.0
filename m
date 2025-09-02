Return-Path: <linux-input+bounces-14414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B3B3F9AD
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 11:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C5C2C1D49
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9523A2EA177;
	Tue,  2 Sep 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOEAKkDf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC72EA16B;
	Tue,  2 Sep 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804034; cv=none; b=ek0SIxcR3jcWx+W/5N7eKItXMLNwwKX1pO0/rGN/9OiviDa3gC/N5hXRK6eovIX+Au1dpgnMREtMzmGtWcb4M3zftI6i9qLhmWCmMiOJTsGHEyY7CRY4+ujBH84uHNojY8E7h3gpU9I5irVt2ESdYCGH7KFAa+eOBPvPWADFSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804034; c=relaxed/simple;
	bh=ZYRQa0YnrQ1tkdfC4xKAVpYoUYvsrm1DUXpkbU4CdBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niFbW3AsQdGj4w5j59+xdwlGxGEmNBcPtT8qFfDLyOEF5jzpHlsUxhXY0Mk6gSCxUTWTv9R+wqnpJqDnxMurI9rc3Jok5JR/QPl1KtbKNXbkpPsiHzY9I6epOp6kuDSk2Ghb674vCZi2nGJ0qb4zVjKVpa8h1aUVwMHhCe3L1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOEAKkDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972B6C4CEED;
	Tue,  2 Sep 2025 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756804032;
	bh=ZYRQa0YnrQ1tkdfC4xKAVpYoUYvsrm1DUXpkbU4CdBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sOEAKkDfSpO5fved75NyfU7q4l3NA/8TF9Y6HEaqHL3G8PE7/VW4l29cbkg0NmVOm
	 YkK+MuAX6UOFlRw8OFCMR559x8K9QQmC7h3hYRGr4K5CzcASo+D6Gvqt8RFMeKJUh1
	 JS9AoIFBycxbz1BOJHYCwI6M3kXWn+ZanI/bTFZQHPWesazfD5qfMdLJ/WJmPq37Lw
	 yb4nFZk93NhOtaau9cGvMYWkFylP27T6RyzhICxx1bk97A8bR90Daulv7PEdCEVhxg
	 hLKzzdQv4+gbmppM9GxN2sHWI4TPROgXQzPy/ce5mqFwoiIBwuhdXuZJBk+fCTEgmS
	 uujK58JBll6MA==
Message-ID: <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
Date: Tue, 2 Sep 2025 11:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aLSntMknSv3lMarZ@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leo,

On 31-Aug-25 9:51 PM, Leo L. Schwab wrote:
> On Sun, Aug 31, 2025 at 03:01:12PM +0200, Hans de Goede wrote:
>>> +static const u16 g13_keys_for_bits_js[] = {
>>> +	/* Joystick buttons */
>>> +	/* These keybits are at bit indices 33, 34, and 35. */
>>> +	BTN_BASE,	/* Left side */
>>> +	BTN_BASE2,	/* Bottom side */
>>> +	BTN_THUMB,	/* Stick depress */
>>> +};
>>
>> You are using this 33 offset hardcoded below, maybe
>> at a #define for this, e.g. :
>>
>> #define G13_JS_KEYBITS_OFFSET	33
>>
> 	Noted.
> 
>> g13_keys_for_bits_js[] is contiguous so no need
>> for this if (g13_keys_for_bits_js[i]) test.
>>
> 	Noted.
> 
>>> +	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
>>
>> I do not believe that this IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)
>> is necessary, led_classdev_notify_brightness_hw_changed() has a static
>> inline replacement when CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set,
>> so you can just call it unconditionally.
>>
>> This is already called unconditionally in other places of the code.
>>
> 	I was actually bit by this in the first two revs by the build bot.
> If CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not enabled, the field
> `cdev.brightness_hw_changed`, referenced a bit further down, does not exist,
> and causes a build failure.
> 
> 	My first attempt at #ifdef-ing around it led to another build bot
> warning about `hw_brightness_changed` being defined but not used.  Then I
> leanred about `IS_ENABLED()`, which is evidently now preferred over `#ifdef
> CONFIG_`, and nicely isolated the whole block, so I went with that.

Ah I see. Yes if you do need to do a CONFIG check then using IS_ENABLED()
is good.

But I'm afraid that the underlying problem here is the use of
cdev.brightness_hw_changed this is really only meant for led-class.c
internal use.

The idea of cdev.brightness_hw_changed is that it stores the last
value set by the hw.

But in the mean time that value may have been overwritten by software.

I think that you will fail to call led_classdev_notify_brightness_hw_changed()
(you can add a debug print to check) if the following happens:

1. Brightness set to 255 (RGB 255,255,255) through sysfs
2. State toggled to off by backlight control button, brightness is now 0
3. Brightness set to 255 (RGB 255,255,255) through sysfs
4. State toggled to off by backlight control button, brightness is now 0

In this case the second hw-button toggle will not call
led_classdev_notify_brightness_hw_changed(), since cdev.brightness_hw_changed
still has the 0 value from last time.

I also see that you use TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF
for the brightness value send to led_classdev_notify_brightness_hw_changed()
but I would expect the hw to restore the previous brightness on a toggle
from off -> on through the button? So then that should be send.

And you also never update cdev.brightness and use the cached 
struct lg_g15_led.brightness in lg_g13_kbd_led_get(). This means that
after a hw toggle of the backlight reading the brightness from sysfs
will show the wrong (old) value.

I think that instead what you need to do is create a
lg_g13_leds_changed_work() mirroring lg_g15_leds_changed_work()
but then only for the leds[0] instead of using the for loops.

Combined with caching the keybit 23 value (1) and then when
keybit 23 changes value queue the work.

This will also allow you to drop the:
	
	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED))

but that is just a side effect. The most important thing here
is to:

1. Correctly update the cached brightness after hitting the toggle button
2. Compare the new brightness against the previous cached brightness to
   determine if led_classdev_notify_brightness_hw_changed() should be called,
   rather then using the possible stale cdev.brightness_hw_changed
3. Pass the actual new brightness to
   led_classdev_notify_brightness_hw_changed() and not LED_FULL.

Note I see that lg_g13_get_leds_state() does 2 USB transfers,
when running from the work we only need to get the backlight
state and not the macro keys state. So either give it a parameter
whether it should update the macro-keys or not; or split it into
2 functions, calling both functions from 
lg_g15_get_initial_led_brightness() and only calling the one
for the backlight from lg_g13_leds_changed_work().

Regards,

Hans



1) You can just init the keybit23 cache at 1 since I think the bl always
starts on, eating the cost of possibly running the work one time too many
on the first key press if the bl was turned off before the driver probes.


