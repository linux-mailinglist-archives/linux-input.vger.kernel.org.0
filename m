Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4D9298FBC
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 15:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781918AbgJZOpe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 10:45:34 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35987 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781912AbgJZOpe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 10:45:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id l16so9650379eds.3
        for <linux-input@vger.kernel.org>; Mon, 26 Oct 2020 07:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=108wjdzd0/xglJPKdUFBrU/U8qTH53Q7ViQVBUZc56k=;
        b=1OrMnfHHqDBoo2mYxJrLQ9UlNNI6ec8McsUQXHPbq7sKgz+s/nXE8wC/tcI/BwH3BA
         YcAIrjszEI+afPxnRmUMsSafZo++P4xTvrdEqggzBABUFDbbV/e9xn+YZ3cB/dPnf3kl
         9ZGuOQRnd6APa67+wQwTCEP61nfTjrToUqGBWbolTmKWKeyz73rYrmvMumShSk9TWAF9
         +MREeJUOnaLftLucXz5QGIgOkw2duaObvPbDmqRNRkJj959McPu1ur7Zk48voZsuQ9ZO
         vX1M9rjAraSINox0yzNORVihGBwgnebY6oKbYvqhxGWZ/XB/jl58QutvGrPjQrUPCTJW
         JjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=108wjdzd0/xglJPKdUFBrU/U8qTH53Q7ViQVBUZc56k=;
        b=g3g/51JBCglcvZQHVXuYt5EYohRlkK/Td5F9GieV+n0zbllMMQUii3XlsE9nMCM/04
         dmMIgMmEf1Oe1OTgU2R/voBiFw0Ud6KLgopXZflesESEv3BNqW+AsrQ8fO1bQU9myRuN
         WwzKrI1yButyO4vrxl8kOhTUrpXDU1vcjVpBY1vHna2oXHFC4ikSIqkMLURNDgn7dERD
         BCiq/f7jcZEievUBC4dNviqH0uKdnAnKLdtDbeOFtuhxgTcDw16/fEuj3Jny3lopIrgE
         +ShBmWIA90qrDIMvfkiNuYKH9asj+lWzfSS+xfvibWX+6WcrMlbnDb2btwEZd5yEe0Nl
         NRKg==
X-Gm-Message-State: AOAM531K9bZmz5fKojD1+E/c75qViIbXLZamenjSp3dNrVK+74zimGA+
        faAQt1QoP615eJkovkZgI++mAtOlO7Te4+NX/AG0rQ==
X-Google-Smtp-Source: ABdhPJwpLZGnNpfAXvm5XX2UTeeOpwB6YzeBR/r0R25NPP/c93Zb+pjiQMB4mwWWBByibX0wj7kl731YGtPxH+pE/SM=
X-Received: by 2002:a50:e442:: with SMTP id e2mr16721662edm.186.1603723528358;
 Mon, 26 Oct 2020 07:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201022155858.20867-1-nsaenzjulienne@suse.de>
 <20201022155858.20867-4-nsaenzjulienne@suse.de> <CAMpxmJXw12hKYCuMDjG-Ns6n=mXmr4B2x3HJaAJ19wH_xDUMag@mail.gmail.com>
 <700a149849222f3efbec73cb8a6be56b4b1c5bcb.camel@suse.de>
In-Reply-To: <700a149849222f3efbec73cb8a6be56b4b1c5bcb.camel@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:45:17 +0100
Message-ID: <CAMpxmJWTuREXQKLtc37uo6+6aG_-Tkb-P+8Ozjkz+7-DixvpDQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpio: raspberrypi-exp: Release firmware handle
 on unbind
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-pwm@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 3:42 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Mon, 2020-10-26 at 15:40 +0100, Bartosz Golaszewski wrote:
> > On Thu, Oct 22, 2020 at 5:59 PM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Upon unbinding the device make sure we release RPi's firmware interface.
> > >
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > ---
> > >  drivers/gpio/gpio-raspberrypi-exp.c | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
> > > index bb100e0124e6..c008336e1131 100644
> > > --- a/drivers/gpio/gpio-raspberrypi-exp.c
> > > +++ b/drivers/gpio/gpio-raspberrypi-exp.c
> > > @@ -231,8 +231,19 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
> > >         rpi_gpio->gc.get = rpi_exp_gpio_get;
> > >         rpi_gpio->gc.set = rpi_exp_gpio_set;
> > >         rpi_gpio->gc.can_sleep = true;
> > > +       platform_set_drvdata(pdev, rpi_gpio);
> > >
> > > -       return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
> > > +       return gpiochip_add_data(&rpi_gpio->gc, rpi_gpio);
> > > +}
> > > +
> > > +static int rpi_exp_gpio_remove(struct platform_device *pdev)
> > > +{
> > > +       struct rpi_exp_gpio *rpi_gpio = platform_get_drvdata(pdev);
> > > +
> > > +       gpiochip_remove(&rpi_gpio->gc);
> > > +       rpi_firmware_put(rpi_gpio->fw);
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  static const struct of_device_id rpi_exp_gpio_ids[] = {
> > > @@ -247,6 +258,7 @@ static struct platform_driver rpi_exp_gpio_driver = {
> > >                 .of_match_table = of_match_ptr(rpi_exp_gpio_ids),
> > >         },
> > >         .probe  = rpi_exp_gpio_probe,
> > > +       .remove = rpi_exp_gpio_remove,
> > >  };
> > >  module_platform_driver(rpi_exp_gpio_driver);
> > >
> > > --
> > > 2.28.0
> > >
> >
> > Why not introduce devm_rpi_firmware_get()? That would allow you to
> > keep the driver elegant without re-adding remove().
>
> I like the idea, I'll look into it.
>
> Thanks,
> Nicolas
>

If you can't do it for some reason, then even using devm_add_action() is fine.

Bartosz
