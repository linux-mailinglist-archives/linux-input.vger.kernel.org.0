Return-Path: <linux-input+bounces-1475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66083D1BF
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 01:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430691C22655
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 00:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C486CEC3;
	Fri, 26 Jan 2024 00:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cXlvFKYY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FB38C
	for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706230511; cv=none; b=PdvPTS+PIwekCNbIjN1Q26dlu5X0yS6vHNO5WzJVhUMfBcgJybiHjqlp0qtoK+mE06ntYhh2B82EL9RNT/it/XcxIm5glJv25mH8TkWNXQ/z9ZLVG9KqI9lugJKkWG5ilpNZXFaJJdGvEjoqbHE+jYFOblfolWkYmqZkzbKS0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706230511; c=relaxed/simple;
	bh=woblf5qNFHrtXcpv2ZP53wuaAZhx3ECN/TDEQZ6mz3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDOCvL8+H3buZeaosAU4+iZSVuWsyxCGlMQgG3DjnZo0a3v254g0JQiiwa5k4xlKOr6aBlT34eA78IElNr97ByExF73W2HIFynUGMCZK9Mt/ylXIBAFEWz/mbeK/f7UAZkzroo5ZesqktG1NesFxJU0RcrSFj9ig6QaocKu6z0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cXlvFKYY; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21460195d11so2251191fac.2
        for <linux-input@vger.kernel.org>; Thu, 25 Jan 2024 16:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706230509; x=1706835309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBYHdpy2T+P9z5bpa228oc6wr1+9JH26Mg1COdKLLrI=;
        b=cXlvFKYYNYfFXDH07WZqAl091+w+1N93HPVe43n0bXHTxvpmeE2wrWueS0dPKknPpM
         c8L8pOalNHvL7hqr4mVPEBWqWNrobL2iTMsjDGnKgX8YQ4tKesXZdDkxNXz6EMwHDlVK
         QTYDcTbpsLg2FMm/e90lhmwdA9vdnxO6DjD0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706230509; x=1706835309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBYHdpy2T+P9z5bpa228oc6wr1+9JH26Mg1COdKLLrI=;
        b=drmLnk0gqu+J8BT0TzENAE37j3nSuAikRnIfztLGpDl6kHIRkQA4cBkjpKX6Y2bZhp
         EWq1YTd88aBRE1riyC53J3YxIbf6ckXFjagyvJXTZAy23tZKv75p/qy0ORBJmzLw1NBJ
         MhO0JUCknS8fIVrSSXl+x3IlmClXOCutrXAG37KbZTaClvB4rb4AycBTtMHOcosCsvV9
         5MVD1d5TetgaYlX1BtYJUyppar4mffJagiSKUtDMwozIkf+/cy1mKPhEcsm7/reIjVP0
         cxTQ6KYLlEAYcxcY4wSFOmDBmxcAwJFfP5Z3ONbp1P7yvfrBTwbHwK/+zZAxNh0rhIXm
         rPFg==
X-Gm-Message-State: AOJu0YwL4nF1qX6Xub5mi+1Oma0su5ycPJ1Gl/BrVITJ7FcMyoOjLxJz
	TAs9/Rq83KjNy+D9hoaMG84CL1YoyXsdFxJxgRRJ9YSDMa+PkSE+DAUQnkStcA==
X-Google-Smtp-Source: AGHT+IF0Jl0JD2X5TRBfnUOQ23MioJtaZ+KrnLymlf81R1TXF1fF3AkWzi0nZH9y9GgU2w267j/Zsg==
X-Received: by 2002:a05:6871:7a2:b0:214:cf50:83a8 with SMTP id o34-20020a05687107a200b00214cf5083a8mr549113oap.31.1706230509086;
        Thu, 25 Jan 2024 16:55:09 -0800 (PST)
Received: from [192.168.0.212] ([50.47.85.47])
        by smtp.gmail.com with ESMTPSA id l17-20020a635b51000000b005cd64ff9a42sm117219pgm.64.2024.01.25.16.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 16:55:08 -0800 (PST)
