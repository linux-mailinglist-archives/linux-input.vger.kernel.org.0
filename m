Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2AF1FC95
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 00:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbfEOWgf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 18:36:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46157 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfEOWgf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 18:36:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id l26so1001898lfh.13
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3JB6BptRDoJrP6qghIXIRgZ+C+fQN1FhzlJ2OMhR6FQ=;
        b=TSeuMGeleN1By+HKQBi7JP4GQc+p92hfSus2kggKHwVMG4usM03ApsmumhHKLi+HnI
         wO6jOdrWNO3h6Y9eyodhHk/btpTHwON+yfTuFKNYj4iPpnosKUeIxBXT2o8fOtpv8dp4
         eBArxKlr+JawPel2oCKp0TycD9Ec/MnSfSjXjMkxbaPHl65RWfysZAR2Ku6XLlYFaPJs
         xFAsH+WVJqxo+6ooXYBM8YF3U0CRG1PLt8We1hTCY9eq//kMrKaqTos8QFeU3InKQr9D
         gaBGfLEGnzgf1muMTX2xlN4pZrlB02Mpi6e9t42gioe6RNxhDBVz79XIUPlD/d4z/YaI
         GNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3JB6BptRDoJrP6qghIXIRgZ+C+fQN1FhzlJ2OMhR6FQ=;
        b=L7FpzyS8IFqxlQN2er21xmOHf9bHPKhok+fhu5cofdohwGks0pM9HKQW81AY/ypNDY
         F12EbO5TZJT5zdfxWLSYqON75P1v/b1YhyeI/HRwdFr8ivd0jH9CDwiY+wKQUcGQFxXf
         4RvNDiHDwsx07PWUqxst0ROZJZKxoHSgIhcAnu4N3hUopypd/vUZMcEGYMT7IgasoZEV
         bc+ZqqtfVyEQ/N0jeKqmSjrqFAm9tdrmL1iJuP9j9EEQkTluli5cMR93H/1+BGf+I37P
         CuVnzdxFU1XiR5w13yQagMg2n0eWRcV5ksDEpU8pOI1CDEVuvTnRB3kqJW/+yHlMxp1M
         bsbQ==
X-Gm-Message-State: APjAAAUTUHuzxTU5NgODlGVWQnsM7e+1QkkdCk8EXezsa5tmkwQwFSl5
        f6jnihlbK39rhntgVhT05gz8QqTSqtADP4hf8z5g6w==
X-Google-Smtp-Source: APXvYqwH14qzCpD9ZhNLkxMggGS4Wl90sMjL3Dk/rsUjJSk89eq3DZc/jziEGrDQl953HamXX1IJcP7VXo8R6Q1RFgM=
X-Received: by 2002:ac2:4315:: with SMTP id l21mr1131920lfh.143.1557959793098;
 Wed, 15 May 2019 15:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190514212111.21742-1-martijn@brixit.nl> <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
In-Reply-To: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
From:   Martijn Braam <martijn@brixit.nl>
Date:   Thu, 16 May 2019 00:36:22 +0200
Message-ID: <CA+XnvuPyNzpUCJK_NdUp-FobAPzCgDYjTruGhUcO8D=MvnoyEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: edt-ft5x06 - add vdd supply
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     dmitry.torokhov@gmail.com, robh@kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

The regulator seems to be optional this way, it gets a dummy regulator
if none is specified so it shouldn't break existing devices. '
I think I managed to do the git send-email thing correctly to add the bindings.

Greetings,
Martijn Braam

Op wo 15 mei 2019 om 06:41 schreef Marco Felsch <m.felsch@pengutronix.de>:

>
> Hi Martijn,
>
> On 19-05-14 23:21, Martijn Braam wrote:
> > Add a regulator supply request for the controller power
> >
> > Signed-off-by: Martijn Braam <martijn@brixit.nl>
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 702bfda7ee77..226c623f8d46 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/ratelimit.h>
> >  #include <linux/irq.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/input.h>
> >  #include <linux/i2c.h>
> >  #include <linux/kernel.h>
> > @@ -103,6 +104,7 @@ struct edt_ft5x06_ts_data {
> >
> >       struct gpio_desc *reset_gpio;
> >       struct gpio_desc *wake_gpio;
> > +     struct regulator *vdd;
> >
> >  #if defined(CONFIG_DEBUG_FS)
> >       struct dentry *debug_dir;
> > @@ -1092,6 +1094,22 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >               return error;
> >       }
> >
> > +     tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > +     if (IS_ERR(tsdata->vdd)) {
> > +             error = PTR_ERR(tsdata->vdd);
> > +             if (error != -EPROBE_DEFER)
> > +                     dev_err(&client->dev,
> > +                             "Failed to get vdd regulator: %d\n", error);
> > +             return error;
>
> This will break current device tree's and this should never happen. So
> we need to make this regulator optional.
> BTW:
> Did you changed the bindings too?
>
> Regards,
>   Marco
>
> > +     }
> > +
> > +     /* power the controller */
> > +     error = regulator_enable(tsdata->vdd);
> > +     if (error) {
> > +             dev_err(&client->dev, "Controller fail to enable vdd\n");
> > +             return error;
> > +     }
> > +
> >       tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
> >                                                   "wake", GPIOD_OUT_LOW);
> >       if (IS_ERR(tsdata->wake_gpio)) {
> > @@ -1204,6 +1222,7 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
> >  {
> >       struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> >
> > +     regulator_disable(tsdata->vdd);
> >       edt_ft5x06_ts_teardown_debugfs(tsdata);
> >
> >       return 0;
> > --
> > 2.21.0
> >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
