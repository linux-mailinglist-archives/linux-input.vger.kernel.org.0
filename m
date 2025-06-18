Return-Path: <linux-input+bounces-12948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE332ADF348
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 19:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 665E01673FF
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 17:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D315B2046B3;
	Wed, 18 Jun 2025 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="XnYGSSHG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C61A257D
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266032; cv=none; b=micSIF7fETTDb/jny1QBRIpiLAMNKWTHwCcxqJ1qz2vMog9dLjhw78ptLNnh9l2Oi6SpHSoDDwjnk3Mt2rjagERrutO19nQmmRFAmt/2cdnpNCRuDKUAvbj4+tHQq4EMNTyrHZ4CRoKhGmxdNB8Pq4R++v8tSryDxjdqeZNlLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266032; c=relaxed/simple;
	bh=CRkmOk1pQb37e4W67BuJnr5eFxJckUQZIKWYQSynclI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKpCA0u86KLw4uH7GqiBH61v5/XmNU0Wifh2AXwGD9B6C3I1H5c9qSrtnwQjrdocTOBV1hOxZkpM6zKDlEOcj0l8uz3WUi8vI1P/+3ZrXLaxk3jIDfzPv0jVAlSc8JWPNWAn6oCCgdtfdlcJgpwYJQYR6/Q6h7rEtUYovIhAwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=XnYGSSHG; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1456283C92;
	Wed, 18 Jun 2025 19:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1750266022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VMlmQ3U0jDUWuibbWL2OJYvuswaYY4gI8f0u5REYOJw=;
	b=XnYGSSHG+4nOwRQgOj8pOBXouf91XXoqbtTU7tHJ0EWdACewEMfAbHfY8S3Dq2qUdR5jbx
	0FX5SjNf2+4hSwhAJskjX6g2JI90d5hXzM45uH3zRUCMkD3ZEpwVlTb6DiAqNkQA18il1i
	0H6Wkr6u6XGk5qyOrSghqmasdheRarFhSVHtRuaUTXhmfD6AtQ4IBOIXn+qBtJVJdoJQH0
	/4/CCNqH1J9qSfG2oPv2lCQRTQ3AiuIYV+YhKwyjR7P12m/nBVXYtIkF7Xg6/AZHID2t5/
	a1oxjYCi3YfcoPFLFyvY69YkHePMqrK7bIthSlviG/LjbuP8mE4unn51HsJrKQ==
Message-ID: <f7be3381-6d92-40a3-b34f-90afd69a7881@cachyos.org>
Date: Thu, 19 Jun 2025 00:00:19 +0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "jikos@kernel.org" <jikos@kernel.org>,
 "bentiss@kernel.org" <bentiss@kernel.org>,
 Denis Benato <benato.denis96@gmail.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "MukundShetty, Akshata" <Akshata.MukundShetty@amd.com>,
 "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
 <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
 <75105471-8f60-41ef-bd51-c7c4ea255664@amd.com>
 <5da550c2-b0d6-4114-baa2-c66070092b28@cachyos.org>
 <57eb65bc-f710-4c86-ad0e-7473cc6db135@amd.com>
Content-Language: en-US
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <57eb65bc-f710-4c86-ad0e-7473cc6db135@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 6/17/25 03:46, Limonciello, Mario wrote:
> On 6/14/25 1:51 AM, Eric Naim wrote:
>> On 6/13/25 21:46, Mario Limonciello wrote:
>>> On 6/9/2025 3:21 PM, Mario Limonciello wrote:
>>>> +Denis
>>>>
>>>> On 5/27/2025 4:10 AM, Basavaraj Natikar wrote:
>>>>> Add changes to enable operating modes in the driver to allow the FW to
>>>>> activate and retrieve data from relevant sensors. This enables the FW to
>>>>> take necessary actions based on the operating modes.
>>>>>
>>>>> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>
>>>> Comparing this to the series that was submitted by Denis [1] I notice that the main tangible difference is that this isn't exported into the HID descriptor.  So how does userspace know the current operating mode with this patch?
>>>>
>>>> Link: https://lore.kernel.org/linux-input/20250309194934.1759953-2- benato.denis96@gmail.com/ [1]
>>>
>>> Recently a bug report came in: https://bugzilla.kernel.org/show_bug.cgi?id=220224
>>>
>>> It was very weird because it advertised a tablet mode switch which I believe comes from the patch that I linked being added to a downstream kernel.  So there appears to be problems with the descriptor from that patch.
>>>
>>> Considering this, I think what you're doing is fine for now; appears firmware is notified on tablet mode.
>>
>> Unfortunately this version of the patch is also causing problems for the user above. Attached is their journal log with the kernel traces. See [1] for the GitHub issue.
>>
> 
> I looked through the patch and I have a theory on the problem.  Is the 
> issue that MAX_HID_DEVICES wasn't incremented?
> 
> Because previously there was only "6" kinda before and now this is a 7th.
> 
> This incremental diff would fix it if so.
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h 
> b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> index 1c91be8daeddf..7452b03029538 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
> @@ -11,7 +11,7 @@
>   #ifndef AMDSFH_HID_H
>   #define AMDSFH_HID_H
> 
> -#define MAX_HID_DEVICES                6
> +#define MAX_HID_DEVICES                7
>   #define AMD_SFH_HID_VENDOR     0x1022
>   #define AMD_SFH_HID_PRODUCT    0x0001
> 

Hi Mario,

This patch seems to work on top of patch in the main post here. Any other steps to proceed?

-- 
Regards,
  Eric

