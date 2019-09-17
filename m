Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B82E0B53D7
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfIQRSY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:18:24 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59011 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfIQRSY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:18:24 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAH7I-0006lV-HY; Tue, 17 Sep 2019 19:18:16 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAH7G-0001Ca-SP; Tue, 17 Sep 2019 19:18:14 +0200
Date:   Tue, 17 Sep 2019 19:18:14 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20190917171814.owcttekv56xgmsts@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917170743.GO237523@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:09:31 up 122 days, 23:27, 70 users,  load average: 0.03, 0.04,
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

Hi Dmitry,

On 19-09-17 10:07, Dmitry Torokhov wrote:
> On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> > The default driver behaviour is to enable the wakeup-source everytime.
> > There are hardware designs which have a dedicated gpio to act as wakeup
> > device. So it must be allowed to disable the wakeup-source capability.
> > 
> > This patch adds the binding documentation to disable the wakeup-source
> > capability.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > index 870b8c5cce9b..4d6524fe3cf4 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > @@ -35,6 +35,10 @@ Optional properties:
> >   - pinctrl-0:   a phandle pointing to the pin settings for the
> >                  control gpios
> >  
> > + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> > +			      (for legacy compatibility). Add the property
> > +			      so the device won't act as wakeup-source.
> 
> I think this is too ugly and I consider it being a bug in the driver
> that it enables wakeup unconditionally.

That's right.

> Let's just update DTS in tree for devices that actually want it (I am
> curious how many that do not declare "wakeup-source" have it working and
> actually want it) and key the dirver behavior off the standard property.

There are a few DTS using this driver and the current driver behaviour.
We need to keep the backward compatibility since the DTB is part of the
firmware and firmware isn't always included during a system-update. I
know its ugly but IMHO that's the right way to go to keep the backward
compatibility. Let us see what the DT-folk says.

> Until we start seeing this controller in devices that actually have DTS
> in hardware device tree I think it is better to use standard property.

Sorry, I didn't get you here..

Regards,
  Marco


> 
> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
