Return-Path: <linux-input+bounces-3785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2E8CC9C1
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 01:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3448B282CCF
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 23:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F7D14C59C;
	Wed, 22 May 2024 23:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bt/C4/nf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818D14BFBF
	for <linux-input@vger.kernel.org>; Wed, 22 May 2024 23:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716421208; cv=none; b=BsVE8JIY/ciDyP/iWY/c556478qjkBkXlNizZJRbt7zbLqfU6aoiZWGTrtWKgHg5NlIQr3Y6tbQ5vIMgmDzZtqyb/oam219r4nznzehZVmAWb/Vws66W2kSkjJsVxBj+mpHPt2/NdncyUqSYXGXH7rf4UI2Sg1IzNdQc2U94YlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716421208; c=relaxed/simple;
	bh=mGlmVg+uwz/HtNBT80xzjZ9KnSF2ROtraD+iGdk3u30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3uDZpvm+cIz7WZip4DQQTL/2sVvV1vs0tQAwY/v4rRj0fY+h87TUXwGKWGFMlMauA6Pk9vTs2X7sg5G0gURR73QJcMJGjZ0Io4pejsOuEkeWY/8DmGF4rPO+aOQognnyvY/5DhVcFPpYeTiDU6fmpSY0rjYGr0aGzGfUFH9w2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bt/C4/nf; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df4f05f4cc8so870635276.0
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 16:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1716421205; x=1717026005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCeXqO694HgEAFqSHQXqbvYxJUxtExpMbdEe7ZIdETA=;
        b=bt/C4/nfWmBO5PAB90tV8lm9lqb7s8wgprxPZ1vQ/sq9tFLaNlBS7302frmjfnWvY9
         Eh/dVxuG34fL2o2CJMwjVJfObV6CeGXmfGNOXDEX0tY+qWW1Ikvgb4QJVadkUjM7KrSB
         gQA5EpTSUmwd5jvKc77woPiwA0LTA1vBmN8Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716421205; x=1717026005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCeXqO694HgEAFqSHQXqbvYxJUxtExpMbdEe7ZIdETA=;
        b=RiJ8Rs5pfdgWgDZiHgTQW29FxgCvNdhlyJiVlOwRj349vob7e3hkMbkn6Ox/5LJV9P
         eSmajDsE0jevbyyddJ5U5IQf+RqZ95FAlAhmYBXsk2Ca5NiGfnA1us8o01MjlnxYFQso
         mkSYaqsY4REAGFXIQ5RAHw+T9ch1BeNCg5dem7j/0aVcqzJ3kcCL6WALyb4skD1A0aXp
         urdwmQvSEN2gVdBFAL/PK+0PigwYaYx+FDDbSMoMKXf12muc9cKgCQ168yS/hEDe9W3H
         FdgNrTJNPQxHyWbhZUYNvvnm2XNYyYtbsPPOfTQl5BVwvpR1tha2KpR+4bV81J4GABev
         VtGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfrq+k45rC7czVBizhPQ9IZNzCwUQqdrNlvpxu5YVtF9cqFHW5jkaWX7gFzOX73hItRBTP2rOTlRdXQlTKEgB7foKOFnrstGdlapg=
X-Gm-Message-State: AOJu0Yzb+3GaF4tiDq9HfKS3xlmzfW9r2TnasxpAfdaTjuMGtkfhQdRb
	AQne2uqfyKTpc7RePKC9DOGbql50M6S/TBqRSYoZ8vlXhE3U0Et2PFJARjkrYw==
X-Google-Smtp-Source: AGHT+IHWA2ySaerrSLmapcqRcekl4k10gEqjceg3ERi1laZg3yw8KcPaSqtvkObLZp4ZwEKO6vwlPg==
X-Received: by 2002:a05:6902:2182:b0:dc6:e4f8:7e22 with SMTP id 3f1490d57ef6-df4e0e81210mr4151332276.62.1716421205384;
        Wed, 22 May 2024 16:40:05 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f18543fsm137498156d6.34.2024.05.22.16.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 16:40:04 -0700 (PDT)
Message-ID: <683225e0-1cd3-4dea-bb68-086d46b233e8@broadcom.com>
Date: Wed, 22 May 2024 16:39:57 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
To: Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kirill.shutemov@linux.intel.com,
 Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
 <20240511150225.GK2347895@kernel.org>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240511150225.GK2347895@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simon, apologize for long delay

On 5/11/24 8:02 AM, Simon Horman wrote:
>> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
> 
> ...
> 
>> +static inline
>> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
>> +				uint32_t *out1, uint32_t *out2)
> 
> nit: u32 is preferred over uint32_t.
>       Likewise elsewhere in this patch-set.
Good to know. Can you please shed a light on the reason?
I still see bunch of stdint style uint32_t in arch/x86.


> ...
> 
>>   /*
>> - * The high bandwidth in call. The low word of edx is presumed to have the
>> - * HB bit set.
>> + * High bandwidth calls are not supported on encrypted memory guests.
>> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
>> + * low bandwidth hypercall it memory encryption is set.
>> + * This assumption simplifies HB hypercall impementation to just I/O port
> 
> nit: implementation
> 
>       checkpatch.pl --codespell is your friend
Thanks, that is useful!

> 
>> + * based approach without alternative patching.
>>    */
> 
> ...

