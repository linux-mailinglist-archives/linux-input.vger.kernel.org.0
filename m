Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF1F29589D
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 08:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504412AbgJVGyI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 22 Oct 2020 02:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504409AbgJVGyH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 02:54:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D5FC0613CF
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 23:54:07 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kVUU7-0001Cq-2W; Thu, 22 Oct 2020 08:54:03 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kVUU6-00068g-8g; Thu, 22 Oct 2020 08:54:02 +0200
Date:   Thu, 22 Oct 2020 08:54:02 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        David Jander <david@protonic.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Message-ID: <20201022065402.x7hlp2zncmnjyum7@pengutronix.de>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
 <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
 <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
 <20201021182757.GA444962@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201021182757.GA444962@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:49:54 up 341 days, 22:08, 380 users,  load average: 0.07, 0.07,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 11:27:57AM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 21, 2020 at 12:56:14PM +0200, Oleksij Rempel wrote:
> > 
> > As you can see, I would need to configure my dts with spi-cs-high flag,
> > even if the hardware is actually ACTIVE_LOW. If I will go this way, I
> > would risk a regression as soon as this issue is fixed.
> > 
> > Since the spi framework is already parsing devicetree and set all needed
> > flags, I assume it is wrong to blindly drop all this flags in the
> > driver.
> 
> Yes, but I wonder if the devices can only work in mode 0 we should be
> doing:
> 
> 	spi->mode &= ~SPI_MODE_MASK; // to be defined as 0x03 in spi.h
> 	spi->mode |= SPI_MODE_0;
> 
> as we can't simply "or" mode value as is

Why not? This values are taken from device tree. If some developer
decided to add them, then driver should take it over. Even if this
values will break the functionality.

Other properties of this driver will break the functionality too of this
driver too, so why should we silently filter only set of this bits?

> (well, mode 0 is kind of working, but just on accident).

Good question, will be probably a good reason to measure it.

> Thanks.
> 
> -- 
> Dmitry
> 
> 

Regards,
Oleksij

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
