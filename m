Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6362B0453
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgKLLuN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgKLLtU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:49:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B097C0613D1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:48:57 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kdB5w-0006Lf-Ft; Thu, 12 Nov 2020 12:48:52 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kdB5v-0001Wn-VL; Thu, 12 Nov 2020 12:48:51 +0100
Date:   Thu, 12 Nov 2020 12:48:51 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        David Jander <david@protonic.nl>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: touchscreen: ads7846.c: Fix race that causes
 missing releases
Message-ID: <20201112114851.mlhhxxjonhx5n4sz@pengutronix.de>
References: <20201027105416.18773-1-o.rempel@pengutronix.de>
 <20201111190740.GY1003057@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201111190740.GY1003057@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:48:21 up 363 days,  3:06, 30 users,  load average: 0.03, 0.07,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 11, 2020 at 11:07:40AM -0800, Dmitry Torokhov wrote:
> Hi Oleksij,
> 
> On Tue, Oct 27, 2020 at 11:54:16AM +0100, Oleksij Rempel wrote:
> > From: David Jander <david@protonic.nl>
> > 
> > If touchscreen is released while busy reading HWMON device, the release
> > can be missed. The IRQ thread is not started because no touch is active
> > and BTN_TOUCH release event is never sent.
> > 
> > Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
> > Co-Developed-by: David Jander <david@protonic.nl>
> 
> Since the patch is nominally attributed to David (via the From: tag)
> I'll be changing Co-developed-by tag to your name, OK?

OK.

> 
> > Signed-off-by: David Jander <david@protonic.nl>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Regards,
Oleksij

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
