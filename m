Return-Path: <linux-input+bounces-14599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FCB520B5
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 21:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 733467AFC01
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 19:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19172C21EC;
	Wed, 10 Sep 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="li505z6B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99E329F2F;
	Wed, 10 Sep 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757531809; cv=none; b=AQQEFpjLKNlylMoyIfH/ODvLh13e+InSCqJM3qqL16hJeRRfMEXoAFnGFYC2Xz1gPtmWYtvACkcNi5WvvkOlFExL0t2/waPTqKWL4MONrWieaMKWX6hEPJTbSJukDP2pUOYRURmr2c4kVItUlOhBo2rhkkkiMFIdROEHY7uVKFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757531809; c=relaxed/simple;
	bh=Moefi023Ws5A7Bv62poU5i9xTPbdBuLZmpnKSR+M8C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcUgJ7xsNG1sHDqnOVjUGNXqZt09cFw/pd4y1O1B4uPOUmC0LVZ1+1FV9c+mBNvDvO7hJ63vy54aFUsiUQbnCbJvdrq149PnHK8x7DOOun7yKVB6pRLRUCgzZVBGj1ns7kARjmZyXKcimlqwDKWTwmPTSiAIRBWpOulXU4KmNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=li505z6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9321C4CEEB;
	Wed, 10 Sep 2025 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757531809;
	bh=Moefi023Ws5A7Bv62poU5i9xTPbdBuLZmpnKSR+M8C0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=li505z6Bv6uolw3OkkelKIUxjyz4sncVNqFCUNjPgIDQXoBsfATYAk39AdGyAn+Ov
	 O/PyJ3FXr0jmXGS4poqWUcy78GFzEQWyNe3osnu2oWdmvaDruiA0PZ0jWw8T9QddcC
	 4qbByWFolvb1KUUf9ASqg191dVcrGxds+NYRtj5+386IsiKa77bmuWI3qxZLMitSvb
	 SN7EyCd75lUDGyJbBY9+iNPyobOAf+WdxRjhuPz7P30NYMxOZDwTdq6QZehZZBCpUn
	 KojRPSSwqzUgdKaxPF3y+Lwjo4zMIu8zXyZXtcaX0uxIyROXFrGlvNvtVUTGUXZwGF
	 YQCUBAQd+Jbrg==
Message-ID: <64b1c076-f1f7-45a3-900a-dd52ab50cd4e@kernel.org>
Date: Wed, 10 Sep 2025 21:16:45 +0200
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
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
 <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
 <aMG9L2566Hh6b0Kf@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aMG9L2566Hh6b0Kf@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Sep-25 8:02 PM, Leo L. Schwab wrote:
> On Wed, Sep 10, 2025 at 01:09:10PM +0200, Hans de Goede wrote:
>> On 10-Sep-25 7:52 AM, Leo L. Schwab wrote:
>>> On Mon, Sep 08, 2025 at 11:08:29PM +0200, Hans de Goede wrote:
>>>> There are 2 improvements which I would like to see:
>>>>
>>>> 1. When the backlight is turned on through the button, you
>>>> should pass g15_led->brightness to the notify() call rather
>>>> then LED_FULL. GNOME will show an OSD with the new brightness
>>>> value shown as a mini progress bar similar to how it shows
>>>> speaker volume when doing mute/unmute. This mini progress
>>>> bar should show the actual brightness being restored, not
>>>> always full brightness.
>>>>
>>> 	If g15_led->brightness is subsequently changed, should a new
>>> notify() call also be made with that new brightness, i.e. should
>>> `hw_brightness_changed` be made to track `brightness`?
>>
>> No, hw_brightness_changed only track changes done independently
>> by the hw. sysfs writes should not call notify().
>>
> 	Erm...  So brightness_hw_changed should only sample
> g15_led->brightness on first probe?
> 
> 	What should happen in this case:
> 
> 	* Driver loads, probes G13 backlight's current color, calculates
> 	  brightness to be 50, sets both `brightness` and
> 	  `brightness_hw_changed` sysfs values to 50.
> 	* User presses toggle key; backlight is now off.
> 	  `brightness_hw_changed` now set to 0.
> 	  `brightness` and RGB values remain unchanged.
> 	* User writes to `brightness` sysfs value, setting it to 255.  This
> 	  does *not* turn the backlight back on; `hw_brightness_changed`
> 	  remains unchanged.
> 	* User presses toggle key; backlight is back on, showing the
> 	  original color, but brighter.
> 
> 	What should brightness_hw_changed be updated to, if anything?

Since the driver writes any new values to the G13 and the G13 accepts
those and remembers them even when the backlight is off,
the notify() should be passed g15_led->brightness when an
off -> on transition happens (and 0 or LED_OFF for the on -> off
transition).

Since g15_led->brightness gets initialized by reading the actual
setting from the G13 at probe time and then gets updated on
any successful completion if writing a new brightness value
to the G13, it should always reflect the value which the backlight
will be set at by the G13 after an off -> on transition.

Or am I missing something ?

In case of your example step above then the notify() should
be passed 255 as brightness and that should also be the value
in g15_led->brightness since g15_led->brightness gets set
to the brightness send to the G13 hw on a successful setting
of the report, right ?

Regards,

Hans



