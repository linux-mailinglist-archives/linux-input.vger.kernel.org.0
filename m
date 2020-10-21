Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF64294B8B
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 12:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410452AbgJUK4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 06:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410402AbgJUK4U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 06:56:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C23BC0613CE
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 03:56:20 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kVBmx-0000ty-9f; Wed, 21 Oct 2020 12:56:15 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kVBmw-0007ZX-5t; Wed, 21 Oct 2020 12:56:14 +0200
Date:   Wed, 21 Oct 2020 12:56:14 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Message-ID: <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
 <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:34:48 up 341 days, 53 min, 372 users,  load average: 0.04, 0.06,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 09:29:35AM +0000, Ardelean, Alexandru wrote:
> 
> 
> > -----Original Message-----
> > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > Sent: Wednesday, October 21, 2020 12:05 PM
> > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ardelean, Alexandru
> > <alexandru.Ardelean@analog.com>
> > Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de; linux-
> > kernel@vger.kernel.org; linux-input@vger.kernel.org; David Jander
> > <david@protonic.nl>
> > Subject: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set by spi
> > framework
> > 
> > [External]
> > 
> > Do not overwrite spi->mode flags set by spi framework, otherwise the chip
> > select polarity will get lost.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/input/touchscreen/ads7846.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/ads7846.c
> > b/drivers/input/touchscreen/ads7846.c
> > index 8fd7fc39c4fd..ea31956f3a90 100644
> > --- a/drivers/input/touchscreen/ads7846.c
> > +++ b/drivers/input/touchscreen/ads7846.c
> > @@ -1288,7 +1288,7 @@ static int ads7846_probe(struct spi_device *spi)
> >  	 * may not.  So we stick to very-portable 8 bit words, both RX and TX.
> >  	 */
> >  	spi->bits_per_word = 8;
> > -	spi->mode = SPI_MODE_0;
> 
> I think the patch is incorrect.
> The initial version is correct; assuming that the datasheet says that this driver operates in mode 0.
> If the initial mode is incorrect, maybe we need to change that.
> 
> What is unfortunate, is that you cannot [yet] override the mode parameters [polarity & phase] from the device-tree, in case there are some things in-between the SPI controller & SPI chip [level inverters for example].
> I was planning to do something for this.

Current kernel (v5.9) is doing following work:

  of_register_spi_device()
    of_spi_parse_dt()
      /* this will parse dt and set different flags in spi->mode
       * all of this flags are dropped by this driver
       */

        ...... and here we parse gpio properties ......

	/*
	 * For descriptors associated with the device, polarity inversion is
	 * handled in the gpiolib, so all gpio chip selects are "active high"
	 * in the logical sense, the gpiolib will invert the line if need be.
	 */
	if ((ctlr->use_gpio_descriptors) && ctlr->cs_gpiods &&
	    ctlr->cs_gpiods[spi->chip_select])
		spi->mode |= SPI_CS_HIGH;
        -------->  ^^^^^^^^
	as you can see, if we use gpio as chip select, then the SPI_CS_HIGH
	flag is set. And gpiolib make all needed level conversation.

Since this diver is removing SPI_CS_HIGH flag, we have fallowing call
sequence:

spi_set_cs(, enable)                                        <---- 1
  ....
  if (spi->cs_gpiod || gpio_is_valid(spi->cs_gpio)) {
     ....
     gpiod_set_value_cansleep(, !enable);                   <---- 0
       gpiod_set_value_nocheck()
         if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
	   value = !value;                                  <---- 1


So, at the end, we set GPIO to 1, even if DTS configured it as ACTIVE_LOW.
You may probably suggest to set gpio in DTS to active ACTIVE_HIGH. In
this case we would run it to following snippet:
of_get_named_gpiod_flags()
  of_gpio_flags_quirks()
    if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios")..
	/*
	 * SPI children have active low chip selects
	 * by default. This can be specified negatively
	 * by just omitting "spi-cs-high" in the
	 * device node, or actively by tagging on
	 * GPIO_ACTIVE_LOW as flag in the device
	 * tree. If the line is simultaneously
	 * tagged as active low in the device tree
	 * and has the "spi-cs-high" set, we get a
	 * conflict and the "spi-cs-high" flag will
	 * take precedence.
	 */
	if (of_property_read_bool(child, "spi-cs-high")) {
		if (*flags & OF_GPIO_ACTIVE_LOW) {
			pr_warn("%s GPIO handle specifies active low - ignored\n",
				of_node_full_name(child));
			*flags &= ~OF_GPIO_ACTIVE_LOW;
		}
	} else {
		if (!(*flags & OF_GPIO_ACTIVE_LOW))
			pr_info("%s enforce active low on chipselect handle\n",
				of_node_full_name(child));
		*flags |= OF_GPIO_ACTIVE_LOW;
	}

As you can see, I would need to configure my dts with spi-cs-high flag,
even if the hardware is actually ACTIVE_LOW. If I will go this way, I
would risk a regression as soon as this issue is fixed.

Since the spi framework is already parsing devicetree and set all needed
flags, I assume it is wrong to blindly drop all this flags in the
driver.

> > +	spi->mode |= SPI_MODE_0;
> >  	err = spi_setup(spi);
> >  	if (err < 0)
> >  		return err;
> > --
> > 2.28.0

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
