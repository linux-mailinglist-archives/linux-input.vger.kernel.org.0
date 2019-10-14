Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9400D5E66
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 11:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbfJNJOp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Oct 2019 05:14:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730585AbfJNJOp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Oct 2019 05:14:45 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64351207FF;
        Mon, 14 Oct 2019 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571044484;
        bh=6s5ALtRsWyyMnGgX+VGvHOkNhg2mUhjWBZWLL7G0/QE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hYJCUvrjaIXYtDRIKZSOJr5SuakAhIlbQdwiZoY+YpJXgL7lC1haL9u25fRBK9SEQ
         qs/GqWhZ2l1xp3N6wIERDnqJHLehZrwvxlPP5akkTq4gs0fgn9YX4aMV+dPQF6+o8Z
         sWcT+PvzHKZ1HwvQT9C3+O/h4V9rU5l3983t39gI=
Date:   Mon, 14 Oct 2019 17:14:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        bcousson@baylibre.com, tony@atomide.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mripard@kernel.org,
        wens@csie.org
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20191014091422.GK12262@dragon>
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
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 02, 2019 at 03:00:18PM +0200, Marco Felsch wrote:
> Hi,
> 
> all of you using a edt,* touchscreen and currently the driver marks
> the touchscreen as wakeup source. To keep backward compatibility I added
> a workaround binding (see below) but Dmitry prefer to use the normal
> "wakeup-source" binding and change the affected device-tree's
> (discussion below). Can you give me your ack/nack for Dmitry's solution?

Acked-by: Shawn Guo <shawnguo@kernel.org>

> 
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
