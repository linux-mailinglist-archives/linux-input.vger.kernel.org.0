Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8ED26FE8D
	for <lists+linux-input@lfdr.de>; Fri, 18 Sep 2020 15:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgIRNcy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Sep 2020 09:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRNcx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Sep 2020 09:32:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC95C0613CE;
        Fri, 18 Sep 2020 06:32:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so5119202ljm.3;
        Fri, 18 Sep 2020 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BF3jjsb2REefmon0b6tZHIp8iTzcESZIUiM6xTwxmY4=;
        b=cZ4/tbTJt8wN3R74p/sx+vS3LTQW5MIbt8xRxtOJA9fpqLEOHRZeLnSNNQ1BPMudzU
         Exhe3bIYCJY1rFZckn4eQGJBpeuKm0lFLJSkWN+URjYj/FcaRmDKcTZNrNTJ+0Apk89G
         7+uWCBN3clAgdzpUJigoQWy0TurOsfU4UHh9s24OvN4phUPLJCV/9VyQwir8+KhAOxVy
         Qy8SXX58/Oon4aBTU24DmnMYZtZHiQud6sn0xzPj7PGEDbXcfvcnpLZcdnY/oqS+eEHY
         gw3kV8WWRCF0i+8PmtM6Fh5Ocjv4/GTuJwWG9qD/aZyFZTUgW5xZfKMH+pI2X2IwSlIG
         UCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BF3jjsb2REefmon0b6tZHIp8iTzcESZIUiM6xTwxmY4=;
        b=ERgBuB8+c6hbFYdDGscrXU+vZtFCeSwt4t9jHcBY2NUFC7iFTcHVpsdSXo4aocCV9u
         8xRx4YCWw0apnNBPL+5lkiV+lhtiycOwi5Budkrosquhfs3BDCoPGTSwLNllnFm0NHQN
         LBNoyY7jQCGk190wZV88YEqQ3CWZv5+xPGNMEL26Ary1mhspzhgM1oavML+d09kpA+Aj
         BtbFJTjN7u3j+aHfcbb8ZVOwlZ4OvXkH5czUNeB9XCIwaT4v5Y2yVadYc2IBasHEIUyh
         9BomnP70viZG4Wgc9A0biDLUkdW/ub2+tik46QSMLDg9Ce+jzcz/m2x9991Sp7R6axYW
         26vg==
X-Gm-Message-State: AOAM5331ytsLR+IlzyFM5s/A0KqR7vHLx5RELWPJMvcr+bA7d29tdNoZ
        fZn5iifx0Nw9G3RUu1bmw98=
X-Google-Smtp-Source: ABdhPJxtnxymCYZONTeLcC1HlZ93NTh0v6ZCjWUP1TrkNxCDRdMTHafN7b5FzhAX2F67KTZ3lEWorQ==
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr10805171ljc.212.1600435971859;
        Fri, 18 Sep 2020 06:32:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u2sm614441ljo.48.2020.09.18.06.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 06:32:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
Date:   Fri, 18 Sep 2020 16:32:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918125601.8210-2-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

18.09.2020 15:56, Jiada Wang пишет:
> According to datasheet, mXT1386 chip has a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with
> it via the I2C-compatible interface.
> 
> if the WAKE line is connected to a GPIO line, the line must be
> asserted 25 ms before the host attempts to communicate with the mXT1386.
> If the WAKE line is connected to the SCL pin, the mXT1386 will send a
> NACK on the first attempt to address it, the host must then retry 25 ms
> later.
> 
> This patch introduces mxt_wake() which does a dummy i2c read, follows
> with a 25 ms sleep for mXT1386 chip. mxt_wake() is added to
> mxt_initialize(), mxt_load_fw() and mxt_start() to ensure before any
> actual i2c transfer, mxt_wake() can be executed.
> 
> Added new compatible string "atmel,mXT1386".
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>

Hello, Jiada!

