Return-Path: <linux-input+bounces-12954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30AADF51E
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 19:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2731BC48CD
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 17:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723ED3085A5;
	Wed, 18 Jun 2025 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="eoD8WtHh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0543085A1
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269127; cv=none; b=frSfLCjEJmCHduUZRwOlmOSZbIalfkS8jFHiYmI/nd+px0dmOkq6CD1zR60tmMpwB0StK7qqe+CGytBDoSzyIoqCaKCy1H2Oi6+1zta+DWX/+l0bQ7HcVciAsT2IHrwIWnd/2vUCQCAG8rg6iLpq+VmtTB3W5HFpGNTp1t+Sosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269127; c=relaxed/simple;
	bh=oT3Ss85wwBMTa55zhZZVfPIvNds1hEKdjLNd/yeiyYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKgJKstHSwzq3V7xikZK9joIb3o1GDGLHo6dgIgc6Zrey+MgjZD4KJOsottPF6bjOqmOMauX69IOC61bc0xctEBsTvRYgFw4dxhDOAWGuZTH004m3RHwP7M1q6L+ib/iteGcJeML38xZ0tzsSbxCn9cDnjYcDpdBxSLeULvnIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=eoD8WtHh; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C31EA280574;
	Wed, 18 Jun 2025 19:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1750269122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yhvt/rFIaIVe/YonySPUmGdX2l7h4jSS2Tb92HiybPk=;
	b=eoD8WtHhaZrtWJU2Q34WYD397DKeh5XqmQWv3zkFOj23HbyP6qAwh/H2VyC3h84bCb7qlA
	u296u1a0AUgmF2toCsrUXvJXctcGHnIpqYPbMslwJJxISlZEBq1Efio1wS5X+Q1T1+f5Po
	qM8zIVOdT+FmkrSpXASDhUXg0/hL6dGuhQlF9gTHIRkzWPjf09TFUKNEleqw334m6yIB9I
	O24kyVF/h0Dis6t1Kk2NtjuWfZUL3EkmTVFT66oZjT14rZiUJDfcXLtmbSyjMJ5eXfCpI5
	VfcBbB25y+RFVgHhv2tYz8HqP6BEaTkWiO61QaZHKW/B3RNYyfFS0aZ6Vjf2Qg==
Message-ID: <318aeef0-fe16-4baf-86da-0318ffa43c73@cachyos.org>
Date: Thu, 19 Jun 2025 00:51:57 +0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
To: Mario Limonciello <mario.limonciello@amd.com>,
 "MukundShetty, Akshata" <Akshata.MukundShetty@amd.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 Denis Benato <benato.denis96@gmail.com>, "jikos@kernel.org"
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
 <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
 <75105471-8f60-41ef-bd51-c7c4ea255664@amd.com>
 <5da550c2-b0d6-4114-baa2-c66070092b28@cachyos.org>
 <57eb65bc-f710-4c86-ad0e-7473cc6db135@amd.com>
 <f7be3381-6d92-40a3-b34f-90afd69a7881@cachyos.org>
 <1755c6be-d293-446d-a6a4-22237714dc38@amd.com>
Content-Language: en-US
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <1755c6be-d293-446d-a6a4-22237714dc38@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 6/19/25 00:01, Mario Limonciello wrote:
> On 6/18/2025 12:00 PM, Eric Naim wrote:
>> On 6/17/25 03:46, Limonciello, Mario wrote:
>>> On 6/14/25 1:51 AM, Eric Naim wrote:
>>>> On 6/13/25 21:46, Mario Limonciello wrote:
>>>>> On 6/9/2025 3:21 PM, Mario Limonciello wrote:
>>>>>> +Denis
>>>>>>
>>>>>> On 5/27/2025 4:10 AM, Basavaraj Natikar wrote:
>>>>>>> Add changes to enable operating modes in the driver to allow the FW to
>>>>>>> activate and retrieve data from relevant sensors. This enables the FW to
>>>>>>> take necessary actions based on the operating modes.
>>>>>>>
>>>>>>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>>>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>>>
>>>>>> Comparing this to the series that was submitted by Denis [1] I notice that the main tangible difference is that this isn't exported into the HID descriptor.  So how does userspace know the current operating mode with this patch?
>>>>>>
>>>>>> Link: https://lore.kernel.org/linux-input/20250309194934.1759953-2- benato.denis96@gmail.com/ [1]
>>>>>
>>>>> Recently a bug report came in: https://bugzilla.kernel.org/show_bug.cgi?id=220224
>>>>>
>>>>> It was very weird because it advertised a tablet mode switch which I believe comes from the patch that I linked being added to a downstream kernel.  So there appears to be problems with the descriptor from that patch.
>>>>>
>>>>> Considering this, I think what you're doing is fine for now; appears firmware is notified on tablet mode.
>>>>
>>>> Unfortunately this version of the patch is also causing problems for the user above. Attached is their journal log with the kernel traces. See [1] for the GitHub issue.
>>>>
>>>
>>> I looked through the patch and I have a theory on the problem.  Is the
>>> issue that MAX_HID_DEVICES wasn't incremented?
>>>
>>> Because previously there was only "6" kinda before and now this is a 7th.
>>>
>>> This incremental diff would fix it if so.
>>>
>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>>> b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>>> index 1c91be8daeddf..7452b03029538 100644
>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
>>> @@ -11,7 +11,7 @@
>>>    #ifndef AMDSFH_HID_H
>>>    #define AMDSFH_HID_H
>>>
>>> -#define MAX_HID_DEVICES                6
>>> +#define MAX_HID_DEVICES                7
>>>    #define AMD_SFH_HID_VENDOR     0x1022
>>>    #define AMD_SFH_HID_PRODUCT    0x0001
>>>
>>
>> Hi Mario,
>>
>> This patch seems to work on top of patch in the main post here. Any other steps to proceed?
>>
> 
> Eric,
> 
> That's great news!
> 
> I think Akshata just needs to spin a second version of the patch squashing it in.
> 
> Thanks,

One more to add to that I suppose, I had another user test this patch that was using Denis's patch, and their device has working tablet mode switching too with this patch.

Akshata, Basavaraj,

feel free to add

Tested-by: Eric Naim <dnaim@cachyos.org>

if its applicable for the next revision of the patch.

-- 
Regards,
  Eric

