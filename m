Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252BB2F0F5E
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 10:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbhAKJqV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 04:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbhAKJqV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 04:46:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421EC061794
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 01:45:41 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1kytlb-0004gW-7d; Mon, 11 Jan 2021 10:45:39 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1kytla-0004Sx-4f; Mon, 11 Jan 2021 10:45:38 +0100
Date:   Mon, 11 Jan 2021 10:45:38 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210111094538.yg3otwgesgyemktp@pengutronix.de>
References: <20210108192337.563679-1-stephan@gerhold.net>
 <20210108192337.563679-2-stephan@gerhold.net>
 <20210111083612.swe2bu7mvjzjromg@pengutronix.de>
 <X/wZqiRbx6nmrj0e@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/wZqiRbx6nmrj0e@gerhold.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:31:11 up 39 days, 23:37, 27 users,  load average: 0.20, 0.07,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21-01-11 10:26, Stephan Gerhold wrote:
> Hi Marco,
> 
> thanks for the review!
> 
> On Mon, Jan 11, 2021 at 09:36:12AM +0100, Marco Felsch wrote:
> > Hi Stephan,
> > 
> > thanks for the patch :) Please see my inline comments.
> > 
> > On 21-01-08 20:23, Stephan Gerhold wrote:
> > > At the moment, the edt-ft5x06 driver can control a single regulator
> > > ("vcc"). However, some FocalTech touch controllers have an additional
> > > IOVCC pin that should be supplied with the digital I/O voltage.
> > > 
> > > The I/O voltage might be provided by another regulator that should also
> > > be kept on. Otherwise, the touchscreen can randomly stop functioning if
> > > the regulator is turned off because no other components still require it.
> > > 
> > > Implement (optional) support for also enabling an "iovcc-supply".
> > > IOVCC is needed whenever VCC is needed, so switch to the regulator bulk
> > > APIs to request/enable/disable both when appropriate.
> > > 
> > > Cc: Ondrej Jirman <megous@megous.com>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > >  drivers/input/touchscreen/edt-ft5x06.c | 35 ++++++++++++++------------
> > >  1 file changed, 19 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > index 2eefbc2485bc..bf2e208112fe 100644
> > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > @@ -103,7 +103,7 @@ struct edt_ft5x06_ts_data {
> > >  	struct touchscreen_properties prop;
> > >  	u16 num_x;
> > >  	u16 num_y;
> > > -	struct regulator *vcc;
> > > +	struct regulator_bulk_data regulators[2];
> > 
> > Is there an enabling order we must follow?
> > 
> 
> I don't know, sadly. The datasheets I was able to find do not mention
> anything about this; the power-on sequence only includes the VDD line.

I've goolged a bit :)

Check this: https://focuslcds.com/content/FT5X26.pdf, page 12 of 32

There it is mentioned that we need to enable it first and add a 10us
delay till we can enable the vdd line. So unfortunately the bulk_api
can't be used as it is today. Another solution could be to extended the
bulk api to respect on/off delays.

Regards,
  Marco

> I tried several suspend/resume cycles with both regulators set up and it
> worked fine, which could mean that I was lucky or that the order does
> not matter. :)
> 
> What do you think?
> 
> > >  	struct gpio_desc *reset_gpio;
> > >  	struct gpio_desc *wake_gpio;
> > > @@ -1066,7 +1066,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
> > >  {
> > >  	struct edt_ft5x06_ts_data *data = arg;
> > >  
> > > -	regulator_disable(data->vcc);
> > > +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> > >  }
> > >  
> > >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > > @@ -1098,18 +1098,19 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > >  
> > >  	tsdata->max_support_points = chip_data->max_support_points;
> > >  
> > > -	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> > > -	if (IS_ERR(tsdata->vcc)) {
> > > -		error = PTR_ERR(tsdata->vcc);
> > > -		if (error != -EPROBE_DEFER)
> > > -			dev_err(&client->dev,
> > > -				"failed to request regulator: %d\n", error);
> > > -		return error;
> > > -	}
> > > +	tsdata->regulators[0].supply = "vcc";
> > > +	tsdata->regulators[1].supply = "iovcc";
> > > +	error = devm_regulator_bulk_get(&client->dev,
> > > +					ARRAY_SIZE(tsdata->regulators),
> > > +					tsdata->regulators);
> > > +	if (error)
> > > +		return dev_err_probe(&client->dev, error,
> > > +				     "failed to request regulators\n");
> > 
> > It would be nice to have a patch in front of this one which handles the
> > support for dev_err_probe().
> > 
> 
> OK, I can send a v2 with the dev_err_probe() change separated into an
> extra patch.
> 
> Thanks!
> Stephan
> 
> > 
> > >  
> > > -	error = regulator_enable(tsdata->vcc);
> > > +	error = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
> > > +				      tsdata->regulators);
> > >  	if (error < 0) {
> > > -		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> > > +		dev_err(&client->dev, "failed to enable regulators: %d\n", error);
> > >  		return error;
> > >  	}
> > >  
> > > @@ -1286,9 +1287,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> > >  	gpiod_set_value_cansleep(reset_gpio, 1);
> > >  	usleep_range(1000, 2000);
> > >  
> > > -	ret = regulator_disable(tsdata->vcc);
> > > +	ret = regulator_bulk_disable(ARRAY_SIZE(tsdata->regulators),
> > > +				     tsdata->regulators);
> > >  	if (ret)
> > > -		dev_warn(dev, "Failed to disable vcc\n");
> > > +		dev_warn(dev, "Failed to disable regulators\n");
> > >  
> > >  	return 0;
> > >  }
> > > @@ -1319,9 +1321,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> > >  		gpiod_set_value_cansleep(reset_gpio, 1);
> > >  		usleep_range(5000, 6000);
> > >  
> > > -		ret = regulator_enable(tsdata->vcc);
> > > +		ret = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
> > > +					    tsdata->regulators);
> > >  		if (ret) {
> > > -			dev_err(dev, "Failed to enable vcc\n");
> > > +			dev_err(dev, "Failed to enable regulators\n");
> > >  			return ret;
> > >  		}
> > >  
> > > -- 
> > > 2.30.0
> > > 
> > > 
> > 
> > -- 
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