This not critical, but yours suggested-by tag always should be the last
line of the commit message. It's like you're signing all the words that
were written by you.

> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f..d580050a237f 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -196,6 +196,7 @@ enum t100_type {
>  #define MXT_CRC_TIMEOUT		1000	/* msec */
>  #define MXT_FW_RESET_TIME	3000	/* msec */
>  #define MXT_FW_CHG_TIMEOUT	300	/* msec */
> +#define MXT_WAKEUP_TIME     25  /* msec */
>  
>  /* Command to unlock bootloader */
>  #define MXT_UNLOCK_CMD_MSB	0xaa
> @@ -2099,12 +2100,33 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
>  	release_firmware(cfg);
>  }
>  
> +static void mxt_wake(struct mxt_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	struct device *dev = &data->client->dev;
> +	struct device_node *np = dev->of_node;
> +	union i2c_smbus_data dummy;
> +
> +	if (!of_device_is_compatible(np, "atmel,mXT1386"))
> +		return;
I'm not sure whether you misses the previous answers from Dmitry
Torokhov and Rob Herring, but they suggested to add a new device-tree
property which should specify the atmel,wakeup-method.

There are 3 possible variants:

  - NONE
  - GPIO
  - I2C-SCL

Hence we should bail out from mxt_wake() if method is set to NONE or GPIO.

Perhaps we could even skip the GPIO method entirely by not mentioning it
anywhere, since this method isn't needed for now.

Nevertheless, I think it will be good to add DT compatible for the
"atmel,mXT1386", hence this part is good to me.

> +	/* TODO: add WAKE-GPIO support */
> +
> +	i2c_smbus_xfer(client->adapter, client->addr,
> +		       0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
> +		       &dummy);
> +

There is no need to sleep if there was no I2C error, meaning that device
wasn't in a deep-sleep mode. Please add a check for the value returned
by i2c_smbus_xfer() and invoke the msleep() only in a case of the I2C
error condition.

> +	msleep(MXT_WAKEUP_TIME);
> +}
> +
>  static int mxt_initialize(struct mxt_data *data)
>  {
>  	struct i2c_client *client = data->client;
>  	int recovery_attempts = 0;
>  	int error;
>  
> +	mxt_wake(data);
> +
>  	while (1) {

I assume the mxt_wake() should be placed here, since there is a 3
seconds timeout in the end of the while-loop, meaning that device may
get back into deep-sleep on a retry.

>  		error = mxt_read_info_block(data);
>  		if (!error)
> @@ -2787,6 +2809,8 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>  	if (ret)
>  		goto release_firmware;
>  
> +	mxt_wake(data);
> +
>  	if (!data->in_bootloader) {
>  		/* Change to the bootloader mode */
>  		data->in_bootloader = true;
> @@ -2928,6 +2952,7 @@ static const struct attribute_group mxt_attr_group = {
>  
>  static void mxt_start(struct mxt_data *data)
>  {
> +	mxt_wake(data);

Shouldn't the mxt_wake() be under the MXT_SUSPEND_DEEP_SLEEP switch? The
wake-up should be needed only for waking from deep-sleep mode.

>  	switch (data->suspend_mode) {
>  	case MXT_SUSPEND_T9_CTRL:
>  		mxt_soft_reset(data);
> @@ -3185,6 +3210,7 @@ static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
>  
>  static const struct of_device_id mxt_of_match[] = {
>  	{ .compatible = "atmel,maxtouch", },
> +	{ .compatible = "atmel,mXT1386", },
>  	/* Compatibles listed below are deprecated */
>  	{ .compatible = "atmel,qt602240_ts", },
>  	{ .compatible = "atmel,atmel_mxt_ts", },
> @@ -3209,6 +3235,7 @@ static const struct i2c_device_id mxt_id[] = {
>  	{ "atmel_mxt_tp", 0 },
>  	{ "maxtouch", 0 },
>  	{ "mXT224", 0 },
> +	{ "mXT1386", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mxt_id);
> 

