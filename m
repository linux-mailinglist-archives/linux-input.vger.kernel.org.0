Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A90411824F
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 09:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfLJIgg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 03:36:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39389 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfLJIgg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 03:36:36 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ieb0B-0001W4-H1; Tue, 10 Dec 2019 09:36:15 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ieb09-0003LN-QI; Tue, 10 Dec 2019 09:36:13 +0100
Date:   Tue, 10 Dec 2019 09:36:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/5] Input: edt-ft5x06 - make wakeup-source switchable
Message-ID: <20191210083613.rozufzqup2r2vuz6@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-5-m.felsch@pengutronix.de>
 <20191202180057.GC50317@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202180057.GC50317@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:35:37 up 24 days, 23:54, 31 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19-12-02 10:00, Dmitry Torokhov wrote:
> On Wed, Nov 27, 2019 at 01:09:47PM +0100, Marco Felsch wrote:
> > Since day one the touch controller acts as wakeup-source. This seems to
> > be wrong since the device supports deep-sleep mechanism [1] which
> > requires a reset to leave it. Also some designs won't use the
> > touchscreen as wakeup-source.
> > 
> > According discussion [2] we decided to break backward compatibility and
> > go the common way by using the 'wakeup-source' device-property.
> > 
> > [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
> > [2] https://patchwork.kernel.org/patch/11149037/
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > v2:
> > - make use of common wakeup-source property
> > - adapt commit message
> > 
> >  drivers/input/touchscreen/edt-ft5x06.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index e1b31fd525e2..8d2ec7947f0e 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/irq.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/property.h>
> >  #include <linux/ratelimit.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> > @@ -1056,6 +1057,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  	unsigned long irq_flags;
> >  	int error;
> >  	char fw_version[EDT_NAME_LEN];
> > +	bool en_wakeup;
> >  
> >  	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
> >  
> > @@ -1114,6 +1116,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  		return error;
> >  	}
> >  
> > +	en_wakeup = device_property_present(&client->dev, "wakeup-source");
> > +
> >  	if (tsdata->wake_gpio) {
> >  		usleep_range(5000, 6000);
> >  		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
> > @@ -1208,7 +1212,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  		return error;
> >  
> >  	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
> > -	device_init_wakeup(&client->dev, 1);
> > +	device_init_wakeup(&client->dev, en_wakeup);
> 
> I2C core already marks device as wakeup source if I2C_CLIEMT_WAKE is set
> (and the flag is specified when, among other things, device has
> "wakeup-source" property).
> 
> So the only thing that is needed is to remove
> 
> 	device_init_wakeup(&client->dev, 1);
> 
> line.

You are right, thanks for covering that.

Regards,
  Marco 

> 
> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
