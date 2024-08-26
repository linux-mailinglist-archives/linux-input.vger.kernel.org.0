Return-Path: <linux-input+bounces-5888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBE95F985
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 21:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E7D2805F7
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 19:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC374199225;
	Mon, 26 Aug 2024 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEwyIGLw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F6198838;
	Mon, 26 Aug 2024 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699884; cv=none; b=DfKETvXQz+feHZRn9nw1clDaKJumH1LOc6J27YccJ2yLQUidc/+4AyDN0denC3Q3N6amLE8j/14JcnIWr4BvVxQ/sLnIFr1LC8EfRSnLosMp24dAJUHSd/qVuv4mtx2EN3zrSzuKpA6IFk9R5Tpiae50J65Ku7Zd92eyUhWc8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699884; c=relaxed/simple;
	bh=476Vr14ljCAg86ulRyF8qBXInnpjefzfqCzBtzB5krY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhOYIXmpVXf8eENiSE+jCBEarf/m+ZkMq/jPqmhkAa3pGi1BsM+lFB+NUMUmIGWnm+LzcJt2CZHJ7LnSJRT0O61uGKaFll1YLi/2wPnhaxeIzJ37adIeUcZ8Hg1XNT/ZrlgoYphHpN+3Ke3yehut9ExY3RT4XryZeuJqSh6cN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEwyIGLw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7143ae1b48fso2657501b3a.1;
        Mon, 26 Aug 2024 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724699882; x=1725304682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2TYhB4X6aKezDz5Iwd0lSG7y3B/W6Y61QRao5geoKM=;
        b=GEwyIGLwdoklLYQhtOgf2FqzZ9rZSEX8LiprgZ8v330zS99b/qH1eAoEncZ2ibGg7S
         fqiFzOmlUWUqw22P56qEgojg1DpyGwTimv3hUFWWqNerwIniaUrFRozw8vHT1e1YS52E
         w2WntGwSjSfcs1mDLiMhW4nzFZIaQ14TgIOpNYrGt0o3EAO51fUgJ5+mcvbZLPS3YBUT
         5PujbZQLGQHcj7hIhF/azu0OHDIoE2+Kg1mJWZN03v1mqV2Q06lYzAQ0+HJKKV/kRpk8
         X5x6r8bUiVJSwBywT+JDcm9cWjMyMKjO6XK+tiMk+VJfS4lwRxSY9ra2P4T+sCnpfiLr
         xT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724699882; x=1725304682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2TYhB4X6aKezDz5Iwd0lSG7y3B/W6Y61QRao5geoKM=;
        b=cg6jUEVJtAHn4gWlnurbwOhvnh4wEdaq7JypIu0Wml5OM7RekMi+Wr5WkGeTXCAvyC
         hunFg61FNJdJLxHnZoYAJqSF2fgoU1fbvM2fW1l30do9dmoU4XRNSO/7g9wX2wy2VYrY
         tEoxfkfAWqiWgkkkbk2t16vO/PffpoFCLD+sV2WdcqgxYd7B+fj7cKGI8EMeBBRvhN4L
         3K67dWr/uAMO7OouY1hDpzKkUtw7CqFrzdy62PmlnZ0cSCmGLKnbaC0xD5eLErga7QSO
         w7Fw1TEOyl0QNG7QkPS7ieRE5zmQtBm5hrMnoISnFg0L+5EB3kNdkfg2tsLDN1/7Rex4
         RBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp0MMf4SEi6/vd42lWv1R7wBnVoWYZuozUuYfW1+nfJ3M40DDecBhRU91u3YHEsv93IW3Gf40XTpaC4abb@vger.kernel.org, AJvYcCW0CqP3DiWV9IObZTso790SRBFszvmgsncf8E4r9KaEIowuqsaproi8K4CQYjd/ymY075UJMEf8YOUlWg8=@vger.kernel.org, AJvYcCWoiVngbVeXiD5vB7tQVK6+t2621IIEkbv9wOM1x/XDQ/QWamIR8OcLa9dxYXuQ7K/t6HD4pu14XwK3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61xJ+9W9ghmJCz4reKyAx6C2crtjJunSLW48aruOa0uDxHGxP
	zXD7oanZNxwlzYQWZRBMGmypCgEstH6rdIsY7I4vmCTKugoMbIdEWfyAIQ==
X-Google-Smtp-Source: AGHT+IGDDl5TpnRaUknWm6+yEglC5u1bH2oXfmR2MhTN08egvLn3pvbBrhb0coEXVMOqW6zr7pT3uQ==
X-Received: by 2002:a05:6a21:4603:b0:1ca:da81:956c with SMTP id adf61e73a8af0-1cc8b41a39amr11864455637.5.1724699882183;
        Mon, 26 Aug 2024 12:18:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430cc60sm7338923b3a.154.2024.08.26.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 12:18:01 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:17:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: utsav.agarwal@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Oliver Gaskell <oliver.gaskell@analog.com>
Subject: Re: [PATCH RESEND v11 2/3] Input: adp5588-keys - add support for
 pure gpio
