Return-Path: <linux-input+bounces-14441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1565FB40EFE
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 23:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25EA43B5698
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 21:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF202E9EC9;
	Tue,  2 Sep 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRkn+Or4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F32E7BDF;
	Tue,  2 Sep 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756847110; cv=none; b=n3si7PokGUy1r0o+wS4ip6NW8TVb2Q7Gp6WsYet2J3LLOaVAvw6hoj20P01BkJVmhAp3QsY38NJbgt6Z7O7q7wIBOVGHhVwgNfmkJaR031fG82A/qFVxXKzukSQmUTIPvjoLNnbzVIGs+HJsvaCy8Ct533n5iGytlioCr/Fa5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756847110; c=relaxed/simple;
	bh=WjiAUtQOvsH2qbKA2s3udE/vJGeq936XDWYdFQFYvcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htbfG8clWbfgdqfwLUCwuRYRw5YWo3+dnDOKaM2LExSGTaGIDrNdV1vHAe5Ik0r1V+NclnDB0DCgJfxxQcKTn/+DMg99N+yfNyvXGpKOPjvbLtxYV9z09zC/44pVv2ZRLv9qxriNn1nH73tZ09xyb4FxpfacXqC5ZzP/AAYMFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRkn+Or4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DB9C4CEED;
	Tue,  2 Sep 2025 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756847109;
	bh=WjiAUtQOvsH2qbKA2s3udE/vJGeq936XDWYdFQFYvcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MRkn+Or4h5vSaoc8kgJJZxOd01MMQtXJdlNPFtvfpam78OFAwZ/1/qa68zZmj22Gb
	 nGI05LBWnJ6YWYdIAH5ejuIAVZkD+tt4YrR5AqJSRTbYhTmH2dF3GTBUWrubRObIJh
	 Rqb/La23wuKcNSA2Z8eLF3OQAehienYD0V9VkptteXNC6E4FhOrtDSd7kkQ0g+Vpc4
	 O306EAeZyc1PIuQM5UV0xxq+eX2m5Bc+wWFpkvGjjYRdncsQ8RD7lhWc9+AUCCC1bv
	 xcmxmLfTHbcTQPtf3oyYmcQ1F2JJl5eZDXeYUvUgaabIV22o8VDLt9cs0Q8ASzOLEf
	 btllMZVTAqIcQ==
Message-ID: <9c47d260-b51e-4ad0-80b5-fc735b48c894@kernel.org>
Date: Tue, 2 Sep 2025 23:05:06 +0200
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
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLdWZJwSrpvgXPFL@ewhac.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aLdWZJwSrpvgXPFL@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Sep-25 22:41, Leo L. Schwab wrote:
> 	Didn't directly receive the intermediate reply:
> 
> On Tue, Sep 02, 2025 at 11:14:09AM +0200, Hans de Goede wrote:
>> On 2-Sep-25 11:07 AM, Hans de Goede wrote:
>>> Ah I see. Yes if you do need to do a CONFIG check then using IS_ENABLED()
>>> is good.
>>>
>>> But I'm afraid that the underlying problem here is the use of
>>> cdev.brightness_hw_changed this is really only meant for led-class.c
>>> internal use.
>>>
> 	Then there should be a comment in the include file to that effect.
> 
>>> The idea of cdev.brightness_hw_changed is that it stores the last
>>> value set by the hw.
>>>
>>> But in the mean time that value may have been overwritten by software.
>>>
>>> I think that you will fail to call led_classdev_notify_brightness_hw_changed()
>>> (you can add a debug print to check) if the following happens:
>>>
>>> 1. Brightness set to 255 (RGB 255,255,255) through sysfs
>>> 2. State toggled to off by backlight control button, brightness is now 0
>>> 3. Brightness set to 255 (RGB 255,255,255) through sysfs
>>> 4. State toggled to off by backlight control button, brightness is now 0
>>>
> 	This does not happen.  The G13 accepts and remembers backlight color
> settings even when the LEDs have been toggled off locally.
> 
> ```
> #### Initial state: Backlight on, full green:
> root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
> 255
> 255
> 0 255 0
> root:/sys/class/leds/g13:rgb:kbd_backlight# echo 255 0 0 > multi_intensity 
> #### Backlight is on, full red.
> root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
> 255
> 255
> 255 0 0
> #### Backlight toggle button pressed; backlight is now off.
> root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
> 255
> 0
> 255 0 0
> root:/sys/class/leds/g13:rgb:kbd_backlight# echo 0 0 255 > multi_intensity 
> #### Backlight color set to full blue, but is still off.
> root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
> 255
> 0
> 0 0 255
> #### Backlight toggle button pressed; backlight is now on, and blue.
> root:/sys/class/leds/g13:rgb:kbd_backlight# cat brightness brightness_hw_changed multi_intensity 
> 255
> 255
> 0 0 255
> ```
> 
> 	This also works if you alter `brightness` while the backlight is
> toggled off.  IMHO, this is correct, principle-of-least-surprise behavior.

