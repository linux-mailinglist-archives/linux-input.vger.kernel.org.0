Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C793329A632
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 09:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508796AbgJ0IHj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 27 Oct 2020 04:07:39 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36887 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508777AbgJ0IH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 04:07:27 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kXK0n-0008HG-7x; Tue, 27 Oct 2020 09:07:21 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kXK0l-0006i8-RJ; Tue, 27 Oct 2020 09:07:19 +0100
Date:   Tue, 27 Oct 2020 09:07:19 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        David Jander <david@protonic.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Message-ID: <20201027080719.utujr2p6pbzpvb3j@pengutronix.de>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
 <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
 <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
 <20201021182757.GA444962@dtor-ws>
 <20201022065402.x7hlp2zncmnjyum7@pengutronix.de>
 <20201027035309.GI444962@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201027035309.GI444962@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:06:46 up 346 days, 23:25, 374 users,  load average: 0.08, 0.04,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 08:53:09PM -0700, Dmitry Torokhov wrote:
> On Thu, Oct 22, 2020 at 08:54:02AM +0200, Oleksij Rempel wrote:
> > On Wed, Oct 21, 2020 at 11:27:57AM -0700, Dmitry Torokhov wrote:
> > > On Wed, Oct 21, 2020 at 12:56:14PM +0200, Oleksij Rempel wrote:
> > > > 
> > > > As you can see, I would need to configure my dts with spi-cs-high flag,
> > > > even if the hardware is actually ACTIVE_LOW. If I will go this way, I
> > > > would risk a regression as soon as this issue is fixed.
> > > > 
> > > > Since the spi framework is already parsing devicetree and set all needed
> > > > flags, I assume it is wrong to blindly drop all this flags in the
> > > > driver.
> > > 
> > > Yes, but I wonder if the devices can only work in mode 0 we should be
> > > doing:
> > > 
> > > 	spi->mode &= ~SPI_MODE_MASK; // to be defined as 0x03 in spi.h
> > > 	spi->mode |= SPI_MODE_0;
> > > 
> > > as we can't simply "or" mode value as is
> > 
> > Why not? This values are taken from device tree. If some developer
> > decided to add them, then driver should take it over. Even if this
> > values will break the functionality.
> > 
> > Other properties of this driver will break the functionality too of this
> > driver too, so why should we silently filter only set of this bits?
> 
> What I was trying to say is that if driver wants to set mode to
> particular value it should not "or" the value, as it will not reset the
> relevant bits. I.e. if there some undesirable data in spi->mode mode
> bits it will not get set properly by essentially doing "spi->mode |= 0".
> That is why I said the driver needs to clear mode bits and set them to
> the desired mode.

Ok, i'll update this patch as you suggested.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