Message-ID: <b10eeb5f-bde5-4932-bdc5-c313ea832e0e@broadcom.com>
Date: Thu, 25 Jan 2024 16:55:05 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] x86/vmware: Add TDX hypercall support
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 dave.hansen@linux.intel.com, mingo@redhat.com, tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com, jsipek@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 horms@kernel.org, kirill.shutemov@linux.intel.com
References: <20240109084052.58661-1-amakhalov@vmware.com>
 <20240109084052.58661-8-amakhalov@vmware.com>
 <ff370e42-f48b-4c62-9b44-9d4031cd78b0@intel.com>
 <4CF87BC4-E8C8-4584-A275-5A985D5A18A1@zytor.com>
 <c01cecef-db06-49d8-aa2e-548908c65861@broadcom.com>
 <351B1153-9CBE-4774-9FAF-770F9F36856E@zytor.com>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <351B1153-9CBE-4774-9FAF-770F9F36856E@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/22/24 4:17 PM, H. Peter Anvin wrote:
> On January 22, 2024 4:04:33 PM PST, Alexey Makhalov <alexey.makhalov@broadcom.com> wrote:
>>
>>
>> On 1/22/24 10:28 AM, H. Peter Anvin wrote:
>>> On January 22, 2024 8:32:22 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>>>> On 1/9/24 00:40, Alexey Makhalov wrote:
>>>>> +#ifdef CONFIG_INTEL_TDX_GUEST
>>>>> +unsigned long vmware_tdx_hypercall(unsigned long cmd,
>>>>> +				   struct tdx_module_args *args)
>>>>> +{
>>>>> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
>>>>> +		return ULONG_MAX;
>>>>> +
>>>>> +	if (cmd & ~VMWARE_CMD_MASK) {
>>>>> +		pr_warn_once("Out of range command %lx\n", cmd);
>>>>> +		return ULONG_MAX;
>>>>> +	}
>>>>> +
>>>>> +	args->r10 = VMWARE_TDX_VENDOR_LEAF;
>>>>> +	args->r11 = VMWARE_TDX_HCALL_FUNC;
>>>>> +	args->r12 = VMWARE_HYPERVISOR_MAGIC;
>>>>> +	args->r13 = cmd;
>>>>> +	args->r15 = 0; /* CPL */
>>>>> +
>>>>> +	__tdx_hypercall(args);
>>>>> +
>>>>> +	return args->r12;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
>>>>> +#endif
>>>>
>>>> This is the kind of wrapper that I was hoping for.  Thanks.
>>>>
>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>>>
>>>
>>> I'm slightly confused by this TBH.
>>>
>>> Why are the arguments passed in as a structure, which is modified by the wrapper to boot? This is analogous to a system call interface.
>>>
>>> Furthermore, this is an out-of-line function; it should never be called with !X86_HYPER_VMWARE or you are introducing overhead for other hypervisors; I believe a pr_warn_once() is in order at least, just as you have for the out-of-range test.
>>>
>>
>> This patch series introduces vmware_hypercall family of functions similar to kvm_hypercall. Similarity: both vmware and kvm implementations are static inline functions and both of them use __tdx_hypercall (global not exported symbol). Difference: kvm_hypercall functions are used _only_ within the kernel, but vmware_hypercall are also used by modules.
>> Exporting __tdx_hypercall function is an original Dave's concern.
>> So we ended up with exporting wrapper, not generic, but VMware specific with added checks against arbitrary use.
>> vmware_tdx_hypercall is not designed for !X86_HYPER_VMWARE callers. But such a calls are not forbidden.
>> Arguments in a structure is an API for __tdx_hypercall(). Input and output argument handling are done by vmware_hypercall callers, while VMware specific dress up is inside the wrapper.
>>
>> Peter, do you think code comments are required to make it clear for the reader?
>>
>>
> 
> TBH that explanation didn't make much sense to me...

Peter,

I would like to understand your concerns.

1. Are you suggesting to move structure (tdx parameters) initialization 
in one please, instead of one part there another part here? Do you 
prefer to pass all arguments as is to vmware_tdx_hypercall() and only 
define tdx_module_args there?

2. And second suggestion is to add pr_warn_once under "if 
(!hypervisor_is_type(X86_HYPER_VMWARE))" ?

--Alexey

