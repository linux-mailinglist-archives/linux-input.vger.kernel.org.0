Return-Path: <linux-input+bounces-605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8857980992B
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 03:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866691C20D2D
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 02:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C41FB3;
	Fri,  8 Dec 2023 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VhFn13j3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9457A1708
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 18:27:43 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d048d38881so12430555ad.2
        for <linux-input@vger.kernel.org>; Thu, 07 Dec 2023 18:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1702002463; x=1702607263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYKvR9biHT3dayV04op9dSPEQWRRtNPHfVpKUnfsyTI=;
        b=VhFn13j3PqZWb5TLNVMvYBK+V5TLVyqMayuvjHvDyM27TAFpwf3ydIrUHG8tP0NGjg
         sBuigy4LfAo0iq0+besGdnnVIxZJkyW91LPWvRPZvzaNM9//TSdHtI4sn5ht2kdYlsvl
         f7RLVnWnv2hSjuKhUzZM5kpwoBEj+YjwPX4Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002463; x=1702607263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYKvR9biHT3dayV04op9dSPEQWRRtNPHfVpKUnfsyTI=;
        b=r2gGOC0gu6+LOAj1hizy8aNz8X9LB1vQx6qTDF8tsdEnaspU+c1y011+AAHZ1hrLUM
         Tp3WYbSr3C/YHlePMhs2F9Nbxbzc+eyvaPGt4bkoNQisZbseqN7pDP7ZJc1MgkihmYIU
         rIMgnXOjLnKSjTIZNZVBXPEXJR/zxlDkzOsNPM80r+Y3J+iADMjnGrS+LsFUlETRkoJp
         Ib+8rtah6b/pbTcVUJ0IrVAilN/NMkGf5TsocZgraVfsi+2RuUiOBfSXS94ZrnX3eXtH
         4GC/XhtfMA9OPRvtDB//PRR8PUfWCpYgKqNkWVA9j3d31/cCotPDxFbn4q63wEUOVKHC
         oEmw==
X-Gm-Message-State: AOJu0YwcbG+V/RWrQ2PAVObOUtyO+Ni3a5CWzmOYwFkYwn3pcRKhlUGU
	WDHXjpAQ4aUdr/h5YB0Qpm0yGg==
X-Google-Smtp-Source: AGHT+IE+YH6XCFuLw8IMGfclF6KPMZA8MDgow7b5AP5v+501j19hkR62ob7PHHZkLnrwYuYQEJvI6w==
X-Received: by 2002:a17:903:230b:b0:1d0:6ffd:cea8 with SMTP id d11-20020a170903230b00b001d06ffdcea8mr3531967plh.97.1702002462996;
        Thu, 07 Dec 2023 18:27:42 -0800 (PST)
Received: from [192.168.0.212] ([50.47.85.47])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902b58700b001d0c41b1d03sm512054pls.32.2023.12.07.18.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 18:27:42 -0800 (PST)
Message-ID: <64074f04-fd72-488b-831a-ad744bbcd950@broadcom.com>
Date: Thu, 7 Dec 2023 18:27:39 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Add TDX hypercall support
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, hpa@zytor.com, dave.hansen@linux.intel.co,
 bp@alien8.d, mingo@redhat.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com, jsipek@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 horms@kernel.org
References: <ef8d3e17-7028-47fd-ad31-54dadbb6796d@broadcom.com>
 <20231206071527.59171-1-alexey.makhalov@broadcom.com>
 <53592a3a-3d96-4aa1-8357-ec595f59c5f3@intel.com>
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <53592a3a-3d96-4aa1-8357-ec595f59c5f3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/23 9:12 AM, Dave Hansen wrote:
> On 12/5/23 23:15, Alexey Makhalov wrote:
>> +#ifdef CONFIG_INTEL_TDX_GUEST
>> +/* Export tdx hypercall and allow it only for VMware guests. */
>> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
>> +{
>> +	if (hypervisor_is_type(X86_HYPER_VMWARE))
>> +		__tdx_hypercall(args);
>> +}
>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
>> +#endif
> 
> I think this is still too generic.  This still allows anything setting
> X86_HYPER_VMWARE to make any TDX hypercall.
> 
> I'd *much* rather you export something like vmware_tdx_hypercall() or
> even the high-level calls like hypervisor_ppn_reset_all().  The higher
> level and more specialized the interface, the less likely it is to be
> abused.

Dave, I understood your point. Please take a look on the next version of 
the patch.

I export vmware_tdx_hypercall(), while vmware_tdx_hypercall_args() is a
static inline wrapper on top.
Most of the vmware hypercall logic plus sanity checks are now in 
exported function. While only input and output argument handling remains 
in the wrapper to allow compiler optimization for hypercalls with few 
argument. Exporting vmware_tdx_hypercall1, vmware_tdx_hypercall3, and so 
on is not an option either.

Regards,
--Alexey

