Return-Path: <linux-input+bounces-6155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F896B947
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 12:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD07B24DE7
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 10:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1A61D04AB;
	Wed,  4 Sep 2024 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbKFNTJR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19F1CF7DA;
	Wed,  4 Sep 2024 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447050; cv=none; b=rmMA38x6GEucBLCrvMDnLCZYwgsq4gVFGz/Hs2/vybhhjYfhj1nMqU2GAL/bP7bPJ+bfGvD0TdiRCBSY5l5Vcrq4a2j5BQ0WiwHXRac+oLL10pT+w3BgIrsKQmIHb6y3aQqe8wKBuwnZfmp0XORQTxgAakmdVkrClpmlMlvbKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447050; c=relaxed/simple;
	bh=mKNch3+QXegszsSSzEUYVAwlQVUK/eTsEY9VYCeHyEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZQYhPt0ERmHQYer0opuYF+oLfCkorQGjOjaQny+UmOWhoMpFPHcu6SnZN5g2sT36m9eAF9AM+ttZRGk6CTG9BehdKfobMdgMAxMNilpTjn7RY7o44vnFtCAMLEYWSBdnbOSe3Urc862BRfAmVnQ5eFrTz3IH5/SQo7FPmViO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbKFNTJR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-534366c194fso5911281e87.0;
        Wed, 04 Sep 2024 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725447047; x=1726051847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNqCODUpT40uEeijJopg/y6lJF5M2iFuwNynTGFfhxM=;
        b=DbKFNTJRTRbp3QOmBG77AqV+0uBMRyUkSaAefTBSdTF6ke/GKZdVg/V38VDyD2TdVh
         3sSNpct7Im7ZS9hSJ8qe17lv/HGevuWW4pMii5LXG8pCGcOSe0XyDKdI7IERnF3L9n0a
         An8kaLdgv9xYlyeuAcz0CcJo2xATEvZuDZ1IaQVdLT3gyqy9cb/yuQXNtkDMdxkcuhc0
         h+dI3BgDzcf9JD07gjUsEuiA4jt3k1CTWln3GY5qEe5kfG6ZCopXf7kbBZjkfELsVNEB
         UXmht5tlFwTHcRTf8NCJQkiy8p5YJeqAcWz5VRw80H41ilxfZPpcCrbX9FxnnBxVuU11
         M0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725447047; x=1726051847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNqCODUpT40uEeijJopg/y6lJF5M2iFuwNynTGFfhxM=;
        b=Czsf5RUD5RzP9buHw3J132ggu6332drnEHDwN1Eu2vBRabeVF0vrPOpgteUoq6ZRWk
         wIdSfQ+kj1BU3GxHCynCEUYfD0CH9FBYI9fAyM6bLTukizlsFU3nS2CKQYRsBAzdZd78
         NdWmIEWWkgC+vdutfZlNzuSYfbk5wWRaEIwbecByqW+lDBxYBJZqFSG7ASSJIcMGa9A7
         4ap298CQRkoSrAfeMApX15Xo7nQ/vFrXm8JPB3dDK2H19mwsS+P7SrESG+ccoFz/fBvQ
         AVtbDneVacO2aIFjj0Zsy0O0DXqkR8IoGgvFTou34cT7ITqM09fJEAwcytnf7VV4o3zV
         bydg==
X-Forwarded-Encrypted: i=1; AJvYcCUcLijgKWTFJw3l9O5sfnvrLd36zD7ZBAaR+JkwSR2jq/RxTw4MNjINuf8CqtBWxmJTX0glUyMl2b/T7shd@vger.kernel.org, AJvYcCWBuuR2/BI1wtFNi2ccmipnyVhXwsTsT9m5k5YWWQbgIcqnUUb8Q8kYyYGpquC3vNMvrnmjKUKmjrvRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYAkgvIFDsQavwbqxE6Now2LwpNnaWoUFogVatqfkMScH5nhAF
	eKH1rK8nzECcJQxkshHctiokk1yZ1ugHN1AWLB18garvuhHnrEmx
X-Google-Smtp-Source: AGHT+IHxbk+krZUUsR0Zl5NFKEJ4y1FAkl+Bz+M4t90ApjmlfY2tpQaDBHpaSHokdKwHIyHsh6pZ8w==
X-Received: by 2002:a05:6512:138e:b0:52e:9b15:1c60 with SMTP id 2adb3069b0e04-53546ba9d09mr10414358e87.48.1725447046256;
        Wed, 04 Sep 2024 03:50:46 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989035f02sm790230066b.89.2024.09.04.03.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 03:50:45 -0700 (PDT)
Message-ID: <f0956e79-8261-4bd5-96ca-3795bbe1faaf@gmail.com>
Date: Wed, 4 Sep 2024 12:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 04/09/2024 06:48, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index 9ca5a743f19f..d9b87606ff7a 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c

...

> @@ -2818,9 +2813,9 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
>  				 int reg_grp_index)
>  {
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *reg_grp_node;
>  	int error;
>  

Nit: reg_grp_node could stay at the top (where it used to be), as you
are assigning it to NULL because there are no sensible assignments at
this point.

> +	struct fwnode_handle *reg_grp_node __free(fwnode_handle) = NULL;
>  	if (iqs7222_reg_grp_names[reg_grp]) {
>  		char reg_grp_name[16];
>  

Best regards,
Javier Carrasco


