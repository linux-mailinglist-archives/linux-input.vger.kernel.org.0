Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6FBE83CA
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 10:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbfJ2JEr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 05:04:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59683 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfJ2JEr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 05:04:47 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPNQe-00023m-5q; Tue, 29 Oct 2019 10:04:40 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPNQd-0007Qk-2y; Tue, 29 Oct 2019 10:04:39 +0100
Date:   Tue, 29 Oct 2019 10:04:39 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ondrej Jirman <megous@megous.com>, linux-sunxi@googlegroups.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add touchscreen support for TBS A711 Tablet
Message-ID: <20191029090439.ikgzrixv7wv2o6xb@pengutronix.de>
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029041516.GE57214@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029041516.GE57214@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:03:51 up 164 days, 15:22, 99 users,  load average: 0.12, 0.15,
 0.07
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

On 19-10-28 21:15, Dmitry Torokhov wrote:
> On Tue, Oct 29, 2019 at 01:58:03AM +0100, Ondrej Jirman wrote:
> > This is a resurrection of https://lkml.org/lkml/2018/7/25/143
> > 
> > Compared to v4 of Mylène's series I've dropped all attempts to
> > power off the chip during suspend. This patch just enables the
> > regulator during probe and disables it on driver rmmod.
> > 
> > I've tested the driver with suspend/resume and touching the
> > panel resumes my soc.
> 
> OK, I guess we can revisit when someone really needs power savings in
> suspend...

Please have a look on https://patchwork.kernel.org/cover/11149039/. I've
already send patches for it.

Regards,
  Marco

> I folded bindings into the driver change and applied, dts changes should
> go through respective tree.
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
