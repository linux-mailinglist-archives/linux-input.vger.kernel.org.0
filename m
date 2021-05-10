Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8E73798F9
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 23:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhEJVPl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 17:15:41 -0400
Received: from vps.xff.cz ([195.181.215.36]:35402 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231420AbhEJVPk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 17:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1620681272; bh=IQYgneSxXFHNToivaNjomIHrIi876UiE0UgSZmBPqiM=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=aspt371u3j9CFz26ZX2zEPXWfyBCBWUMCjFUW+M9J6qQYU7nzemEXr9qlfKfs5qcr
         zh7XbcpqcQJL83QD2oy3nfGprEtyWr97W6JN6qFKDlGu3i25exnHRHXKHegiFsmbvS
         qD1vL+Kj7z8lMpBUN+KaMT/Nhzfpvrgg41UFMmeo=
Date:   Mon, 10 May 2021 23:14:32 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210510211432.c3hsph52zlbqi6nw@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
 <YJmUm/6Vm3d9hp1z@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJmUm/6Vm3d9hp1z@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 10:16:41PM +0200, Stephan Gerhold wrote:
> Hi!
> 
> On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> > Hello Stephan,
> > 
> > On Mon, May 10, 2021 at 09:31:08PM +0200, Stephan Gerhold wrote:
> > > At the moment, the edt-ft5x06 driver can control a single regulator
> > > ("vcc"). However, some FocalTech touch controllers have an additional
> > > IOVCC pin that should be supplied with the digital I/O voltage.
> > > 
> > > The I/O voltage might be provided by another regulator that should also
> > > be kept on. Otherwise, the touchscreen can randomly stop functioning if
> > > the regulator is turned off because no other components still require it.
> > > 
> > > Implement (optional) support for also enabling an "iovcc-supply".
> > > The datasheet specifies a delay of ~ 10us before enabling VDD/VCC
> > > after IOVCC is enabled, so make sure to enable IOVCC first.
> > > 
> > > Cc: Ondrej Jirman <megous@megous.com>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > > Sorry about the long delay, couldn't find the time to test the new changes :)
> > > 
> > > Changes in v2:
> > >   - Respect 10us delay between enabling IOVCC and VDD/VCC line
> > >     (suggested by Marco Felsch)
> > > 
> > > v1: https://lore.kernel.org/linux-input/20210108192337.563679-2-stephan@gerhold.net/
> > > ---
> > >  drivers/input/touchscreen/edt-ft5x06.c | 34 ++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > > 
> > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > index 2eefbc2485bc..d3271856bb5c 100644
> > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > @@ -104,6 +104,7 @@ struct edt_ft5x06_ts_data {
> > >  	u16 num_x;
> > >  	u16 num_y;
> > >  	struct regulator *vcc;
> > > +	struct regulator *iovcc;
> > >  
> > >  	struct gpio_desc *reset_gpio;
> > >  	struct gpio_desc *wake_gpio;
> > > @@ -1067,6 +1068,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
> > >  	struct edt_ft5x06_ts_data *data = arg;
> > >  
> > >  	regulator_disable(data->vcc);
> > > +	regulator_disable(data->iovcc);
> > >  }
> > >  
> > >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > > @@ -1107,9 +1109,28 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > >  		return error;
> > >  	}
> > >  
> > > +	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
> > > +	if (IS_ERR(tsdata->iovcc)) {
> > > +		error = PTR_ERR(tsdata->iovcc);
> > > +		if (error != -EPROBE_DEFER)
> > > +			dev_err(&client->dev,
> > > +				"failed to request iovcc regulator: %d\n", error);
> > 
> > Please use dev_err_probe instead. If this pattern is used for vcc-supply, maybe
> > change that too. Maybe also consider using a bulk regulator API.
> >
> 
> I had both of that in v1 but reverted both of that as discussed.
> I didn't make that very clear in the changelog, sorry about that. :)
> 
> The reasons were:
> 
>   - Bulk regulator API: AFAICT there is no way to use it while also
>     maintaining the correct enable/disable order plus the 10us delay.
>     See https://lore.kernel.org/linux-input/X%2Fwj+bxe%2FIlznCj6@gerhold.net/
> 
>   - dev_err_probe(): For some reason the patch set that converted a lot of
>     input drivers (including edt-ft5x06) to dev_err_probe() was never applied:
>     https://lore.kernel.org/linux-input/20200827185829.30096-12-krzk@kernel.org/
>     I dropped the change from my patch since Andy already mentioned
>     a similar thing back then.

Thanks for explanation.

regards,
	o.

> Thanks!
> Stephan
