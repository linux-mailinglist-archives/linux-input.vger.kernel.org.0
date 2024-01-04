Return-Path: <linux-input+bounces-1099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D6823E7C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 10:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F0B2873EE
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 09:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87320314;
	Thu,  4 Jan 2024 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1UeoY3/"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922C62030F
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704360097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DCNBHl6UaugjT3RT+JFYFMy3g1qTqNXJHP1js23EpI=;
	b=d1UeoY3/kYjZ4S43P/OE+tip55L2JbrjQinw4wDU88UL2yWp9IyJieKnPZ/LU90vBc0DSa
	1yN3sceQX6/iEOo7Q3xLZzNGXIQsmYUQjDuczQhhyI2LDbHbSoltzGf+z6vhhiHRXDtLZl
	AzfU2SN/7UEKSAoxYN8N+TVbchPAQ5w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-MFRwHT-oMWiZxkD8mabMlg-1; Thu, 04 Jan 2024 04:21:35 -0500
X-MC-Unique: MFRwHT-oMWiZxkD8mabMlg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a28ef2418d3so8883466b.0
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 01:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704360094; x=1704964894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DCNBHl6UaugjT3RT+JFYFMy3g1qTqNXJHP1js23EpI=;
        b=kH5zc32mTSULT8UhXunlAuuM0N21FIUBJaMGSDXkTLg9q1RDKO4xT4+Hl1jp9hvhdT
         bCeOepqEHjsXvKKPefzYkLyZoITddz+1vKj4oRPV0klov18taCohS/y08BalfY5f66GI
         5F/+nQXkoXyDbtmYWk6tx2RNU8ZAy1nv+cZxkPXDdt8XZink+lw8pt14I2mZN7zjREe2
         srwfI5dfijRrdeGIIAuK2ixBvbTZ/eC/vYnj3hny1tuLKTYkAW/hMEOjYVY1JHx7yXDY
         PHb9EV/eMS3ieaIKX79fwtDCBb9IT4GpqB3P+nc6OMeZIV6mppKAHBLuMnpH0kRY4PSA
         RQGg==
X-Gm-Message-State: AOJu0YwtoyjfSZGRCtuFLzUwc23rcEgpoqEpNixjDIElwXA8Rr/xilE9
	H+kfNkfOpmKl4MDb/8bUFu/PLzHZEDdJdagNYe6jhuNZK5Ve3RBkNWn3TiKtkt/3ZUOqyNe/CcJ
	B6RrO04HyQYb7WEQnOMJnR1wTkMaqKR0=
X-Received: by 2002:a17:906:29d4:b0:a27:6570:5db4 with SMTP id y20-20020a17090629d400b00a2765705db4mr249456eje.1.1704360094552;
        Thu, 04 Jan 2024 01:21:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESj4WLYhJHuUGa1LUTWWp44t2akjrq3TncbYEbPxKsPY5ISl0+GAbCemrhOsw1dEb3ItlUSg==
X-Received: by 2002:a17:906:29d4:b0:a27:6570:5db4 with SMTP id y20-20020a17090629d400b00a2765705db4mr249448eje.1.1704360094258;
        Thu, 04 Jan 2024 01:21:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fr20-20020a170906891400b00a28479fcb8esm2435041ejc.103.2024.01.04.01.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 01:21:33 -0800 (PST)
Message-ID: <c4d8c0db-e125-4d2c-98d2-59cd9ca7ed11@redhat.com>
Date: Thu, 4 Jan 2024 10:21:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add new SFH interfaces
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Jiri Kosina <jkosina@suse.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: benjamin.tissoires@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 Patil Rajesh <Patil.Reddy@amd.com>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2401021122350.29548@cbobk.fhfr.pm>
 <71296fab-d6dd-490b-b29d-468f0eecb244@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <71296fab-d6dd-490b-b29d-468f0eecb244@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 1/4/24 09:29, Shyam Sundar S K wrote:
> Hi Jiri,
> 
> On 1/2/2024 3:53 PM, Jiri Kosina wrote:
>> On Wed, 20 Dec 2023, Basavaraj Natikar wrote:
>>
>>> This series adds new interfaces to export User presence information and
>>> Ambient light to other drivers within the kernel.
>>
>> Hi,
>>
>> thanks for the patches. I'd like this to go in together with the actual 
>> users of it on the PMF side. Does that code already exist?
> 
> I am yet to submit the patches that uses the new SFH interfaces
> defined in this series.
> 
> The suggestion from Hans is to have the SFH changes landed
> independently, so that Hans can take the PMF changes alone later
> during the rc's as fix. IMO, we can have this series merged first alone.
> 
> But I am OK to have both PMF and SFH changes together.
> 
> Hans, what is your feedback for Jiri's question?

Jiri, originally the drivers/hid/amd-sfh-hid/ changes
were posted as part of this series:

https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-1-Shyam-sundar.S-k@amd.com/

specifically in these patches:

https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-14-Shyam-sundar.S-k@amd.com/
https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-15-Shyam-sundar.S-k@amd.com/
https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-16-Shyam-sundar.S-k@amd.com/

Where the last 2 patches introduce both the HID changes and the drivers/platform/x86/amd/pmf/...
consumer of the HID changes in one go.

I have asked Shyam to split out the HID changes:
https://lore.kernel.org/platform-driver-x86/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/

"""
But this patch also needs to have its HID parts split out
from the rest and the HID patches need to be merged
separately.

Since the merge-window is getting close I would like
to propose the following:

1. Send a v7 addressing review remarks consisting of
only patches 1-12, assuming all review remarks are
fixed in v7 I can merge that then.

2. Send a 3 patch HID patch series separately:

[PATCH 1/3] HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
[PATCH 2/3] HID: amd_sfh: adding the HID hpd bits + amd_get_sfh_info() function
[PATCH 3/3] HID: amd_sfh: adding the HID als bits

3. Once v7 of patches 1-12 + hopefully the 3 patch HID series have
landed in 6.8-rc1 then I would be willing to take a patch using
amd_get_sfh_info() to implement hpd + als support in the spc code
as a fix for 6.8-rc# .
"""

I have merged patches 1-12 of the AMD PMF series already.
So assuming there are no other objections against the HID
changes it would be great if these can still make it into
6.8-rc1 then Shyam can re-send the AMD PMF changes which
consume the new HID API as a separate patch and then I'll
send that to Linus once the HID changes have been merged
by Linus.

Note I understand if the timing does not work out
in that case the HID changes + the AMD PMF patches which
consume the new HID API can wait for the next cycle.

If this is going to wait for the next cycle, then please
send me a pull-request for an immutable branch with
the HID changes in there so that I can merge that
into pdx86/for-next before merging the AMD PMF changes.

Regards,

Hans




