Return-Path: <linux-input+bounces-511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3C8060EC
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 22:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDAE1F21416
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 21:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBF76D1C0;
	Tue,  5 Dec 2023 21:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SAy1PQ8+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9ECD3
	for <linux-input@vger.kernel.org>; Tue,  5 Dec 2023 13:41:29 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58e28e0461bso2261724eaf.1
        for <linux-input@vger.kernel.org>; Tue, 05 Dec 2023 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701812488; x=1702417288; darn=vger.kernel.org;
        h=content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5lTYwIubHQaV5E5T6aUEz+uUHrWFy5zBX2hYxAm8Zqs=;
        b=SAy1PQ8+IKs/dEwz4eNGsZ2SGbcuM7UKtVq/GgvomtyBisqoqjFs8K2cldluUFRmbW
         boxupqkWoT38xTuPnheMIUBs7ujAO3e31k5TiWHDXF0U8QjhV/IGCO74Canpw6d8mlEw
         Ie99SNwBxvq+2g49OoYdsYM+Qmv+TbSz1RK4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812488; x=1702417288;
        h=content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lTYwIubHQaV5E5T6aUEz+uUHrWFy5zBX2hYxAm8Zqs=;
        b=st8fTIuXadOyMzIejjoxu/b2RwcMYbDDTmJ7Y2Pm+SX7wLZLIB8OycZnn2fMZb+hs5
         Xw2nlVTlP4Z4KvOCz+VS7xNGveEbHG0WE8RUIu2c1LJaFHp/fgtZGBA2a+9I+9eMVyfT
         3ikeZU3cmpeGn09AkISkCUBkD28qXi7jIbLzFtB6smPx7wOMwvqC12wxN12ubbgzMI3J
         MPG2yLSWXGsOdGVrlFI6UrrIDEADNYfMpz0hamfVW1se8SpwWGgEnQE5dbRc2sTZOqO2
         VJEH8xvYS8/27avU0iH34hTtekUmoSeTS0zrc+cTxI7qg8aTRo6ldyFdP07Xun97ygCk
         USXQ==
X-Gm-Message-State: AOJu0Yx1kd3m1X4eEg47I3tVH1GKqv6PzpUeEBkWYifNty42QizoGqxC
	gcDw/BcCoLrU3PNL/tNcURYfimo+cEkhCkNuRlToNcuVnpnIlpU2vSXLUHqprta3T9FjDpa941n
	rDEQAu9T5hBWVwg==
X-Google-Smtp-Source: AGHT+IGrSD1QCLOvXJeAIN3MVd3BGbcWv5kJwN+NTnHMdMsscIynvdKGgNKboyxYDtxzuaKfuCyLSQ==
X-Received: by 2002:a05:6358:e4a8:b0:170:698:3fe with SMTP id by40-20020a056358e4a800b00170069803femr8180354rwb.9.1701812488549;
        Tue, 05 Dec 2023 13:41:28 -0800 (PST)
Received: from [10.62.14.168] ([128.177.82.146])
        by smtp.gmail.com with ESMTPSA id g34-20020a635662000000b005c19c586cb7sm9738086pgm.33.2023.12.05.13.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 13:41:26 -0800 (PST)
Message-ID: <204f743d-2901-4ad2-bbcc-a7857a8644e7@broadcom.com>
Date: Tue, 5 Dec 2023 13:41:22 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
 Alexey Makhalov <amakhalov@vmware.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com, jsipek@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 horms@kernel.org
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-7-amakhalov@vmware.com>
 <20231204103100.GYZW2qZE9tbGMtuVgY@fat_crate.local>
 <c2519c9a-8518-403a-9bca-cb79a5f2a6e9@intel.com>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <c2519c9a-8518-403a-9bca-cb79a5f2a6e9@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 12/5/23 1:24 PM, Dave Hansen wrote:
> On 12/4/23 02:31, Borislav Petkov wrote:
>> On Fri, Dec 01, 2023 at 03:24:52PM -0800, Alexey Makhalov wrote:
>>> +#ifdef CONFIG_INTEL_TDX_GUEST
>>> +/* __tdx_hypercall() is not exported. So, export the wrapper */
>>> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
>>> +{
>>> +	__tdx_hypercall(args);
>>> +}
>>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
>> Uuuh, lovely. I'd like to see what the TDX folks think about this
>> export first.
> 
> I don't really like it much.  This does a generic thing (make a TDX
> hypercall) with a specific name ("vmware_").  If you want to make an
> argument that a certain chunk of the __tdx_hypercall() space is just for
> VMWare and you also add a VMWare-specific check and then export *that*,
> it might be acceptable.
> 
> But I don't want random modules able to make random, unrestricted TDX
> hypercalls.  That's asking for trouble.

Considering exporting of __tdx_hypercall for random modules is not an 
option, what VMware specific checks you are suggesting?

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

