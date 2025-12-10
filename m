Return-Path: <linux-input+bounces-16520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E09CB1D02
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 04:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D240E30052F3
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 03:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E5E30E849;
	Wed, 10 Dec 2025 03:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="EJOapkb3"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968E224240
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765338231; cv=none; b=e01yZP5CLpQqfNgZo+X61jTbWOCoFgnEyhnynBnGuk8tyjrbyFJH2d3RR7haGGyaCVMGGv9gQRzU+NcsDTJ9/ML1n0WdCm89qWl+SPpt9ax+CDbcprrE8OWI/jQjIjg0XURLaQ+FMWIIzRPK5Z6TvIOMJFxrLKF3HoxrZ+Pdkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765338231; c=relaxed/simple;
	bh=LLOM5zQUVt2qNrzsWhVeeywD/V2iFziEHUkheUH0Wl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNdVXpoJK34+qqYxpF+JZWlu20iCU2spgz1zIRj1cQ8ud7xNPsa9TkD8MhfSVzp3H951+GLJg1LK/J26HFFcLvNTp4Z09gEWCEtHn/3sfbnu/gXrUcTnW7ZjUb7uL5SeP12e+YR9qDqOZTk0Vjb7AxHf3PghBl35AM5bhAmJn/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=EJOapkb3; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1765337878; bh=LLOM5zQUVt2qNrzsWhVeeywD/V2iFziEHUkheUH0Wl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJOapkb3CqNudsUfb84PFH83Khz6POtR1jIYCzL0ii+uXa1ticzRyC9QL8sqUQ9M7
	 iLeSMa1DKGRQUDm8dmzM6n7Kv35c9Gb1W/qhNoB2YT3q0vxPHglHVJdk6PEutxs0b0
	 D63f2vuT+IjOYIntmXabkO4OJ4WCPoLzo9C7138gtFmBN/UNWgI9SYz6OVeR/mVhKb
	 gnaHGvqXa3ylEckAbd3QNXOc68AAIavFkv7xrk1kY9aL/A3zPJBNRoyb4PwwvJPTGl
	 pxMMRMjWLI60QJrjgKki7a89qk4pj43SVFrWsptOGiUsYqLsYxQ43khSiRHCKi6ieR
	 RH/oO8RAqkXOQ==
