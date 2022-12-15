Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE33664D97B
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 11:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiLOKXQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 05:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiLOKWd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 05:22:33 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFF92A25A
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 02:22:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m5-20020a7bca45000000b003d2fbab35c6so1084493wml.4
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 02:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ23rY0XR70jngxzcUnTdilDc/45ZsQp2qbzh2w01V4=;
        b=SfZkdLA8dps/s6bzlJTUiN8XFoyrfgnVV/+LFwJwwZTJtgSaqd4FmDR4HTt+DKbOW1
         hZIycJVJXc6GfKnpOTWLMKcCzlh7Pqs/86sm7eaMjeZt3bzT3BkSbI/RwfWwwIDwZBBR
         2qiH+/g5/Bvpuha9uhROM7BpBevnH1Z+iHHY7Hd4dIOX+/hm5cm6JVR9wHe41pCUSC2t
         Fj61coIViNXGwRsywtni4warVLODYGpTa7aWLro1BiCNmDcePRX2OXD2hVbK4BWZTS+w
         Y+QaJeX2VZKo2rvy2mrl37k3iIsBDNNTBPUnNGNcBs8UfERi58f+LDVd5KwbAC3a9KPG
         064A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ23rY0XR70jngxzcUnTdilDc/45ZsQp2qbzh2w01V4=;
        b=7gLnUuR3ozLtUhnrQwFKwSk0rp3idJ7oMaVLSDulivEH7erkmj94VvFq4h4C5TpEZC
         43lsORAAM0XO+WSGWmHdPoHrfKgirwmPIcBZHiNqNb7CS18E+vdAuJ40L+sZX46lzzre
         itxMjHbqH8CMjpBbIbgoe2PAwa+6OTEaS0dLI2ziHmGioWVhoCRLBdQ2yabHHaW/IlVy
         DxlTLYFygyDmyA50SBGC0xa+U4AV7zdkiWw8wY4tROh5c3kUW9fjTjHY6+um3O1R9bRT
         6yPh0Hd3Cqdn0UR5cPDBrcLwgq1k0HiljDRZ/oO+bG/bDTn3dnkXp5lRQ/JIWhMiSzv5
         SnUA==
X-Gm-Message-State: ANoB5pljKpbZeqgMw+bf43ZbB+5oqGPn/6ya20SUbJFncI8wjcLY4fmS
        18Yqbwg0oTXRrM9H4RCRqVGL6A==
X-Google-Smtp-Source: AA0mqf66cz05LmXsZ6GU5PUf1Q34tSHRVSkMdR4Tebqiae3CpUERLm8nPKcHKO1RkSEcFdAT/sffmg==
X-Received: by 2002:a05:600c:1d98:b0:3cf:74b4:c3c8 with SMTP id p24-20020a05600c1d9800b003cf74b4c3c8mr21717111wms.17.1671099748896;
        Thu, 15 Dec 2022 02:22:28 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c430b00b003c6b70a4d69sm5104650wme.42.2022.12.15.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 02:22:28 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 5/5] Input: iqs269a - do not poll during ATI
In-Reply-To: <Y4V2Z8Iwp3qbGiBf@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71> <Y4V2Z8Iwp3qbGiBf@nixie71>
Date:   Thu, 15 Dec 2022 11:22:27 +0100
Message-ID: <87ilidj7a4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 28, 2022 at 21:03, Jeff LaBundy <jeff@labundy.com> wrote:

