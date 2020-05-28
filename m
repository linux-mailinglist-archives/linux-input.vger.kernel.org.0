Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058791E5EA1
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 13:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388463AbgE1LqN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 07:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388444AbgE1LqM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 07:46:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A353C05BD1E
        for <linux-input@vger.kernel.org>; Thu, 28 May 2020 04:46:12 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jeGz2-0002tO-Rx; Thu, 28 May 2020 13:46:00 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jeGz0-0001oA-7h; Thu, 28 May 2020 13:45:58 +0200
Date:   Thu, 28 May 2020 13:45:58 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [RESEND PATCH v11 2/3] drivers: input: keyboard: Add mtk keypad
 driver
Message-ID: <20200528114558.5decxsun2o65k2fr@pengutronix.de>
References: <20200528090144.54033-1-fengping.yu@mediatek.com>
 <20200528090144.54033-3-fengping.yu@mediatek.com>
 <20200528102730.GK1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528102730.GK1634618@smile.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:44:39 up 195 days,  3:03, 196 users,  load average: 0.02, 0.07,
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

Hi Andy,

On 20-05-28 13:27, Andy Shevchenko wrote:
> On Thu, May 28, 2020 at 05:01:47PM +0800, Fengping Yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> > 
> > This adds matrix keypad support for Mediatek SoCs.
> 
> ...
> 
> > +config KEYBOARD_MTK_KPD
> > +	tristate "MediaTek Keypad Support"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> 
> > +	select CONFIG_REGMAP_MMIO
> 
> This is wrong.

Why is this wrong? The driver uses the rmap-mmio functions.

Thanks for the explanation =)
  Marco

> 
> > +	select INPUT_MATRIXKMAP
> 
> ...
> 
> > +	ret = devm_add_action_or_reset(&pdev->dev, kpd_clk_disable,
> > +				       keypad->clk);
> 
> I would leave on one line (only 81 characters).
> 
> > +	if (ret)
> > +		return ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
