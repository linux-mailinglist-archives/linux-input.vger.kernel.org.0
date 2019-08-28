Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51739FE35
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfH1JQB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:16:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37507 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1JQB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:16:01 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i2u3T-0004Lz-Hh; Wed, 28 Aug 2019 11:15:51 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1i2u3S-000616-ES; Wed, 28 Aug 2019 11:15:50 +0200
Date:   Wed, 28 Aug 2019 11:15:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Robin Gong <yibin.gong@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Message-ID: <20190828091550.pdc57wanu6twew5p@pengutronix.de>
References: <20190827123216.32728-1-robin@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827123216.32728-1-robin@protonic.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:06:38 up 102 days, 14:24, 64 users,  load average: 0.12, 0.14,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Robin,

thanks for the patch.

On 19-08-27 14:32, Robin van der Gracht wrote:
> The first generation i.MX6 processors does not send an interrupt when the
> power key is pressed. It sends a power down request interrupt if the key is
> released before a hard shutdown (5 second press). This should allow
> software to bring down the SoC safely.
> 
> For this driver to work as a regular power key with the older SoCs, we need
> to send a keypress AND release when we get the power down request irq.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
>  .../devicetree/bindings/crypto/fsl-sec4.txt   | 16 ++++--
>  drivers/input/keyboard/Kconfig                |  2 +-
>  drivers/input/keyboard/snvs_pwrkey.c          | 52 ++++++++++++++++---

Can we split this so the dt-bindings are a standalone patch? IMHO this
is the usual way because the maintainer can squash them on there needs.
Also it would be cool to document the changes. A common place for
changes is after the '---' or on the cover-letter.

>  3 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
> index 2fe245ca816a..e4fbb9797082 100644
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
> +++ b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
> @@ -420,14 +420,22 @@ EXAMPLE
>  =====================================================================
>  System ON/OFF key driver
>  
> -  The snvs-pwrkey is designed to enable POWER key function which controlled
> -  by SNVS ONOFF, the driver can report the status of POWER key and wakeup
> -  system if pressed after system suspend.
> +  The snvs-pwrkey is designed to enable POWER key function which is controlled
> +  by SNVS ONOFF. It can wakeup the system if pressed after system suspend.
> +
> +  There are two generations of SVNS pwrkey hardware. The first generation is
> +  included in i.MX6 Solo, DualLite and Quad processors. The second generation
> +  is included in i.MX6 SoloX and newer SoCs.
> +
> +  Second generation SNVS can detect and report the status of POWER key, but the
> +  first generation can only detect a key release and so emits an instantaneous
> +  press and release event when the key is released.
>  
>    - compatible:
>        Usage: required
>        Value type: <string>
> -      Definition: Mush include "fsl,sec-v4.0-pwrkey".
> +      Definition: Must include "fsl,sec-v4.0-pwrkey" for i.MX6 SoloX and newer
> +	   or "fsl,imx6qdl-snvs-pwrkey" for older SoCs.
>  
>    - interrupts:
>        Usage: required
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 7c4f19dab34f..937e58da5ce1 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -436,7 +436,7 @@ config KEYBOARD_SNVS_PWRKEY
>  	depends on OF
>  	help
>  	  This is the snvs powerkey driver for the Freescale i.MX application
> -	  processors that are newer than i.MX6 SX.
> +	  processors.
>  
>  	  To compile this driver as a module, choose M here; the
>  	  module will be called snvs_pwrkey.
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index 5342d8d45f81..d71c44733103 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -29,6 +29,11 @@
>  #define DEBOUNCE_TIME 30
>  #define REPEAT_INTERVAL 60
>  
> +enum imx_snvs_hwtype {
> +	IMX6SX_SNVS,	/* i.MX6 SoloX and newer */
> +	IMX6QDL_SNVS,	/* i.MX6 Solo, DualLite and Quad */
> +};
> +
>  struct pwrkey_drv_data {
>  	struct regmap *snvs;
>  	int irq;
> @@ -37,14 +42,41 @@ struct pwrkey_drv_data {
>  	int wakeup;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
> +	enum imx_snvs_hwtype hwtype;
>  };
>  
> +static const struct of_device_id imx_snvs_pwrkey_ids[] = {
> +	{
> +		.compatible = "fsl,sec-v4.0-pwrkey",
> +		.data = (const void *)IMX6SX_SNVS,
> +	},
> +	{
> +		.compatible = "fsl,imx6qdl-snvs-pwrkey",
> +		.data = (const void *)IMX6QDL_SNVS,
> +	},
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);

Can we keep this on the original place if you are using ...

> +
>  static void imx_imx_snvs_check_for_events(struct timer_list *t)
>  {
>  	struct pwrkey_drv_data *pdata = from_timer(pdata, t, check_timer);
>  	struct input_dev *input = pdata->input;
>  	u32 state;
>  
> +	if (pdata->hwtype == IMX6QDL_SNVS) {
> +		/*
> +		 * The first generation i.MX6 SoCs only sends an interrupt on
> +		 * button release. To mimic power-key usage, we'll prepend a
> +		 * press event.
> +		 */
> +		input_report_key(input, pdata->keycode, 1);

Missing input_sync() here?

> +		input_report_key(input, pdata->keycode, 0);
> +		input_sync(input);
> +		pm_relax(input->dev.parent);
> +		return;
> +	}
> +
>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>  
> @@ -67,13 +99,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
> +	unsigned long expire = jiffies;
>  	u32 lp_status;
>  
>  	pm_wakeup_event(pdata->input->dev.parent, 0);
>  
>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> -	if (lp_status & SNVS_LPSR_SPO)
> -		mod_timer(&pdata->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> +	if (lp_status & SNVS_LPSR_SPO) {
> +		if (pdata->hwtype == IMX6SX_SNVS)
> +			expire += msecs_to_jiffies(DEBOUNCE_TIME);
> +		mod_timer(&pdata->check_timer, expire);

Is this desired because the timer gets triggered earlier.

> +	}
>  
>  	/* clear SPO status */
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> @@ -93,6 +129,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	struct pwrkey_drv_data *pdata = NULL;
>  	struct input_dev *input = NULL;
>  	struct device_node *np;
> +	const struct of_device_id *match;
>  	int error;
>  
>  	/* Get SNVS register Page */
> @@ -100,6 +137,10 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	if (!np)
>  		return -ENODEV;
>  
> +	match = of_match_node(imx_snvs_pwrkey_ids, np);
> +	if (!match)
> +		return -ENODEV;

... of_device_get_match_data() here. While reading the rm it seems that
the snvs block has a dedicated version register. IMHO this could be a
better way to apply the change also to existing devices with old
firmware.

Regards,
  Marco


> +
>  	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
>  		return -ENOMEM;
> @@ -115,6 +156,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
>  	}
>  
> +	pdata->hwtype = (enum imx_snvs_hwtype)match->data;
>  	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
>  
>  	pdata->irq = platform_get_irq(pdev, 0);
> @@ -175,12 +217,6 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id imx_snvs_pwrkey_ids[] = {
> -	{ .compatible = "fsl,sec-v4.0-pwrkey" },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
> -
>  static struct platform_driver imx_snvs_pwrkey_driver = {
>  	.driver = {
>  		.name = "snvs_pwrkey",
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
