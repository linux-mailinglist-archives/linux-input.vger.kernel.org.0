Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74491E86A7
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 12:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfJ2LVb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 07:21:31 -0400
Received: from vps.xff.cz ([195.181.215.36]:60158 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfJ2LVb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 07:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572348089; bh=JdWur1bMeHO2JpWgp6+b0/Rbt6VKQR73yvBxM9IXugU=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=YIEuUbSu/F8VLiKeFAf+61/x2w+CZ5vxxDg2CttU/zfL7pXo+3O12XZ3X9Tz3i2kg
         /hXkZX1Uv0KQdTpXOupmwGgb0NY7eOffbcVQpIGC66CKbP9HkkCuLKz1tO1szrxT05
         K7yH53Jtn2cLiVfZPp52mklDpWOlo+NwNQp4DiUk=
Date:   Tue, 29 Oct 2019 12:21:29 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] input: edt-ft5x06: Add support for regulator
Message-ID: <20191029112129.t4mxqyybltjbuyhj@core.my.home>
Mail-Followup-To: Marco Felsch <m.felsch@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-2-megous@megous.com>
 <20191029041233.GD57214@dtor-ws>
 <20191029085545.cw5c24gi76gbfdhy@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029085545.cw5c24gi76gbfdhy@pengutronix.de>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Tue, Oct 29, 2019 at 09:55:45AM +0100, Marco Felsch wrote:
> Hi Dmitry,
> 
> On 19-10-28 21:12, Dmitry Torokhov wrote:
> > On Tue, Oct 29, 2019 at 01:58:04AM +0100, Ondrej Jirman wrote:
> > > From: Mylène Josserand <mylene.josserand@bootlin.com>
> > > 
> > > Add the support for enabling optional regulator that may be used as VCC
> > > source.
> > > 
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > 
> > Applied, thank you.
> 
> What happens with my vdd patches?

Sorry for not noticing your patches, I was only aware of Mylène's older series.
It looks like you can just skip regulator enable support from your series, and
re-send the deep-sleep mechanism and wakeup source patches only.

I'll test it with my board, and give you a tested-by.

thank you and regards,
	o.

> Regards,
>   Marco
> 
> > 
> > > ---
> > >  drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > index 5525f1fb1526..d61731c0037d 100644
> > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/input/mt.h>
> > >  #include <linux/input/touchscreen.h>
> > >  #include <asm/unaligned.h>
> > > +#include <linux/regulator/consumer.h>
> > >  
> > >  #define WORK_REGISTER_THRESHOLD		0x00
> > >  #define WORK_REGISTER_REPORT_RATE	0x08
> > > @@ -88,6 +89,7 @@ struct edt_ft5x06_ts_data {
> > >  	struct touchscreen_properties prop;
> > >  	u16 num_x;
> > >  	u16 num_y;
> > > +	struct regulator *vcc;
> > >  
> > >  	struct gpio_desc *reset_gpio;
> > >  	struct gpio_desc *wake_gpio;
> > > @@ -1036,6 +1038,13 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
> > >  	}
> > >  }
> > >  
> > > +static void edt_ft5x06_disable_regulator(void *arg)
> > > +{
> > > +	struct edt_ft5x06_ts_data *data = arg;
> > > +
> > > +	regulator_disable(data->vcc);
> > > +}
> > > +
> > >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > >  					 const struct i2c_device_id *id)
> > >  {
> > > @@ -1064,6 +1073,27 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > >  
> > >  	tsdata->max_support_points = chip_data->max_support_points;
> > >  
> > > +	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> > > +	if (IS_ERR(tsdata->vcc)) {
> > > +		error = PTR_ERR(tsdata->vcc);
> > > +		if (error != -EPROBE_DEFER)
> > > +			dev_err(&client->dev,
> > > +				"failed to request regulator: %d\n", error);
> > > +		return error;
> > > +	}
> > > +
> > > +	error = regulator_enable(tsdata->vcc);
> > > +	if (error < 0) {
> > > +		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> > > +		return error;
> > > +	}
> > > +
> > > +	error = devm_add_action_or_reset(&client->dev,
> > > +					 edt_ft5x06_disable_regulator,
> > > +					 tsdata);
> > > +	if (error)
> > > +		return error;
> > > +
> > >  	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
> > >  						     "reset", GPIOD_OUT_HIGH);
> > >  	if (IS_ERR(tsdata->reset_gpio)) {
> > > -- 
> > > 2.23.0
> > > 
> > 
> > -- 
> > Dmitry
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
