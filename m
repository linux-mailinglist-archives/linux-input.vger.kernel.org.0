Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE5E6D84CB
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 02:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387824AbfJPAYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 20:24:17 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39643 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfJPAYR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 20:24:17 -0400
Received: by mail-pl1-f194.google.com with SMTP id s17so10372892plp.6;
        Tue, 15 Oct 2019 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=iz/2QmgX5qn3uw1ZPZbSw14i0nhsp3XhRLoNHgWrIzI=;
        b=odBco6QfeM5DozpV7q6a1OoesIUrgnTLnKczFHo8cax6NZv7paq9MZpwIGoNqFVnbd
         CR51o+odye3KOZ5bkOQlfpXASUNyI1CJP1tJrgRxZUn9/OLeOoj8ke5JezNAra2rjeyu
         T+QCP/2AtnluQuu7ZN2RfxqnWhKfnkUAUzJQrDuMqdUquKaTPfUNqFEQeRyg33kZR9EE
         7VqfLnWhe69YATA2/FFOn69JC3opRZK0oXStzi0UkhJjEa2A1zT4koZQyUmwt11A8BN4
         vYctQhrywxwC5sWVMCq3D6XAezim8BfrtSNSvHh45EDOcfySeqDLLkrfsUlHxDACExCo
         /kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=iz/2QmgX5qn3uw1ZPZbSw14i0nhsp3XhRLoNHgWrIzI=;
        b=Kvk17VW+YXiR8TVffIQwvx9mUzJ1oXGJUhZi8VbMnsGXRXCod3io3NJec7EqoIn5ag
         BKmYIVyxB3oIxr7otNRVuPygEgWsS+NPkGTM1VWRLlrZAUC6a+PKoCOtEINF0fyQ3yrW
         KFW7GVEZl1iLtbX8L3PwpdRKiYHjAHrck3CxyE/yN4OymVFp/Imnq7lJLGeVcmAoEzrk
         GjsOeb57niGG6aPIBIKmQFLeupaCSjzZwjdLkHsF8wqWmDhagJK3ttjlJVMINBVZQuuE
         HWW1Mpl8Ntpskn95ztnBMuAgujIyG4aTm/5Oz7udtopYsM3UslNAE9HURr+KWuUVGTgZ
         QM8A==
X-Gm-Message-State: APjAAAU7n5EjDO7F/ZYd3XviaM+qU8UIrqnG+uVg8lZdxcyH8rpUj+us
        kTz+RmbAYn5M0ZP9+fRidvM=
X-Google-Smtp-Source: APXvYqyP6eGaLruYLwn6jIJXgRPw69p4n96K8wrDiqlij5xNlqk9dU/pwtuDS8gLjuBRKpBX6eqKTg==
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr38465001plb.332.1571185455837;
        Tue, 15 Oct 2019 17:24:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k6sm20913441pfg.162.2019.10.15.17.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 17:24:15 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:24:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] Input: mpr121: Add polling mode
Message-ID: <20191016002413.GM105649@dtor-ws>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-5-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570083176-8231-5-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 03, 2019 at 08:12:55AM +0200, Michal Vokáč wrote:
> In case the interrupt line is not available, polling can be used
> to read out the state of the keys. Period of the polling needs to
> be configured by the poll-interval DT property.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied, thank you.

