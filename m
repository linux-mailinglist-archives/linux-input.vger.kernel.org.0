Return-Path: <linux-input+bounces-16834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E538ECFECAD
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 17:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 997A6307B3A4
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939E3AD24;
	Wed,  7 Jan 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoBPqurZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F11534EC
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799238; cv=none; b=T3XKV5S4fFLXiuqqFUqbErpKVJwboblo5KqeKmJizb2h08kQ2UVmshzc47Rs/Nb/Xa4CGQ0ism8POeGf++R437vQc45jT/4R7s7bSdDNKr+jYD+l8/GmacWHNKS3k3K8HKnLhHZlXDRxTi21hgUeWNCCbJOxMYK5Jt6qrA7hlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799238; c=relaxed/simple;
	bh=kCmyDDfeEqaNtlnLitOPh57YzuJP5VRz/xqJdY269B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWp1ZQJRLT+/EQhZWtBuMO0BhWe6Kt4RMlVNj/RLYNVmBdUp443OuDws0vQxXkLadFJRHTu1NuB6tfTR4Rd27cZtr3zBMosW31aZaKKfuFj7nzgY04bfOgCvwP2z0Pgxd1/FVwMLCAwX9/PGW9OIkO/TjA/zNPAtBNdFFF1u2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoBPqurZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so15702615e9.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799235; x=1768404035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fiGd0IdqTo8lWQtyKc8CW1DFNsuFCUGvQu2s7Gs/sc=;
        b=RoBPqurZ+4xIFNluZaEsnLa8ZD9v4Z4Jgz+BjscgfYjpPgiXe34YZerMipCbsdipQx
         oLx8ueKmUmHV7Y5ON4oZt+kw4AeTqRKFqf/lKvxAima30HKbENgi0AXw5i6R35QsLjmz
         qXg+AW7H6yUjW0aJY+RUTAN+rV6kEsWPTabNRYCV7QrCd5q9YzG9ZLqplDOkomvMLQZQ
         9pUQ0Q1W1Bxih9RO5RsxI840j2Q/SG51lx6HFKAWBw4YL1zhncW4uK44S9XKOSgLZdjb
         /gb3jeod81T6lUuCn2SY90lf+na201lBANF2e9amaVUjLg+riGeiEhgXQVFtmTLKnJCc
         elhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799235; x=1768404035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fiGd0IdqTo8lWQtyKc8CW1DFNsuFCUGvQu2s7Gs/sc=;
        b=K2R3Llxwd6rRzIgiGlMIEwbJjsT+lMal62VAcJxjneT492gs7do/lEMn6VQj+0s1Rn
         y3iXezPqPxu+F3zf2S++XCUyfRavIYJpa8RaUlgjU/3P1gmf7FUf8GkMqvLsHBcth22r
         FNQIljex/llyTGWGm25TbU1nAxClk+vDJpslhNblHsqpV3NYVVwIxGwSxw/MHT8HgMQp
         Yc/WpOggHM6NyAhHvyG2g44XU+mw0rtNX/C3Qozt6c5X/I3HZxhq2hzys6RD7X4PkT3G
         fvqVggEkor6t53RHMsDTJbYjYiKqkiKIkiZSv8G8i1UtPs9gRQPxaRskRIAzNEDgEUhB
         C36w==
X-Gm-Message-State: AOJu0Yy6I8JxT7k3oxV5SLmYSywh8ap6LbzQD2kpeivElHLz1tc1MTsI
	CdmHFJxTFIEWxG3F6CnN1gfTA8FmMuRf9faMtxTKxaPFpg/uhPCUMdUx
X-Gm-Gg: AY/fxX6xsgofZM7WXx7nqUXmgUmfd1dwcxIeZ2c+wVciKjiqqtg9pmKAbH5txnPwCFZ
	DMGfOaQg0Sibp5a0ftWc1PX5qMUulTd1Rdc5wF6HQmj8I2mBHYfnF5+f5ZB+ZfAfkygoOYmnfVQ
	MtMMp46pV3xmcLSp/4LVJG3LRUuanEJHHau+bWNExWiUKISZ+DVFlKC2p0gXqFOOZZaNIofKg3w
	XEIgciXV+w9wAZAeCTd1OQdTHKioStqcW66HSWG7wWWZUapgSMeMM/8bIcSbho0G+HZrwdbt82m
	IXJ6KFC8UMt6E/P+ZPVRwuQLfkE7ZUpXGagSIvDH4+ziehSYfPeLy1joFnbwSraL9CKDBMhgA+b
	GAGGchZKwkZILrpnRKUSIrwhWOZMsfnEa48cJ76NrszBnM2Bp/45BjB1knOduamlOxWQ411iaKO
	gGxqLqflwc34mjgTs2PO0VCPNl9hggIDzvYw==
