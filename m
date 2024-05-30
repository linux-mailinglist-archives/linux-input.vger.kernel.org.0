Return-Path: <linux-input+bounces-3964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3BB8D4275
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 02:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AD55B24677
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C497BE4D;
	Thu, 30 May 2024 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="I1VaVCsd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7AE134C6
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717029951; cv=none; b=Nd77LJ30SY5SH41BEYuCIr/7z31daYiCzrulSoEjIxVjkiNQkrGedDtvnjqtgs8E9NyB2dwTdlxNcm+Orn6Cv1ubN0DZQBqUBI2gLnjmJo8KTwXodpDj5MFUcaMBT/d91efW24AMD+Zoa+/roaWOpsb23T2YuWneBYEvEEP8MK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717029951; c=relaxed/simple;
	bh=wBz2qZopS6FfLTe4ZSNt9bUuEFegNutb19fG4EI+yAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjcWhOUkes0r5l8uIgsuRKHykcY1Z7KpLlKdkw+UWgwvzQ2QEtjNzxzmOrYimBeU5ghmt8pcaeFOHqkiXcC4Fr8KcaxQF7f5XI460TGzX2TEpKqUrCwr/kSnbkYlenSGGvhaUN4exIhXGF1mNp2sY6DLg4SuhN5EyoQSOrQRev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=I1VaVCsd; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6818eea9c3aso249573a12.1
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 17:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1717029949; x=1717634749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UzT4rsaryvD4HsIjsYHJczNs+fMyCNVp7/lsR9UttHw=;
        b=I1VaVCsdIl1m5FsHcC0pBBxjAMfa/ng+p4U17H1mLGQ8MfCwLEuTEHNWoSIZtBWMRc
         cVJEHhaHfR06d6kal2VJvwF12gG5KQFGpjEKYTsjPg/y0OwlhEUt6YOzhxgEMkeFkWK9
         e0NMv/noYBftZ2dxACbNPzgD55I8vytIG4jYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717029949; x=1717634749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzT4rsaryvD4HsIjsYHJczNs+fMyCNVp7/lsR9UttHw=;
        b=wNZ0gXMoVv17SfzmvGrEnbOWovH7zjnCAvO6OJ6A4FiZyoOTsCK+0m1VsClA/hWv5n
         hA0mSsN8W8WYiKkWgpmtI0mQkBZ2AbVlZee5ZbEv2P79m8SeMQaqOWHxfANnzw/CVfmX
         p9Hxy88hsABIx1EyeP9xP9uynpunOxvTJnNT1a+xgEcSbbza2RKEMgCtZdlIRba0cHMS
         CmMyfMmdqUZtBKKAthUvqWESSLqgPoSAFS/xgje9BvKWeeAcGAT0G+MG+8MUzaP7cR9U
         md/MEVuNXFNQd6rBV5HcFNId6X0OXfQNKsSanL4tqsmZ/hDAcWN+dF8LnH5cwkQDX5Tl
         Wy3w==
X-Forwarded-Encrypted: i=1; AJvYcCUpFiyPECkRr4MLjcPOBf4sBgRZKa7yvp2F4YPp5DpJmsI7Fnc4jCzrQjFhGXfSvJTwrRtGCvLo0R+zgK1qbjWeP1nLGvxiaigdPy4=
X-Gm-Message-State: AOJu0YwSSAXlBkKUMiC3/oWJrznE4H4WCCzU0i6+AfdZpcSKyPat6qUb
	rIfaplfsdPAj1yGgxvpNKLT2WlC8aiJqJVOF4FCjGTCYBliI2Lfv6i7M8bJujA==
X-Google-Smtp-Source: AGHT+IGw/uQweGpiOxtSfYPC7LJBdJ2zJ1rqH+pim/ho7+uhpHOfv5xU/GTUkOAC13zAozamcR+7Gw==
X-Received: by 2002:a17:90a:de93:b0:2c1:a9da:8344 with SMTP id 98e67ed59e1d1-2c1ab9e32c6mr750050a91.9.1717029948937;
        Wed, 29 May 2024 17:45:48 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1abe3d4d7sm288005a91.44.2024.05.29.17.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 17:45:48 -0700 (PDT)
Message-ID: <bcbe13ec-839c-4061-895c-8188bcd03841@broadcom.com>
Date: Wed, 29 May 2024 17:45:43 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] x86/vmware: Correct macro names
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Ajay Kaher <akaher@vmware.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simon Horman <horms@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Merrifield
 <timothym@vmware.com>, Zack Rusin <zackr@vmware.com>
References: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
 <448230a6-1afd-416f-a430-3fc83d81908f@web.de>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <448230a6-1afd-416f-a430-3fc83d81908f@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/25/24 8:53 AM, Markus Elfring wrote:
>> VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
>> These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
>> Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. …
> 
> Can such information be relevant for the addition of the tag “Fixes”?
> 

Makes sense! Thanks, --Alexey

