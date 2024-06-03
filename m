Return-Path: <linux-input+bounces-4043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345328D7E53
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 11:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659A61C21578
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A965026B;
	Mon,  3 Jun 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDKN3X91"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929605FDA7
	for <linux-input@vger.kernel.org>; Mon,  3 Jun 2024 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406201; cv=none; b=K3XOBmcKVQUKk+gn3uYGirIEopvQ01i/fGaTyY/LvJikw52lzqVRFePgQxvvC93tCuW49MAauPxGQqCFqYuSEwV1k6QwZspDKLgLzxz5m/5VZfnkYhdQ5Q9rawHFhAjFfsILPkRtgui/w/r5+WKBrD3uDchW4ZnFQ0jZlURFSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406201; c=relaxed/simple;
	bh=ImHt7Zo3bC3AcAH6+P9BA7vqDiszxaZntToY+2lkWmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIe8X2arR2igVvScz5KcilpG1Sx9Qi87QeDzBCARwWobh92ZWGXtkA518OyhVPeHVMHHiChRabztJ4eSXA9fEHoh/o9jShDvxOY44ciJ6yPa1zG+suzZj9ygBgDoc/UXj7eiVtMDzb/DPvFxFBbV5apWfZqc6m8Lbc3Mow0mBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDKN3X91; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717406198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ER449LmaSckkw0lE9Rnq7WLr5seCu4LCDcpsoMn1VAg=;
	b=FDKN3X91xH9V0OEEuo0jPuGYQOWeeFjmHq3UoHjTefrvwXXmesNGxlQDW6kqna9QrN7blm
	KrreNmJ0RERfNhtvKZfvOrjPP6Rgq5vmBknML5WrLngKnLBcFZ4KMWh5eahdhULXUiGdI2
	DjAzd2BVnQ2ExmIcZB8GRu4WSuFZF/Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-tpHIHBLTMNmOBXmKuLg_gQ-1; Mon, 03 Jun 2024 05:16:37 -0400
X-MC-Unique: tpHIHBLTMNmOBXmKuLg_gQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a68c8de898aso60350366b.1
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2024 02:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717406196; x=1718010996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ER449LmaSckkw0lE9Rnq7WLr5seCu4LCDcpsoMn1VAg=;
        b=siVKMoEZEFZGIkhKTuSf65KucqrgTqah9lzqzgXd0shGgf6Wv0qd2ejuDqT8T0hvN5
         H7sOPzpbL+5cp/4KjpvCez7krWaZFYZjDR+sVYBSLTK+L4DshfUK06LgGJwgYHUUrwYq
         1uBYlju1uEVMvUeMsS9GAYVGdZxGmHTU8ixZNz1v1Szw2xB66KDiNYqc1RKZ4gWlUnkO
         2DmUDXMAwb4ls7ma3vJvW+Hr2lOwgk9d633sSdnTfuNU9OSj+ld6MB1Bh517ncvObrki
         piOmbrZL+Evs+ONctyTYlkMk+dvbneReNaspAeKmFG1mr2IPXMZ6NhAEPStMRZOqgM9A
         s3bw==
X-Forwarded-Encrypted: i=1; AJvYcCWvjXLsfMXAYAgNdVKL2AQ5YZRe3jpDH0w8HrHqGirVQAUBInMenrBi15Swj6WCOS0/ADyyQ//eI3obdRI7GFGMd7QcX8P8cweZ050=
X-Gm-Message-State: AOJu0YySs0ISOd2ux+mJ9CqVzI+ykYpB3SNtmGj1Y08wnH+sJqkz6/VL
	cSPhCHJRqiW21EXb9EOWVZItrgrUdg97QyI+zAxqHqheK087ali1fmm62Qnu+H551N40sN4TVyh
	LKQ7C78w8u/vW8NaH2zhfiHzcTxiIERKyHfZm9osm4utgg8vFdYEi+oU5E6Q4
X-Received: by 2002:a17:907:3fa6:b0:a69:180e:9dde with SMTP id a640c23a62f3a-a69180e9e03mr102605966b.26.1717406196061;
        Mon, 03 Jun 2024 02:16:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7yp9unRJH++xLy+GgIWNG4UQ4k52l26EQdjCKCjPLXFaFHYNHG+T5/e4WkozKTS/UOAX1Wg==
X-Received: by 2002:a17:907:3fa6:b0:a69:180e:9dde with SMTP id a640c23a62f3a-a69180e9e03mr102603466b.26.1717406195678;
        Mon, 03 Jun 2024 02:16:35 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68fbf068fesm186916366b.26.2024.06.03.02.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:16:35 -0700 (PDT)
Message-ID: <6629757d-fa07-450f-9de8-bcda54d42067@redhat.com>
Date: Mon, 3 Jun 2024 11:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] platform/x86: touchscreen_dmi: Use 2-argument
 strscpy()
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jorge Lopez <jorge.lopez2@hp.com>, Li Zetao <lizetao1@huawei.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Mark Pearson <markpearson@lenovo.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
 <20240602090244.1666360-8-andy.shevchenko@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240602090244.1666360-8-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/2/24 10:58 AM, Andy Shevchenko wrote:
> Use 2-argument strscpy(), which is not only shorter but also provides
> an additional check that destination buffer is an array.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Since the code being modified only exists on the fixes branch I've merged
this as a fix now.

I know this is more of a cleanup then a pure fix, but since the DMI quirks
always get updated through the fixes branch this avoids conflicts.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Regards,

Hans



> ---
>  drivers/platform/x86/touchscreen_dmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 2d9ca2292ea1..879a63e4ecd0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1907,7 +1907,7 @@ static int __init ts_parse_props(char *str)
>  	u32 u32val;
>  	int i, ret;
>  
> -	strscpy(orig_str, str, sizeof(orig_str));
> +	strscpy(orig_str, str);
>  
>  	/*
>  	 * str is part of the static_command_line from init/main.c and poking


