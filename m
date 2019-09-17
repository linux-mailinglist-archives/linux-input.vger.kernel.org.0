Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9FD1B5340
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfIQQoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:44:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43395 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfIQQoC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:44:02 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGa2-0003CM-EP; Tue, 17 Sep 2019 18:43:54 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGa1-0008Hn-4T; Tue, 17 Sep 2019 18:43:53 +0200
Date:   Tue, 17 Sep 2019 18:43:53 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] Input: edt-ft5x06 - alphabetical include reorder
Message-ID: <20190917164353.nkjfuukmjc45mpi5@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-2-m.felsch@pengutronix.de>
 <20190917162909.GG2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917162909.GG2680@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:43:25 up 122 days, 23:01, 69 users,  load average: 0.04, 0.04,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19-09-17 19:29, Andy Shevchenko wrote:
> On Tue, Sep 17, 2019 at 05:58:03PM +0200, Marco Felsch wrote:
> > It seems that the include order is historical increased and no one takes
> > care of it. Fix this to align it with the common rule to be in a
> > alphabetical order.
> 
> But asm parts we usually put after linux parts.

Thanks, I will change it in the v2.

Regards,
  Marco


> 
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 3cc4341bbdff..9e328a82b765 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -13,21 +13,21 @@
> >   *    http://www.glyn.com/Products/Displays
> >   */
> >  
> > -#include <linux/module.h>
> > -#include <linux/ratelimit.h>
> > -#include <linux/irq.h>
> > -#include <linux/interrupt.h>
> > -#include <linux/input.h>
> > -#include <linux/i2c.h>
> > -#include <linux/kernel.h>
> > -#include <linux/uaccess.h>
> > -#include <linux/delay.h>
> > +#include <asm/unaligned.h>
> >  #include <linux/debugfs.h>
> > -#include <linux/slab.h>
> > +#include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/input.h>
> >  #include <linux/input/mt.h>
> >  #include <linux/input/touchscreen.h>
> > -#include <asm/unaligned.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/ratelimit.h>
> > +#include <linux/slab.h>
> > +#include <linux/uaccess.h>
> >  
> >  #define WORK_REGISTER_THRESHOLD		0x00
> >  #define WORK_REGISTER_REPORT_RATE	0x08
> > -- 
> > 2.20.1
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
