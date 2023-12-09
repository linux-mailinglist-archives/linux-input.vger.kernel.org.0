Return-Path: <linux-input+bounces-636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD580B1E6
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 04:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91EB52818CA
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 03:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84F010F6;
	Sat,  9 Dec 2023 03:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="qIR+nWr8"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198F5BA
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 19:24:44 -0800 (PST)
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 832BBA028;
	Fri,  8 Dec 2023 19:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1702092283; bh=4rQiWYIEjSITKM/3haGDheWiKuK5pwvwyUPRY3G4DJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qIR+nWr8UciPyC44NhoPxZBotf4FNHIKqHfbHWrHOqQvJ0/GURzf4RYbXy26Pq33E
	 +7Ge6ewt4DsHXB4X+g+mrS2oosdM5Fw4b2GkedP8dy2IAd3Pj9AXywQtjOYj8C01r/
	 JT0cuDW/XorcNVGndToUZ5ecDFDlb7gprDk+J2PS6DMcCrDoopF8Hpc6BLDHIhZeSs
	 7VKW+QZzQy/IqdXzEMa3Su67XnSlFAOvWnOiSvBW11VGrEsXL3LEDdXrdsX9uNj6Ak
	 MmkGa47VgSysaeDZAX8hIbJZtkpXR+77PoyJihlC/DPvykLMWrxU+NNdp9pFD7EXNV
	 ++74goIsdfr5Q==
Message-ID: <ab8dd2f1-31b1-4883-a378-f6a62e3d2434@endrift.com>
Date: Fri, 8 Dec 2023 19:24:43 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Input: uinput - Release mutex while unregistering
 input device
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-3-vi@endrift.com> <ZXN1ZFYZBekXryha@google.com>
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <ZXN1ZFYZBekXryha@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 12/8/23 11:58, Dmitry Torokhov wrote:
> Hi Vicki,
> 
> On Wed, Dec 06, 2023 at 10:34:06PM -0800, Vicki Pfau wrote:
>> Any pending requests may be holding a mutex from its own subsystem, e.g.
>> evdev, while waiting to be able to claim the uinput device mutex.
>> However, unregistering the device may try to claim that mutex, leading
>> to a deadlock. To prevent this from happening, we need to temporarily
>> give up the lock before calling input_unregister_device.
> 
> I do not think we can simply give up the lock, the whole thing with
> UI_DEV_DESTROY allowing reusing connection to create a new input device
> was a huge mistake because if you try to do UI_DEV_CREATE again on
> the same fd you'll end up reusing whatever is in udev instance,
> including the state and the mutex, and will make a huge mess.

Yeah, I was curious why this was possible in the first place. It seemed overcomplicated compared to just opening a new fd. I suppose that that makes more sense, though it's a bit involved for this.

> 
> I think the only reasonable way forward is change the driver so that no
> ioctls are accepted after UI_DEV_DESTROY and then start untangling the
> locking issues (possibly by dropping the lock on destroy after setting
> the status - I think you will not observe the lockups you mention if
> your application will stop using UI_DEV_DESTROY and simply closes the
> fd).

This does sound like a reasonable way forward. Unfortunately, I don't have access to the uinput-side application code, but I have been trying to work with them to flatten out bugs in it. I can pass this suggestion along, though there is still a reproducible deadlock that could theoretically happen with other programs in the meantime (though the likelihood of it being hit without actively trying for it is low).

> 
>>
>> Fixes: e8b95728f724 ("Input: uinput - avoid FF flush when destroying device")
> 
> This is not the commit that introduced the problem, it has been there
> since forever.

My mistake. If I prepare a v2, which I may not, I'll drop the line.
> 
> Thanks.
> 

Vicki

