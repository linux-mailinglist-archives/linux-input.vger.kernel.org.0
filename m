Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EABF164D93E
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 11:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiLOKHz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 05:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiLOKHx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 05:07:53 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC40B1E
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 02:07:51 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i7so2484348wrv.8
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSv3G96/4PAOLp1M9lgOUmVxhOppz2QwnN8wjGypRsE=;
        b=orRazjGm7yt4FEK61Hdiiqpp++xCv0wDWuWTZ6gVvV/tBrdiddxcW3cMQ5vDAJXltb
         AHLMwKFOJkfpvIQEfNmuhlawmW88uktZl60mG5cJwktT8w5zpPtHpID2ZarPqt+IqZou
         6U8MfvBxbxoG7PtiCSnR6Z6lyIKzvEms2Oos3sn48MJNCXrQhFFQOfkqCg3GgRk7bCAW
         WUYqBU/sVznscESbao5z0BsON++BrgttJk0H2mQu7k5FBgQ9x8W7cGMkxFHalAdcUa0o
         G+aBV4YJi7jtGyv0f62w9KTrRlwQ6Ph8BESttjAL9MtSOvuy469lMqGyizIw/oBUxTBs
         /pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSv3G96/4PAOLp1M9lgOUmVxhOppz2QwnN8wjGypRsE=;
        b=2zIYinEhFl2fLFzWj5wqDjTHBH4ewGIGo/GdoQB/U78N4ixVnOF9hE9Ut5rl0IxGGg
         JZ/kRmftJV+ivsZo0rr6kKIm9AxkL7yo+nhEpAOYkYhUtyWgboiGR6EQeCRc9umsIe62
         OfZCw+qYkvZIpOqS3iBTeb3Csrtq753LsR2sFgFchq0YtH8ZM+s5LDQ3dYTO22vUUnRK
         GSEeDiWtA5/ZOYEX1c3i2M5mUQeXn3+A/+Oomou3b16sdAbESesscCzGaDFoiRi44pDR
         zg3SHwPrcS+2X+8RCEy16x5wfXBkscoC0onPmGbq/5AKqI+pubvL6jSuKPpHcRAbWuE5
         w6ig==
X-Gm-Message-State: ANoB5pkx7ykIK9EAqsuPYznbf0Km2pQMur2e3R0sZcWZk5+zEtWGYvNU
        Ujpp9i53QDQ8Y7DbrqqdUAKdiA==
X-Google-Smtp-Source: AA0mqf7w6auO5x/tV70C52h/ZFKATEe9yVS1YBIy3Cft/40PvV+zfA/sYqSTCpNFyiPvXZxpF70bPw==
X-Received: by 2002:adf:cc85:0:b0:242:713c:7f65 with SMTP id p5-20020adfcc85000000b00242713c7f65mr18184629wrj.55.1671098869769;
        Thu, 15 Dec 2022 02:07:49 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600c4e0100b003d1cc0464a2sm5912897wmq.8.2022.12.15.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 02:07:49 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 4/5] Input: iqs269a - do not poll during suspend or resume
In-Reply-To: <Y4V2XUtLVkOHvi6C@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71> <Y4V2XUtLVkOHvi6C@nixie71>
Date:   Thu, 15 Dec 2022 11:07:48 +0100
Message-ID: <87len9j7yj.fsf@baylibre.com>
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

On Mon, Nov 28, 2022 at 21:02, Jeff LaBundy <jeff@labundy.com> wrote:

