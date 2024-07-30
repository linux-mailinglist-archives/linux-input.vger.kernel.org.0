Return-Path: <linux-input+bounces-5202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 545579402E6
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 02:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C84CD1F22F86
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 00:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A1D23C9;
	Tue, 30 Jul 2024 00:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXjtXTdS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA019460;
	Tue, 30 Jul 2024 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301115; cv=none; b=pC8+GtXZg63b3UnIbMxtS3gSrYdkzBXgCsuOoiOZzvtxXWOk1Ga24DWjNmDmZpwmVOGQSnMjSvWuxpL+b1qF9Qi0eCrdpR+oweITVRga1XwDZXXaIq67hFfips+653hjUk8sXcCcy8lEo6uS59j9/eApgCevqQUj20aUUs4IRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301115; c=relaxed/simple;
	bh=CpYECB0kmaquqCdk4FxbZ09dwK4tNbkto3Y1jPXD1mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCKRwTuLVu6pEfSlAqudqp7H0AgZIlPD2veGMpevhw75PgC+5oO24XAFk188LVeBKjNZtVWiU+oKzkv5AifYhM9dTPZFNgUf7VCJJGxEAXuG5sia27Ema1QDuy6GvfK5+9g1nobJoXyE1pA3hhDfqjsLLdOmig+jdGHpJ7uo3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXjtXTdS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d150e8153so2405216b3a.0;
        Mon, 29 Jul 2024 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722301112; x=1722905912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDSB5pPC4KBnYq35M/mZ4xVlhDzcx3CFEpFuR7OQWhw=;
        b=SXjtXTdSJydJwXKgd+WvJpky37Y8O2Hn6Cebw0lVW1s5amITlk46lWD9EyaefUe6br
         +XsjchxxWp6qtQHO/PcnTqzLv1oUdDyvmkiJMp4bubn/1Slj8kb0zuyCCTP15tgusn24
         folHj1IkcWrfFvv0yUNAXbQuQI+U+g4ZFn7KjDsZfvW9Wp3G9r6r3iZSeh73wd27HZNj
         2u3636CKkb4crX+/1p7KaiithBnxoGXQoLlZ4FSXWn5XbU4c3cTQGBqr3RUcbnu4u2vi
         Y1+zA8sEzlBvpCLF72itCDfF/H3cI5hKq+LbnivUSsmZq5j1mZLETLf9YUkCdSJjYLFo
         ybLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722301112; x=1722905912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDSB5pPC4KBnYq35M/mZ4xVlhDzcx3CFEpFuR7OQWhw=;
        b=da7gih406NNDbDgp/5GI8m3XDM8Jxez3AoQ3mSHIx5Gc+B2Ikw/sSxLQ/BfpRgYrSX
         Yjmq08RKw6uGmtxWbetCfnyAwempZsIt5DNnZC4DDMlpJG8NkHaYsaobtRXn2z/GZ46G
         92z7bTSRCoTKTVUWytWuiEbXyWEcTse1/h21c0pLQON+d3rrlcwbzirnMqJ1QiG93WKm
         /Fe6N+7nMrtTX3dHwC8CRYk181a0hY0GeJinHo2ImrZMV6ASJ8TiaLShXDDT2Q/rvRxX
         nEKi/pb0Dz1m+Fpk5bbk/n4JLdpQY9auKtiSipfuU1iwwo39UnOupJ0pRosylq358Ec8
         oXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrMdhuptmeBhfgDZdbOBGR2CGzSyTbO3gMczCOLqENjBHMHo1LCbRl5zuOlKFSNCfhz7c7tIWBwdCIXcPXsHI8GtyhpDWX8InYrAiPsCE9qETPfkCRn3onh3BhRiguQLAYx7DAq1vs2znrLfPYRhl9HZvkQREHk+KKLFcWVxD31SN9cWbn
X-Gm-Message-State: AOJu0YxxOkS+H5s8P1FHFd4x+qP/4zM1NSe22mNfZ0Kybgsq/oYaINn9
	KUHE0djiDK7IvL/NtxxuIW13r7ZmaVZvBSdFISu588r4PZ2McDKc