X-Google-Smtp-Source: AGHT+IHvq9tYXXsEcq4RpJO5Mn8IVNDo2ooXeRepP9MuBNmG3K1d1vbIeG1zFRjVm4eKgNXCP5H3yA==
X-Received: by 2002:a05:600c:1991:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47d84b4119amr34621895e9.32.1767799234785;
        Wed, 07 Jan 2026 07:20:34 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm10980544f8f.35.2026.01.07.07.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:20:34 -0800 (PST)
Message-ID: <61fa38dd-dcb6-4619-a670-a8d1d3d61046@gmail.com>
Date: Wed, 7 Jan 2026 16:20:34 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] HID: asus: Add WMI communication infrastructure
To: Mario Limonciello <superm1@kernel.org>,
 "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-8-sunlightlinux@gmail.com>
 <088286f0-3469-4b2a-87bb-56440d40fb82@gmail.com>
 <58414ae4-59e4-4f3b-ba19-dd706e4ae1a9@kernel.org>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <58414ae4-59e4-4f3b-ba19-dd706e4ae1a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/7/26 16:14, Mario Limonciello wrote:
> On 1/7/26 7:07 AM, Denis Benato wrote:
>>
>> On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
>>> From: Ionut Nechita <ionut_n2001@yahoo.com>
>>>
>>> Add the infrastructure needed for the HID driver to communicate with
>>> the asus-wmi driver:
>>>
>>> - Add linux/acpi.h include (in alphabetical order)
>> Mentioning the addition of acpi.h seems a bit too specific
>> for a commit message, but wait for hid maintainers to
>> tell.
>>> - Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
>>> - Implement asus_wmi_send_event() function to send events to asus-wmi
>>>
>>> This infrastructure will be used to handle special keys that require
>>> WMI communication.
>>>
>>> Change-Id: Ic4d9b35f8b1f2b48c7c26e7259b4d05951021b58
>>> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
>>> ---
>>>   drivers/hid/hid-asus.c                     | 24 ++++++++++++++++++++++
>>>   include/linux/platform_data/x86/asus-wmi.h |  1 +
>>>   2 files changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 06cd3d3b74af7..05fa35489258d 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -23,6 +23,7 @@
>>>   /*
>>>    */
>>>   +#include <linux/acpi.h>
>>>   #include <linux/dmi.h>
>>>   #include <linux/hid.h>
>>>   #include <linux/module.h>
>>> @@ -321,6 +322,29 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>>>       return 0;
>>>   }
>>>   +/*
>>> + * Send events to asus-wmi driver for handling special keys
>>> + */
>>> +static int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
>>> +{
>>> +    int err;
>>> +    u32 retval;
>>> +
>>> +    err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
>>> +                       ASUS_WMI_METHODID_NOTIF, code, &retval);
>> This code is based on the fact asus-wmi driver is available:
>> are you sure this doesn't make the kernel compilation fail
>> if such driver is not enabled?
>
> asus-wmi.h has conditional behavior already:
>
> #if IS_REACHABLE(CONFIG_ASUS_WMI) 
>
Ah yes I missed that.


Reviewed-by: Denis Benato <benato.denis96@gmail.com>

>>> +    if (err) {
>>> +        pr_warn("Failed to notify asus-wmi: %d\n", err);
>>> +        return err;
>>> +    }
>>> +
>>> +    if (retval != 0) {
>>> +        pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
>>> +        return -EIO;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int asus_event(struct hid_device *hdev, struct hid_field *field,
>>>                 struct hid_usage *usage, __s32 value)
>>>   {
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 419491d4abca1..516538b5a527e 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -29,6 +29,7 @@
>>>   #define ASUS_WMI_METHODID_KBFT        0x5446424B /* KeyBoard FilTer */
>>>   #define ASUS_WMI_METHODID_INIT        0x54494E49 /* INITialize */
>>>   #define ASUS_WMI_METHODID_HKEY        0x59454B48 /* Hot KEY ?? */
>>> +#define ASUS_WMI_METHODID_NOTIF        0x00100021 /* Notify method */
>>>     #define ASUS_WMI_UNSUPPORTED_METHOD    0xFFFFFFFE
>>>   
>

