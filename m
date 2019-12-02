Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1FA10EEE0
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 19:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfLBSE3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 13:04:29 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38240 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfLBSE3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 13:04:29 -0500
Received: by mail-pj1-f67.google.com with SMTP id l4so56963pjt.5;
        Mon, 02 Dec 2019 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cQ9oVNJacMjkMJKWTxTPgLt210fBSMvgSycxfh0yVXI=;
        b=OY79MF/N8tYtw+exWoHVtpCuKzSe++gRB3jUFPCoZT/B0m7YffdkvHxyguDJH0OwXi
         KwNGNqHuJ8/hT+u4eul2SSg7pQLGsHuhPNLXY2bprxd6F3ctz+XVf73Ed4yDhKkMBOsj
         ZMg+Ihe7/5VqtH9MoPkxFWJSMpKEau+R2QJ7zcpHgALQeROkWNWtkb+ltwYST6oSLnFs
         wYJ7wObxvaUzrj5vvWLe9tWmeg2mrMqL5j9XY14KNVkK9p/jBwi+dwlpGFZwKoc9YsHI
         tyaPiYRXpPCZ0rGzRlY1S+alj4m4DFnCxJkPxiuoo8OzTfiYbSN9Bm6tkVCNuYaVPmhu
         9xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cQ9oVNJacMjkMJKWTxTPgLt210fBSMvgSycxfh0yVXI=;
        b=X1asr3IJizeSRwj1Ib0Z3J6T8wBffag8RQD0abBr9ihYc85hpby2S+ycm5XRuiwXnV
         if2ZP8lx/21zNPcN3waZ3JTHiwXMK3xEM8E558NcRGNszSSmTfPeHp4vrBwtvBiqArKy
         /0WjLm6wk9Up5RW466w3+9suaqfFZuei97qJ9MQjAtsrunXEpV6TetLruo6ZnDd7LChM
         /GtFoIj/sqLxSkQVMLAtLpnZv7s/Nc6JL1HxXtBR5c8LQS4YQW5i2gh4ITbPRmSWE2xk
         VS4lOijU7yx4twVw4pp/WlvBN8LWm4fKjC3UJjm0reeXVnioSOFLQxonH0lEq1lj+/xI
         oA/Q==
X-Gm-Message-State: APjAAAUFWAL/k8qzS0+Zdf8bbvks/mnAWD7Mywko9zRZKPdtdgpoHnEn
        ogDrjUy7egWb/pLueXXv7lEmuy9q
X-Google-Smtp-Source: APXvYqyy6xNi5ggCOgagMRSD+wggG/3RbwYmamrUmls5ljxkQCK3mFIJW0/RFwRDj5KGb7p6XfvJSw==
X-Received: by 2002:a17:90a:8a98:: with SMTP id x24mr315830pjn.113.1575309866724;
        Mon, 02 Dec 2019 10:04:26 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d26sm230000pgv.66.2019.12.02.10.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 10:04:25 -0800 (PST)
Date:   Mon, 2 Dec 2019 10:04:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20191202180423.GD50317@dtor-ws>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127120948.22251-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:09:48PM +0100, Marco Felsch wrote:
> It is possible to bring the device into a deep sleep state. To exit this
> state the reset or wakeup pin must be toggeled as documented in [1].
> Because of the poor documentation I used the several downstream kernels
> [2] and other applications notes [3] to indentify the related registers.
> 
> Furthermore I added the support to disable the device completely. This is
> the most effective power-saving mechanism. Disabling the device don't
> change the suspend logic because the hibernate mode needs a hardware
> reset anyway.
> 
> [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
> [2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/input/touchscreen/ft5x_ts.c
>     https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ft5336_driver.c
> [3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x16_registers.pdf
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - adapt commit message
> - don't return errors during suspend/resume
> - replace dev_err() by dev_warn()
> - add support to disable the regulator too
> 
>  drivers/input/touchscreen/edt-ft5x06.c | 49 ++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 8d2ec7947f0e..0bdd3440f684 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -39,6 +39,9 @@
>  #define WORK_REGISTER_NUM_X		0x33
>  #define WORK_REGISTER_NUM_Y		0x34
>  
> +#define PMOD_REGISTER_ACTIVE		0x00
> +#define PMOD_REGISTER_HIBERNATE		0x03
> +
>  #define M09_REGISTER_THRESHOLD		0x80
>  #define M09_REGISTER_GAIN		0x92
>  #define M09_REGISTER_OFFSET		0x93
> @@ -54,6 +57,7 @@
>  
>  #define WORK_REGISTER_OPMODE		0x3c
>  #define FACTORY_REGISTER_OPMODE		0x01
> +#define PMOD_REGISTER_OPMODE		0xa5
>  
>  #define TOUCH_EVENT_DOWN		0x00
>  #define TOUCH_EVENT_UP			0x01
> @@ -1235,9 +1239,29 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
>  static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> +	int ret;
>  
> -	if (device_may_wakeup(dev))
> +	if (device_may_wakeup(dev)) {
>  		enable_irq_wake(client->irq);

Can we start with preliminary patch dropping calls to enable_irq_wake()
and disable_irq_wake() as device/PM core will tale care of configuring
wake irqs properly for us, since we are now allowing I2C core to mark
the interrupt as wake IRQ.

So we need to do:

	if (device_may_wakeup(dev))
		return 0;

	<execute power down sequence>

Thanks.

-- 
Dmitry
