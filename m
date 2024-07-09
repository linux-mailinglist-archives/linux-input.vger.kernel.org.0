Return-Path: <linux-input+bounces-4914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988392AF2F
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 06:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB281F22345
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 04:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAA312C52F;
	Tue,  9 Jul 2024 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeV1ScEj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EC29CEA;
	Tue,  9 Jul 2024 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720500943; cv=none; b=lPcgWrZCbo7mZ0XIW8Y0ly257uXO3ulh1l9T+MdsNNY03aED1XaNUqT8SdFqLOaXhmkwV4dayzztMo3w+PyFOvR8AfBCDFlDgH3yi1d5pd2CNullSGnWMgvWFLXNav1JodK0sXNGo2HIecFq/4poXgsafxN5AaLzythn+tvFeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720500943; c=relaxed/simple;
	bh=eHlJaYGkVYm28d+8Yw6VuGyew1kE2JhPT0Et+UQxfhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aA2AfDe83D22s2PEAK4OkLky/dfFVMQZA6QBAS2CH5K5oDVWgSEl64rABj8cr6P8F203PM9Jayov17iewmEfm/23tAV4hVd+llvXLZNfzJCqHzVIAB9Y3DXXkML8WIkuWDzl9K9wlk4YIfcYoQzyQlZ8D0JQABsdtlIhccZI5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeV1ScEj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso2730855a12.0;
        Mon, 08 Jul 2024 21:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720500942; x=1721105742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqKaJocUioa9zVhmFj29t92/q5RUZD9GpRYJvaszsh0=;
        b=JeV1ScEjpjpHkm0YU8QzGqt/TFmi4AyED8Su5GxN/Uju2Qu8IpTmdcqqwHw4x3vr8d
         3S0H1vDQxyR3GRqyipX3j3dKL2UhuJ8rEeov9nmQDk5GlJnhhvmf9qRpX2BY9QWbGr6u
         EXSBlaErmE/jqLXLCoO2F6wUswRInUcAiLYp5gtogbvQhNM02eVj5hhL1jw9JMeKXygU
         7NTm/aq9nmaVS+MLcLzJdeEU8YhOnKEAsSnHnHdRJnDGb99mTMgom7DflzkOvQK7isUj
         fIWVm3W9qzKN7rK4CfW23cwH0ObdUDryGiRdhNRkg1mVKZX9jsw+MGD/BRjdsEsp6nKA
         tO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720500942; x=1721105742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqKaJocUioa9zVhmFj29t92/q5RUZD9GpRYJvaszsh0=;
        b=vw8ro2tpXu9vQJ5u3KRfJYxmoshEjQ6JOg4sZYvnmb236As/dnQp41tvz+e6SwLV7d
         I+r/kn8Jw1QwvZh3G1434oUauUMIxpxvf4F3gcQPhbTp//9wHZkAHZUNMJKh8HKEtEge
         x2LhWbfKkYsnU7vNl6Jxg9K04804FJsWC3v7pXr3BqL7ckO1XgcAoovhAuqldnKqnwal
         jNbqy8Nk90917AB12CTph0zWx6YBadSJIBSg83mGwWKFQ/ynZYUTpTxWxQ6j0up7wV7z
         wyopITaVzYmRwZT+U6lMJa+nKASTA/7+Hu+8ndWZ9/jbY24EsMinRzEj9evlfcpUhj+M
         SfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhEtKrsvwJdwG8GgWeK1BdWmHSnaXevEA44z+g2XqhxoX4WBRALkg9LAFp/ubKEOnI7GeT5YicUhTFwbduZr7v5zHG6tAcIvztxyyhHIjCYSLCl9Go07e03jKWcF0Gkgz3wqY60GOhvNejh4mImENfUplokfEXEFT7mk6d3uSzNFDRt79w
X-Gm-Message-State: AOJu0YzuHWm8i/LB3s/z72T3Y5eF1f9CPp92aFK5rqiBK0t6Ku+1yhJ3
	grpmBTn0S/dfy0W0Ycy7+dCGL72dK1oHZZVgioAWGxgMWgjZg5qIE48V8w==
