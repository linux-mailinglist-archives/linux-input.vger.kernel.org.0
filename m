Return-Path: <linux-input+bounces-14802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646CB7DFA1
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD13F7A3374
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 10:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822052820DA;
	Wed, 17 Sep 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2ttTBwW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1427875C;
	Wed, 17 Sep 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758105222; cv=none; b=qnQtefL3L/k156H++ApaqCSP4i7bFcamOxs1+F2gyX2GIu1bbGDAv7ZIXmNO08Aby5xG1qZpugS/hIwkTkyRrapBgo9HIM9ffJWcUaNv1Nr43RaCcSrCGRuWRh+gNf22LLrYr0wZHphjpgTOCVEMDcP0c3nndezDkMJcknEXLXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758105222; c=relaxed/simple;
	bh=zR8e5ODVjSrwzVSSVXLPmLraedCt8Ylf7vaGoQG0OA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9XcgTQVXZkGJTprroUnHD2Aavj/+Qiuia5IdruWFh+VbZfl9gQT1YoBrazuAyd+4Dc/hReBpY7PdxU8nn2VOoPoczVJmd6aO2lH5KEzUOCSWNTQVFkuaQoHcObxPBsefra1D9PTuaQO50HqrmK+FX0WU7XaLl6AL3jRyyof4IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2ttTBwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AC8C4CEF0;
	Wed, 17 Sep 2025 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758105221;
	bh=zR8e5ODVjSrwzVSSVXLPmLraedCt8Ylf7vaGoQG0OA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2ttTBwWWFlIjwbrOMe7mhW6e8zw60BNGJXPhrKxmLY7OxbePmWFFTOXKrNzUps5p
	 J1B9vDAovgN4oKZ5CxFoz4Sn+61kq+LEaQG/Ure6HNkdoSnRm6tKdZ3pYlDVIKdac7
	 n8yM0w79IVoPcHVO8cP0V+W1rTYHTz9kPTfoA4T7uaC+Ho2nc7HWfaoeC6DVXBmBdf
	 Jix+GTPnWkyK0BdxTOrnWAIIS4hzT1f2RfIbNHFnyC/osWPGgDdrPe4WUseop88tBp
	 Nj1EgyuN560nkQcEP4ATjRcv87kVMFFEoXL36wk7SQmJ3vhYiKxwU2lBoJQsI/VXU/
	 0riuvvyP26PlQ==
Message-ID: <8e2c3560-6cba-4808-8207-ba3e1dd0e661@kernel.org>
Date: Wed, 17 Sep 2025 12:33:36 +0200
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
References: <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
 <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
 <aMG9L2566Hh6b0Kf@ewhac.org>
 <64b1c076-f1f7-45a3-900a-dd52ab50cd4e@kernel.org>
 <aMiQsMtyX9POrXof@ewhac.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aMiQsMtyX9POrXof@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leo,

On 16-Sep-25 00:18, Leo L. Schwab wrote:
> On Wed, Sep 10, 2025 at 09:16:45PM +0200, Hans de Goede wrote:
>> Since the driver writes any new values to the G13 and the G13 accepts
>> those and remembers them even when the backlight is off,
>> the notify() should be passed g15_led->brightness when an
>> off -> on transition happens (and 0 or LED_OFF for the on -> off
>> transition).
>>
>> Since g15_led->brightness gets initialized by reading the actual
>> setting from the G13 at probe time and then gets updated on
>> any successful completion if writing a new brightness value
>> to the G13, it should always reflect the value which the backlight
>> will be set at by the G13 after an off -> on transition.
>>
>> Or am I missing something ?
>>
> 	If I'm understanding you correctly:


> 	You want `brightness` to be copied to `brightness_hw_changed` on
> probe, and on every backlight off->on transition (cool so far).

Just to clarify, there are 2 things here

1: brightness as in the actual rgb/brightness values the backlight will
   be lit with when it is on
2. A backlight_disabled flag to indicate if the backlight is disabled
   in hw by the button on the G13

I would suggest to track those separately by adding a backlight_disabled
(or backlight_enabled) flag to struct lg_g15_data like I do in the
g510 patch I send earlier in the thread.

So wrt copying things on probe() I would copy both the brightness
to g15_led->brightness which is already done in v3 as well as 
use something like:

        ret = hid_hw_raw_request(g15->hdev, LG_G510_INPUT_KBD_BACKLIGHT,
                                 g15->transfer_buf, 2,
                                 HID_INPUT_REPORT, HID_REQ_GET_REPORT);

to get the input-report with the backlight_enabled/disabled flag and
initialize backlight_disabled based on that.

I would not touch mcled.cdev.brightness_hw_changed directly,
not touching this will also avoid the build issues when
support for it is disabled.

Ack to on detecting a backlight off->on transition based on comparing
the input-report bit to the cached backlight_disabled flag pass
the cached g15_led->brightness to notify()

> 	What do you want to happen to `brightness_hw_changed` when
> `brightness` is changed in sysfs while the backlight is on?  As it stands,
> the current behavior is:
> 	* Driver loads and probes; `brightness` and `brightness_hw_changed`
> 	  both set to 255.

Ack, except that as mentioned above I would not touch brightness_hw_changed
and just leave it at -1.

> 	* sysfs `brightness` changed to 128.  `brightness_hw_changed`
> 	  remains at 255.
> 	* Toggle backilght off.  `brightness_hw_changed` changed to 0.
> 	  `brightness` remains at 128.
> 	* Toggle backlight back on.  `brightness_hw_changed` gets a copy of
> 	  `brightness`, and both are now 128.

Ack this is all correct.

> 	This seems inconsistent to me.

This is working as intended / how the API was designed as
Documentation/ABI/testing/sysfs-class-led says:

                Reading this file will return the last brightness level set
                by the hardware, this may be different from the current
                brightness. Reading this file when no hw brightness change
                event has happened will return an ENODATA error.

>  Hence my earlier suggestion that
> `brightness_hw_changed` should track all changes to `brightness`, except
> when the backlight is toggled off.

Then it also would be reporting values coming from sysfs writes,
which it explicitly should not do.

Summarizing in my view the following changes are necessary on v4:

1. Add backlight_disabled (or backlight_enabled) flag to struct lg_g15_data
2. Init that flag from prope()
3. Use that flag on receiving input reports to see if notify()
   should be called
4. Replace the LED_FULL passed to notify() (for off->on)
   with g15_led->brightness

and that is it, with those changes I believe that we should be
good to go.

Regards,

Hans



