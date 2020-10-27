Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D44D29A6D2
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 09:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509233AbgJ0IpI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 04:45:08 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56901 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2509226AbgJ0IpG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 04:45:06 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kXKbG-0003rX-Cj; Tue, 27 Oct 2020 09:45:02 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kXKbF-0008T3-3v; Tue, 27 Oct 2020 09:45:01 +0100
Date:   Tue, 27 Oct 2020 09:45:01 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        David Jander <david@protonic.nl>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1] Input: touchscreen: ads7846.c: Fix race that causes
 missing releases
Message-ID: <20201027084501.rjfza4il5gv7ursy@pengutronix.de>
References: <20201026132117.20887-1-o.rempel@pengutronix.de>
 <20201027034851.GH444962@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201027034851.GH444962@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:07:38 up 346 days, 23:26, 374 users,  load average: 0.11, 0.05,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 08:48:51PM -0700, Dmitry Torokhov wrote:
> Hi Oleksij,
> 
> On Mon, Oct 26, 2020 at 02:21:17PM +0100, Oleksij Rempel wrote:
> > From: David Jander <david@protonic.nl>
> > 
> > If touchscreen is released while busy reading HWMON device, the release
> > can be missed. The IRQ thread is not started because no touch is active
> > and BTN_TOUCH release event is never sent.
> > 
> > Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
> > Co-Developed-by: David Jander <david@protonic.nl>
> > Signed-off-by: David Jander <david@protonic.nl>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  drivers/input/touchscreen/ads7846.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> > index ea31956f3a90..0236a119c52d 100644
> > --- a/drivers/input/touchscreen/ads7846.c
> > +++ b/drivers/input/touchscreen/ads7846.c
> > @@ -211,10 +211,26 @@ static void ads7846_stop(struct ads7846 *ts)
> >  	}
> >  }
> >  
> > +static int get_pendown_state(struct ads7846 *ts);
> 
> Not a fan forward declarations, just move the definition if needed.

ok

> > +
> >  /* Must be called with ts->lock held */
> >  static void ads7846_restart(struct ads7846 *ts)
> >  {
> > +	unsigned int pdstate;
> 
> I do not see it being used. Do you have more patches for the driver?

Ooops. Artifact of previous version of this patch.
But, yes, there is one huge patch with major rework of this driver. I'll
need to split it before sending. Or, are you ready to accept a one big
patch? :)

> > +
> >  	if (!ts->disabled && !ts->suspended) {
> > +		/* Check if pen was released since last stop */
> > +		if (ts->pendown && !get_pendown_state(ts)) {
> > +			struct input_dev *input = ts->input;
> > +
> > +			input_report_key(input, BTN_TOUCH, 0);
> > +			input_report_abs(input, ABS_PRESSURE, 0);
> > +			input_sync(input);
> > +
> > +			ts->pendown = false;
> > +			dev_vdbg(&ts->spi->dev, "UP\n");
> 
> I wonder if we should not have ads7846_report_pen_up(struct ads7846 *ts) 

Sure, which is already done in rework patch. Should I move this change
here?

> > +		}
> > +
> >  		/* Tell IRQ thread that it may poll the device. */
> >  		ts->stopped = false;
> >  		mb();
> > -- 
> > 2.28.0
> > 
> 

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
