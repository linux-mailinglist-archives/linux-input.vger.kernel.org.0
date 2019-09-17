Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7163AB535B
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfIQQvc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:51:32 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32815 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbfIQQvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:51:32 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGhJ-00041v-De; Tue, 17 Sep 2019 18:51:25 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGhI-000067-PQ; Tue, 17 Sep 2019 18:51:24 +0200
Date:   Tue, 17 Sep 2019 18:51:24 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Message-ID: <20190917165124.4i2ctextifucz2xo@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-7-m.felsch@pengutronix.de>
 <20190917163536.GI2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917163536.GI2680@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:46:52 up 122 days, 23:05, 70 users,  load average: 0.02, 0.02,
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

On 19-09-17 19:35, Andy Shevchenko wrote:
> On Tue, Sep 17, 2019 at 05:58:08PM +0200, Marco Felsch wrote:
> > Currently the driver do not care about the regulator which supplies the
> > controller. This can lead into problems since we support (deep-)sleep
> > because the regulator can be turned off before we send the (deep-)sleep
> > command to the controller. Using a own regulator improves the power
> > consumption during sleep even more.
> 
> > +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> > +	if (IS_ERR(tsdata->vdd)) {
> > +		error = PTR_ERR(tsdata->vdd);
> > +		if (error == -EPROBE_DEFER)
> > +			return error;
> 
> Before it worked w/o regulator. You have to make it optional.

devm_regulator_get will return a dummy regulator if no one is specified
so it is optional.

Regards,
  Marco


> 
> > +		dev_err(&client->dev,
> > +			"Failed to request vdd-supply, error %d\n", error);
> > +		return error;
> > +	}
> > +
> > +	error = regulator_enable(tsdata->vdd);
> > +	if (error) {
> > +		dev_err(&client->dev,
> > +			"Failed to enable vdd-supply, error %d\n", error);
> > +		return error;
> > +	}
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