Message-ID: <ZszU5xzd6S8JKd5E@google.com>
References: <20240826-adp5588_gpio_support-v11-0-3e5ac2bd31b7@analog.com>
 <20240826-adp5588_gpio_support-v11-2-3e5ac2bd31b7@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-adp5588_gpio_support-v11-2-3e5ac2bd31b7@analog.com>

Hi Utsav,

On Mon, Aug 26, 2024 at 06:22:02PM +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
> 
> Keypad specific setup is relaxed if no keypad rows/columns are specified,
> enabling a purely gpio operation.
> 
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 37 +++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index 09bcfc6b9408..7c32f8b69a3e 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -188,6 +188,7 @@ struct adp5588_kpad {
>  	u32 cols;
>  	u32 unlock_keys[2];
>  	int nkeys_unlock;
> +	bool gpio_only;
>  	unsigned short keycode[ADP5588_KEYMAPSIZE];
>  	unsigned char gpiomap[ADP5588_MAXGPIO];
>  	struct gpio_chip gc;
> @@ -431,10 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
>  	kpad->gc.label = kpad->client->name;
>  	kpad->gc.owner = THIS_MODULE;
>  
> -	girq = &kpad->gc.irq;
> -	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> -	girq->handler = handle_bad_irq;
> -	girq->threaded = true;
> +	if (kpad->client->irq) {
> +		girq = &kpad->gc.irq;
> +		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> +		girq->handler = handle_bad_irq;
> +		girq->threaded = true;
> +	}

I think we should only set up irqchip if we have "interrupt-controller"
property in the device tree.

>  
>  	mutex_init(&kpad->gpio_lock);
>  
> @@ -632,6 +635,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
>  	struct i2c_client *client = kpad->client;
>  	int ret, i;
>  
> +	/*
> +	 * Check if the device is to be operated purely in GPIO mode. To do
> +	 * so, check that no keypad rows or columns have been specified,
> +	 * since all GPINS should be configured as GPIO.
> +	 */
> +	ret = device_property_present(&client->dev,
> +			"keypad,num-rows");
> +	ret |= device_property_present(&client->dev,
> +			"keypad,num-columns");
> +	/* If purely GPIO, skip keypad setup */
> +	if (!ret) {
> +		kpad->gpio_only = true;
> +		return 0;
> +	}
> +
>  	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
>  					     &kpad->cols);
>  	if (ret)
> @@ -775,6 +793,11 @@ static int adp5588_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	if (kpad->gpio_only && !client->irq) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
> +		return 0;
> +	}

This is way too noisy. I think one message logging the revision ID
should be enough. The rest of the data can be found from elsewhere if
needed.

Can you try the below on top of yours? If this works I'' squash it
together with your change.

Thanks.

-- 
Dmitry


diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 7c32f8b69a3e..b5f4becf5cb6 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -432,7 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.label = kpad->client->name;
 	kpad->gc.owner = THIS_MODULE;
 
-	if (kpad->client->irq) {
+	if (device_property_present(dev, "interrupt-controller")) {
+		if (!kpad->client->irq) {
+			dev_err(dev, "Unable to serve as interrupt controller without interrupt");
+			return -EINVAL;
+		}
+
 		girq = &kpad->gc.irq;
 		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
 		girq->handler = handle_bad_irq;
@@ -640,12 +645,9 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
 	 * so, check that no keypad rows or columns have been specified,
 	 * since all GPINS should be configured as GPIO.
 	 */
-	ret = device_property_present(&client->dev,
-			"keypad,num-rows");
-	ret |= device_property_present(&client->dev,
-			"keypad,num-columns");
-	/* If purely GPIO, skip keypad setup */
-	if (!ret) {
+	if (!device_property_present(&client->dev, "keypad,num-rows") &&
+	    !device_property_present(&client->dev, "keypad,num-columns")) {
+		/* If purely GPIO, skip keypad setup */
 		kpad->gpio_only = true;
 		return 0;
 	}
@@ -793,28 +795,19 @@ static int adp5588_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	if (kpad->gpio_only && !client->irq) {
-		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
-		return 0;
-	}
-
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  adp5588_hard_irq, adp5588_thread_irq,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					  client->dev.driver->name, kpad);
-	if (error) {
-		dev_err(&client->dev, "failed to request irq %d: %d\n",
-			client->irq, error);
-		return error;
-	}
-
-	if (kpad->gpio_only) {
-		dev_info(&client->dev, "Rev.%d GPIO only, irq %d\n",
-				revid, client->irq);
-		return 0;
+	if (client->irq) {
+		error = devm_request_threaded_irq(&client->dev, client->irq,
+						  adp5588_hard_irq, adp5588_thread_irq,
+						  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+						  client->dev.driver->name, kpad);
+		if (error) {
+			dev_err(&client->dev, "failed to request irq %d: %d\n",
+				client->irq, error);
+			return error;
+		}
 	}
 
-	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
+	dev_info(&client->dev, "Rev.%d controller\n", revid);
 	return 0;
 }
 

