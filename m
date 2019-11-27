Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A30610B463
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 18:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfK0R0D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 12:26:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51115 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfK0R0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 12:26:01 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ia14Z-00041y-JI; Wed, 27 Nov 2019 18:25:51 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ia14Z-0001Vf-5P; Wed, 27 Nov 2019 18:25:51 +0100
Date:   Wed, 27 Nov 2019 18:25:51 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/5] EDT-FT5x06 improvements
Message-ID: <20191127172551.z3la7o6d575j3sp4@pengutronix.de>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127171456.GR32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127171456.GR32742@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:25:25 up 12 days,  8:44, 24 users,  load average: 0.11, 0.06,
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

Hi Andy,

On 19-11-27 19:14, Andy Shevchenko wrote:
> On Wed, Nov 27, 2019 at 01:09:43PM +0100, Marco Felsch wrote:
> > Hi,
> > 
> > this v2 address all comments made on [1]. See the patch based changelog
> > for further information.
> > 
> > During the discussion we all agreed to use the common wakeup-src device
> > property but I added all users of this driver again. So they can provide
> > their ack-tag.
> > 
> 
> Independently on the decision on patch 5, FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for testing and the review =)

Regards,
  Marco

> > Regards,
> >   Marco
> > 
> > [1] https://patchwork.kernel.org/cover/11149039/
> > 
> > Marco Felsch (4):
> >   Input: edt-ft5x06 - alphabetical include reorder
> >   dt-bindings: Input: edt-ft5x06 - document wakeup-source capability
> >   Input: edt-ft5x06 - make wakeup-source switchable
> >   Input: edt-ft5x06 - improve power management operations
> > 
> > Philipp Zabel (1):
> >   Input: edt-ft5x06: work around first register access error
> > 
> >  .../bindings/input/touchscreen/edt-ft5x06.txt |  2 +
> >  drivers/input/touchscreen/edt-ft5x06.c        | 85 ++++++++++++++++---
> >  2 files changed, 73 insertions(+), 14 deletions(-)
> > 
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
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