Received: from [192.168.0.22] (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id 768AFA01D;
	Tue,  9 Dec 2025 19:37:58 -0800 (PST)
Message-ID: <7cf83f8b-d2c1-43e0-9641-1d4dbe525028@endrift.com>
Date: Tue, 9 Dec 2025 19:37:57 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: uinput - Allow uinput_request_submit wait
 interrupting
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-input@vger.kernel.org
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-2-vi@endrift.com> <ZXNvQCFxPoH0-i-P@google.com>
 <b54584c2-9db8-4715-966a-6fdf57fdee1a@endrift.com>
 <853baa9e-1c76-4e61-b1f6-a1155ccb5dd7@endrift.com>
 <Za3pB5_n0udgD4d1@google.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <Za3pB5_n0udgD4d1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

It's been nearly 2 years with no updates on this, so I'm going to press on this some again.

On 1/21/24 8:03 PM, Dmitry Torokhov wrote:
> Hi Vicki,
> 
> On Thu, Dec 14, 2023 at 07:04:09PM -0800, Vicki Pfau wrote:
>> Hi Dmitry
>>
>> On 12/8/23 19:24, Vicki Pfau wrote:
>>> Hi Dmitry,
>>>
>>> On 12/8/23 11:32, Dmitry Torokhov wrote:
>>>> Hi Vicki,
>>>>
>>>> On Wed, Dec 06, 2023 at 10:34:05PM -0800, Vicki Pfau wrote:
>>>>> Currently, uinput_request_submit will only fail if the request wait times out.
>>>>> However, in other places this wait is interruptable, and in this specific
>>>>> location it can lead to issues, such as causing system suspend to hang until
>>>>> the request times out.
>>>>
>>>> Could you please explain how a sleeping process can cause suspend to
>>>> hang?
>>>
>>> While I'm not 100% sure how it happens, given I found this by
>>> reproducing it before I came up with a theory for why it happened,
>>> my guess is that as it's trying to suspend all of userspace
>>> programs, it suspends the process that owns the uinput handle, so it
>>> can't continue to service requests, while the other process hangs in
>>> the uninterruptable call, blocking suspend for 30 seconds until the
>>> call times out.
>>>
>>>>
>>>>> Since the timeout is so long, this can cause the
>>>>> appearance of a total system freeze. Making the wait interruptable resolves
>>>>> this and possibly further issues.
>>>>
>>>> I think you are trying to find a justification too hard and it does not
>>>> make sense, however I agree that allowing to kill the process issuing
>>>> the request without waiting for the timeout to expire if the other side
>>>> is stuck might be desirable.
>>>
>>> This isn't reaching. As I said above, I discovered the patched line
>>> of code *after* observing suspend hanging for 30 seconds while
>>> trying to reproduce another bug. I wrote this patch, retested, and
>>> found that it now suspended immediately, leading to a visible
>>> -ERESTARTSYS in strace on coming back from suspend.
>>>
> 
> I must apologize, you indeed weren't reaching. As far as I can see,
> putting tasks into the freezer (which happens during system suspend) is
> done via delivering a fake signal to the task. So the task indeed needs
> to be in an interruptible state, uninterruptible tasks result in system
> failing to suspend.
> 
>>> I can post the reproduction case somewhere, but the test program is
>>> only the evdev client end, with the uinput side being Steam, which I
>>> don't have source code for.
>>>
>>>>
>>>> I think the best way to use wait_for_completion_killable_timeout()
>>>> so that stray signals do not disturb userspace, but the processes can
>>>> still be terminated.
>>>
>>> There's already a mutex_lock_interruptable in uinput_request_send
>>> that could cause this to fall back to userspace under similar
>>> circumstances. The only difference I can find, which is admittedly a
>>> bug in this patch now that I look at it again, is that
>>> uinput_dev_event would get called twice, leading to the request
>>> getting duplicated.
>>
>> After further investigation, it seems this would still be the case
>> even if the request times out--an invalid request would get left in
>> the buffer, which means that while this is a new way to trigger the
>> issue, it's not actually a new issue.
> 
> No, I disagree that it is the same issue. The timeout condition is
> pretty much fatal, I expect the caller to exit or stop using the device
> if request times out (because either the real device is not responding,
> or userspace is not responding, and there is no indication that they
> will start responding any time soon). That is why the timeout value is
> so generous (30 seconds). In this case we definitely not expect the
> request to be re-submitted, either automatically, or explicitly by
> userspace.
> 
> If we make waiting on the request interruptible we may get interrupted
> by a stray signal, and I do not know how both producer (the process
> issuing the uinput request) and consumer of the request, will react to
> essentially duplicate requests being sent.
> 
> I believe we can split this into 2 separate issues:
> 
> 1. The fact that it is not possible terminate the producer process while
> it is waiting for request to be handled (for 30 seconds). I think this
> can be safely resolved by switching to
> wait_for_completion_killable_timeout(). This will allow fatal signals to
> break the wait, and for the process to exit.
> 
> 2. Producer task failing to enter refrigerator and breaking suspend.
> I wonder if the best way to handle that is for uinput to create and
> register wakeup source, and then use __pm_stay_awake() and __pm_relax()
> to indicate to the rest of the system that suspend is blocked. I believe
> userspace should be able to handle this and repeat suspend attempt when
> the condition clears...
> 
> Rafael, do you have any suggestions here? And I wonder, could we make
> killable tasks also enter refrigerator?
> 
> 
> Also, now that I think about it more, we should not use slot number for
> request->id, as I expect the common situation is to have 1 outstanding
> request, so all requests have id 0. Instead we should have a counter and
> increase it. This way timeout handling will be more robust, we will not
> mistake delayed response to the previous request as response to the
> current one.
> 
> Thanks.
> 

Though it may not be the "best" approach, the patch I posted has been shipping in SteamOS for 2 years with, as far as I'm aware, no issues. For obvious reasons, I don't want to be carrying downstream patches for any longer than necessary, so I'd like to see what needs to be done to get this properly fixed. I don't think I'm really familiar enough with the subsystem to fix it in the desired way, but hopefully Rafael can chime in this time, or someone else who is more familiar can make some progress.

Vicki