X-Google-Smtp-Source: AGHT+IGlRbqc8Vnkb/OVeSxyLoLVHmlnHJgJ1CjK24WFJc9iHRieP0JngOXu75PmQbjxav/NMb5GfQ==
X-Received: by 2002:a05:6a00:9a2:b0:704:151d:dcce with SMTP id d2e1a72fcca58-70efe428b7dmr681641b3a.5.1722301112114;
        Mon, 29 Jul 2024 17:58:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead712f1asm7392956b3a.61.2024.07.29.17.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 17:58:31 -0700 (PDT)
Date: Mon, 29 Jul 2024 17:58:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v6 3/3] Input: atmel_mxt_ts - add support for
 poweroff-sleep
Message-ID: <Zqg6tNbCn3W79Li_@google.com>
References: <20240715153330.91979-1-eichest@gmail.com>
 <20240715153330.91979-4-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715153330.91979-4-eichest@gmail.com>

Hi Stefan,

On Mon, Jul 15, 2024 at 05:31:23PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add support for poweroff-sleep to the Atmel maXTouch driver. This allows
> us to power off the input device entirely and only power it on when it
> is opened. This will also automatically power it off when we suspend the
> system.

I have been looking at the patch closely and I have a few comments.

> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 82 ++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 9416de53bf9af..46ed3dbf0c5ed 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -265,6 +265,7 @@ enum v4l_dbg_inputs {
>  enum mxt_suspend_mode {
>  	MXT_SUSPEND_DEEP_SLEEP	= 0,
>  	MXT_SUSPEND_T9_CTRL	= 1,
> +	MXT_SUSPEND_POWEROFF	= 2,
>  };
>  
>  /* Config update context */
> @@ -1311,6 +1312,10 @@ static int mxt_power_on(struct mxt_data *data)
>  {
>  	int error;
>  
> +	/* Make sure the device is in reset before enabling power */
> +	if (data->reset_gpio)
> +		gpiod_set_value_cansleep(data->reset_gpio, 1);
> +
>  	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
>  				      data->regulators);
>  	if (error) {
> @@ -2270,8 +2275,38 @@ static int mxt_configure_objects(struct mxt_data *data,
>  
>  static void mxt_config_cb(const struct firmware *cfg, void *ctx)
>  {
> +	struct mxt_data *data = ctx;
> +
>  	mxt_configure_objects(ctx, cfg);
>  	release_firmware(cfg);
> +
> +	if ((data->suspend_mode == MXT_SUSPEND_POWEROFF) && !data->in_bootloader) {
> +		disable_irq(data->irq);
> +		mxt_power_off(data);
> +	}

I do not think you can do it like that here. When you register an input
device it goes through the list of registered handlers and attaches
matching ones. Some of them may be in-kernel (for example on Chrome OS
ARM we have a handler that momentarily boosts CPU frequency on user
activity) and may open the input device immediately. So when you get to
this spot the device might be powered up and being used.

You should probably check result of input_device_enabled() when deciding
whether to power it off.

Also I think this would be valid for other suspend modes. Why don't we
power off unused device?

> +}
> +
> +static void mxt_initialize_after_resume(struct mxt_data *data)
> +{
> +	int error;
> +
> +	error = mxt_power_on(data);
> +	if (error) {
> +		dev_err(&data->client->dev, "Failed to power on device\n");
> +		return;
> +	}
> +
> +	error = mxt_acquire_irq(data);
> +	if (error) {
> +		dev_err(&data->client->dev, "Failed to acquire IRQ\n");
> +		return;
> +	}
> +
> +	error = mxt_configure_objects(data, NULL);

I do not think you need to call mxt_configure_objects() here. You are
not going to apply the config (you do not have it) and you are not going
to create the input device (it should already be created or we do not
have right fw/config for it to be created). You also do not need to call
mxt_init_t7_power_cfg() because it is supposed to be run already. We
just need to call mxt_set_t7_power_cfg() to set the right T7 power
config, which happens later in mxt_start() anyways.

I think you just need to power on and re-enable interrupts here, and I
would do it directly in mxt_start.


> +	if (error) {
> +		dev_err(&data->client->dev, "Failed to configure objects\n");
> +		return;
> +	}
>  }
>  
>  static int mxt_initialize(struct mxt_data *data)
> @@ -2828,15 +2863,18 @@ static int mxt_configure_objects(struct mxt_data *data,
>  			dev_warn(dev, "Error %d updating config\n", error);
>  	}
>  
> -	if (data->multitouch) {
> -		error = mxt_initialize_input_device(data);
> -		if (error)
> -			return error;
> -	} else {
> -		dev_warn(dev, "No touch object detected\n");
> -	}
> +	/* Do not initialize and register input device twice */
> +	if (!data->input_dev) {
> +		if (data->multitouch) {
> +			error = mxt_initialize_input_device(data);
> +			if (error)
> +				return error;
> +		} else {
> +			dev_warn(dev, "No touch object detected\n");
> +		}
>  
> -	mxt_debug_init(data);
> +		mxt_debug_init(data);
> +	}
>  
>  	return 0;
>  }
> @@ -3070,6 +3108,12 @@ static ssize_t mxt_update_fw_store(struct device *dev,
>  	struct mxt_data *data = dev_get_drvdata(dev);
>  	int error;
>  
> +	if ((data->suspend_mode == MXT_SUSPEND_POWEROFF) && !data->in_bootloader) {
> +		error = mxt_power_on(data);

Can we not make it dependent on data->suspend_mode? Maybe keep track of
the power state the device is in and just call mxt_power_on() if we
believe that the device is off? Or even have this check (counter?) in
mxt_power_on()/mxt_power_off()?

> +		if (error)
> +			return error;
> +	}
> +
>  	error = mxt_load_fw(dev, MXT_FW_NAME);
>  	if (error) {
>  		dev_err(dev, "The firmware update failed(%d)\n", error);
> @@ -3104,7 +3148,10 @@ static const struct attribute_group mxt_attr_group = {
>  
>  static void mxt_start(struct mxt_data *data)
>  {
> -	mxt_wakeup_toggle(data->client, true, false);
> +	if (data->suspend_mode == MXT_SUSPEND_POWEROFF)
> +		mxt_initialize_after_resume(data);
> +	else
> +		mxt_wakeup_toggle(data->client, true, false);
>  
>  	switch (data->suspend_mode) {
>  	case MXT_SUSPEND_T9_CTRL:
> @@ -3116,6 +3163,7 @@ static void mxt_start(struct mxt_data *data)
>  				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
>  		break;
>  
> +	case MXT_SUSPEND_POWEROFF:

I would do like this:

		error = mxt_power_on(...);
		if (error) {
			dev_err(...);
			return;
		}

  		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);

		/*
		 * I am not sure if explicit calibration is needed
		 * after full power up.
		 */
		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
		mxt_acquire_irq(...);
		break;

>  	case MXT_SUSPEND_DEEP_SLEEP:
>  	default:
>  		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
> @@ -3141,7 +3189,12 @@ static void mxt_stop(struct mxt_data *data)
>  		break;
>  	}
>  
> -	mxt_wakeup_toggle(data->client, false, false);
> +	if (data->suspend_mode == MXT_SUSPEND_POWEROFF) {
> +		disable_irq(data->irq);
> +		mxt_power_off(data);

Work it into switch() as well. If you need to move mxt_wakeup_toggle()
into individual cases that is fine.

> +	} else {
> +		mxt_wakeup_toggle(data->client, false, false);
> +	}
>  }
>  
>  static int mxt_input_open(struct input_dev *dev)
> @@ -3338,6 +3391,9 @@ static int mxt_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	if (device_property_read_bool(&client->dev, "atmel,poweroff-sleep"))
> +		data->suspend_mode = MXT_SUSPEND_POWEROFF;
> +
>  	/*
>  	 * Controllers like mXT1386 have a dedicated WAKE line that could be
>  	 * connected to a GPIO or to I2C SCL pin, or permanently asserted low.
> @@ -3387,7 +3443,8 @@ static void mxt_remove(struct i2c_client *client)
>  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
>  	mxt_free_input_device(data);
>  	mxt_free_object_table(data);
> -	mxt_power_off(data);
> +	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
> +		mxt_power_off(data);

Please make decision based on the state, not suspend mode.

>  }
>  
>  static int mxt_suspend(struct device *dev)
> @@ -3420,7 +3477,8 @@ static int mxt_resume(struct device *dev)
>  	if (!input_dev)
>  		return 0;
>  
> -	enable_irq(data->irq);
> +	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
> +		enable_irq(data->irq);

It would be good to have consistent IRQ management regardless of the
suspend mode.

>  
>  	mutex_lock(&input_dev->mutex);
>  
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry

