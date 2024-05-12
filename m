Return-Path: <linux-input+bounces-3688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8F8C36C2
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 15:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8A61C20909
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 13:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA4923775;
	Sun, 12 May 2024 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rh6N1gdh"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E84210FB
	for <linux-input@vger.kernel.org>; Sun, 12 May 2024 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715522119; cv=none; b=JMsVb5+yymdR47IIJ4DOSkXXP9gX4zrmPNck5pO38G3I+w/MKSlfc8xOITwtG5NRpeXVejn4j1U4GX14ynRrYVbHmEvlOUzYyRr7zIj5ZIusiLPzvd2+8K5lpq570NMSlq7lY5IaEORYlR2kTzPXaDVsokQ/dJKZSRJ4vabgjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715522119; c=relaxed/simple;
	bh=QzWIjhiIW1aFIbIhMjmlJIAZhe/Sp3sb9SM0pcpMXm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUNHF7+g1GN6ur32CsX7hHQywbUyjnl8OHoMmy5Gf+1RNgAnwth2P6SlZTCNFKk4opjUUHcNRQJF9BXXNB43XeBX3WN9of7jVa0omU6KyOcgC7BujJsNDT2x/IU5jtTwqT7B8NJ0RQHDwGe7hq/l4z20lFTCgAFSsNC31XCij6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rh6N1gdh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715522116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/r0A7TPkHZGpSI3kSzq0XZsCei4tDjmUynzk4cOnsI=;
	b=Rh6N1gdhlsWioVdnxNoYpatfxMbuCzBTn+UAozqgQ0OZurZ9Bo379qTtzG/HprQ++SLya6
	KrQ6b8I+pLbRD+l1nFfnErDxgTtpviDQPNmI3UqkiQzmxWE+unagZHDV/j8NNSmg0AW/Vl
	DawQJRiZ8XUQqorsquVcCj6+N2v5/pU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-cUjinokyPT-ldrNqmtLsDQ-1; Sun, 12 May 2024 09:55:14 -0400
X-MC-Unique: cUjinokyPT-ldrNqmtLsDQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2e1f38cb631so31327451fa.1
        for <linux-input@vger.kernel.org>; Sun, 12 May 2024 06:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715522113; x=1716126913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/r0A7TPkHZGpSI3kSzq0XZsCei4tDjmUynzk4cOnsI=;
        b=eiM5g+M/SG8OE9gTMarJCOnM2VY9zTjEBNb8ZQPn3A4ls9OGeplgc4c3RXa8G5bnAB
         j+c4NPsp1EdA2knUHItROYY8Gxcij7sEjRPFWMLxnf69Am9d31Y/QQVLUrnkAWEwVteZ
         RZ9mg+N3mH2ti/x3yYnppbHs8jFoHcVPFVTSzC11EovT5RYsPWx8LOUEHAUrBsCsv8xO
         Itnw1mEKHSGH9QScp6IGC5o0ayyTLnd8Csgh+d8bWzFKkAN4wcARP4TPSyXoipY/qGX0
         VfqOaRPeqn7K4xvFD28SzkcTmB9j8rR5UVIqjxIbil2oqK+M/Zq2TuOKtxq60I2iS171
         sCqA==
X-Forwarded-Encrypted: i=1; AJvYcCXkiQLC7F6tMjATdM2tjNz68iQnzT5nujw8AxjYAtp4Xqt7opb5/PYgvTXv+3wFF3ZlrKvpW2bnHNt9A5+qRaE8mqvFsBicp+kWOeU=
X-Gm-Message-State: AOJu0YxY9lORPGed40fGAiuFoc9aV4VY6LFPLOygp9HXpAqyrCBb+3qm
	3UYFZzDaZ2YEKgtzcCIhLa5L3230DnWtATnCNeqDOQf5qi43vfyy7XoiIhj1mgkv4V9aNmcMdZg
	WQPNEDoL87oCOPZHemeW5wbU6Ko7WfxqqERppmAsU2bNB0958JXJhmmvcHNBC
X-Received: by 2002:a2e:954c:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e569571f3amr35927971fa.4.1715522113198;
        Sun, 12 May 2024 06:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhPImeqHdj7RC0ZYwwkh8BAqDqXDeq0j+HJ2a85twhLE+tGMBO4C8LqXyu6uCaufPlp77uZQ==
X-Received: by 2002:a2e:954c:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e569571f3amr35927831fa.4.1715522112795;
        Sun, 12 May 2024 06:55:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c699sm458503866b.53.2024.05.12.06.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 06:55:12 -0700 (PDT)
Message-ID: <dd84ba87-b546-41ec-9cbd-9e6d0fa35476@redhat.com>
Date: Sun, 12 May 2024 15:55:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: chipone_icn8505 - remove an unused field in struct
 icn8505_data
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-input@vger.kernel.org
References: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/24 10:25 AM, Christophe JAILLET wrote:
> In "struct icn8505_data", the 'wake_gpio' field is unused.
> There is also nothing about gpio neither in this driver nor in the
> data-sheet.
> 
> So, remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> Compile tested only.
> 
> It was added in the initial commit e7330fa032bb ("Input: add support for
> ChipOne icn8505 based touchscreens") but was never used.
> ---
>  drivers/input/touchscreen/chipone_icn8505.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
> index b56954830b33..c1b4fc28fa8d 100644
> --- a/drivers/input/touchscreen/chipone_icn8505.c
> +++ b/drivers/input/touchscreen/chipone_icn8505.c
> @@ -68,7 +68,6 @@ struct icn8505_touch_data {
>  struct icn8505_data {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> -	struct gpio_desc *wake_gpio;
>  	struct touchscreen_properties prop;
>  	char firmware_name[32];
>  };