> ---
> Changes since v2:
>  - None
> 
> Changes since v1:
>  - Use poll-interval property name instead of linux,poll-interval.
> 
>  drivers/input/keyboard/mpr121_touchkey.c | 69 +++++++++++++++++++++++---------
>  1 file changed, 51 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
> index ee80de44ce3f..40d6e5087cde 100644
> --- a/drivers/input/keyboard/mpr121_touchkey.c
> +++ b/drivers/input/keyboard/mpr121_touchkey.c
> @@ -54,6 +54,9 @@
>  /* MPR121 has 12 keys */
>  #define MPR121_MAX_KEY_COUNT		12
>  
> +#define MPR121_MIN_POLL_INTERVAL	10
> +#define MPR121_MAX_POLL_INTERVAL	200
> +
>  struct mpr121_touchkey {
>  	struct i2c_client	*client;
>  	struct input_dev	*input_dev;
> @@ -115,11 +118,11 @@ static struct regulator *mpr121_vdd_supply_init(struct device *dev)
>  	return vdd_supply;
>  }
>  
> -static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
> +static void mpr_touchkey_report(struct input_dev *dev)
>  {
> -	struct mpr121_touchkey *mpr121 = dev_id;
> -	struct i2c_client *client = mpr121->client;
> +	struct mpr121_touchkey *mpr121 = input_get_drvdata(dev);
>  	struct input_dev *input = mpr121->input_dev;
> +	struct i2c_client *client = mpr121->client;
>  	unsigned long bit_changed;
>  	unsigned int key_num;
>  	int reg;
> @@ -127,14 +130,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
>  	reg = i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_1_ADDR);
>  	if (reg < 0) {
>  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
> -		goto out;
> +		return;
>  	}
>  
>  	reg <<= 8;
>  	reg |= i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_0_ADDR);
>  	if (reg < 0) {
>  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
> -		goto out;
> +		return;
>  	}
>  
>  	reg &= TOUCH_STATUS_MASK;
> @@ -155,8 +158,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
>  
>  	}
>  	input_sync(input);
> +}
> +
> +static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
> +{
> +	struct mpr121_touchkey *mpr121 = dev_id;
> +
> +	mpr_touchkey_report(mpr121->input_dev);
>  
> -out:
>  	return IRQ_HANDLED;
>  }
>  
> @@ -229,14 +238,10 @@ static int mpr_touchkey_probe(struct i2c_client *client,
>  	int vdd_uv;
>  	struct mpr121_touchkey *mpr121;
>  	struct input_dev *input_dev;
> +	u32 poll_interval = 0;
>  	int error;
>  	int i;
>  
> -	if (!client->irq) {
> -		dev_err(dev, "irq number should not be zero\n");
> -		return -EINVAL;
> -	}
> -
>  	vdd_supply = mpr121_vdd_supply_init(dev);
>  	if (IS_ERR(vdd_supply))
>  		return PTR_ERR(vdd_supply);
> @@ -274,6 +279,7 @@ static int mpr_touchkey_probe(struct i2c_client *client,
>  	if (device_property_read_bool(dev, "autorepeat"))
>  		__set_bit(EV_REP, input_dev->evbit);
>  	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +	input_set_drvdata(input_dev, mpr121);
>  
>  	input_dev->keycode = mpr121->keycodes;
>  	input_dev->keycodesize = sizeof(mpr121->keycodes[0]);
> @@ -288,13 +294,40 @@ static int mpr_touchkey_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	error = devm_request_threaded_irq(dev, client->irq, NULL,
> -					  mpr_touchkey_interrupt,
> -					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -					  dev->driver->name, mpr121);
> -	if (error) {
> -		dev_err(dev, "Failed to register interrupt\n");
> -		return error;
> +	device_property_read_u32(dev, "poll-interval", &poll_interval);
> +
> +	if (client->irq) {
> +		error = devm_request_threaded_irq(dev, client->irq, NULL,
> +						  mpr_touchkey_interrupt,
> +						  IRQF_TRIGGER_FALLING |
> +						  IRQF_ONESHOT,
> +						  dev->driver->name, mpr121);
> +		if (error) {
> +			dev_err(dev, "Failed to register interrupt\n");
> +			return error;
> +		}
> +	} else if (poll_interval) {
> +		if (poll_interval < MPR121_MIN_POLL_INTERVAL)
> +			return -EINVAL;
> +
> +		if (poll_interval > MPR121_MAX_POLL_INTERVAL)
> +			return -EINVAL;
> +
> +		error = input_setup_polling(input_dev, mpr_touchkey_report);
> +		if (error) {
> +			dev_err(dev, "Failed to setup polling\n");
> +			return error;
> +		}
> +
> +		input_set_poll_interval(input_dev, poll_interval);
> +		input_set_min_poll_interval(input_dev,
> +					    MPR121_MIN_POLL_INTERVAL);
> +		input_set_max_poll_interval(input_dev,
> +					    MPR121_MAX_POLL_INTERVAL);
> +	} else {
> +		dev_err(dev,
> +			"invalid IRQ number and polling not configured\n");
> +		return -EINVAL;
>  	}
>  
>  	error = input_register_device(input_dev);
> -- 
> 2.1.4
> 

-- 
Dmitry
