Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E310F990
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 09:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfLCIQP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 03:16:15 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53209 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCIQP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 03:16:15 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ic3Lk-0002Ds-MK; Tue, 03 Dec 2019 09:16:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ic3Lj-0006Xc-Gp; Tue, 03 Dec 2019 09:15:59 +0100
Date:   Tue, 3 Dec 2019 09:15:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/5] Input: edt-ft5x06: work around first register
 access error
Message-ID: <20191203081559.rchykgk22aoygfef@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-2-m.felsch@pengutronix.de>
 <20191202175851.GB50317@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202175851.GB50317@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:15:29 up 17 days, 23:34, 26 users,  load average: 0.07, 0.03,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19-12-02 09:58, Dmitry Torokhov wrote:
> On Wed, Nov 27, 2019 at 01:09:44PM +0100, Marco Felsch wrote:
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > The EP0700MLP1 returns bogus data on the first register read access
> > (reading the threshold parameter from register 0x00):
> > 
> >     edt_ft5x06 2-0038: crc error: 0xfc expected, got 0x40
> > 
> > It ignores writes until then. This patch adds a dummy read after which
> > the number of sensors and parameter read/writes work correctly.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Need your signed-off-by as well.

Damn, you're right.. I fix this in the next version.

> 
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index d61731c0037d..b87b1e074f62 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -1050,6 +1050,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  {
> >  	const struct edt_i2c_chip_data *chip_data;
> >  	struct edt_ft5x06_ts_data *tsdata;
> > +	u8 buf[2] = { 0xfc, 0x00 };
> >  	struct input_dev *input;
> >  	unsigned long irq_flags;
> >  	int error;
> > @@ -1140,6 +1141,12 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
> >  		return error;
> >  	}
> >  
> > +	/*
> > +	 * Dummy read access. EP0700MLP1 returns bogus data on the first
> > +	 * register read access and ignores writes.
> > +	 */
> > +	edt_ft5x06_ts_readwrite(tsdata->client, 2, buf, 2, buf);
> > +
> >  	edt_ft5x06_ts_set_regs(tsdata);
> >  	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
> >  	edt_ft5x06_ts_get_parameters(tsdata);
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
