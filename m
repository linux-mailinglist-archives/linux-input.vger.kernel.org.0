Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F095B5C1
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 09:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfGAHez (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 03:34:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36438 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfGAHez (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 03:34:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id r7so6133561pfl.3
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2019 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hy0qlUcKgdUgYYe+PJgXJ2TlnXkznVpLls1npCRoGyI=;
        b=Uo3j6a67LDQpRvrdd5xgmo9iCchdeNGWe6co98OdtQqJ9VPmszfur4S4g0ggLyI06S
         h+bL2g356idg0CJ/20fuum5F+KmeS4E5MKs4HvBAChApth7gSnrlG8IwL02+BZh5uZON
         t1ds7Un0wxSZgy8gF7OqNybmBDU3fle7FXBiwniHAnOMor+ofTGpHobThQJtU+DK5Fcf
         AXB4P/tv9attaZeboZXvpEC3AwuUD7SvfmzANL99zHM8KymthU8mktvpOuwaC2FeFPdE
         OlGdfO47G6/zNkRplJeRvmy4GCCqgyuXchQL6+QPTFN40EJYTivTRukDz+XbNPmyOjAY
         9LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hy0qlUcKgdUgYYe+PJgXJ2TlnXkznVpLls1npCRoGyI=;
        b=frbuZF6EAFT6ePNQitf+gbeP2ItIOqnQoVhmpgCaA/lJxgFNE3V5qx6tY8/zZqtbwV
         fdmSbaPi/aZ7et/wyEULq/jdWQlH4DL7c1pfui222yePjOe+41QAHBzPv7Xqtym/b8UN
         8tR5V0/x03DjwrhlW7Q1aRhczHf/hQ1dMdiCX2KfkZ3KD1/3CQTQqNtMHFAJSgAHSViL
         MObOCuCaJsBk2X59l6YqvcDzLUCiBpXl5uUKOgYBQdNZMeJVT0LGWvKlkIMo1bcVvf4H
         KUYBLIAGncRaGxGBLE1jvvUjnMvnNEpBauGTdQjSXIZaADCkjeVs4zcA+7xO6Ln2pTNS
         rUJQ==
X-Gm-Message-State: APjAAAXafcscA306rZanXXN/ixisY90DjworOPiVhsSpR5SMPIIpXLwu
        W9bJJdABVGyiR0jgLEJAnGStU3L7
X-Google-Smtp-Source: APXvYqxuTfGKzUDvd3n1ncyg2ngWye7hoVPSqKfRJmp2XsCgeFr5i5PsT3xfKlsUlTWmubaKh0tuNg==
X-Received: by 2002:a17:90a:ac14:: with SMTP id o20mr29819427pjq.114.1561966494089;
        Mon, 01 Jul 2019 00:34:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 137sm11140043pfz.112.2019.07.01.00.34.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 00:34:53 -0700 (PDT)
Date:   Mon, 1 Jul 2019 00:34:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martijn Braam <martijn@brixit.nl>
Cc:     m.felsch@pengutronix.de, robh@kernel.org,
        linux-input@vger.kernel.org,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>
Subject: Re: [PATCH] Input: edt-ft5x06 - add vdd supply
Message-ID: <20190701073452.GB172968@dtor-ws>
References: <20190514212111.21742-1-martijn@brixit.nl>
 <20190630071213.GB91171@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190630071213.GB91171@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 30, 2019 at 12:12:13AM -0700, Dmitry Torokhov wrote:
> Hi Martijn,
> 
> On Tue, May 14, 2019 at 11:21:11PM +0200, Martijn Braam wrote:
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
> >  	struct gpio_desc *reset_gpio;
> >  	struct gpio_desc *wake_gpio;
> > +	struct regulator *vdd;
> >  
> >  #if defined(CONFIG_DEBUG_FS)
> >  	struct dentry *debug_dir;
> > @@ -1092,6 +1094,22 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  		return error;
> >  	}
> >  
> > +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > +	if (IS_ERR(tsdata->vdd)) {
> > +		error = PTR_ERR(tsdata->vdd);
> > +		if (error != -EPROBE_DEFER)
> > +			dev_err(&client->dev,
> > +				"Failed to get vdd regulator: %d\n", error);
> > +		return error;
> > +	}
> > +
> > +	/* power the controller */
> > +	error = regulator_enable(tsdata->vdd);
> > +	if (error) {
> > +		dev_err(&client->dev, "Controller fail to enable vdd\n");
> > +		return error;
> > +	}
> > +
> >  	tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
> >  						    "wake", GPIOD_OUT_LOW);
> >  	if (IS_ERR(tsdata->wake_gpio)) {
> > @@ -1204,6 +1222,7 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
> >  {
> >  	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> >  
> > +	regulator_disable(tsdata->vdd);
> 
> This is too early. You are powering down the chip while it may still
> generate interrupts and we'll get errors if we try to access it then.
> Please use devm_add_action_or_reset() to include turning off the
> regulator into devm handling of the rest of the resources.

Also, I just recalled that Mylène Josserand was also working on adding
regulator handling for this driver, you want to check their work to make
sure it is compatible.

Thanks.

-- 
Dmitry