I see, interesting.

So what happens if you turn off the backlight with the toggle button on the G13
and then write 0 to brightness in sysfs and then press the toggle button again?

> 	Further (at least on my machine), `brightness_hw_changed` is
> read-only in sysfs, and therefore can't be altered by host software.
> Therefore, it would seem that using `cdev.brightness_hw_changed` as a cache
> value is valid.

Right it does seem that using cdev.brightness_hw_changed is valid in
this case.

But the LED API is supposed to have the brightness attribute present
the actual current brightness of the device.

I'm not sure how upower will react if the poll() on brightness_hw_changed
wakes upower up and then the reported brightness is unchanged...

I need to think about this a bit and check the upower code, let me
get back to you on this in a day or 2 ...

>>> I also see that you use TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF
>>> for the brightness value send to led_classdev_notify_brightness_hw_changed()
>>> but I would expect the hw to restore the previous brightness on a toggle
>>> from off -> on through the button? So then that should be send.
>>>
>>> And you also never update cdev.brightness and use the cached 
>>> struct lg_g15_led.brightness in lg_g13_kbd_led_get(). This means that
>>> after a hw toggle of the backlight reading the brightness from sysfs
>>> will show the wrong (old) value.
>>>
> 	This prompts the question:  What is the full intensity calculation
> formula intended to be?  The docs appear to be rather quiet on this point.
> If we assume all intensity/brightness values (0-255) are essentially mapped
> to the range [0.0, 1.0], then it seems to me the calculation is:
> 
> 	out = intensity * brightness * brightness_hw_changed

The way the API is intended to work is that after a hw-brightness-changes
event brightness == brightness_hw_changed in sysfs.

brightness_hw_changed only purpose is to cache the last hw set value so
that if userspace writing a new value to brightness races with
a brightness_hw_changed event a userspace process listening can still
read which value the hw actually send. TBH this is of little value to
userspace but the LED subsys maintainer insisted on this.

IOW the formula should always be:

 	out = intensity * brightness

The problem is that in the G13 case the real formula is:

 	out = intensity * brightness * internal-g13-toggle-bool

And there is no standard userspace API for how to deal with
the device having an internal-g13-toggle-bool

The G510 has something similar which is why I left out
brightness_hw_changed event generation in the G510 code.

As mentioned before I need to think a bit about how to handle
this. I have an idea howto handle this and I can try and
prototype this on the G510 which has more or less the same
problem, except that it simply throws away brightness writes
while toggled off with the button.


> 
>>> I think that instead what you need to do is create a
>>> lg_g13_leds_changed_work() mirroring lg_g15_leds_changed_work()
> 
> 	I dissent.  But then it's entirely possible I'm still missing
> something...
> 
> 	The only edge case I'm immediately aware of is:
> 
> 	* Plug in G13.
> 	* Toggle backlight off.
> 	* Unload kernel module.
> 	* Reload kernel module.
> 
> 	The backlight is now toggled off, but the newly loaded driver
> doesn't know this.  Attempting to read `brightness_hw_changed` from sysfs at
> this point will result in ENODATA (essentially reporting, "I don't know").
> AFAIK, there is no way to probe the G13 for the current state of the
> backlight HW toggle.  However, the moment the user generates any event on
> the G13, the correct state will be obtained, and `brightness_hw_changed`
> will be updated accordingly.  Not ideal, but seemed the most honest
> approach.

Ack.

Regards,

Hans


