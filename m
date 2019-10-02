Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4FDBC891B
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 15:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfJBNAb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 09:00:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37829 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBNAb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 09:00:31 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iFeEv-00087R-Lu; Wed, 02 Oct 2019 15:00:21 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iFeEs-0008R8-9y; Wed, 02 Oct 2019 15:00:18 +0200
Date:   Wed, 2 Oct 2019 15:00:18 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        bcousson@baylibre.com, tony@atomide.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, shawnguo@kernel.org,
        mripard@kernel.org, wens@csie.org
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
 <20190930231146.GA30010@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930231146.GA30010@bogus>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:53:29 up 137 days, 19:11, 90 users,  load average: 0.02, 0.05,
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

Hi,

all of you using a edt,* touchscreen and currently the driver marks
the touchscreen as wakeup source. To keep backward compatibility I added
a workaround binding (see below) but Dmitry prefer to use the normal
"wakeup-source" binding and change the affected device-tree's
(discussion below). Can you give me your ack/nack for Dmitry's solution?

Regards,
  Marco

On 19-09-30 18:11, Rob Herring wrote:
> On Tue, Sep 17, 2019 at 10:26:58AM -0700, Dmitry Torokhov wrote:
> > On Tue, Sep 17, 2019 at 07:18:14PM +0200, Marco Felsch wrote:
> > > Hi Dmitry,
> > > 
> > > On 19-09-17 10:07, Dmitry Torokhov wrote:
> > > > On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> > > > > The default driver behaviour is to enable the wakeup-source everytime.
> > > > > There are hardware designs which have a dedicated gpio to act as wakeup
> > > > > device. So it must be allowed to disable the wakeup-source capability.
> > > > > 
> > > > > This patch adds the binding documentation to disable the wakeup-source
> > > > > capability.
> > > > > 
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > index 870b8c5cce9b..4d6524fe3cf4 100644
> > > > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > @@ -35,6 +35,10 @@ Optional properties:
> > > > >   - pinctrl-0:   a phandle pointing to the pin settings for the
> > > > >                  control gpios
> > > > >  
> > > > > + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> > > > > +			      (for legacy compatibility). Add the property
> > > > > +			      so the device won't act as wakeup-source.
> > > > 
> > > > I think this is too ugly and I consider it being a bug in the driver
> > > > that it enables wakeup unconditionally.
> > > 
> > > That's right.
> > > 
> > > > Let's just update DTS in tree for devices that actually want it (I am
> > > > curious how many that do not declare "wakeup-source" have it working and
> > > > actually want it) and key the dirver behavior off the standard property.
> > > 
> > > There are a few DTS using this driver and the current driver behaviour.
> > > We need to keep the backward compatibility since the DTB is part of the
> > > firmware and firmware isn't always included during a system-update. I
> > > know its ugly but IMHO that's the right way to go to keep the backward
> > > compatibility. Let us see what the DT-folk says.
> > > 
> > > > Until we start seeing this controller in devices that actually have DTS
> > > > in hardware device tree I think it is better to use standard property.
> > > 
> > > Sorry, I didn't get you here..
> > 
> > What I was trying to say is that I have not actually seen DTB that is
> > part of hardware or separately upgradable frimware (not talking about
> > ppc or sparc boxes, but ones that might be using this driver). It is
> > always built into the kernel in my experience, so backward compatibility
> > is simply a tool that is being used to prevent us from being too wild
> > with hacking on bindings, but rarely a practical concern.
> 
> Well, that's self fulfilling...
> 
> > In cases like this I think it is worthwhile to simply update in-tree
> > DTS and arrive at a sane binding.
> 
> Get the maintainers of the affected platforms to agree to the changes.
> 
> Rob
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
