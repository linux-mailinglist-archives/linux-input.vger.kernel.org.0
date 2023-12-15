Return-Path: <linux-input+bounces-795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C1814070
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 04:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7240B21261
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 03:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C83B1FBC;
	Fri, 15 Dec 2023 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="ohaj/X9b"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E91C16
	for <linux-input@vger.kernel.org>; Fri, 15 Dec 2023 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id A3F3CA080;
	Thu, 14 Dec 2023 19:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1702609450; bh=PVBORfjY2c8XtNxI7uHAmVZ1Y/kqc9LsOB6107UNxU8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ohaj/X9bveAQBp8jg2L+IC3W5+i2G7e0uy2ph+wL3tmNoNfM1E8T2T73gkVo1GFby
	 9ECVRLdVv9+aWG7ew6euIhKGOrx9tRdP2Vjk1uXRZNXraw33rsxsKjmgNpRYSWPlRc
	 m3sYI39kZ7ryaL+t6lx7z7cdR8AZcGVKcUW52Cwb1ajuzYNJp9z9QcbvcMbk8w3OOt
	 ZWW0CFHGjhnSwidGSUQMCpLkYU1TdgctHhKo8YmxAS9pv9BLLWvJccqWw7XTmgdpy4
	 xpwuajPUS+HIlESKg5OYSWFIqURDNNCgXAdZSkH5ATMDP9zHYL/T/HohxC3GamRliL
	 jthONIBdiDKag==
Message-ID: <853baa9e-1c76-4e61-b1f6-a1155ccb5dd7@endrift.com>
Date: Thu, 14 Dec 2023 19:04:09 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: uinput - Allow uinput_request_submit wait
 interrupting
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-2-vi@endrift.com> <ZXNvQCFxPoH0-i-P@google.com>
 <b54584c2-9db8-4715-966a-6fdf57fdee1a@endrift.com>
In-Reply-To: <b54584c2-9db8-4715-966a-6fdf57fdee1a@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry

On 12/8/23 19:24, Vicki Pfau wrote:
> Hi Dmitry,
> 
> On 12/8/23 11:32, Dmitry Torokhov wrote:
>> Hi Vicki,
>>
>> On Wed, Dec 06, 2023 at 10:34:05PM -0800, Vicki Pfau wrote:
>>> Currently, uinput_request_submit will only fail if the request wait times out.
>>> However, in other places this wait is interruptable, and in this specific
>>> location it can lead to issues, such as causing system suspend to hang until
>>> the request times out.
>>
>> Could you please explain how a sleeping process can cause suspend to
>> hang?
> 
> While I'm not 100% sure how it happens, given I found this by reproducing it before I came up with a theory for why it happened, my guess is that as it's trying to suspend all of userspace programs, it suspends the process that owns the uinput handle, so it can't continue to service requests, while the other process hangs in the uninterruptable call, blocking suspend for 30 seconds until the call times out.
> 
>>
>>> Since the timeout is so long, this can cause the
>>> appearance of a total system freeze. Making the wait interruptable resolves
>>> this and possibly further issues.
>>
>> I think you are trying to find a justification too hard and it does not
>> make sense, however I agree that allowing to kill the process issuing
>> the request without waiting for the timeout to expire if the other side
>> is stuck might be desirable.
> 
> This isn't reaching. As I said above, I discovered the patched line of code *after* observing suspend hanging for 30 seconds while trying to reproduce another bug. I wrote this patch, retested, and found that it now suspended immediately, leading to a visible -ERESTARTSYS in strace on coming back from suspend.
> 
> I can post the reproduction case somewhere, but the test program is only the evdev client end, with the uinput side being Steam, which I don't have source code for.
> 
>>
>> I think the best way to use wait_for_completion_killable_timeout()
>> so that stray signals do not disturb userspace, but the processes can
>> still be terminated.
> 
> There's already a mutex_lock_interruptable in uinput_request_send that could cause this to fall back to userspace under similar circumstances. The only difference I can find, which is admittedly a bug in this patch now that I look at it again, is that uinput_dev_event would get called twice, leading to the request getting duplicated.

After further investigation, it seems this would still be the case even if the request times out--an invalid request would get left in the buffer, which means that while this is a new way to trigger the issue, it's not actually a new issue.

It seems to me that this driver could use a lot of love to get it into better shape, which I could work on, but I'm not actually sure where to begin. Especially if we don't want to break ABI.

> 
> If there's a better way to handle the suspend case let me know, but this is not a hypothetical issue.
> 
>>
>> Thanks.
>>
> 
> Vicki

Vici

