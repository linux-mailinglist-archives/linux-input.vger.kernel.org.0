Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513A2C8CD3
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfJBPY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 11:24:58 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39053 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfJBPY6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 11:24:58 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 26AE21BF207;
        Wed,  2 Oct 2019 15:24:53 +0000 (UTC)
Date:   Wed, 2 Oct 2019 17:24:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        bcousson@baylibre.com, tony@atomide.com,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shawnguo@kernel.org, mripard@kernel.org, wens@csie.org
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20191002152452.GN4106@piout.net>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
 <20190930231146.GA30010@bogus>
 <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/10/2019 15:00:18+0200, Marco Felsch wrote:
> Hi,
> 
> all of you using a edt,* touchscreen and currently the driver marks
> the touchscreen as wakeup source. To keep backward compatibility I added
> a workaround binding (see below) but Dmitry prefer to use the normal
> "wakeup-source" binding and change the affected device-tree's
> (discussion below). Can you give me your ack/nack for Dmitry's solution?
> 

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Regards,
>   Marco
> 
> On 19-09-30 18:11, Rob Herring wrote:
> > On Tue, Sep 17, 2019 at 10:26:58AM -0700, Dmitry Torokhov wrote:
> > > On Tue, Sep 17, 2019 at 07:18:14PM +0200, Marco Felsch wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On 19-09-17 10:07, Dmitry Torokhov wrote:
> > > > > On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> > > > > > The default driver behaviour is to enable the wakeup-source everytime.
> > > > > > There are hardware designs which have a dedicated gpio to act as wakeup
> > > > > > device. So it must be allowed to disable the wakeup-source capability.
> > > > > > 
> > > > > > This patch adds the binding documentation to disable the wakeup-source
> > > > > > capability.
> > > > > > 
> > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > ---
> > > > > >  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > > index 870b8c5cce9b..4d6524fe3cf4 100644
> > > > > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > > > @@ -35,6 +35,10 @@ Optional properties:
> > > > > >   - pinctrl-0:   a phandle pointing to the pin settings for the
> > > > > >                  control gpios
> > > > > >  
> > > > > > + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> > > > > > +			      (for legacy compatibility). Add the property
> > > > > > +			      so the device won't act as wakeup-source.
> > > > > 
> > > > > I think this is too ugly and I consider it being a bug in the driver
> > > > > that it enables wakeup unconditionally.
> > > > 
> > > > That's right.
> > > > 
> > > > > Let's just update DTS in tree for devices that actually want it (I am
> > > > > curious how many that do not declare "wakeup-source" have it working and
> > > > > actually want it) and key the dirver behavior off the standard property.
> > > > 
> > > > There are a few DTS using this driver and the current driver behaviour.
> > > > We need to keep the backward compatibility since the DTB is part of the
> > > > firmware and firmware isn't always included during a system-update. I
> > > > know its ugly but IMHO that's the right way to go to keep the backward
> > > > compatibility. Let us see what the DT-folk says.
> > > > 
> > > > > Until we start seeing this controller in devices that actually have DTS
> > > > > in hardware device tree I think it is better to use standard property.
> > > > 
> > > > Sorry, I didn't get you here..
> > > 
> > > What I was trying to say is that I have not actually seen DTB that is
> > > part of hardware or separately upgradable frimware (not talking about
> > > ppc or sparc boxes, but ones that might be using this driver). It is
> > > always built into the kernel in my experience, so backward compatibility
> > > is simply a tool that is being used to prevent us from being too wild
> > > with hacking on bindings, but rarely a practical concern.
> > 
> > Well, that's self fulfilling...
> > 
> > > In cases like this I think it is worthwhile to simply update in-tree
> > > DTS and arrive at a sane binding.
> > 
> > Get the maintainers of the affected platforms to agree to the changes.
> > 
> > Rob
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
