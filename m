Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5E6E8723
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 12:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfJ2LaL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 07:30:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45195 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfJ2LaK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 07:30:10 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPPhI-0001hB-9f; Tue, 29 Oct 2019 12:30:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPPhH-0003aC-0J; Tue, 29 Oct 2019 12:29:59 +0100
Date:   Tue, 29 Oct 2019 12:29:58 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] input: edt-ft5x06: Add support for regulator
Message-ID: <20191029112958.gd3vbbcjxuw6n3m5@pengutronix.de>
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-2-megous@megous.com>
 <20191029041233.GD57214@dtor-ws>
 <20191029085545.cw5c24gi76gbfdhy@pengutronix.de>
 <20191029112129.t4mxqyybltjbuyhj@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029112129.t4mxqyybltjbuyhj@core.my.home>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:26:01 up 164 days, 17:44, 99 users,  load average: 0.11, 0.04,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ondřej,

On 19-10-29 12:21, Ondřej Jirman wrote:
> Hi Marco,
> 
> On Tue, Oct 29, 2019 at 09:55:45AM +0100, Marco Felsch wrote:
> > Hi Dmitry,
> > 
> > On 19-10-28 21:12, Dmitry Torokhov wrote:
> > > On Tue, Oct 29, 2019 at 01:58:04AM +0100, Ondrej Jirman wrote:
> > > > From: Mylène Josserand <mylene.josserand@bootlin.com>
> > > > 
> > > > Add the support for enabling optional regulator that may be used as VCC
> > > > source.
> > > > 
> > > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > > 
> > > Applied, thank you.
> > 
> > What happens with my vdd patches?
> 
> Sorry for not noticing your patches, I was only aware of Mylène's older series.
> It looks like you can just skip regulator enable support from your series, and
> re-send the deep-sleep mechanism and wakeup source patches only.

No problems just wondered myself. Now I need to adapt the patches ^^

> I'll test it with my board, and give you a tested-by.

Thanks.

Regards,
  Marco

> thank you and regards,
> 	o.
> 
> > Regards,
> >   Marco
> > 
> > > 
> > > > ---
> > > >  drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > > 
> > > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > > index 5525f1fb1526..d61731c0037d 100644
> > > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <linux/input/mt.h>
> > > >  #include <linux/input/touchscreen.h>
> > > >  #include <asm/unaligned.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >  
> > > >  #define WORK_REGISTER_THRESHOLD		0x00
> > > >  #define WORK_REGISTER_REPORT_RATE	0x08
> > > > @@ -88,6 +89,7 @@ struct edt_ft5x06_ts_data {
> > > >  	struct touchscreen_properties prop;
> > > >  	u16 num_x;
> > > >  	u16 num_y;
> > > > +	struct regulator *vcc;
> > > >  
> > > >  	struct gpio_desc *reset_gpio;
> > > >  	struct gpio_desc *wake_gpio;
> > > > @@ -1036,6 +1038,13 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
> > > >  	}
> > > >  }
> > > >  
> > > > +static void edt_ft5x06_disable_regulator(void *arg)
> > > > +{
> > > > +	struct edt_ft5x06_ts_data *data = arg;
> > > > +
> > > > +	regulator_disable(data->vcc);
> > > > +}
> > > > +
> > > >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > > >  					 const struct i2c_device_id *id)
> > > >  {
> > > > @@ -1064,6 +1073,27 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > > >  
> > > >  	tsdata->max_support_points = chip_data->max_support_points;
> > > >  
> > > > +	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> > > > +	if (IS_ERR(tsdata->vcc)) {
> > > > +		error = PTR_ERR(tsdata->vcc);
> > > > +		if (error != -EPROBE_DEFER)
> > > > +			dev_err(&client->dev,
> > > > +				"failed to request regulator: %d\n", error);
> > > > +		return error;
> > > > +	}
> > > > +
> > > > +	error = regulator_enable(tsdata->vcc);
> > > > +	if (error < 0) {
> > > > +		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> > > > +		return error;
> > > > +	}
> > > > +
> > > > +	error = devm_add_action_or_reset(&client->dev,
> > > > +					 edt_ft5x06_disable_regulator,
> > > > +					 tsdata);
> > > > +	if (error)
> > > > +		return error;
> > > > +
> > > >  	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
> > > >  						     "reset", GPIOD_OUT_HIGH);
> > > >  	if (IS_ERR(tsdata->reset_gpio)) {
> > > > -- 
> > > > 2.23.0
> > > > 
> > > 
> > > -- 
> > > Dmitry
> > > 
> > 
> > -- 
> > Pengutronix e.K.                           |                             |
> > Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
