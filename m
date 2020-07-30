Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7BA232EFF
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 10:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbgG3IzV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 04:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3IzM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 04:55:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51273C061794
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 01:55:12 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k14L8-0002K4-FP; Thu, 30 Jul 2020 10:55:02 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k14L2-0003Tl-Jy; Thu, 30 Jul 2020 10:54:56 +0200
Date:   Thu, 30 Jul 2020 10:54:56 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Message-ID: <20200730085456.qy3uen46nfhkxba4@pengutronix.de>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
 <20200723074314.3304-3-horia.geanta@nxp.com>
 <20200729073323.pse772mh44bzgdai@pengutronix.de>
 <20200730060426.GD1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730060426.GD1665100@dtor-ws>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:02:52 up 257 days, 23:21, 250 users,  load average: 0.24, 0.19,
 0.09
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

On 20-07-29 23:04, Dmitry Torokhov wrote:
> On Wed, Jul 29, 2020 at 09:33:23AM +0200, Marco Felsch wrote:
> > Hi,
> > 
> > On 20-07-23 10:43, Horia Geantă wrote:
> > > From: André Draszik <git@andred.net>
> > > 
> > > At the moment, enabling this driver without the SNVS RTC driver
> > > being active will hang the kernel as soon as the power button
> > > is pressed.
> > > 
> > > The reason is that in that case the SNVS isn't enabled, and
> > > any attempt to read the SNVS registers will simply hang forever.
> > > 
> > > Ensure the clock is enabled (during the interrupt handler) to
> > > make this driver work.
> > > 
> > > Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")
> > > and commit edb190cb1734
> > > ("rtc: snvs: make sure clock is enabled for interrupt handle")
> > > for similar updates to the snvs rtc driver.
> > > 
> > > Signed-off-by: André Draszik <git@andred.net>
> > > Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
> > > Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
> > > ---
> > >  drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++++-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> > > index 2f5e3ab5ed63..382d2ae82c9b 100644
> > > --- a/drivers/input/keyboard/snvs_pwrkey.c
> > > +++ b/drivers/input/keyboard/snvs_pwrkey.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/of_address.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_wakeirq.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/regmap.h>
> > >  
> > > @@ -38,6 +39,7 @@ struct pwrkey_drv_data {
> > >  	int wakeup;
> > >  	struct timer_list check_timer;
> > >  	struct input_dev *input;
> > > +	struct clk *clk;
> > >  	u8 minor_rev;
> > >  };
> > >  
> > > @@ -47,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
> > >  	struct input_dev *input = pdata->input;
> > >  	u32 state;
> > >  
> > > +	clk_enable(pdata->clk);
> > >  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
> > > +	clk_disable(pdata->clk);
> > > +
> > >  	state = state & SNVS_HPSR_BTN ? 1 : 0;
> > >  
> > >  	/* only report new event if status changed */
> > > @@ -74,11 +79,13 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> > >  
> > >  	pm_wakeup_event(input->dev.parent, 0);
> > >  
> > > +	clk_enable(pdata->clk);
> > > +
> > >  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> > >  	if (lp_status & SNVS_LPSR_SPO) {
> > >  		if (pdata->minor_rev == 0) {
> > >  			/*
> > > -			 * The first generation i.MX6 SoCs only sends an
> > > +			 * The first generation i.MX[6|7] SoCs only send an
> > >  			 * interrupt on button release. To mimic power-key
> > >  			 * usage, we'll prepend a press event.
> > >  			 */
> > > @@ -96,6 +103,8 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> > >  	/* clear SPO status */
> > >  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> > >  
> > > +	clk_disable(pdata->clk);
> > 
> > I'm not so happy about clk_enable/disable() during the interrupt
> > routine since those routines should be handled fast. Since we assume
> > that the clock is always oni
> 
> We do? I thought that the fact that clock might be off is the root of
> the problem.

Currently yes else the driver would never work. I thought so at least
after reading the commit message. But after checking the imx6qdl I
found that the imx6qdl has no clock-gate for the SNVS module. I think
Horia had Problems on a imx7 device since he adapted the comment to
cover the imx7. Which makes more sense since the imx7 has a clock gate
but the commit message is wrong. After checking the device-tree's in
mainline all imx7 and imx8 devices specify the "snvs-pwrkey" clock so
this is a new feature and they need the clock. So IMHO for those devices
a clock should be required and not optional.

> > I would rather call clk_prepare_enable()
> > during probe() and keep the clock on.
> 
> clk_enable() must not sleep and is supposed to be lightweight. This
> interrupt I believe is supposed to be infrequent, so having it here
> should be fine and might save us some power.

Didn't know that clk_enable()/clk_disable() never sleeps and yes it
should be infrequent triggered. I don't think that we can save a
measureable amount of power since this is Low-Power IP clocked by a
low-power clock. However, this was just my point of view.

> > > +
> > >  	return IRQ_HANDLED;
> > >  }
> > >  
> > > @@ -140,6 +149,23 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> > >  	if (pdata->irq < 0)
> > >  		return -EINVAL;
> > >  
> > > +	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
> > > +	if (IS_ERR(pdata->clk))
> > > +		return PTR_ERR(pdata->clk);
> > > +
> > > +	error = clk_prepare(pdata->clk);
> > > +	if (error) {
> > > +		dev_err(&pdev->dev, "failed to prepare the snvs clock\n");
> > > +		return error;
> > > +	}
> > > +	error = devm_add_action_or_reset(&pdev->dev,
> > > +			(void(*)(void *))clk_unprepare,
> > > +			pdata->clk);
> > 
> > I'm not a fan about those casts. However, the intentation should be
> > fixed.
> 
> Yes, can we please create a proper function for this (or maybe we will
> finally get devm clk API?).

devm_clk API +1 :)

Regards,
  Marco
