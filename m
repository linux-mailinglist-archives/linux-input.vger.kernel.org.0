Return-Path: <linux-input+bounces-4042-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4568D7E3E
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 11:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55E11B238CC
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 09:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D888080039;
	Mon,  3 Jun 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWzm5vrN"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533E770F1
	for <linux-input@vger.kernel.org>; Mon,  3 Jun 2024 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406100; cv=none; b=jlnXLTBPNK8jvuGP/x79TTWq5VpCA4EhK6egu44pfTyGyat2tKa88vjB9PnrE8oqME/fzweBuSktpQOG/hzPkenyfTzk7y4FZOoRcY4wdMybiMHJ6QuAf18TarQ3Xszc+Bgn7TXfXzVK3FaNu6d97990OYK3Mm4sPXcsyYIkpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406100; c=relaxed/simple;
	bh=RUdhv/rV66TofoZ/+ZusaQUHGKegZw/ZPFoN3z59CkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTehNzbrxVcMZC1AwLBqAXG5AQ+Wj8U3wpF5kucsEt6p200oMSrkCYKqVj5AoQYvMGUHTGlsC4d3RpIiodvW/E2MuJ04uUNZthigoPcNOW79rXQVrWfJkBmijAKeW5rTXxrcrYCyTyAKcvxvNOxrBrJlFAKHdFGYheQa3FK6pbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWzm5vrN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717406098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elJN2/S+zNiKtT9pH96MRDhhv69WvQATNgXhmP4Js+w=;
	b=iWzm5vrNAV1uL+KWuPbs0mn4IoPZCBBg4T7z67AvhgXGXGT/e5B4THaRw3+4Cdv+uYgAGe
	+pe6YZMEH45fPidAR7gDsr4y1WapwqH/JtqQfEAcQQF23SbgGOywIaF+cLuao+DV+PT50Q
	cDFCl/4qvOnLEtCt6IryEPfGmuvYwLQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-1eiiIrhHOv-vqeIC2f3fzA-1; Mon, 03 Jun 2024 05:14:56 -0400
X-MC-Unique: 1eiiIrhHOv-vqeIC2f3fzA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ea9aeae4e6so19363851fa.0
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2024 02:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717406095; x=1718010895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elJN2/S+zNiKtT9pH96MRDhhv69WvQATNgXhmP4Js+w=;
        b=mNqPus0kAztvF3WYEDoVUkHFZxh7K0zgCABcw5/LpBClxKGhxcCdPVfSA0YHK8NmI5
         nbBjCeYuyCChTdI3iVAHNDlVHNw6DI9g6IW4s0rtU7a7916fnI7wdnw1IrcEItMxOVjs
         japmN0AvW1I5lOFBKqQpJqAXyAMgIQwLvWx6FbGk1IKi7tmTgKJwVRuWBFoFrkdrGat1
         hh+P3b94FANrCVNtiYMmluWb+ciOUvnbG09+BNKUkmIYaVB3WB9aSkHf85Xvd7R8E9ra
         4CpAKRYzHxtCof5n7Jb9B7MsU9uw2YkLVsE2ux1ZZmidTPs9Q9CyEWmTuzw4bhWqYwa2
         rYrg==
X-Gm-Message-State: AOJu0YyhS1WN5t7dLivEcNFNOt1eB6sB/3kQkyLpbUtvDvvJnIBKn4OX
	SkJKJPPv4uFdVtgNq+/1D6Rscai7ZuGTS6wrM+ekSnsmIZCaWPrQNi3U0/4jApE2l04ZaZP+guu
	JucVYLi+c+WIQYveVCAhqetjDBptRbi12a/X4XjltIWVm7C8/fiAj0nVukVMm
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id 38308e7fff4ca-2ea951ddecfmr84042741fa.40.1717406095115;
        Mon, 03 Jun 2024 02:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNrbHFnrr7U2i5f2P28bJU9GNKZDttPSaEpiR/axgOakGkvJT++VeRbq1nIOoBMsJWVbBVCA==
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id 38308e7fff4ca-2ea951ddecfmr84042501fa.40.1717406094649;
        Mon, 03 Jun 2024 02:14:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68f77ec99dsm199907566b.106.2024.06.03.02.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:14:54 -0700 (PDT)
Message-ID: <dd3f15f6-6e42-4da1-8ed3-3d526f08369c@redhat.com>
Date: Mon, 3 Jun 2024 11:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240525193854.39130-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240525193854.39130-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/25/24 9:38 PM, Hans de Goede wrote:
> Hi all,
> 
> The first patch in this series stops making the maximum number of supported
> fingers in silead_ts configurable, replacing this with simply hardcoding it
> to 10.
> 
> The main reason for doing so is to avoid the need to have a boiler-plate
> "silead,max-fingers=10" property in each silead touchscreen config.
> The second patch removes this boilerplate from all silead touchscreen
> configs in touchscreen_dmi.c .
> 
> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
> best to merge the 2 patches separately. As long as I know that patch 1/2
> is queued for merging for say 6.11 then I can merge patch 2/2 independently
> for the same cycle.

As discussed I've added this series my review-hans (soon to be fixes) branch now.
This is more of a cleanup then a pure fix, but since the DMI quirks always get
updated through the fixes branch this avoids conflicts.

Regards,

Hans



> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   Input: silead - Always support 10 fingers
>   platform/x86: touchscreen_dmi: Drop "silead,max-fingers" property
> 
>  drivers/input/touchscreen/silead.c     | 19 +++------
>  drivers/platform/x86/touchscreen_dmi.c | 56 --------------------------
>  2 files changed, 5 insertions(+), 70 deletions(-)
> 


