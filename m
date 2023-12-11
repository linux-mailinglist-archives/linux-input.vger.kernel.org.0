Return-Path: <linux-input+bounces-673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0D80C42E
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 10:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BE331C20CB1
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 09:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD4921102;
	Mon, 11 Dec 2023 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0hOzhRj"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66369FC
	for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 01:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702286161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUybIe9KqFLYcWP/O6bBcrUunOZCGQTAWb7qxrL5p9o=;
	b=c0hOzhRj56jZ0R5uFHLyphEcqNwKfck7a3osmETEwaT3WlELrO2rs+mL3pvOmRAB6l8as8
	jRg1N/NzNkQ3eEcXXUqbxzypFa0DOF/bSWCb/JV7kArQXoc46ZMZDSRpMNaJihNp6gKGz2
	zvG//leETwx1LY4LluEbSGNfHskjsIw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-yA74I9F9OBSHh1wa2l7fFg-1; Mon, 11 Dec 2023 04:16:00 -0500
X-MC-Unique: yA74I9F9OBSHh1wa2l7fFg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9fd0a58549bso476725166b.0
        for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286159; x=1702890959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUybIe9KqFLYcWP/O6bBcrUunOZCGQTAWb7qxrL5p9o=;
        b=pvsBVZzRRYRGnsNyun2ymz8eh83grVt1BBCQxuZ5Hcny/+gbgRYdGdPI962Z1/oRGz
         vI7UgpnVBZEJSXaynMbI+XrMWIognWMZQTD6LwMp9PjSA3SeiBHKRQvA27PxXMB9IaR8
         +M5QGjIECpZkwS2ScOwfPwOMHYNmRU3TZEvLogzUYRW3xAuH36cdv9ZASbmB8xypO4Ca
         2RomAONWIcyNbmoLOZWx4UrWZ0CgsKzo1cxkrraC6sjxneMQclZ2Fq8nU47vRoL+bZus
         24u818oI/8r8OSYNASYrxAtwVjmXxt2Amp7MxbtbRW/AxNa3IoSuuj1QPHEk3McuriNW
         s/JA==
X-Gm-Message-State: AOJu0Yxz3PlBytJ1engdOylE2YanyWdlENseLJlpj3ssezYGBL2tgRVk
	320qvm7E7JzqQ76qzHFTrOxqAHuhY3Q6JHGQd/YH/uQ5UOLazSwc3vViH+LbCpnBwVoJaYB4+oW
	pDYNMHRkANQk6sFW25KyusFI=
X-Received: by 2002:a17:906:d8b7:b0:a1e:9373:155d with SMTP id qc23-20020a170906d8b700b00a1e9373155dmr3875676ejb.30.1702286158644;
        Mon, 11 Dec 2023 01:15:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW1e+waL/QAdSpSyUmPOaSmsPd59r49OwBNwRqu8vficgePrUyWjV5v7UzdONOfkjFDQt5Ng==
X-Received: by 2002:a17:906:d8b7:b0:a1e:9373:155d with SMTP id qc23-20020a170906d8b700b00a1e9373155dmr3875668ejb.30.1702286158309;
        Mon, 11 Dec 2023 01:15:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tz9-20020a170907c78900b00a19afc16d23sm4518226ejc.104.2023.12.11.01.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:15:57 -0800 (PST)
Message-ID: <ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com>
Date: Mon, 11 Dec 2023 10:15:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for ALS
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-16-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204101548.1458499-16-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 11:15, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the Ambient light via the Ambient
> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 19 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c            |  9 ++++++++-
>  include/linux/amd-pmf-io.h                    |  4 ++++
>  5 files changed, 38 insertions(+), 1 deletion(-)

Ok so with this patch also added in the mix I guess the
multi-plexing nature of amd_get_sfh_info() makes sense,
so it is ok to keep that.

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

Regards,

Hans


