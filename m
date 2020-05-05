Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79051C501F
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 10:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgEEITj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 04:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEITj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 04:19:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAB3C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 01:19:39 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVsnh-0007Hm-Ey; Tue, 05 May 2020 10:19:37 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVsng-0002pB-NX; Tue, 05 May 2020 10:19:36 +0200
Date:   Tue, 5 May 2020 10:19:36 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v2 1/3] input: touch: ads7846: add short-hand for
 spi->dev in probe() function
Message-ID: <20200505081936.GA18755@pengutronix.de>
References: <20200504173745.1246505-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504173745.1246505-1-daniel@zonque.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:15:39 up 73 days, 19:32, 142 users,  load average: 7.24, 3.82,
 2.84
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

thanks for splitting it up :) The patch subject should start with:
"Input: ads7846 - " to align it with the current patches.

On 20-05-04 19:37, Daniel Mack wrote:
> This will make the code a bit more terse.
> No functional change intended.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/input/touchscreen/ads7846.c | 45 +++++++++++++++--------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 8fd7fc39c4fd..a1033b06f031 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -1265,20 +1265,21 @@ static int ads7846_probe(struct spi_device *spi)
>  {
>  	const struct ads7846_platform_data *pdata;
>  	struct ads7846 *ts;
> +	struct device *dev = &spi->dev;
>  	struct ads7846_packet *packet;
>  	struct input_dev *input_dev;
>  	unsigned long irq_flags;
>  	int err;
>  
>  	if (!spi->irq) {
> -		dev_dbg(&spi->dev, "no IRQ?\n");
> +		dev_dbg(dev, "no IRQ?\n");
>  		return -EINVAL;
>  	}
>  
>  	/* don't exceed max specified sample rate */
>  	if (spi->max_speed_hz > (125000 * SAMPLE_BITS)) {
> -		dev_err(&spi->dev, "f(sample) %d KHz?\n",
> -				(spi->max_speed_hz/SAMPLE_BITS)/1000);
> +		dev_err(dev, "f(sample) %d KHz?\n",
> +			     (spi->max_speed_hz/SAMPLE_BITS)/1000);

This should be aligned correctly.

Appart of these two nits feel free to add my:
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

>  		return -EINVAL;
>  	}
>  
> @@ -1310,9 +1311,9 @@ static int ads7846_probe(struct spi_device *spi)
>  	mutex_init(&ts->lock);
>  	init_waitqueue_head(&ts->wait);
>  
> -	pdata = dev_get_platdata(&spi->dev);
> +	pdata = dev_get_platdata(dev);
>  	if (!pdata) {
> -		pdata = ads7846_probe_dt(&spi->dev);
> +		pdata = ads7846_probe_dt(dev);
>  		if (IS_ERR(pdata)) {
>  			err = PTR_ERR(pdata);
>  			goto err_free_mem;
> @@ -1354,12 +1355,12 @@ static int ads7846_probe(struct spi_device *spi)
>  
>  	ts->wait_for_sync = pdata->wait_for_sync ? : null_wait_for_sync;
>  
> -	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(&spi->dev));
> +	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
>  	snprintf(ts->name, sizeof(ts->name), "ADS%d Touchscreen", ts->model);
>  
>  	input_dev->name = ts->name;
>  	input_dev->phys = ts->phys;
> -	input_dev->dev.parent = &spi->dev;
> +	input_dev->dev.parent = dev;
>  
>  	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
>  	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
> @@ -1393,16 +1394,16 @@ static int ads7846_probe(struct spi_device *spi)
>  
>  	ads7846_setup_spi_msg(ts, pdata);
>  
> -	ts->reg = regulator_get(&spi->dev, "vcc");
> +	ts->reg = regulator_get(dev, "vcc");
>  	if (IS_ERR(ts->reg)) {
>  		err = PTR_ERR(ts->reg);
> -		dev_err(&spi->dev, "unable to get regulator: %d\n", err);
> +		dev_err(dev, "unable to get regulator: %d\n", err);
>  		goto err_free_gpio;
>  	}
>  
>  	err = regulator_enable(ts->reg);
>  	if (err) {
> -		dev_err(&spi->dev, "unable to enable regulator: %d\n", err);
> +		dev_err(dev, "unable to enable regulator: %d\n", err);
>  		goto err_put_regulator;
>  	}
>  
> @@ -1410,18 +1411,18 @@ static int ads7846_probe(struct spi_device *spi)
>  	irq_flags |= IRQF_ONESHOT;
>  
>  	err = request_threaded_irq(spi->irq, ads7846_hard_irq, ads7846_irq,
> -				   irq_flags, spi->dev.driver->name, ts);
> +				   irq_flags, dev->driver->name, ts);
>  	if (err && !pdata->irq_flags) {
> -		dev_info(&spi->dev,
> +		dev_info(dev,
>  			"trying pin change workaround on irq %d\n", spi->irq);
>  		irq_flags |= IRQF_TRIGGER_RISING;
>  		err = request_threaded_irq(spi->irq,
>  				  ads7846_hard_irq, ads7846_irq,
> -				  irq_flags, spi->dev.driver->name, ts);
> +				  irq_flags, dev->driver->name, ts);
>  	}
>  
>  	if (err) {
> -		dev_dbg(&spi->dev, "irq %d busy?\n", spi->irq);
> +		dev_dbg(dev, "irq %d busy?\n", spi->irq);
>  		goto err_disable_regulator;
>  	}
>  
> @@ -1429,18 +1430,18 @@ static int ads7846_probe(struct spi_device *spi)
>  	if (err)
>  		goto err_free_irq;
>  
> -	dev_info(&spi->dev, "touchscreen, irq %d\n", spi->irq);
> +	dev_info(dev, "touchscreen, irq %d\n", spi->irq);
>  
>  	/*
>  	 * Take a first sample, leaving nPENIRQ active and vREF off; avoid
>  	 * the touchscreen, in case it's not connected.
>  	 */
>  	if (ts->model == 7845)
> -		ads7845_read12_ser(&spi->dev, PWRDOWN);
> +		ads7845_read12_ser(dev, PWRDOWN);
>  	else
> -		(void) ads7846_read12_ser(&spi->dev, READ_12BIT_SER(vaux));
> +		(void) ads7846_read12_ser(dev, READ_12BIT_SER(vaux));
>  
> -	err = sysfs_create_group(&spi->dev.kobj, &ads784x_attr_group);
> +	err = sysfs_create_group(&dev->kobj, &ads784x_attr_group);
>  	if (err)
>  		goto err_remove_hwmon;
>  
> @@ -1448,19 +1449,19 @@ static int ads7846_probe(struct spi_device *spi)
>  	if (err)
>  		goto err_remove_attr_group;
>  
> -	device_init_wakeup(&spi->dev, pdata->wakeup);
> +	device_init_wakeup(dev, pdata->wakeup);
>  
>  	/*
>  	 * If device does not carry platform data we must have allocated it
>  	 * when parsing DT data.
>  	 */
> -	if (!dev_get_platdata(&spi->dev))
> -		devm_kfree(&spi->dev, (void *)pdata);
> +	if (!dev_get_platdata(dev))
> +		devm_kfree(dev, (void *)pdata);
>  
>  	return 0;
>  
>   err_remove_attr_group:
> -	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
> +	sysfs_remove_group(&dev->kobj, &ads784x_attr_group);
>   err_remove_hwmon:
>  	ads784x_hwmon_unregister(spi, ts);
>   err_free_irq:
> -- 
> 2.26.2
