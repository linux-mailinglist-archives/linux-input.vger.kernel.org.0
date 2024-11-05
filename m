Return-Path: <linux-input+bounces-7864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAD9BC4E6
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 06:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905A02830DC
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 05:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468D7126BEE;
	Tue,  5 Nov 2024 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNRpgiKs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07F23BE;
	Tue,  5 Nov 2024 05:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785729; cv=none; b=HoEepKU6jgm/k2M6wQtx0Oi0xssgmZDQwzktKSLU47t2Uzu2UcZRETZiSgGi0K4TvneqYcSgl+gmuq8FowDNFQE+08ZpYquwKVs/2M9EIawRaXZ5hiyCT70A6vt07ANyXFo8EcUFkZaNFR7LP+s5s7gP+dp5hO40m5KHvlNl29o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785729; c=relaxed/simple;
	bh=plWhkMM9DMyZcPEJcHRaAyB4kLecpKMX3UbDVGiBikM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czN/LJkjp3xVRRniNeT2V9rBWr4N85z5KGunyLSLAYJQjco0ozr65m+n9HE4Iju7qAI/sCHZV3SGk2Lk/JOPvoaINdjQf5IfxrraHVw38qt3OmEoYZjm+hSRU52wwNrhgw3PiHBMRNJvK5/HkWVw1w9q5VJYPad9e/O6witGV4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNRpgiKs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72097a5ca74so4793936b3a.3;
        Mon, 04 Nov 2024 21:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785727; x=1731390527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rt3oCNO/Mms9lJTaH1KqVGhms1p5GyyIrIQr/7bq/oQ=;
        b=PNRpgiKsVRHBPJkkErJhrJapYv9t594H2oVwAux2e2O4gH2Qt/b1gOHHFCfDWbmmuO
         40YtRWY6H8bVT8Oo369ihxNa7uetb8NmoH1h7KRzHFLjkKnK0ZklcHFU47elFEb2Ewbf
         ROdBIe5ayrO3vf5NmwJFp7G6ZKPYqhZSiTvkKzxj4BssOLra5Y57ea4K4OizU2qWe0a5
         1q1uVOHakWs5ybAI8FX5a74y250Z9DqdGvdVWGK4G6lJkBWPzj2yduS6j+han8GCmTB1
         kCd5CJJxqomzLM64YhlDLIvNm/HlZ6HPjCfWM31CTlAb1jz3oFA/pYieiv8xvj4gFQbB
         LyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785727; x=1731390527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rt3oCNO/Mms9lJTaH1KqVGhms1p5GyyIrIQr/7bq/oQ=;
        b=lGweOa9qcezU3X4i5jjYsyQ4Pr5EkmKRnk7y6PfA/icxpTcpE08uR9O8ghDyi4QUbk
         aBNmJm/x08ahsnXGsUefCU4sSLp/huTTRGmARAd3J3yoFoIG2xoyDn++yMN4vF4gJJCj
         rw4X3K3+b9NwmgBYHe9gyJ6LjwF4Uz6R+DOQeAlodTgBZfBRJgLqlIJKuQxjcPtrMwRZ
         r5yk/ENMAPEXGsLNvstJXvoX+S0/7ImADbUbxRm07nV70oIcR64ENcY3NBLhzI8RxEtd
         YrDVX9oXOVwNIjgq1IcL1R/iJtTIA9YFActpf4mGpYJnocdMRSL8dAp4H60DCGdrxY6l
         6WVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzgSAbsIEfLueqksl96SXnKI8OHoL8WBo5OkL9gVBFLnh+WwEjPo2fMIb9rj3DnjyDGxXIFgUpqIkUYQ==@vger.kernel.org, AJvYcCVwC0MvbA7cMUSCpzWSigcGM55nvuH7SqKnEweWq22gNDi25mMzqWk2jdSfcynlLWYOQh5YxFO334QbIZob@vger.kernel.org
X-Gm-Message-State: AOJu0YznCEujNl6LvKlvj1Bu7sKmXHxURcAXj3DrQah+f3ZB+C3qPx4e
	nolsF1R4QhIl5Dm3pzCiRZ0F7j9aOr3LwIwBE4vCWju+H7JOq2cK
X-Google-Smtp-Source: AGHT+IFXZsu1GL9Bs4v5jowcGu70iYaX4EvplHIXSm76zYns6IOj6e+f90tUgH4PjGjEcqvAREhnhQ==
X-Received: by 2002:a05:6a00:2e12:b0:71e:452:13dc with SMTP id d2e1a72fcca58-720c9908550mr20217340b3a.13.1730785726895;
        Mon, 04 Nov 2024 21:48:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e7825sm8536352b3a.76.2024.11.04.21.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:48:46 -0800 (PST)
Date: Mon, 4 Nov 2024 21:48:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH V2] Input: bbnsm_pwrkey - add remove hook
Message-ID: <ZymxvLMkkktRoCXZ@google.com>
References: <20241104031552.3475108-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104031552.3475108-1-peng.fan@oss.nxp.com>

Hi Peng,

On Mon, Nov 04, 2024 at 11:15:51AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Per Christophe JAILLET
>   Use remove, not remove_new
>   Drop checking bbnsm pointer in remove
> 
>  drivers/input/misc/nxp-bbnsm-pwrkey.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> index eb4173f9c820..f0bf119309dd 100644
> --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> @@ -187,6 +187,16 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void bbnsm_pwrkey_remove(struct platform_device *pdev)
> +{
> +	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +
> +	dev_pm_clear_wake_irq(&pdev->dev);

I wonder, could we have this done in the driver core instead of
individual drivers?

> +	device_init_wakeup(&pdev->dev, false);
> +
> +	input_unregister_device(bbnsm->input);

No need to call unregister here, it should happen automatically.

Thanks.

-- 
Dmitry

