Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAED6B534D
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfIQQqu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:46:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46493 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfIQQqu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:46:50 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGch-0003ZC-Mk; Tue, 17 Sep 2019 18:46:39 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAGch-0008PQ-3F; Tue, 17 Sep 2019 18:46:39 +0200
Date:   Tue, 17 Sep 2019 18:46:39 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 3/6] Input: edt-ft5x06 - add support to disable the
 wakeup-source
Message-ID: <20190917164639.bsspf3xoqfggpxwj@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-4-m.felsch@pengutronix.de>
 <20190917163215.GH2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917163215.GH2680@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:43:59 up 122 days, 23:02, 69 users,  load average: 0.02, 0.03,
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

On 19-09-17 19:32, Andy Shevchenko wrote:
> On Tue, Sep 17, 2019 at 05:58:05PM +0200, Marco Felsch wrote:
> > Since day one the touch controller acts as wakeup-source. This seems to
> > be wrong since the device supports deep-sleep mechanism [1] which
> > requires a reset to leave it. Also some designs won't use the
> > touchscreen as wakeup-source.
> > 
> > Add a firmware property to address this. The common 'wakeup-source'
> > property can't be used for that because the driver must be backward
> > compatible with old firmwares which may assume the default on
> > wakeup-source behaviour. So we need to go the other way by explicit
> > disable the wakeup-source capability.
> > 
> 
> > [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
> >     FT5x26.pdf
> 
> Please, don't split URLs

Hm.. then checkpatch complains.. If you prefer it, I can change it in
the v2.

> >  	int error;
> >  	char fw_version[EDT_NAME_LEN];
> 
> > +	bool en_wakeup;
> 
> Perhaps wakeup_en?

I have no strong opinion about that..

Regards,
  Marco


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