X-Google-Smtp-Source: AGHT+IHbadqVJQre10gCHyswTEmwsTSHIFV6clkSkz4h7Tp9Flx8bMAH8aAoU2KjYDqs5mnA6wfg4Q==
X-Received: by 2002:a05:6a20:4f12:b0:1be:e265:81fa with SMTP id adf61e73a8af0-1c29824d472mr1014200637.35.1720500941419;
        Mon, 08 Jul 2024 21:55:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:922a:af36:b3d9:2eac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca34e89d46sm889698a91.27.2024.07.08.21.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 21:55:41 -0700 (PDT)
Date: Mon, 8 Jul 2024 21:55:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 1/4] Input: atmel_mxt_ts - add power off and power on
 functions
Message-ID: <ZozCyQ-deK8A2uOe@google.com>
References: <20240417090527.15357-1-eichest@gmail.com>
 <20240417090527.15357-2-eichest@gmail.com>
 <ZnRMxONryyi5uZ8a@google.com>
 <ZnWQYc1IunNyhmD4@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWQYc1IunNyhmD4@eichest-laptop>

Hi Stefan,

On Fri, Jun 21, 2024 at 04:38:25PM +0200, Stefan Eichenberger wrote:
> Hi Dmitry
> 
> On Thu, Jun 20, 2024 at 08:37:40AM -0700, Dmitry Torokhov wrote:
> > Hi Stefan,
> > 
> > On Wed, Apr 17, 2024 at 11:05:24AM +0200, Stefan Eichenberger wrote:
> > > @@ -3374,8 +3390,7 @@ static void mxt_remove(struct i2c_client *client)
> > >  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
> > >  	mxt_free_input_device(data);
> > >  	mxt_free_object_table(data);
> > > -	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
> > > -			       data->regulators);
> > > +	mxt_power_off(data);
> > 
> > This change means that on unbind we will leave with GPIO line asserted.
> > Won't this potentially cause some current leakage? Why do we need to
> > have reset asserted here?
> 
> This is correct, but I checked the datasheet of three different maxTouch
> models and all of them have the reset line low active. This means we had
> a current leakage before this patch.

No, the reset line would be either set or pulled high, which is the
normal state for the device.

> Now it is fixed because we assert
> the reset line, which sets the pin to 0. I also think it makes sense if
> we look at the power on sequence. There we first power on the controller
> before we release the reset line. Without asserting it on unbind this
> would never trigger a reset after a power on.

Please see that in mxt_probe() we do:

	/* Request the RESET line as asserted so we go into reset */
	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
						   "reset", GPIOD_OUT_HIGH);

If the reset GPIO is annotated as "active low" (as it should unless
there are inverters on the line) this will cause the line
be driven to 0, putting the chip into the reset state. Then we enable
regulators and deassert the reset GPIO with this bit of code:

	if (data->reset_gpio) {
		/* Wait a while and then de-assert the RESET GPIO line */
		msleep(MXT_RESET_GPIO_TIME);
		gpiod_set_value(data->reset_gpio, 0);
		msleep(MXT_RESET_INVALID_CHG);
	}

So the line here will be left at "1" state (logical off). It should stay
this way until we need to go through the reset sequence again.

I can see that you need the power on sequence to be executed again after
probing is done. I recommend you make it something like this:

static int mxt_power_on()
{
	int error;

	if (data->reset_gpio)
		gpiod_set_value_cansleep(data->reset_gpio, 1);


	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
				      data->regulators);
	if (error) {
		dev_err(&client->dev, "failed to enable regulators: %d\n",
			error);
		return error;
	}

	/*
	 * The device takes 40ms to come up after power-on according
	 * to the mXT224 datasheet, page 13.
	 */
	msleep(MXT_BACKUP_TIME);

	if (data->reset_gpio) {
		/* Wait a while and then de-assert the RESET GPIO line */
		msleep(MXT_RESET_GPIO_TIME);
		gpiod_set_value(data->reset_gpio, 0);
		msleep(MXT_RESET_INVALID_CHG);
	}

	return 0;
}

And then mxt_power_off() should only disable regulators, and leave the
reset line alone. This way first time around the first
"piod_set_value_cansleep(data->reset_gpio, 1)" will be effectively a
noop, but on subsequent calls it will ensure that you have the
transition inactive->active->inactive for the reset line.

I wonder if we need both MXT_BACKUP_TIME and MXT_RESET_GPIO_TIME
though...

Thanks.

-- 
Dmitry

