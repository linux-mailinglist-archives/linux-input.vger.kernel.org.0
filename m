Return-Path: <linux-input+bounces-15969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940BC44E22
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 05:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A81DE4E757D
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 04:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4AB533D6;
	Mon, 10 Nov 2025 04:00:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F310C1E50E;
	Mon, 10 Nov 2025 04:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747251; cv=none; b=JJQ8svltEuoHMkIQ1AG5MPMz2QhAElguIxUvrplU8uyRc0qP5rwsTrrntthZbfFztYzcVZSiKyPtqNkoBZH1Dz5kJYhWesEi/o6q+LHVmPP59+EodOlvucgIlaD4sdM0hkMtj2yqbIiTh93j4ji4dqJ7hqhqsFuJiPi6xpHqJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747251; c=relaxed/simple;
	bh=atMFvgtY65VQuY/EkXVgEnl/vnO2b9+d5D/lbVsgpfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5oiJaFOL4RFU+N7SE9ZhNt7sAJg95iVNQQjK/mto+YTv//mkkUKRoafD4oQkKCAjKYz0gZv7koq1bxGf/D2M0ob3+qlINmYSH5trcOA1d+/jrHJoK6Hue6I28hw6Y0T6e26km5FzNLblrrn/AJ2flpUxkLXPPNCDidX2P5iDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id A556421C8272;
	Sun,  9 Nov 2025 20:00:48 -0800 (PST)
Message-ID: <70076b5d-aa2a-4057-834d-881fa25d797e@cosmicgizmosystems.com>
Date: Sun, 9 Nov 2025 20:00:47 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: The-Luga <lugathe2@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org
References: <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <CALvgqECd=EavhXAhhAGang+6+-_yWgBVSaiafMAozVgmZ5VsvA@mail.gmail.com>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <CALvgqECd=EavhXAhhAGang+6+-_yWgBVSaiafMAozVgmZ5VsvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/25 4:56 PM, The-Luga wrote:
>> I wonder if suspend/resume would be a problem. Maybe the device crashes
>> when it attempts to resume?
>> Windows will not suspend this device because it has a Consumer Control
>> application collection.
>>
>> Is there a USB quirk to stop the kernel from suspending the device?
> 
> I tried two parameters independently:
> 
> usbcore.quirks=2d99:a101k
> where k = USB_QUIRK_NO_LPM (device can't handle Link Power Management);
> 
> usbcore.autosuspend=-1
> 
> In both cases, a reboot occurred.
> 
>> Two collections, both vendor unique.
>> Basically HID 'pipes' to transport vendor unique data.
>> We have only seen traces with input report ID 2F so far.
>> If we could get traces of output report ID 2E from Windows running the
>> vendor's software (TempoHub) it might help.
> 
> I don't understand what I should do to capture this data. This is the
> data I captured:
> 
> 1. Wireshark on guest with usbpcap. I selected to capture from newly
> attached drives (this should filter out the mouse, etc.).
> 2. I opened TempoHub.
> 3. I started logging on host with `sudo cat
> /sys/kernel/debug/usb/usbmon/3u > qr30_passthrough_wireshark.log`
> 4. I passed the device through.
> 

OK, The attached trace captured the input and output reports between the
host software and the device. I'll try and find a pattern to the vendor's protocol.
The vendor software only supports Windows and Mac, no claim for Linux support.

If all else fails we might by able to block the behavior by having the kernel ignore 
the second HID interface.

> Every increase/decrease of values are step by step.
> 
> [TempoHub Actions]
> 5. I increased the volume 0 (muted) to 16 (max) with TempoHub.
>  >I will press the physical play/pause button after each action, as it
> may be easier to analyze when seeing this marker(?)
> 6. Decreased the volume from 16 to 0.
>    >play/pause
> 7. Decreased the brightness to 0 from TempoHub and increased it to 100%.
>    >play/pause
> 8. Decreased the brightness from 100 to 0.
>    >play/pause
> 9. Changed my light profile to static color.
>    >play/pause
> 10. Changed back to glittering colors.
>    >play/pause
> 
> [Hardware Actions]
> 11. Increased volume with the knob to 16.
>    >play/pause
> 12. Decreased volume with the knob to 0 (muted).
>    >play/pause
> 13. Increased brightness with the knob until 100 and decreased
> brightness with the knob until 0.
>    >play/pause
> 14. Pressed the RGB profile switcher 2 times.
> 
> I stopped the capture.
> 
> The software has no button. It's a slider for volume and brightness, I
> may have missed some step on the full range because of this.


