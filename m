Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FAC379834
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 22:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhEJUSN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 16:18:13 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:33538 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhEJUSN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 16:18:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620677812; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Re/cw8tgUoKs/f6av+PApFiLfNxVfNm/VXzJ9THjYNMSrf/yS5e4Y5pOVRWtPsUl1k
    M8Ul0XiJyE8wwf6GYo8l0h8UCNGhijJV+VkkFTCKeiV3BlAkXFapJXlDpOgQb+6K/XlW
    SSNw3AzvqfkwJXDI7AtAlHCzkkERwziLQT0gZLsKSc21LC43DeuGPMO2G0X7wulUd+Bt
    NJBli9fNlEu9PrnKqgQUGaoYfKIw6F8GtlcGmKlL/0uh513dDkK5y8czw/2aWYKcJUa2
    zDaG0jATUy90QtqufFbth6lapwa0oJ40NNyqJtCFO80waMLZ7CaP2PUkW8VAmGCyMFAt
    r7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620677812;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v4CH/t+TevX8Jl7XyE1q3Vi1BBSufL18VS7+Z97a78o=;
    b=pjaQEe59q/YpED7xWUM8nw2fwdFADgaoPurayFpUXESPk0HWz+JoD12j7Q+g7DqU+d
    uxa6ppTDN9XevUT7kAKJ/TUUCM+i07nvDn/rIUF54J61EgfWrvIKX6MaDDRB/OYPAjq0
    x304Mq1w0jjgdVUFb9u9EuGOsIRzV3/jmQIKf+GtN+g0fj1gyP/k5ZRKHrx/MAJTPUS4
    W4l2HsCiR4TsPGvNrxPXPSqpiOmZXX8jmmQWWjZC8EV3LrIA+Di4v3FG17052r1DMzXF
    tHFgEyGNNyUw5NxuEFat6ngPTEG6V9XZUDCKnxv1fKB62znQbyZl+2tVe7Pzo/ew1zOq
    Hl/A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620677812;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v4CH/t+TevX8Jl7XyE1q3Vi1BBSufL18VS7+Z97a78o=;
    b=aFXgC0I7DydQG6ghypOv8991X+cetsjEfSNoZoYCnQt1QKOdpThXGrk4wU0Y4AzIgn
    KRd47iGYhpN5EG+A4/XZ0X62+sEmR6y4qVE6P4XrmPc07Eg7A5kBuzTD15ownOglu4mF
    2Mi/r8IUjYLqDu32B5WL3mK13u1Z0w6T8i7G1QM48Qe6vvSVnhf9QnF3pPqDz0BaE+t6
    d/dSmN2Ek49I+8bGKM2eHlqR/1pPgm1luT8htGBmbBx8enbNMfHYVeZMPg4dq1D5aa0R
    LOw7fW/O7k+GjyYcZShhyizns9WDLaOh+DGiiIHg2sRPBQaa9qrj+A6AL2Om0D5Wl93/
    cDFA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8Ic/Da4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.25.6 DYNA|AUTH)
    with ESMTPSA id e01f26x4AKGpYd8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 10 May 2021 22:16:51 +0200 (CEST)
Date:   Mon, 10 May 2021 22:16:41 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <YJmUm/6Vm3d9hp1z@gerhold.net>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510194848.g7cgty3lirxkht5g@core>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> Hello Stephan,
> 
> On Mon, May 10, 2021 at 09:31:08PM +0200, Stephan Gerhold wrote:
> > At the moment, the edt-ft5x06 driver can control a single regulator
> > ("vcc"). However, some FocalTech touch controllers have an additional
> > IOVCC pin that should be supplied with the digital I/O voltage.
> > 
> > The I/O voltage might be provided by another regulator that should also
> > be kept on. Otherwise, the touchscreen can randomly stop functioning if
> > the regulator is turned off because no other components still require it.
> > 
> > Implement (optional) support for also enabling an "iovcc-supply".
> > The datasheet specifies a delay of ~ 10us before enabling VDD/VCC
> > after IOVCC is enabled, so make sure to enable IOVCC first.
> > 
> > Cc: Ondrej Jirman <megous@megous.com>
> > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> > Sorry about the long delay, couldn't find the time to test the new changes :)
> > 
> > Changes in v2:
> >   - Respect 10us delay between enabling IOVCC and VDD/VCC line
> >     (suggested by Marco Felsch)
> > 
> > v1: https://lore.kernel.org/linux-input/20210108192337.563679-2-stephan@gerhold.net/
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 34 ++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 2eefbc2485bc..d3271856bb5c 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -104,6 +104,7 @@ struct edt_ft5x06_ts_data {
> >  	u16 num_x;
> >  	u16 num_y;
> >  	struct regulator *vcc;
> > +	struct regulator *iovcc;
> >  
> >  	struct gpio_desc *reset_gpio;
> >  	struct gpio_desc *wake_gpio;
> > @@ -1067,6 +1068,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
> >  	struct edt_ft5x06_ts_data *data = arg;
> >  
> >  	regulator_disable(data->vcc);
> > +	regulator_disable(data->iovcc);
> >  }
> >  
> >  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> > @@ -1107,9 +1109,28 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  		return error;
> >  	}
> >  
> > +	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
> > +	if (IS_ERR(tsdata->iovcc)) {
> > +		error = PTR_ERR(tsdata->iovcc);
> > +		if (error != -EPROBE_DEFER)
> > +			dev_err(&client->dev,
> > +				"failed to request iovcc regulator: %d\n", error);
> 
> Please use dev_err_probe instead. If this pattern is used for vcc-supply, maybe
> change that too. Maybe also consider using a bulk regulator API.
>

I had both of that in v1 but reverted both of that as discussed.
I didn't make that very clear in the changelog, sorry about that. :)

The reasons were:

  - Bulk regulator API: AFAICT there is no way to use it while also
    maintaining the correct enable/disable order plus the 10us delay.
    See https://lore.kernel.org/linux-input/X%2Fwj+bxe%2FIlznCj6@gerhold.net/

  - dev_err_probe(): For some reason the patch set that converted a lot of
    input drivers (including edt-ft5x06) to dev_err_probe() was never applied:
    https://lore.kernel.org/linux-input/20200827185829.30096-12-krzk@kernel.org/
    I dropped the change from my patch since Andy already mentioned
    a similar thing back then.

Thanks!
Stephan
