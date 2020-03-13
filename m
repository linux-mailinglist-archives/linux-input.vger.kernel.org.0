Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC850184999
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 15:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgCMOje (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 10:39:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48421 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCMOje (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 10:39:34 -0400
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jClTI-0000KZ-Dv; Fri, 13 Mar 2020 15:39:32 +0100
Message-ID: <3ded79256352ebf028f17fd10fdddc4a852c8059.camel@pengutronix.de>
Subject: Re: [PATCH 4/4] Input: exc3000: add firmware update support
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Date:   Fri, 13 Mar 2020 15:39:32 +0100
In-Reply-To: <20200120195430.GK47797@dtor-ws>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
         <20200107171741.10856-4-l.stach@pengutronix.de>
         <20200120195430.GK47797@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mo, 2020-01-20 at 11:54 -0800, Dmitry Torokhov wrote:
> On Tue, Jan 07, 2020 at 06:17:40PM +0100, Lucas Stach wrote:
> > This change allows the device firmware to be updated by putting a
> > firmware
> > file in /lib/firmware and providing the name of the file via the
> > update_fw
> > sysfs property. The driver will then flash the firmware image into
> > the
> > controller internal storage and restart the controller to activate
> > the new
> > firmware.
> > 
> > The implementation was done by looking at the the messages passed
> > between
> > the controller and proprietary vendor update tool. Not every detail
> > of the
> > protocol is totally well understood, so the implementation still
> > has some
> > "monkey see, monkey do" parts, as far as they have been found to be
> > required
> > for the update to succeed.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/input/touchscreen/exc3000.c | 248
> > +++++++++++++++++++++++++++-
> >  1 file changed, 246 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/exc3000.c
> > b/drivers/input/touchscreen/exc3000.c
> > index ce83914d65ff..f9a9820dc232 100644
> > --- a/drivers/input/touchscreen/exc3000.c
> > +++ b/drivers/input/touchscreen/exc3000.c
> > @@ -3,8 +3,8 @@
> >   * Driver for I2C connected EETI EXC3000 multiple touch controller
> >   *
> >   * Copyright (C) 2017 Ahmet Inan <inan@distec.de>
> > - *
> > - * minimal implementation based on egalax_ts.c and egalax_i2c.c
> > + * Copyright (C) 2019 Pengutronix <kernel@pengutronix.de>
> > + * Copyright (C) 2019 Zodiac Inflight Innovations
> >   */
> >  
> >  #include <linux/bitops.h>
> > @@ -18,6 +18,8 @@
> >  #include <linux/of.h>
> >  #include <linux/timer.h>
> >  #include <asm/unaligned.h>
> > +#include <linux/firmware.h>
> > +#include <linux/delay.h>
> >  
> >  #define EXC3000_NUM_SLOTS		10
> >  #define EXC3000_SLOTS_PER_FRAME		5
> > @@ -37,6 +39,7 @@ struct exc3000_data {
> >  	struct mutex vendor_data_lock;
> >  	struct completion vendor_data_done;
> >  	char *type, *model, *fw_rev;
> > +	int update_status;
> >  };
> >  
> >  static void exc3000_report_slots(struct input_dev *input,
> > @@ -215,6 +218,8 @@ static int exc3000_populate_device_info(struct
> > exc3000_data *data)
> >  	if (ret < 0)
> >  		return -ENODEV;
> >  
> > +	if (data->type)
> > +		devm_kfree(dev, data->type);
> >  	data->type = devm_kmemdup(dev, &response[1], ret - 1,
> > GFP_KERNEL);
> 
> This makes me uncomfortable, as this changes the release order of the
> resources (newly re-allocated memory will be freed first). Please
> reassure me that it will work fine WRT device removal (or,
> alternatively, we will need devm_realloc() that would preserve devm
> release ordering.

The cached information here is only used for the sysfs FW info
attributes. In v2 I split those out into a separate group, which gets
removed and registered again when refreshing this information after the
FW update. This keeps the devm ordering the same and fixes a possible
use-after-free through sysfs reads at the same time.

Regards,
Lucas

