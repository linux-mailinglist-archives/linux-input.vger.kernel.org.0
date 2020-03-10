Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EB517EFA2
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 05:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgCJE0s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 00:26:48 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55593 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgCJE0r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 00:26:47 -0400
Received: by mail-pj1-f66.google.com with SMTP id a18so845063pjs.5
        for <linux-input@vger.kernel.org>; Mon, 09 Mar 2020 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Ols9Dp+3Hl4obwjqMB90LL1LcauNGXmqkUVHXtPcvY=;
        b=kIwSVbDiGMvfCRti6Ctcu7UItcrU6/ir/yrPR01q8wzflG3NjX6/5Kivxoq2dHp41m
         5yQ5LWT7ya1Welbz0AyOwmV62F7ZeRlPGzFqx1Pt5HVlnJxtVs+PMLCTeHwO0l6gtpP3
         DANGr141Fx0l4NyiNpYNPhZGb2gE6Dca+3DuXfEYgeArgikzOHk7ar3M2BaLTVOPey+/
         mbpepeU1T7kNd7nhhJD2TBWKTPTNJZo1qrUDD0znOlGtXIhqhVh4fBOoqIGmYhq9Qav+
         A5JGOHejFhPu9/GNx8crt3t6HoSFIMylba9pt5xrV8cM/ONV+Zagstd8BxzNaOjhxXns
         qeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Ols9Dp+3Hl4obwjqMB90LL1LcauNGXmqkUVHXtPcvY=;
        b=sZlLKNqJd6zSQpsU1f4Ji7WjzyWkXmjFkftrkKlF7h/oZoPQVclF9hv3gSv/zRKrnp
         56vHM5UBARP+g0trLGnPdZgJKxMUhQ7FFtgF+A3Pz68dTfKEhUkBA+g3va5Rm3qKQcWB
         rly1qo2DLCS0nwmDKubrt5eSiJu1x9/0jV6UDUyCGxDfDwUt6/fO9VaqFbtGIxvSB/OO
         ZCzGYdWR7Rt6lvE+9DmX4TPYAF1nnLb0qEhDaWqtnSv5bVPK7gVAIglRNWxcwIUHklD7
         lN6WPDJ/FdN0z69vjx1fxssqnYXY0zk71jshepsqJ6lBtdfhU+mdHBLviafYGiKZpQHf
         73nA==
X-Gm-Message-State: ANhLgQ3aOQ2i0vJEiPAYcUyq3ZICP2hW6mtbSuxcN7IyLQRz8ldqIvl6
        q1QYKvT4vnG2iiHWwgqFtSY=
X-Google-Smtp-Source: ADFU+vvhK7BzXPzfvkBCsItn82+SqK2LAzrn1zhq521oDGOi/EhUGYVJGAapgLnM3NJ94G9AowD8ag==
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr2719235pju.46.1583814406391;
        Mon, 09 Mar 2020 21:26:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id s7sm44711971pgp.44.2020.03.09.21.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 21:26:45 -0700 (PDT)
Date:   Mon, 9 Mar 2020 21:26:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     haibo.chen@nxp.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
Message-ID: <20200310042643.GB192640@dtor-ws>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <1581410472-3225-2-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581410472-3225-2-git-send-email-haibo.chen@nxp.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 11, 2020 at 04:41:12PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> If GPIO is connected to an IRQ then it should not request it as
> GPIO function only when free its IRQ resource.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/input/touchscreen/egalax_ts.c | 44 +++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
> index 5e35ca5edc7b..c7983104a0b9 100644
> --- a/drivers/input/touchscreen/egalax_ts.c
> +++ b/drivers/input/touchscreen/egalax_ts.c
> @@ -116,6 +116,26 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int egalax_irq_request(struct egalax_ts *ts)
> +{
> +	int ret;
> +	struct i2c_client *client = ts->client;
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					egalax_ts_interrupt,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +					"egalax_ts", ts);
> +	if (ret < 0)
> +		dev_err(&client->dev, "Failed to register interrupt\n");
> +
> +	return ret;
> +}
> +
> +static void egalax_free_irq(struct egalax_ts *ts)
> +{
> +	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +}
> +
>  /* wake up controller by an falling edge of interrupt gpio.  */
>  static int egalax_wake_up_device(struct i2c_client *client)
>  {
> @@ -225,19 +245,15 @@ static int egalax_ts_probe(struct i2c_client *client,
>  			     ABS_MT_POSITION_Y, 0, EGALAX_MAX_Y, 0, 0);
>  	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS, 0);
>  
> -	error = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> -					  egalax_ts_interrupt,
> -					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					  "egalax_ts", ts);
> -	if (error < 0) {
> -		dev_err(&client->dev, "Failed to register interrupt\n");
> +	error = egalax_irq_request(ts);
> +	if (error)
>  		return error;
> -	}
>  
>  	error = input_register_device(ts->input_dev);
>  	if (error)
>  		return error;
>  
> +	i2c_set_clientdata(client, ts);
>  	return 0;
>  }
>  
> @@ -253,11 +269,10 @@ static int __maybe_unused egalax_ts_suspend(struct device *dev)
>  		0x3, 0x6, 0xa, 0x3, 0x36, 0x3f, 0x2, 0, 0, 0
>  	};
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct egalax_ts *ts = i2c_get_clientdata(client);
>  	int ret;
>  
> -	if (device_may_wakeup(dev))
> -		return enable_irq_wake(client->irq);
> -

Why are you removing handling of the interrupt as a wakeup source if
device is configured for wakeup? I guess it is a noop and I2C core does
it for us on newer kernels anyways, but such cleanup should be in  a
separate patch. Still, you do not want to put the controller to sleep if
it is supposed to be a wakeup source.

> +	egalax_free_irq(ts);

It sounds to me you want simply disable interrupts in suspend. Does not
calling disable_irq() here suffice?

Thanks.

-- 
Dmitry
