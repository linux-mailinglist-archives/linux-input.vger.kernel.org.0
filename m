Return-Path: <linux-input+bounces-1395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8058A8378E4
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 01:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10FD91F26129
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 00:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B336514462E;
	Tue, 23 Jan 2024 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eV3CerKZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0F13ACC
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968280; cv=none; b=VhSnyf8F8KZUvbNRPmweeW7undWyea6FeJKYu1peqGIpCYxEyxqu/ZiruGHqEd5WFhVZWQ+sn2Zel1ibj4DFupjmfAVB33/YUmuoUXcnQwlthcItYsxazo5twUk4Y1wiLpBNcKr2jjalN/0kvLEbDYh9FwYpWsGYWDDw2MeaxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968280; c=relaxed/simple;
	bh=8Z+ULs/q4uaFuzdQu2SajzdOoT1NsPPNsx1Mfe0md28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUJh0H8dS7olkvVASNPgJuG4FqS72yf3AlHWL0R164nCQTWDb8Vb9aiEr+QRcGWQhxHpnH2lxpFHhB2yOVNuW22TLclDEE80Ic9lCX9JuoLRWLLfaFksaOJxhnGlHz/qwXxHkSkXjSOt/LMWgwi5Wzy1L7TaQyiCrQj0YQhO1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eV3CerKZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d746ce7d13so13188325ad.0
        for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 16:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705968277; x=1706573077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xgfmCkmz6VqNVg7hccbLpNYur17IGmTm4uzzQPE4EUY=;
        b=eV3CerKZhwI9x4gxtyPsu9NuV0Fb2tRLJa3VnuH4jP9X3MBPYJZdtIwze6uPbYgbTD
         nq4LQeO93qm1moiZmwOtANf1VqmQxC/fjoBiP8M2LCWH36ynab/o0bptbt366lZHGDU8
         BT8WY7I8FHKJC+fyVfAt4QQf7QqH4VwC9FMAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705968277; x=1706573077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgfmCkmz6VqNVg7hccbLpNYur17IGmTm4uzzQPE4EUY=;
        b=e7j06xf5N2LU6x9S680RwkApKjjrH/1hfgmcfFQ2WpTh1yde41nLwPvnAZ8GuSlf0Q
         NYnav0+ZHZfj0NC/Yswz3Qf36xSidqVCUyrexP1YfhkO6cNWNbFPx+cfHVzuwBBRlfWT
         WtHCFSB1hTXyi7aXmPZrjfmvq8AEEgg7S3eYxdp2pComqC5O1np8qNMqQ1sHKuj8B/VA
         Qg/7sTdBXVG1Ql5ktv8NuRNFQWxULXbD0e6geuw1wBXsY+mSIlcjf3It2V9te7QS0r1n
         1Rvzf2NtWls27qR+iNbWD2o3ACY3KXpyGRkW/FAU/qJ1irbFrfSJkX52V4Ai1u/hh5sN
         2RvA==
X-Gm-Message-State: AOJu0Yx4yMYUavKfGG/hyaEkAcgIIjv+WpPqTeO0VTiJcefRCGJhOJPN
	G2FV9Rs9YQ0IXlOowrmMgFY6nIlc5N5I9BrHGpfVPsJTeKDBZ/amA2Volm2lvA==
X-Google-Smtp-Source: AGHT+IF5yKC8hKNBRzCwOfVpSH7KZaK0Y2BiM8IVrQK6Ra+ueNGnouj9WLbWFBvo3F8qwKPNnXzqHw==
X-Received: by 2002:a17:903:2487:b0:1d7:6a42:616a with SMTP id p7-20020a170903248700b001d76a42616amr606317plw.114.1705968277246;
        Mon, 22 Jan 2024 16:04:37 -0800 (PST)
Received: from [10.62.13.168] ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902b28700b001d751b1b241sm2359500plr.26.2024.01.22.16.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 16:04:36 -0800 (PST)
Message-ID: <c01cecef-db06-49d8-aa2e-548908c65861@broadcom.com>
Date: Mon, 22 Jan 2024 16:04:33 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] x86/vmware: Add TDX hypercall support
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
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <4CF87BC4-E8C8-4584-A275-5A985D5A18A1@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/22/24 10:28 AM, H. Peter Anvin wrote:
> On January 22, 2024 8:32:22 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>> On 1/9/24 00:40, Alexey Makhalov wrote:
>>> +#ifdef CONFIG_INTEL_TDX_GUEST
>>> +unsigned long vmware_tdx_hypercall(unsigned long cmd,
>>> +				   struct tdx_module_args *args)
>>> +{
>>> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
>>> +		return ULONG_MAX;
>>> +
>>> +	if (cmd & ~VMWARE_CMD_MASK) {
>>> +		pr_warn_once("Out of range command %lx\n", cmd);
>>> +		return ULONG_MAX;
>>> +	}
>>> +
>>> +	args->r10 = VMWARE_TDX_VENDOR_LEAF;
>>> +	args->r11 = VMWARE_TDX_HCALL_FUNC;
>>> +	args->r12 = VMWARE_HYPERVISOR_MAGIC;
>>> +	args->r13 = cmd;
>>> +	args->r15 = 0; /* CPL */
>>> +
>>> +	__tdx_hypercall(args);
>>> +
>>> +	return args->r12;
>>> +}
>>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
>>> +#endif
>>
>> This is the kind of wrapper that I was hoping for.  Thanks.
>>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>
> 
> I'm slightly confused by this TBH.
> 
> Why are the arguments passed in as a structure, which is modified by the wrapper to boot? This is analogous to a system call interface.
> 
> Furthermore, this is an out-of-line function; it should never be called with !X86_HYPER_VMWARE or you are introducing overhead for other hypervisors; I believe a pr_warn_once() is in order at least, just as you have for the out-of-range test.
> 

This patch series introduces vmware_hypercall family of functions 
similar to kvm_hypercall. Similarity: both vmware and kvm 
implementations are static inline functions and both of them use 
__tdx_hypercall (global not exported symbol). Difference: kvm_hypercall 
functions are used _only_ within the kernel, but vmware_hypercall are 
also used by modules.
Exporting __tdx_hypercall function is an original Dave's concern.
So we ended up with exporting wrapper, not generic, but VMware specific 
with added checks against arbitrary use.
vmware_tdx_hypercall is not designed for !X86_HYPER_VMWARE callers. But 
such a calls are not forbidden.
Arguments in a structure is an API for __tdx_hypercall(). Input and 
output argument handling are done by vmware_hypercall callers, while 
VMware specific dress up is inside the wrapper.

Peter, do you think code comments are required to make it clear for the 
reader?



