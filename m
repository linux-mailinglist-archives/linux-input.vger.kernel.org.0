Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C987C2F0F1C
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 10:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbhAKJ3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 04:29:44 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:25204 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbhAKJ3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 04:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610357208;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=Thwx2ec/xiYXWR1am8RvtOIs3D2qApCivqd/df8SyCQ=;
        b=ZMpRKgpKP55bqHpTsq6W1kslP9/yCvht0ayVgUMnjp0anvyXuYJmrpn8qUYZtMKnBB
        EFQgZeA6PEfb1aos+wB5Vn1b6rGtbwB7FDzvD2DW39jbbjSQbFZVEVFaMV91t+iDJlyc
        AUwNTVBvVGQEzk3JIJW0koYzZGel0EH0XTajP2w9Y8VME+8/pMcsdYXzXRWKXv4nS7ze
        YX8QUAzQ2dbZ8DWeoFS7Rv9B4IOBGKOCHxCXFATP7zYXjseS9fvE0FNkggLJXskYhULk
        Fo4Cxfqa19+1ikdraTeIDpWqLSUkSfDU7zImU00jxItXUyFmjv/qB6mkrRmXD/cggPfU
        6XeQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8jxIcvGBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0B9Qeqgv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 11 Jan 2021 10:26:40 +0100 (CET)
Date:   Mon, 11 Jan 2021 10:26:25 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <X/wZqiRbx6nmrj0e@gerhold.net>
References: <20210108192337.563679-1-stephan@gerhold.net>
 <20210108192337.563679-2-stephan@gerhold.net>
 <20210111083612.swe2bu7mvjzjromg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111083612.swe2bu7mvjzjromg@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

thanks for the review!

On Mon, Jan 11, 2021 at 09:36:12AM +0100, Marco Felsch wrote:
> Hi Stephan,
> 
> thanks for the patch :) Please see my inline comments.
> 
> On 21-01-08 20:23, Stephan Gerhold wrote:
> > At the moment, the edt-ft5x06 driver can control a single regulator
> > ("vcc"). However, some FocalTech touch controllers have an additional
> > IOVCC pin that should be supplied with the digital I/O voltage.
> > 
> > The I/O voltage might be provided by another regulator that should also
> > be kept on. Otherwise, the touchscreen can randomly stop functioning if
> > the regulator is turned off because no other components still require it.
> > 
> > Implement (optional) support for also enabling an "iovcc-supply".
> > IOVCC is needed whenever VCC is needed, so switch to the regulator bulk
> > APIs to request/enable/disable both when appropriate.
> > 
> > Cc: Ondrej Jirman <megous@megous.com>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 35 ++++++++++++++------------
> >  1 file changed, 19 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 2eefbc2485bc..bf2e208112fe 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -103,7 +103,7 @@ struct edt_ft5x06_ts_data {
> >  	struct touchscreen_properties prop;
> >  	u16 num_x;
> >  	u16 num_y;
> > -	struct regulator *vcc;
> > +	struct regulator_bulk_data regulators[2];
> 
> Is there an enabling order we must follow?
> 

I don't know, sadly. The datasheets I was able to find do not mention
anything about this; the power-on sequence only includes the VDD line.

I tried several suspend/resume cycles with both regulators set up and it
worked fine, which could mean that I was lucky or that the order does
not matter. :)

What do you think?

> >  	struct gpio_desc *reset_gpio;
> >  	struct gpio_desc *wake_gpio;
> > @@ -1066,7 +1066,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
> >  {
> >  	struct edt_ft5x06_ts_data *data = arg;
> >  
> > -	regulator_disable(data->vcc);
> > +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> >  }
> >  
> >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > @@ -1098,18 +1098,19 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  
> >  	tsdata->max_support_points = chip_data->max_support_points;
> >  
> > -	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> > -	if (IS_ERR(tsdata->vcc)) {
> > -		error = PTR_ERR(tsdata->vcc);
> > -		if (error != -EPROBE_DEFER)
> > -			dev_err(&client->dev,
> > -				"failed to request regulator: %d\n", error);
> > -		return error;
> > -	}
> > +	tsdata->regulators[0].supply = "vcc";
> > +	tsdata->regulators[1].supply = "iovcc";
> > +	error = devm_regulator_bulk_get(&client->dev,
> > +					ARRAY_SIZE(tsdata->regulators),
> > +					tsdata->regulators);
> > +	if (error)
> > +		return dev_err_probe(&client->dev, error,
> > +				     "failed to request regulators\n");
> 
> It would be nice to have a patch in front of this one which handles the
> support for dev_err_probe().
> 

OK, I can send a v2 with the dev_err_probe() change separated into an
extra patch.

Thanks!
Stephan

> 
> >  
> > -	error = regulator_enable(tsdata->vcc);
> > +	error = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
> > +				      tsdata->regulators);
> >  	if (error < 0) {
> > -		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> > +		dev_err(&client->dev, "failed to enable regulators: %d\n", error);
> >  		return error;
> >  	}
> >  
> > @@ -1286,9 +1287,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> >  	gpiod_set_value_cansleep(reset_gpio, 1);
> >  	usleep_range(1000, 2000);
> >  
> > -	ret = regulator_disable(tsdata->vcc);
> > +	ret = regulator_bulk_disable(ARRAY_SIZE(tsdata->regulators),
> > +				     tsdata->regulators);
> >  	if (ret)
> > -		dev_warn(dev, "Failed to disable vcc\n");
> > +		dev_warn(dev, "Failed to disable regulators\n");
> >  
> >  	return 0;
> >  }
> > @@ -1319,9 +1321,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> >  		gpiod_set_value_cansleep(reset_gpio, 1);
> >  		usleep_range(5000, 6000);
> >  
> > -		ret = regulator_enable(tsdata->vcc);
> > +		ret = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
> > +					    tsdata->regulators);
> >  		if (ret) {
> > -			dev_err(dev, "Failed to enable vcc\n");
> > +			dev_err(dev, "Failed to enable regulators\n");
> >  			return ret;
> >  		}
> >  
> > -- 
> > 2.30.0
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
