Return-Path: <linux-input+bounces-3659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AF8C1A00
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2024 01:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADFFA1C20D62
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 23:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B00512FF9F;
	Thu,  9 May 2024 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aiL8EzfA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEEC81741
	for <linux-input@vger.kernel.org>; Thu,  9 May 2024 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298126; cv=none; b=DpvyVMAR/iBLmtpzBQtKTcnjn51ADdrVo+N/pcnHZZjmqWsBWtrm4KnuE25CD/BolzrcEBUAhu+cAc/sQAInWa3pBdmHmIS8iXWPgAPr94kXYqUqzCCFRIf/VeSDOciT/fUvzkfUs49Ez+OjODwVjVBoJeMtPAMdpukyQFQYvlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298126; c=relaxed/simple;
	bh=liAIFAR0glyuJJFMxq3gQatxiT2/acVSfwl2Gt6U1ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBgxhHBVjmjTyy3iIKObJRWQ1PKW9FCF3dfBcK7NWQ3irupPi42Eqbm5gzpXN7MgVCM9Q1DGmmoVEi4DFDtDx1wIr6eld8C3MzeuI13Dmm2KxxR/qA262iaiLUDVPE6wMJn90Jg5ArGp2yFQY4zdQNKs9oJTH1h6tIPVgfFPnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aiL8EzfA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so12922295ad.1
        for <linux-input@vger.kernel.org>; Thu, 09 May 2024 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1715298124; x=1715902924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qcQ+E1QA8l+ah/ENXdvarlO1w5eDBmEI+kx8d052/jY=;
        b=aiL8EzfARiwhzt5jd76ck4lSqjuQxAELokIUMzzOQJ+U/b7OshlpHDLelxppKsTwIA
         qeG3m6RQbnsKI3HjQAmkfe1RIah0nD3EM17vvFGhbHnan1AhqlGfwD8q/Rlgs/HBls39
         A7OKWwpGeS/oYJVDJQ6fmnpFl4e14MJNTyp9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715298124; x=1715902924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcQ+E1QA8l+ah/ENXdvarlO1w5eDBmEI+kx8d052/jY=;
        b=Nw0f7fFNp6puPEHEvY94g1vTxqRwwVIsFWaF8RbSVxwRBKVfJYQxKceM3SxuZdMps3
         7DAE205nrJ909peVh0USLOPXikmk+BLlHHMg/hA5A96cLeqelJwo4H0Qxt8NfJvTKDvK
         MwXYRqt1oqiKrCCELCwz6weIq/6iH98VU6MuTy5KqCaUIrBFTuNG8yuEK+jFeFY2oaal
         VXiru4IKTnxisERy3gCVTrsyv/u+QI8kAEWI9+H3RAF5WLft+W7+Dq8EOpFUnkbJWMq0
         tgWrRL7bDA6IfIpnuY/D9ocMNqk2q/ST3s1WMk8er4MSlwycQrkGZ+JvdwQdZmu3+Gf7
         R5kA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9veSc/QJQ/IxXoCA3CvzeYqEOnFshBdNVQinB+BRgUHrO3oJZr8hKK4Nl1BTau8j34MAk2nwgrAboAQb4fmD8POk8pB4FmndUUQ=
X-Gm-Message-State: AOJu0Yy8v/ew6i+xTYFw8HIyF+zj3SPfBpyDRZefPFigBGguL19V+ZzJ
	/FrpLhALaE1mDpBpHoKdZ4AvW9Eb3KopFg3MB2FzMFHc4jok2XYAzGQlWCVe1g==
X-Google-Smtp-Source: AGHT+IEUXVntNOdIl0JFIcu3FbFOnabVgHUgiNiHs/V/L6l5se4Qx1VFF0gI5J1ocymcGEaLDXx4BQ==
X-Received: by 2002:a17:903:120e:b0:1e4:6519:816d with SMTP id d9443c01a7336-1ef43f51feamr13083235ad.48.1715298124022;
        Thu, 09 May 2024 16:42:04 -0700 (PDT)
