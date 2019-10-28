Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968B8E7D4D
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 00:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfJ1X43 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 19:56:29 -0400
Received: from vps.xff.cz ([195.181.215.36]:51132 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbfJ1X43 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 19:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572306987; bh=VBiEzOAOkY+HDeeyqrk83KEuJjLXMJSGG+CM5QrE39g=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=YufQZxInPttFYT6kzs3T5+jAucMqqOWMW/BQdx8nH+P1aKOpk54J+TJTZCy5axAgP
         aB3T2T6Et0qFkkNERhYiJSCfK6LYbfnyVbP8svit4mwtQiSAcK8UTI7BW639zK7Efp
         JL4dB+NkMq9L5KuxC0cywXAqiUAYULDboPx7Qz8M=
Date:   Tue, 29 Oct 2019 00:56:26 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: sun4i-lradc-keys: Add wakup support
Message-ID: <20191028235626.5afvszxtppsieywi@core.my.home>
Mail-Followup-To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191028221502.3503543-1-megous@megous.com>
 <20191028233828.GA57214@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028233828.GA57214@dtor-ws>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

On Mon, Oct 28, 2019 at 04:38:28PM -0700, Dmitry Torokhov wrote:
> Hi Ondrej,
> 
> On Mon, Oct 28, 2019 at 11:15:02PM +0100, Ondrej Jirman wrote:
> > Allow the driver to wakeup the system on key press.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> > index 4a796bed48ac..bba679d7b54b 100644
> > --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> > +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> > @@ -22,6 +22,8 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_wakeirq.h>
> > +#include <linux/pm_wakeup.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  
> > @@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> >  {
> >  	struct sun4i_lradc_data *lradc;
> >  	struct device *dev = &pdev->dev;
> > -	int i;
> > -	int error;
> > +	int i, error, irq;
> >  
> >  	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
> >  	if (!lradc)
> > @@ -272,8 +273,13 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> >  	if (IS_ERR(lradc->base))
> >  		return PTR_ERR(lradc->base);
> >  
> > -	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
> > -				 sun4i_lradc_irq, 0,
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> > +		return irq;
> > +	}
> > +
> > +	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
> >  				 "sun4i-a10-lradc-keys", lradc);
> >  	if (error)
> >  		return error;
> > @@ -282,6 +288,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> >  	if (error)
> >  		return error;
> >  
> > +	device_init_wakeup(dev, true);
> 
> I do not think we want to do this unconditionally. Can we maybe key off
> "wakeup-source" device property.

Sure thing.

> > +
> > +	error = dev_pm_set_wake_irq(dev, irq);
> > +	if (error) {
> > +		dev_err(dev, "Could not set wake IRQ\n");
> > +		return error;
> > +	}
> > +
> 
> I wonder if we could teach platform driver core to handle this for us.

Not sure, some drivers do enable/disable wake_irq by hand in suspend/resume
callbacks, so it would probably need to be opt-in somehow. I guess calling the
function like this is one way to make it opt-in.

The other way may be by passing a flag somewhere, like to
request_threaded_irq. Did you have something more concrete in mind?

regards,
	o.

> Thanks.
> 
> -- 
> Dmitry
