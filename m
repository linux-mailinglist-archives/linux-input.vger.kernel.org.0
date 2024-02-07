Return-Path: <linux-input+bounces-1720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D12B284C17F
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71E61B22A06
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118146A0;
	Wed,  7 Feb 2024 00:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HNYTVNEg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F99D27E
	for <linux-input@vger.kernel.org>; Wed,  7 Feb 2024 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266857; cv=none; b=Zf7YwiXXIvGZNvYzXtnyQSippOeHUmUAXnMKV4quEC4RnUjx1XqzSl0w4t8XoZzdP5TKE0AoR8xPwy2y/6FDZgyTEKMvQiZoWmZWSyfNoTR5YroV7dZyPErx97HWQq3KEDrDtZD2ea+U7N8lAhUbtkBdTrjnuApIIXvkLZQ5frw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266857; c=relaxed/simple;
	bh=94YzYXEp1uORbNJKyOyHBQcdMq3uI+6oMYHqyUH0Pr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aT9dmOhw+9wRWFqENgOrEy9iHUDe8k/fwZYMYL4VdUw2qbmH3qkFd/CPZQZr/lOvTi0gg6KXKQVAQ+V7BmnnTDbAsFMOCi94qWqgFAFZc4II832D1MsZEPZTHppEZDY6m1Z3wV0ha/kdXxU34oRlUXyHhzXhbA/Pl6wnQohdEJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HNYTVNEg; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-219108b8e9cso64810fac.2
        for <linux-input@vger.kernel.org>; Tue, 06 Feb 2024 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707266854; x=1707871654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsEjXZX6xQ1bWIwsvoqizKiR6sGEHjxD6RK0x9ggrFA=;
        b=HNYTVNEgT4ZuHIZ3oWg9ZPv3BTEV2T7bZjfSHQnXc/gBm5hkudNfQ+QAFXHCaFIbWQ
         XKDENnHMXw8J8fqycvG1OgN97ZoZYHG+X3gOLalttnE01hbSK2GnrGXHKZh2mPWVgWel
         gvIl3vf9f0AF8oM+xG04/nGT9hdHQXU75052E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707266854; x=1707871654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsEjXZX6xQ1bWIwsvoqizKiR6sGEHjxD6RK0x9ggrFA=;
        b=nZT/2DramujoWhCiXM95frrjOA/qihZ1XIMDP/9Qt+wMqPNXcENlNWvL4R8EWE0mx1
         A3sm3G61Iz2Gh9noXWWlzOO3vB1rIJtjFrxQ5b65aOr6p8Jqlol7Ed1R2Euo11bJrVf6
         xKBmYrNgweD1QltvRCZNH2s3xd+F2p44TrUEGnR26BHbToLeuT0Vrd8AmnbAQcgF/xlr
         YqkKrMt7svUrxQO6id64bHKu2Xu9TcJcC1j6B5ahdLxx2zEH+Gch4LiyBCEIG4U3/FDS
         Xdw4PFQnimzwY9Bb+0aYjCsiKLjZBTBfHLp6zXpdlntvNd2T80fUnQix7NDIQ11bOj2D
         VO3g==
X-Gm-Message-State: AOJu0Yy7HfT26qe2lHONu9y8pY7NeHIJruglBM5WC+P3egv7LPwgD5f4
	WU9GUoBogwXG3UGTPgFgBCdmRjQMkEOUWkTBI/HaSpOFev3uvBr2bfa4Qo8Nog==
X-Google-Smtp-Source: AGHT+IF/rDLtdFbe55ST7w5PxhOZY1WnwU1GB1z9+jLCHlGHp+cCk8u5VLljSX0gXAK1NCzjyxykjg==
X-Received: by 2002:a05:6870:63aa:b0:219:7a41:348e with SMTP id t42-20020a05687063aa00b002197a41348emr4463605oap.49.1707266854548;
        Tue, 06 Feb 2024 16:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5J6Rqtr0j/snrDML0dw3JTs5gZadpORkSlVTwggjDtf769sNKVDWmTOqdOsFxRp6P7WQG0YLTn6O5i5dzNWrbILeohCfOQSRx5UBp9SfiaGL20Y4O7XLWz/q1L1z33cQwM1JyphFLx4TXdtS86ftmffiBqG0xT8ZPzlSA
Received: from [192.168.68.59] (076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id dt37-20020a0568705aa500b002186e53f9a1sm49173oab.3.2024.02.06.16.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 16:47:33 -0800 (PST)
Message-ID: <b186f4ab-42f4-47f5-ba83-81e7b38c8649@chromium.org>
Date: Tue, 6 Feb 2024 18:47:32 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Requesting 3 patches for Apple Magic Keyboard 2021 to be merged
 to LTS kernels
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org
References: <3b82d3d8-c0c3-49e1-ae68-966f02fe5429@chromium.org>
 <2024020217-immodest-reversion-407e@gregkh>
From: Aseda Aboagye <aaboagye@chromium.org>
In-Reply-To: <2024020217-immodest-reversion-407e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> On Fri, Feb 02, 2024 at 08:45:40PM -0600, Aseda Aboagye wrote:
>> Dear stable kernel maintainers,
>>
>> I am writing to request that 3 related patches be merged to various LTS kernels. I'm not sure if it would have
>> been preferable for me to send 3 separate emails, so please forgive me if I chose wrongly. (This is my first foray
>> into interacting with the kernel community) :)
>>
>> The patches are as follows:
>>
>>     1. 0cd3be51733f (HID: apple: Add support for the 2021 Magic Keyboard, 2021-10-08)
>>     2. 346338ef00d3 (HID: apple: Swap the Fn and Left Control keys on Apple keyboards, 2020-05-15)
>>     3. 531cb56972f2 (HID: apple: Add 2021 magic keyboard FN key mapping, 2021-11-08)
>>
>> These patches have all been merged to mainline, but I believe when they were submitted, backporting may not have been considered. The Apple Magic Keyboard 2021 (Model # A2450) seems to be a popular keyboard, and without these
>> patches, for users on certain LTS kernels that use this keyboard, the function keys do not behave as expected. e.g. Pressing the brightness down or brightness up key didn't work, and bizarrely pressing the globe/Fn key alone caused the brightness to decrease. None of the top row keys worked as expected.
>>
>> I checked to see where the patches were missing and figured that it would be good to have those patches in those
>> kernels.
>>
>> I would ask that patches 1 & 3 be merged to v4.19, v5.4, v5.10, and v5.15.
>> I would ask that patch 2 be merged to: v5.4 and v4.19.
>>
>> For patch 3 to apply cleanly, it needed patch 2 to be present in the tree.
> 
> I've done so now, but really, adding support for a keyboard that wasn't
> even out when the kernel was released is odd, why not just use a newer
> kernel version?  That's generally a good idea for all consumer devices,
> use the latest stable kernel please.
> 

Thank you so much Greg! Yes, that would be the ideal, using a newer kernel. Our
team is in the process of updating the kernel version for our devices, but it's
a long process with many devices and hence wanting to get a fix in the interim.
Our goal is to eventually continuously ship the latest stable kernel versions.

Thanks,

--
Aseda Aboagye

> thanks,
> 
> greg k-h
> 