Received: from [10.62.14.240] ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm19965805ad.58.2024.05.09.16.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:42:03 -0700 (PDT)
Message-ID: <a503d8b3-d31c-46e9-a4a2-538312e850c5@broadcom.com>
Date: Thu, 9 May 2024 16:42:00 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>,
 Jeff Sipek <jsipek@vmware.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
 <20240507095852.GVZjn7XM0VMXzBfKsd@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240507095852.GVZjn7XM0VMXzBfKsd@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/24 2:58 AM, Borislav Petkov wrote:
> On Mon, May 06, 2024 at 02:53:00PM -0700, Alexey Makhalov wrote:
>> +#define VMWARE_HYPERCALL						\
>> +	ALTERNATIVE_3("cmpb $"						\
>> +			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
>> +			", %[mode]\n\t"					\
>> +		      "jg 2f\n\t"					\
>> +		      "je 1f\n\t"					\
>> +		      "movw %[port], %%dx\n\t"				\
>> +		      "inl (%%dx), %%eax\n\t"				\
>> +		      "jmp 3f\n\t"					\
>> +		      "1: vmmcall\n\t"					\
>> +		      "jmp 3f\n\t"					\
>> +		      "2: vmcall\n\t"					\
>> +		      "3:\n\t",						\
>> +		      "movw %[port], %%dx\n\t"				\
>> +		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\
> 
> That's a bunch of insns and their size would inadvertently go into the final
> image.
> 
> What you should try to do is something like this:
> 
> ALTERNATIVE_3("jmp .Lend_legacy_call", "", X86_FEATURE_HYPERVISOR,
> 	      "vmcall; jmp .Lend_legacy_call", X86_FEATURE_VMCALL,
> 	      "vmmcall; jmp .Lend_legacy_call", X86_FEATURE_VMW_VMMCALL)
> 
> 		/* bunch of conditional branches and INs and V*MCALLs, etc go here */
> 
> 		.Lend_legacy_call:
> 
> so that you don't have these 26 bytes, as you say, of alternatives to patch but
> only the JMPs and the VM*CALLs.
> 
> See for an example the macros in arch/x86/entry/calling.h which simply jump
> over the code when not needed.
Good idea!

> 
> Also, you could restructure the alternative differently so that that bunch of
> insns call is completely out-of-line because all current machines support
> VM*CALL so you won't even need to patch. You only get to patch when running on
> some old rust and there you can just as well go completely out-of-line.
> 
Alternatives patching has not been performed at platform detection time.
And platform detection hypercalls should work on all machines.
That is the reason we have IN as a default hypercall behavior.

> Something along those lines, anyway.
> 
>> - * The high bandwidth in call. The low word of edx is presumed to have the
>> - * HB bit set.
>> + * High bandwidth calls are not supported on encrypted memory guests.
>> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
>> + * low bandwidth hypercall it memory encryption is set.
> 
> s/it/if/
Acked.

> 
>> -#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("inl (%%dx), %%eax" :					\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
>> -		"memory")
>> -
>> -#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("vmcall" :						\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(0), "b"(UINT_MAX) :					\
>> -		"memory")
>> -
>> -#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
>> -	__asm__("vmmcall" :						\
>> -		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>> -		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>> -		"c"(VMWARE_CMD_##cmd),					\
>> -		"d"(0), "b"(UINT_MAX) :					\
>> -		"memory")
>> -
>> -#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
>> -	switch (vmware_hypercall_mode) {			\
>> -	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
>> -		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
>> -		break;						\
>> -	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
>> -		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
>> -		break;						\
>> -	default:						\
>> -		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
>> -		break;						\
>> -	}							\
>> -	} while (0)
> 
> You're kidding, right?
> 
> You went to all that trouble in patch 1 to move those to the header only to
> *remove* them here?
> 
> You do realize that that is a unnecessary churn for no good reason, right?
> 
> So that set needs to be restructured differently.
> 
> * first patch introduces those new API calls.
> 
> * follow-on patches convert the callers to the new API
> 
> * last patch removes the old API.
> 
> Ok?
My intention was to have a implementation transformation from locals 
macro through common macros to common API.

What you are suggesting will eliminate unnecessary patches. It makes sense.

Will perform this restructuring in v10.

> 
> And when you redo them, make sure you drop all Reviewed-by tags because the new
> versions are not reviewed anymore.
Noted.

Thanks again,
--Alexey

