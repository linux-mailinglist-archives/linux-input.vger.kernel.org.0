Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6316E11829E
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 09:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLJInZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 03:43:25 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46269 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfLJInZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 03:43:25 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ieb6v-0002IR-Vc; Tue, 10 Dec 2019 09:43:13 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ieb6v-0003Mi-4d; Tue, 10 Dec 2019 09:43:13 +0100
Date:   Tue, 10 Dec 2019 09:43:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20191210084313.ed2ij6pp4h5n6xfw@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-6-m.felsch@pengutronix.de>
 <20191202180423.GD50317@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202180423.GD50317@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:39:02 up 24 days, 23:57, 31 users,  load average: 0.00, 0.00,
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

On 19-12-02 10:04, Dmitry Torokhov wrote:
> On Wed, Nov 27, 2019 at 01:09:48PM +0100, Marco Felsch wrote:
> > It is possible to bring the device into a deep sleep state. To exit this
> > state the reset or wakeup pin must be toggeled as documented in [1].
> > Because of the poor documentation I used the several downstream kernels
> > [2] and other applications notes [3] to indentify the related registers.
> > 
> > Furthermore I added the support to disable the device completely. This is
> > the most effective power-saving mechanism. Disabling the device don't
> > change the suspend logic because the hibernate mode needs a hardware
> > reset anyway.
> > 
> > [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
> > [2] https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/input/touchscreen/ft5x_ts.c
> >     https://github.com/Pablito2020/focaltech-touch-driver/blob/master/ft5336_driver.c
> > [3] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x16_registers.pdf
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > v2:
> > - adapt commit message
> > - don't return errors during suspend/resume
> > - replace dev_err() by dev_warn()
> > - add support to disable the regulator too
> > 
> >  drivers/input/touchscreen/edt-ft5x06.c | 49 ++++++++++++++++++++++++--
> >  1 file changed, 47 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 8d2ec7947f0e..0bdd3440f684 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -39,6 +39,9 @@
> >  #define WORK_REGISTER_NUM_X		0x33
> >  #define WORK_REGISTER_NUM_Y		0x34
> >  
> > +#define PMOD_REGISTER_ACTIVE		0x00
> > +#define PMOD_REGISTER_HIBERNATE		0x03
> > +
> >  #define M09_REGISTER_THRESHOLD		0x80
> >  #define M09_REGISTER_GAIN		0x92
> >  #define M09_REGISTER_OFFSET		0x93
> > @@ -54,6 +57,7 @@
> >  
> >  #define WORK_REGISTER_OPMODE		0x3c
> >  #define FACTORY_REGISTER_OPMODE		0x01
> > +#define PMOD_REGISTER_OPMODE		0xa5
> >  
> >  #define TOUCH_EVENT_DOWN		0x00
> >  #define TOUCH_EVENT_UP			0x01
> > @@ -1235,9 +1239,29 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
> >  static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > +	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> > +	int ret;
> >  
> > -	if (device_may_wakeup(dev))
> > +	if (device_may_wakeup(dev)) {
> >  		enable_irq_wake(client->irq);
> 
> Can we start with preliminary patch dropping calls to enable_irq_wake()
> and disable_irq_wake() as device/PM core will tale care of configuring
> wake irqs properly for us, since we are now allowing I2C core to mark
> the interrupt as wake IRQ.
> 
> So we need to do:
> 
> 	if (device_may_wakeup(dev))
> 		return 0;
> 
> 	<execute power down sequence>
> 
> Thanks.

Of course, thanks for covering that.A

Regards,
  Marco 

> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
