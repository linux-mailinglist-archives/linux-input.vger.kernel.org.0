Return-Path: <linux-input+bounces-4544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B09127D2
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 16:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE971285A66
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 14:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92F519479;
	Fri, 21 Jun 2024 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqv/MoLK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF82C6A3;
	Fri, 21 Jun 2024 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980295; cv=none; b=iH9GApgQTkZhvcEix/CoeauS2fGtTBA8/EI2+MFf0ei7Yx3vB+GkviIWD5Qek6OhBs8mCqQ3gJ8RYoPReey1h7iHMvF5pKCFgJuleh2SwXm2ZYyOVCoUFOenbhGSzTbeunyavKQ+rC0p1Ik6LuVq6ZwdXTw16ItDuqAuYc94uFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980295; c=relaxed/simple;
	bh=XCbt65JM5drL3RAmY/zdyFoPmP4wbwjd11pSuoOxVFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpt+EpT9+A9LUkGjoLDhb0bINuJJbsUATxQMzugsoVjw9o2xcXIidLHA39eC5Fm3TktMed1afnwwPv/uHXZ42k00RGAWZn0FIQePqid0HTaalw1ej82LlJgkt129oWRjNrWV653woUMUXlXiKOP9oYIT7/4WpbtZAFBFxgttOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqv/MoLK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3636c572257so1902365f8f.0;
        Fri, 21 Jun 2024 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718980292; x=1719585092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TxWzOS2rlgnTib80uuvc9FbJTTdOcXThAdpc8WlZls8=;
        b=Iqv/MoLK0I00yOkLjnDQBkqasz1N4h7ShKPK19gCfWfEGuNyJAU60B5hdmhQf/dS1A
         /AMvkhAOV0nrNDREuiInDnRdcqsbU/gx7PtlQnAxb0A7tlU1snB95z78tpeebwgmkwVF
         Ae0ZbI2godh7D82pLgkqVCGSOrspSphg9zocBHIPvLG+SFwhUP8UBx2XIoEy9bJPaWkt
         QTS6DsFdFVQ+UZabhhIgGCZuiAzrfuQTYhcJ5roKGiFB7RJHJEQbMwCEE5qamli8DvLG
         2/HO5fUHvWgz9Oxgt50Q2haHOvazpxBVzQRSioo2I34YTHJP+hQSCpK2IxDnkRZb60xn
         bvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980292; x=1719585092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxWzOS2rlgnTib80uuvc9FbJTTdOcXThAdpc8WlZls8=;
        b=oslzIYjQ3q+ZHeY4vsR16SaQrIzTm99+ksBleOgtQ7YSibI+94dyY8XEkEjaoxKP2s
         A6oRitexkko4EOfGZfkNky0Y2ZVEgSPbjNNYYkOfTxt95B1YTeqptN9YlsOc2SbA1/HU
         DVQvwmy3Xbo71tG+1sFKxvC7SicWmsRnFQWJcFL3uyMT90onng0CselKrBuC6AJQYIi/
         qVaMERcT+9+UYzNe0716wh+udgSsK2TRG3cskZrcf2ANv9+spZeuD+Ri7S1Sch1AwC72
         vv5ZIxC76mjalL2qTkES/uklj5TgO/MoiYkWr1G/M2++CiuD0SGidNat4kiY7ytavqoW
         5rPA==
X-Forwarded-Encrypted: i=1; AJvYcCV6i0VeYaGUpFIav+Kxa3gGBpZVNz5JMkdipwpWrfpt+t87i38a1/Ijihgn21H0iYtbRMSMjZfZKZ95oGSIo3mKqjh+f1gQCIT/oVMLCeBXx83jwqTuPPBs1YyHkMzfrhgbCR4qCE3e99srpW8vzYNaFwmFRDxT4k8goP4e50YCFFJMyS3N
X-Gm-Message-State: AOJu0YztW6c7YLFEY5kW53AP5/gR6iEfY1xZzpJj/dW2JqvQgXiVoGwD
	fxIrlUZNRmIMemL1zWVACnep0moaj9DpMGtS82nurciw7PqnT7yc
X-Google-Smtp-Source: AGHT+IGb2Il+nEdX/84tcJeogeC2bwTGt+Ya62nxkHpXjgWZeTlpmlbCuGXS9elNN+BSnuxUuQ5Nkw==
X-Received: by 2002:adf:f791:0:b0:360:79ae:dd26 with SMTP id ffacd0b85a97d-363170ed429mr7981784f8f.7.1718980292272;
        Fri, 21 Jun 2024 07:31:32 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:b162:502a:9bd1:4c8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b4ad8sm30062715e9.21.2024.06.21.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:31:31 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:31:29 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 4/4] Input: atmel_mxt_ts - add support for
 poweroff-sleep
Message-ID: <ZnWOwZ1u-eqs3aDW@eichest-laptop>
References: <20240417090527.15357-1-eichest@gmail.com>
 <20240417090527.15357-5-eichest@gmail.com>
 <ZnOCDaetFnsg09if@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnOCDaetFnsg09if@google.com>

Hi Dimitry,

On Wed, Jun 19, 2024 at 06:12:45PM -0700, Dmitry Torokhov wrote:
> Hi Stefan,
> 
> On Wed, Apr 17, 2024 at 11:05:27AM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add support for poweroff-sleep to the Atmel maXTouch driver. This allows
> > us to power off the input device entirely and only power it on when it
> > is opened. This will also automatically power it off when we suspend the
> > system.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/input/touchscreen/atmel_mxt_ts.c | 71 +++++++++++++++++++-----
> >  1 file changed, 57 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > index 7c807d1f1f9b..f92808be3f5b 100644
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -317,6 +317,7 @@ struct mxt_data {
> >  	struct gpio_desc *reset_gpio;
> >  	struct gpio_desc *wake_gpio;
> >  	bool use_retrigen_workaround;
> > +	bool poweroff_sleep;
> 
> Why is this separate from "enum mxt_suspend_mode suspend_mode"? Can we
> make MXT_SUSPEND_POWEROFF and use it in mxt_start() and others? It still
> can be driven by the "atmel,poweroff-sleep" device property. 

I agree and will change this in the next version.

> >  
> >  	/* Cached parameters from object table */
> >  	u16 T5_address;
> > @@ -2277,6 +2278,19 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
> >  	release_firmware(cfg);
> >  }
> >  
> > +static int mxt_initialize_after_resume(struct mxt_data *data)
> > +{
> > +	const struct firmware *fw;
> > +
> > +	mxt_acquire_irq(data);
> > +
> > +	firmware_request_nowarn(&fw, MXT_CFG_NAME, &data->client->dev);
> > +
> > +	mxt_config_cb(fw, data);
> 
> Is this really required? As far as I know all maXTouch controllers have
> NVRAM for their configs and should not lose configuration even if power
> is cut off. In fact, the whole automatic request of firmware/config upon
> probe I think was a mistake and I would like to get rid of it. In fact,
> on Chrome OS the version of the driver in use does not do that and
> instead relies on userspace to check if firmware update is needed.
> 
> If this is actually required you need to add error handling.

You are right, and the configuration goes to non-volatile memory, so
this is not needed. I will remove the firmware loading here and improve
the error handling. I will keep the firmware loading in the initial
probe for now, to be consistent with the non poweroff-sleep version.

Regards,
Stefan

