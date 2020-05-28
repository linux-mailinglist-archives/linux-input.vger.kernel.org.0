Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75B71E60EF
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 14:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389692AbgE1Mdd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 08:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389279AbgE1Mdc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 08:33:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF68C05BD1E
        for <linux-input@vger.kernel.org>; Thu, 28 May 2020 05:33:32 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jeHiv-0000ic-LM; Thu, 28 May 2020 14:33:25 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jeHiu-0004hf-5T; Thu, 28 May 2020 14:33:24 +0200
Date:   Thu, 28 May 2020 14:33:24 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528123324.baoihyrg7rqjtt6r@pengutronix.de>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
 <20200528102730.GK1634618@smile.fi.intel.com>
 <20200528114558.5decxsun2o65k2fr@pengutronix.de>
 <20200528122248.GL1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528122248.GL1634618@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:31:38 up 195 days,  3:50, 196 users,  load average: 0.17, 0.13,
 0.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20-05-28 15:22, Andy Shevchenko wrote:
> On Thu, May 28, 2020 at 01:45:58PM +0200, Marco Felsch wrote:
> > On 20-05-28 13:27, Andy Shevchenko wrote:
> > > On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:
> 
> ...
> 
> > > > +	select CONFIG_REGMAP_MMIO
> > > 
> > > This is wrong.
> > 
> > Why is this wrong? The driver uses the rmap-mmio functions.
> 
> In Kconfig CONFIG_ prefix is implied.
> 
> There is no CONFIG_CONFIG_REGMAP_MMIO.
> 
> > Thanks for the explanation =)
> 
> Sorry, I think it's obvious...

Damn, you right it is. Bloody automatism mismatch in my brain.

Regards,
  Marco

> 
> > > > +	select INPUT_MATRIXKMAP
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
