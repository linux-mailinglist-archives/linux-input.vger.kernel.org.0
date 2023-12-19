Return-Path: <linux-input+bounces-852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D77817F76
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 02:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D668D1C2195E
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 01:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E5015B2;
	Tue, 19 Dec 2023 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy1UbAlj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D917CB;
	Tue, 19 Dec 2023 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b9e2a014e8so3196252b6e.2;
        Mon, 18 Dec 2023 17:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702950623; x=1703555423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0IzZ7NGTt3ceygRd3fIge/+R8EucqPmRW3ehbqrFx4=;
        b=Gy1UbAljxDbV50JzJ+L66d0fVGlweoogfiH/cjJD4nIV6tCB7Cxo4J6nbRIRBKpdk2
         RrUHQBxNFupDE5N3j6lKzxyuLLi+INRZumSiP/QBqmtUKZJpdr/zKIUcuVKSBkuH5zlR
         7Why5FATks3bkR345+f14UJRVo9Jjqp/PLY93b5l3QHFI18Rkw+5Ug0wAhfUykqAYxpr
         sd5SYHGww1yPppLjobsrMwL59/MpxpFDXpgWM6EJntwjHHA6U4baBrmE69h8zrWqsN2P
         ULrob04LNbctS2H8U8CH+xPfFBuIn+3PXsNHtxh1xyzbahWvXDpkBT79zVy0JTEgmPXO
         U5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950623; x=1703555423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0IzZ7NGTt3ceygRd3fIge/+R8EucqPmRW3ehbqrFx4=;
        b=lvoFNg5VaP5gJlqP5MUSmJeE+elxItAf2uY0a7QA3s/IQVPKsVtrjWw26a/tAUFou/
         0dF75niDzoTrcAsJjO+tJpdwhuq/xzYjPEkyxGDIzcWdvWdHHNnfeBP6b+p0bMRZvY/2
         WMISyrIjfVTMi5iD4Ho4AJ+BhjbmP+bMSFqQB2pSlx5y9OTKQUhUOKRD+TZlzItuIo6P
         ke9K7TyxddQXKxaydUyN2vakAe6X70/bBsCMrVJYhWU+QhN1chy6FtH+KJ3uRLkaMA0J
         C1iwx6QK6VaDl4dZEY/MPbSe2CmMtH9Y5ncBpsebV9aoSoOEPDH1Nb1TwP9CrDl8axpP
         6S+Q==
X-Gm-Message-State: AOJu0YxNfUWQGaAjvUppzKm4NPcRTOEQRtzGVorpujiK8sAuSVkYlBbw
	tv5YxjCLucgkB1WSl8FtGu0=
X-Google-Smtp-Source: AGHT+IEbQHqPCb9R/q/akFiX9xlbS+Py6UAmP5YBrdk82zGKMt7kFLWVMFJwVI3UqJNj7a+ShZm1fw==
X-Received: by 2002:a05:6808:1390:b0:3ae:4cab:526a with SMTP id c16-20020a056808139000b003ae4cab526amr22396514oiw.14.1702950623425;
        Mon, 18 Dec 2023 17:50:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e0f5:2344:80e4:a1fc])
        by smtp.gmail.com with ESMTPSA id ei22-20020a056a0080d600b006ce75e0ef83sm1858380pfb.179.2023.12.18.17.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 17:50:23 -0800 (PST)
Date: Mon, 18 Dec 2023 17:50:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] Input: da9063 - Drop redundant prints in probe()
Message-ID: <ZYD23GEe2Ex-yMLk@google.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
 <20231213214803.9931-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213214803.9931-3-biju.das.jz@bp.renesas.com>

On Wed, Dec 13, 2023 at 09:48:01PM +0000, Biju Das wrote:
> The memory allocation core code already prints error message in case of
> OOM. So, drop additional print messages for OOM cases.
> 
> While at it, input_register_device() is already printing error messages on
> failure. Drop the redundant print.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch.
> ---
>  drivers/input/misc/da9063_onkey.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
> index 9351ce0bb405..80878274204e 100644
> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -185,10 +185,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
>  
>  	onkey = devm_kzalloc(&pdev->dev, sizeof(struct da9063_onkey),
>  			     GFP_KERNEL);
> -	if (!onkey) {
> -		dev_err(&pdev->dev, "Failed to allocate memory.\n");
> +	if (!onkey)
>  		return -ENOMEM;
> -	}
>  
>  	onkey->config = device_get_match_data(&pdev->dev);
>  	if (!onkey->config)
> @@ -206,10 +204,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
>  						  "dlg,disable-key-power");
>  
>  	onkey->input = devm_input_allocate_device(&pdev->dev);
> -	if (!onkey->input) {
> -		dev_err(&pdev->dev, "Failed to allocated input device.\n");
> +	if (!onkey->input)
>  		return -ENOMEM;
> -	}
>  
>  	onkey->input->name = onkey->config->name;
>  	snprintf(onkey->phys, sizeof(onkey->phys), "%s/input0",
> @@ -221,12 +217,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
>  
>  	error = devm_delayed_work_autocancel(&pdev->dev, &onkey->work,
>  					     da9063_poll_on);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Failed to add cancel poll action: %d\n",
> -			error);
> +	if (error)
>  		return error;
> -	}
>  
>  	irq = platform_get_irq_byname(pdev, "ONKEY");
>  	if (irq < 0)
> @@ -250,14 +242,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
>  	else
>  		device_init_wakeup(&pdev->dev, true);
>  
> -	error = input_register_device(onkey->input);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Failed to register input device: %d\n", error);
> -		return error;
> -	}
> -
> -	return 0;
> +	return input_register_device(onkey->input);

When there are multiple exit points I prefer all of them to use form

	error = action(...);
	if (error)
		return error;

	...
	return 0;

Fixed up and applied, thank you.

Thanks.

-- 
Dmitry