> Polling the device while it transitions from automatic to manual
> power mode switching may keep the device from actually finishing
> the transition. The process appears to time out depending on the
> polling rate and the device's core clock frequency.
>
> This is ultimately unnecessary in the first place; instead it is
> sufficient to write the desired mode during initialization, then
> disable automatic switching at suspend. This eliminates the need
> to ensure the device is prepared for a manual change and removes
> the 'suspend_mode' variable.
>
> Similarly, polling the device while it transitions from one mode
> to another under manual control may time out as well. This added
> step does not appear to be necessary either, so drop it.
>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs269a.c | 118 +++++++++--------------------------
>  1 file changed, 31 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 0eb3cff177e5..eca680bf8c20 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -148,9 +148,6 @@
>  #define IQS269_ATI_POLL_TIMEOUT_US		(iqs269->delay_mult * 500000)
>  #define IQS269_ATI_STABLE_DELAY_MS		(iqs269->delay_mult * 150)
>  
> -#define IQS269_PWR_MODE_POLL_SLEEP_US		IQS269_ATI_POLL_SLEEP_US
> -#define IQS269_PWR_MODE_POLL_TIMEOUT_US		IQS269_ATI_POLL_TIMEOUT_US
> -
>  #define iqs269_irq_wait()			usleep_range(200, 250)
>  
>  enum iqs269_local_cap_size {
> @@ -295,7 +292,6 @@ struct iqs269_private {
>  	struct input_dev *keypad;
>  	struct input_dev *slider[IQS269_NUM_SL];
>  	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
> -	unsigned int suspend_mode;
>  	unsigned int delay_mult;
>  	unsigned int ch_num;
>  	bool hall_enable;
> @@ -773,17 +769,6 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
>  	iqs269->hall_enable = device_property_present(&client->dev,
>  						      "azoteq,hall-enable");
>  
> -	if (!device_property_read_u32(&client->dev, "azoteq,suspend-mode",
> -				      &val)) {
> -		if (val > IQS269_SYS_SETTINGS_PWR_MODE_MAX) {
> -			dev_err(&client->dev, "Invalid suspend mode: %u\n",
> -				val);
> -			return -EINVAL;
> -		}
> -
> -		iqs269->suspend_mode = val;
> -	}
> -
>  	error = regmap_raw_read(iqs269->regmap, IQS269_SYS_SETTINGS, sys_reg,
>  				sizeof(*sys_reg));
>  	if (error)
> @@ -1011,6 +996,17 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
>  	general &= ~IQS269_SYS_SETTINGS_DIS_AUTO;
>  	general &= ~IQS269_SYS_SETTINGS_PWR_MODE_MASK;
>  
> +	if (!device_property_read_u32(&client->dev, "azoteq,suspend-mode",
> +				      &val)) {
> +		if (val > IQS269_SYS_SETTINGS_PWR_MODE_MAX) {
> +			dev_err(&client->dev, "Invalid suspend mode: %u\n",
> +				val);
> +			return -EINVAL;
> +		}
> +
> +		general |= (val << IQS269_SYS_SETTINGS_PWR_MODE_SHIFT);
> +	}
> +
>  	if (!device_property_read_u32(&client->dev, "azoteq,ulp-update",
>  				      &val)) {
>  		if (val > IQS269_SYS_SETTINGS_ULP_UPDATE_MAX) {
> @@ -1693,59 +1689,30 @@ static int iqs269_probe(struct i2c_client *client)
>  	return error;
>  }
>  
> +static u16 iqs269_general_get(struct iqs269_private *iqs269)
> +{
> +	u16 general = be16_to_cpu(iqs269->sys_reg.general);
> +
> +	general &= ~IQS269_SYS_SETTINGS_REDO_ATI;
> +	general &= ~IQS269_SYS_SETTINGS_ACK_RESET;
> +
> +	return general | IQS269_SYS_SETTINGS_DIS_AUTO;
> +}
> +
>  static int __maybe_unused iqs269_suspend(struct device *dev)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs269->client;
> -	unsigned int val;
>  	int error;
> +	u16 general = iqs269_general_get(iqs269);
>  
> -	if (!iqs269->suspend_mode)
> +	if (!(general & IQS269_SYS_SETTINGS_PWR_MODE_MASK))
>  		return 0;
>  
>  	disable_irq(client->irq);
>  
> -	/*
> -	 * Automatic power mode switching must be disabled before the device is
> -	 * forced into any particular power mode. In this case, the device will
> -	 * transition into normal-power mode.
> -	 */
> -	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
> -				   IQS269_SYS_SETTINGS_DIS_AUTO, ~0);
> -	if (error)
> -		goto err_irq;
> -
> -	/*
> -	 * The following check ensures the device has completed its transition
> -	 * into normal-power mode before a manual mode switch is performed.
> -	 */
> -	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
> -					!(val & IQS269_SYS_FLAGS_PWR_MODE_MASK),
> -					 IQS269_PWR_MODE_POLL_SLEEP_US,
> -					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
> -	if (error)
> -		goto err_irq;
> -
> -	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
> -				   IQS269_SYS_SETTINGS_PWR_MODE_MASK,
> -				   iqs269->suspend_mode <<
> -				   IQS269_SYS_SETTINGS_PWR_MODE_SHIFT);
> -	if (error)
> -		goto err_irq;
> -
> -	/*
> -	 * This last check ensures the device has completed its transition into
> -	 * the desired power mode to prevent any spurious interrupts from being
> -	 * triggered after iqs269_suspend has already returned.
> -	 */
> -	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
> -					 (val & IQS269_SYS_FLAGS_PWR_MODE_MASK)
> -					 == (iqs269->suspend_mode <<
> -					     IQS269_SYS_FLAGS_PWR_MODE_SHIFT),
> -					 IQS269_PWR_MODE_POLL_SLEEP_US,
> -					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
> +	error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS, general);
>  
> -err_irq:
>  	iqs269_irq_wait();
>  	enable_irq(client->irq);
>  
> @@ -1756,43 +1723,20 @@ static int __maybe_unused iqs269_resume(struct device *dev)
>  {
>  	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
>  	struct i2c_client *client = iqs269->client;
> -	unsigned int val;
>  	int error;
> +	u16 general = iqs269_general_get(iqs269);
>  
> -	if (!iqs269->suspend_mode)
> +	if (!(general & IQS269_SYS_SETTINGS_PWR_MODE_MASK))
>  		return 0;
>  
>  	disable_irq(client->irq);
>  
> -	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
> -				   IQS269_SYS_SETTINGS_PWR_MODE_MASK, 0);
> -	if (error)
> -		goto err_irq;
> -
> -	/*
> -	 * This check ensures the device has returned to normal-power mode
> -	 * before automatic power mode switching is re-enabled.
> -	 */
> -	error = regmap_read_poll_timeout(iqs269->regmap, IQS269_SYS_FLAGS, val,
> -					!(val & IQS269_SYS_FLAGS_PWR_MODE_MASK),
> -					 IQS269_PWR_MODE_POLL_SLEEP_US,
> -					 IQS269_PWR_MODE_POLL_TIMEOUT_US);
> -	if (error)
> -		goto err_irq;
> -
> -	error = regmap_update_bits(iqs269->regmap, IQS269_SYS_SETTINGS,
> -				   IQS269_SYS_SETTINGS_DIS_AUTO, 0);
> -	if (error)
> -		goto err_irq;
> -
> -	/*
> -	 * This step reports any events that may have been "swallowed" as a
> -	 * result of polling PWR_MODE (which automatically acknowledges any
> -	 * pending interrupts).
> -	 */
> -	error = iqs269_report(iqs269);
> +	error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS,
> +			     general & ~IQS269_SYS_SETTINGS_PWR_MODE_MASK);
> +	if (!error)
> +		error = regmap_write(iqs269->regmap, IQS269_SYS_SETTINGS,
> +				     general & ~IQS269_SYS_SETTINGS_DIS_AUTO);
>  
> -err_irq:
>  	iqs269_irq_wait();
>  	enable_irq(client->irq);
>  
> -- 
> 2.34.1
