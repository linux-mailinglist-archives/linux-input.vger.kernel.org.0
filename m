Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD9F231A5C
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 09:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgG2Hdh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 03:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgG2Hdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 03:33:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D37C061794
        for <linux-input@vger.kernel.org>; Wed, 29 Jul 2020 00:33:37 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k0gae-0004yu-Q8; Wed, 29 Jul 2020 09:33:28 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k0gaZ-0004VP-OU; Wed, 29 Jul 2020 09:33:23 +0200
Date:   Wed, 29 Jul 2020 09:33:23 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <20200729073323.pse772mh44bzgdai@pengutronix.de>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
 <20200723074314.3304-3-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200723074314.3304-3-horia.geanta@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:19:17 up 256 days, 22:37, 248 users,  load average: 0.06, 0.09,
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

Hi,

On 20-07-23 10:43, Horia Geantă wrote:
> From: André Draszik <git@andred.net>
> 
> At the moment, enabling this driver without the SNVS RTC driver
> being active will hang the kernel as soon as the power button
> is pressed.
> 
> The reason is that in that case the SNVS isn't enabled, and
> any attempt to read the SNVS registers will simply hang forever.
> 
> Ensure the clock is enabled (during the interrupt handler) to
> make this driver work.
> 
> Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")
> and commit edb190cb1734
> ("rtc: snvs: make sure clock is enabled for interrupt handle")
> for similar updates to the snvs rtc driver.
> 
> Signed-off-by: André Draszik <git@andred.net>
> Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
> Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
> ---
>  drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index 2f5e3ab5ed63..382d2ae82c9b 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_wakeirq.h>
> +#include <linux/clk.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  
> @@ -38,6 +39,7 @@ struct pwrkey_drv_data {
>  	int wakeup;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
> +	struct clk *clk;
>  	u8 minor_rev;
>  };
>  
> @@ -47,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
>  	struct input_dev *input = pdata->input;
>  	u32 state;
>  
> +	clk_enable(pdata->clk);
>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
> +	clk_disable(pdata->clk);
> +
>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>  
>  	/* only report new event if status changed */
> @@ -74,11 +79,13 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
>  
>  	pm_wakeup_event(input->dev.parent, 0);
>  
> +	clk_enable(pdata->clk);
> +
>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
>  	if (lp_status & SNVS_LPSR_SPO) {
>  		if (pdata->minor_rev == 0) {
>  			/*
> -			 * The first generation i.MX6 SoCs only sends an
> +			 * The first generation i.MX[6|7] SoCs only send an
>  			 * interrupt on button release. To mimic power-key
>  			 * usage, we'll prepend a press event.
>  			 */
> @@ -96,6 +103,8 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
>  	/* clear SPO status */
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
>  
> +	clk_disable(pdata->clk);

I'm not so happy about clk_enable/disable() during the interrupt
routine since those routines should be handled fast. Since we assume
that the clock is always on I would rather call clk_prepare_enable()
during probe() and keep the clock on.

> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -140,6 +149,23 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	if (pdata->irq < 0)
>  		return -EINVAL;
>  
> +	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
> +	if (IS_ERR(pdata->clk))
> +		return PTR_ERR(pdata->clk);
> +
> +	error = clk_prepare(pdata->clk);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to prepare the snvs clock\n");
> +		return error;
> +	}
> +	error = devm_add_action_or_reset(&pdev->dev,
> +			(void(*)(void *))clk_unprepare,
> +			pdata->clk);

I'm not a fan about those casts. However, the intentation should be
fixed.

Regards,
  Marco

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to add reset action on 'snvs-pwrkey'");
> +		return error;
> +	}
> +
>  	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
>  	pdata->minor_rev = vid & 0xff;
