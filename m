Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408FC13681A
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 08:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgAJHQY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 02:16:24 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48349 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgAJHQX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 02:16:23 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ipoWd-0001oM-Qd; Fri, 10 Jan 2020 08:16:07 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ipoWc-00084N-CC; Fri, 10 Jan 2020 08:16:06 +0100
Date:   Fri, 10 Jan 2020 08:16:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 6/6] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20200110071606.g42csvhgtriddqj4@pengutronix.de>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-7-m.felsch@pengutronix.de>
 <20200110010957.GP8314@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110010957.GP8314@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:06:45 up 55 days, 22:25, 49 users,  load average: 0.03, 0.08,
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

Hi Dmitry,

On 20-01-09 17:09, Dmitry Torokhov wrote:
> Hi Marco,
> 
> On Wed, Jan 08, 2020 at 12:10:50PM +0100, Marco Felsch wrote:
> > +static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
> > +	int ret;
> > +
> > +	if (device_may_wakeup(dev))
> > +		return 0;
> > +
> > +	ret = regulator_enable(tsdata->vcc);
> > +	if (ret)
> > +		dev_warn(dev, "Failed to enable vcc\n");
> 
> I wonder if we should not return error here instead of continuing. If
> device is not powered up properly we'll have hard time communicating
> with it.

That's a reasonable point.

> The same is for suspend: maybe we should abort if we can't switch off
> regulator or write to the device.

I have no strong opinion about that case but IMHO it's okay to go further
if we can't switch it off. Instead we should print a warning.

Regards,
  Marco

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