> After initial start-up, the driver triggers ATI (calibration) with
> the newly loaded register configuration in place. Next, the driver
> polls a register field to ensure ATI completed in a timely fashion
> and that the device is ready to sense.
>
> However, communicating with the device over I2C while ATI is under-
> way may induce noise in the device and cause ATI to fail. As such,
> the vendor recommends not to poll the device during ATI.
>
> To solve this problem, let the device naturally signal to the host
> that ATI is complete by way of an interrupt. A completion prevents
> the device from successfully probing until this happens.
>
> As an added benefit, initial switch states are now reported in the
> interrupt handler at the same time ATI status is checked. As such,
> duplicate code that reports initial switch states has been removed
> from iqs269_input_init().
>
> The former logic that scaled ATI timeout and filter settling delay
> is not carried forward with the new implementation, as it produces
> overly conservative delays at the lower clock rate.
>
> Rather, a single timeout that covers both clock rates is used. The
> filter settling delay does not happen to be necessary and has been
> removed as well.
>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs269a.c | 97 +++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index eca680bf8c20..4e7b46d30052 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -9,6 +9,7 @@
>   * axial sliders presented by the device.
>   */
>  
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -144,10 +145,6 @@
>  #define IQS269_NUM_CH				8
>  #define IQS269_NUM_SL				2
>  
> -#define IQS269_ATI_POLL_SLEEP_US		(iqs269->delay_mult * 10000)
> -#define IQS269_ATI_POLL_TIMEOUT_US		(iqs269->delay_mult * 500000)
> -#define IQS269_ATI_STABLE_DELAY_MS		(iqs269->delay_mult * 150)
> -
>  #define iqs269_irq_wait()			usleep_range(200, 250)
>  
>  enum iqs269_local_cap_size {
> @@ -289,10 +286,10 @@ struct iqs269_private {
>  	struct mutex lock;
>  	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
>  	struct iqs269_sys_reg sys_reg;
> +	struct completion ati_done;
>  	struct input_dev *keypad;
>  	struct input_dev *slider[IQS269_NUM_SL];
>  	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
> -	unsigned int delay_mult;
>  	unsigned int ch_num;
>  	bool hall_enable;
>  	bool ati_current;
> @@ -979,13 +976,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
>  
>  	general = be16_to_cpu(sys_reg->general);
>  
> -	if (device_property_present(&client->dev, "azoteq,clk-div")) {
> +	if (device_property_present(&client->dev, "azoteq,clk-div"))
>  		general |= IQS269_SYS_SETTINGS_CLK_DIV;
> -		iqs269->delay_mult = 4;
> -	} else {
> -		general &= ~IQS269_SYS_SETTINGS_CLK_DIV;
> -		iqs269->delay_mult = 1;
> -	}
>  
>  	/*
>  	 * Configure the device to automatically switch between normal and low-
> @@ -1042,7 +1034,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
>  
>  static int iqs269_dev_init(struct iqs269_private *iqs269)
>  {
> -	unsigned int val;
>  	int error;
>  
>  	mutex_lock(&iqs269->lock);
> @@ -1058,14 +1049,12 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  	if (error)
>  		goto err_mutex;
>  
> -	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
> -					!(val & IQS269_SYS_FLAGS_IN_ATI),
> -					 IQS269_ATI_POLL_SLEEP_US,
> -					 IQS269_ATI_POLL_TIMEOUT_US);
> -	if (error)
> -		goto err_mutex;
> +	/*
> +	 * The following delay gives the device time to deassert its RDY output
> +	 * so as to prevent an interrupt from being serviced prematurely.
> +	 */
> +	usleep_range(2000, 2100);
>  
> -	msleep(IQS269_ATI_STABLE_DELAY_MS);
>  	iqs269->ati_current = true;
>  
>  err_mutex:
> @@ -1077,10 +1066,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  static int iqs269_input_init(struct iqs269_private *iqs269)
>  {
>  	struct i2c_client *client = iqs269->client;
> -	struct iqs269_flags flags;
>  	unsigned int sw_code, keycode;
>  	int error, i, j;
> -	u8 dir_mask, state;
>  
>  	iqs269->keypad = devm_input_allocate_device(&client->dev);
>  	if (!iqs269->keypad)
> @@ -1093,23 +1080,7 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
>  	iqs269->keypad->name = "iqs269a_keypad";
>  	iqs269->keypad->id.bustype = BUS_I2C;
>  
> -	if (iqs269->hall_enable) {
> -		error = regmap_raw_read(iqs269->regmap, IQS269_SYS_FLAGS,
> -					&flags, sizeof(flags));
> -		if (error) {
> -			dev_err(&client->dev,
> -				"Failed to read initial status: %d\n", error);
> -			return error;
> -		}
> -	}
> -
>  	for (i = 0; i < ARRAY_SIZE(iqs269_events); i++) {
> -		dir_mask = flags.states[IQS269_ST_OFFS_DIR];
> -		if (!iqs269_events[i].dir_up)
> -			dir_mask = ~dir_mask;
> -
> -		state = flags.states[iqs269_events[i].st_offs] & dir_mask;
> -
>  		sw_code = iqs269->switches[i].code;
>  
>  		for (j = 0; j < IQS269_NUM_CH; j++) {
> @@ -1122,13 +1093,9 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
>  			switch (j) {
>  			case IQS269_CHx_HALL_ACTIVE:
>  				if (iqs269->hall_enable &&
> -				    iqs269->switches[i].enabled) {
> +				    iqs269->switches[i].enabled)
>  					input_set_capability(iqs269->keypad,
>  							     EV_SW, sw_code);
> -					input_report_switch(iqs269->keypad,
> -							    sw_code,
> -							    state & BIT(j));
> -				}
>  				fallthrough;
>  
>  			case IQS269_CHx_HALL_INACTIVE:
> @@ -1144,14 +1111,6 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
>  		}
>  	}
>  
> -	input_sync(iqs269->keypad);
> -
> -	error = input_register_device(iqs269->keypad);
> -	if (error) {
> -		dev_err(&client->dev, "Failed to register keypad: %d\n", error);
> -		return error;
> -	}
> -
>  	for (i = 0; i < IQS269_NUM_SL; i++) {
>  		if (!iqs269->sys_reg.slider_select[i])
>  			continue;
> @@ -1211,6 +1170,9 @@ static int iqs269_report(struct iqs269_private *iqs269)
>  		return error;
>  	}
>  
> +	if (be16_to_cpu(flags.system) & IQS269_SYS_FLAGS_IN_ATI)
> +		return 0;
> +
>  	error = regmap_raw_read(iqs269->regmap, IQS269_SLIDER_X, slider_x,
>  				sizeof(slider_x));
>  	if (error) {
> @@ -1273,6 +1235,12 @@ static int iqs269_report(struct iqs269_private *iqs269)
>  
>  	input_sync(iqs269->keypad);
>  
> +	/*
> +	 * The following completion signals that ATI has finished, any initial
> +	 * switch states have been reported and the keypad can be registered.
> +	 */
> +	complete_all(&iqs269->ati_done);
> +
>  	return 0;
>  }
>  
> @@ -1304,6 +1272,9 @@ static ssize_t counts_show(struct device *dev,
>  	if (!iqs269->ati_current || iqs269->hall_enable)
>  		return -EPERM;
>  
> +	if (!completion_done(&iqs269->ati_done))
> +		return -EBUSY;
> +
>  	/*
>  	 * Unsolicited I2C communication prompts the device to assert its RDY
>  	 * pin, so disable the interrupt line until the operation is finished
> @@ -1560,7 +1531,9 @@ static ssize_t ati_trigger_show(struct device *dev,
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
>  
> -	return scnprintf(buf, PAGE_SIZE, "%u\n", iqs269->ati_current);
> +	return scnprintf(buf, PAGE_SIZE, "%u\n",
> +			 iqs269->ati_current &&
> +			 completion_done(&iqs269->ati_done));
>  }
>  
>  static ssize_t ati_trigger_store(struct device *dev,
> @@ -1580,6 +1553,7 @@ static ssize_t ati_trigger_store(struct device *dev,
>  		return count;
>  
>  	disable_irq(client->irq);
> +	reinit_completion(&iqs269->ati_done);
>  
>  	error = iqs269_dev_init(iqs269);
>  
> @@ -1589,6 +1563,10 @@ static ssize_t ati_trigger_store(struct device *dev,
>  	if (error)
>  		return error;
>  
> +	if (!wait_for_completion_timeout(&iqs269->ati_done,
> +					 msecs_to_jiffies(2000)))
> +		return -ETIMEDOUT;
> +
>  	return count;
>  }
>  
> @@ -1647,6 +1625,7 @@ static int iqs269_probe(struct i2c_client *client)
>  	}
>  
>  	mutex_init(&iqs269->lock);
> +	init_completion(&iqs269->ati_done);
>  
>  	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO, &ver_info,
>  				sizeof(ver_info));
> @@ -1682,6 +1661,22 @@ static int iqs269_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +	if (!wait_for_completion_timeout(&iqs269->ati_done,
> +					 msecs_to_jiffies(2000))) {
> +		dev_err(&client->dev, "Failed to complete ATI\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/*
> +	 * The keypad may include one or more switches and is not registered
> +	 * until ATI is complete and the initial switch states are read.
> +	 */
> +	error = input_register_device(iqs269->keypad);
> +	if (error) {
> +		dev_err(&client->dev, "Failed to register keypad: %d\n", error);
> +		return error;
> +	}
> +
>  	error = devm_device_add_group(&client->dev, &iqs269_attr_group);
>  	if (error)
>  		dev_err(&client->dev, "Failed to add attributes: %d\n", error);
> -- 
> 2.34.1
