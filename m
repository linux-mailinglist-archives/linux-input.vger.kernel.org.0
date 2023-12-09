Return-Path: <linux-input+bounces-635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B150480B1E5
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 04:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCDA81C20AFC
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 03:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C541101;
	Sat,  9 Dec 2023 03:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="WKnAUHZ4"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ADF84
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 19:24:41 -0800 (PST)
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 2820CA028;
	Fri,  8 Dec 2023 19:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1702092281; bh=8QD01xS13o/E/j7ns5E17KypTMsvN6pKHyU0khO0U1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WKnAUHZ4jAM5kaqz34qjrPifLUXbk4Rvuz/lqQVObPWHcvZ2+CPURrBWWyBfk8XiJ
	 G94QzhmWU5tVcusmhhsjoQrY16DT3Q2CALFRxMR27IfrYKaze2YiE22W4EuMt+r+Ck
	 4Enotz/G9ierCro4rYFYHF/18p5OqhqLAxAECYbHRdwOOqGvUKVC3+klJ75YOnldS2
	 tt+t4enEsw9WzIoRN20+ouR8TleY5AWPrnS4Owsj0GV5h9DMWrk2c1MUwjL2vTZJXW
	 NiY53zh2JGMzTmD3/DvXulbx7XGa1wWpCYBoqL/kr+31MMOUse/bLpoJ9RnMxI9bCY
	 dtka2ZY30v7AQ==
Message-ID: <b54584c2-9db8-4715-966a-6fdf57fdee1a@endrift.com>
Date: Fri, 8 Dec 2023 19:24:40 -0800
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
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-2-vi@endrift.com> <ZXNvQCFxPoH0-i-P@google.com>
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <ZXNvQCFxPoH0-i-P@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 12/8/23 11:32, Dmitry Torokhov wrote:
> Hi Vicki,
> 
> On Wed, Dec 06, 2023 at 10:34:05PM -0800, Vicki Pfau wrote:
>> Currently, uinput_request_submit will only fail if the request wait times out.
>> However, in other places this wait is interruptable, and in this specific
>> location it can lead to issues, such as causing system suspend to hang until
>> the request times out.
> 
> Could you please explain how a sleeping process can cause suspend to
> hang?

While I'm not 100% sure how it happens, given I found this by reproducing it before I came up with a theory for why it happened, my guess is that as it's trying to suspend all of userspace programs, it suspends the process that owns the uinput handle, so it can't continue to service requests, while the other process hangs in the uninterruptable call, blocking suspend for 30 seconds until the call times out.

> 
>> Since the timeout is so long, this can cause the
>> appearance of a total system freeze. Making the wait interruptable resolves
>> this and possibly further issues.
> 
> I think you are trying to find a justification too hard and it does not
> make sense, however I agree that allowing to kill the process issuing
> the request without waiting for the timeout to expire if the other side
> is stuck might be desirable.

This isn't reaching. As I said above, I discovered the patched line of code *after* observing suspend hanging for 30 seconds while trying to reproduce another bug. I wrote this patch, retested, and found that it now suspended immediately, leading to a visible -ERESTARTSYS in strace on coming back from suspend.

I can post the reproduction case somewhere, but the test program is only the evdev client end, with the uinput side being Steam, which I don't have source code for.

> 
> I think the best way to use wait_for_completion_killable_timeout()
> so that stray signals do not disturb userspace, but the processes can
> still be terminated.

There's already a mutex_lock_interruptable in uinput_request_send that could cause this to fall back to userspace under similar circumstances. The only difference I can find, which is admittedly a bug in this patch now that I look at it again, is that uinput_dev_event would get called twice, leading to the request getting duplicated.

If there's a better way to handle the suspend case let me know, but this is not a hypothetical issue.

> 
> Thanks.
> 

Vicki

