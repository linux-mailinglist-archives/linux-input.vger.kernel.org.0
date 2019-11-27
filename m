Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 780A710B45D
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 18:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfK0RZi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 12:25:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfK0RZh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 12:25:37 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ia147-0003uj-UN; Wed, 27 Nov 2019 18:25:23 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ia146-0001PW-IG; Wed, 27 Nov 2019 18:25:22 +0100
Date:   Wed, 27 Nov 2019 18:25:22 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20191127172522.4wmc6pqyuw7vpvzl@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-6-m.felsch@pengutronix.de>
 <20191127125932.GK32742@smile.fi.intel.com>
 <20191127130602.5zp537xdybbafnci@pengutronix.de>
 <20191127143217.GL32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127143217.GL32742@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:23:16 up 12 days,  8:41, 24 users,  load average: 0.07, 0.03,
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

Hi,

On 19-11-27 16:32, Andy Shevchenko wrote:
> On Wed, Nov 27, 2019 at 02:06:02PM +0100, Marco Felsch wrote:
> > On 19-11-27 14:59, Andy Shevchenko wrote:
> > > On Wed, Nov 27, 2019 at 01:09:48PM +0100, Marco Felsch wrote:
> 
> > > Perhaps
> > > 
> > > static void edt_ft5x06_ts_toggle_gpio(struct gpio_desc *gpiod)
> > > {
> > > 	...
> > > }
> > > 
> > > ...resume(...)
> > > {
> > > 	...
> > > 	if (wake_gpio)
> > > 		...toggle_gpio(wake_gpio);
> > > 	else if (reset_gpio)
> > > 		...toggle_gpio(reset_gpio);
> > > 	...
> > > }
> > > 
> > > ?
> > 
> > Thanks fpr your suggestion but we need to differentiate between reset
> > and wake logic level. The wake-gpio keeps asserted while the reset is
> > released. So the edt_ft5x06_ts_toggle_gpio() needs at least a 'is_reset'
> > parameter but then the simplification is gone.
> 
> 
> How about this:
> static void edt_ft5x06_ts_toggle_gpio(struct gpio_desc *gpiod, int value)
> {
> 	gpiod_...(..., !value);
> 	...
> 	gpiod_...(..., value);
> 	...
> }
> 
> ...resume(...)
> {
> 	...
> 	if (wake_gpio)
> 		...toggle_gpio(wake_gpio, 1);
> 	else if (reset_gpio)
> 		...toggle_gpio(reset_gpio, 0);
> 	...
> }
> 
> ?

That's possible.. Don't see the improvement yet, but I can prepare a
folllow-up patch if Dmitry wants.

Regards,
  Marco

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
