Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6188C232F60
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 11:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgG3JSQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 05:18:16 -0400
Received: from vps.xff.cz ([195.181.215.36]:51866 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgG3JSQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 05:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1596100692; bh=HOOQYK09295xgAy28jQQY6G9ActTahF44D4teInPcZc=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=AL5BskQRTKQ2jtUjuXN5AlYRTEEoD9Yu79BpEqCpouulQKMRA9mLiMf2M11wyBQHx
         VO2AnkKvpaCVGtLMT5+sLy0cxbcQPLXiMwuT00skkrIJ8UGZ9Ig02gK+stqpF4/ZYK
         fxWKL7fR7MlXKcjEwTLEFa155Ph5W4PSBUtOQQDE=
Date:   Thu, 30 Jul 2020 11:18:12 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] input: gpio-vibra: Allow to use vcc-supply alone
 to control the vibrator
Message-ID: <20200730091812.7sia7w3waz2jj62a@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200714102303.3007896-1-megous@megous.com>
 <20200714102303.3007896-3-megous@megous.com>
 <20200730061939.GF1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730061939.GF1665100@dtor-ws>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

thanks for looking into the patch. :)

On Wed, Jul 29, 2020 at 11:19:39PM -0700, Dmitry Torokhov wrote:
> Hi Ondrej,
> 
> On Tue, Jul 14, 2020 at 12:23:01PM +0200, Ondrej Jirman wrote:
> > Make enable-gpio optional to allow using this driver with boards that
> > have vibrator connected to a power supply without intermediate gpio
> > based enable circuitry.
> > 
> > Also avoid a case where neither regulator nor enable gpio is specified,
> > and bail out in probe in such a case.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/input/misc/gpio-vibra.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
> > index f79f75595dd7..b3bb7e61ed1d 100644
> > --- a/drivers/input/misc/gpio-vibra.c
> > +++ b/drivers/input/misc/gpio-vibra.c
> > @@ -39,7 +39,7 @@ static int gpio_vibrator_start(struct gpio_vibrator *vibrator)
> >  	struct device *pdev = vibrator->input->dev.parent;
> >  	int err;
> >  
> > -	if (!vibrator->vcc_on) {
> > +	if (vibrator->vcc && !vibrator->vcc_on) {
> >  		err = regulator_enable(vibrator->vcc);
> >  		if (err) {
> >  			dev_err(pdev, "failed to enable regulator: %d\n", err);
> > @@ -57,7 +57,7 @@ static void gpio_vibrator_stop(struct gpio_vibrator *vibrator)
> >  {
> >  	gpiod_set_value_cansleep(vibrator->gpio, 0);
> >  
> > -	if (vibrator->vcc_on) {
> > +	if (vibrator->vcc && vibrator->vcc_on) {
> >  		regulator_disable(vibrator->vcc);
> >  		vibrator->vcc_on = false;
> >  	}
> > @@ -112,7 +112,7 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
> >  	if (!vibrator->input)
> >  		return -ENOMEM;
> >  
> > -	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> > +	vibrator->vcc = devm_regulator_get_optional(&pdev->dev, "vcc");
> 
> I know it is very surprising, but regulator_get_optional does not return
> NULL when regulator is not present, but rather ERR_PTR(-ENODEV). You
> need to replace it with NULL in the branch below, or change conditions
> to !IS_ERR(virbrator->vcc) (and still handle -ENODEV in the branch
> below).

Oops, I'll fix that in the next revision.

regards,
	o.

> >  	err = PTR_ERR_OR_ZERO(vibrator->vcc);
> >  	if (err) {
> >  		if (err != -EPROBE_DEFER)
> > @@ -121,7 +121,8 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
> >  		return err;
> >  	}
> >  
> > -	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> > +	vibrator->gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> > +						 GPIOD_OUT_LOW);
> >  	err = PTR_ERR_OR_ZERO(vibrator->gpio);
> >  	if (err) {
> >  		if (err != -EPROBE_DEFER)
> > @@ -130,6 +131,11 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
> >  		return err;
> >  	}
> >  
> > +	if (!vibrator->vcc && !vibrator->gpio) {
> > +		dev_err(&pdev->dev, "Neither gpio nor regulator provided\n");
> > +		return -EINVAL;
> > +	}
> > +
> >  	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
> >  
> >  	vibrator->input->name = "gpio-vibrator";
> > -- 
> > 2.27.0
> > 
> 
> Thanks.
> 
> -- 
> Dmitry
