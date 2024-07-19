Return-Path: <linux-input+bounces-5089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D059374FA
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 10:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638401F21A41
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 08:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDBB5F873;
	Fri, 19 Jul 2024 08:24:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B76208BA
	for <linux-input@vger.kernel.org>; Fri, 19 Jul 2024 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377446; cv=none; b=hNiJ/zcXUMK8I3svVtZzG0FyGp1Yb2VpN6WCk5Yh46+JXYOYDuAOhMERVMUvfLTZONEecV+LzWSRfeZhO5aZsKK18r83rHNtCb6TBZA21KNhk8rtSN+QL+UUtjX/6usRB2nzBMm97rrFAOU9lzTUCXn+jbREvJY5vyF6a9jUeFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377446; c=relaxed/simple;
	bh=jWVoXi6wL+gbH1Hl8mMljgmVUxEENhQVY0C4fLNW/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFJVU7IWTsInGh6vJAtBIb9WGj2bMQWVdLUXOxRfuQWzsrAFUFne73ruj2VTKTqkioZbl5bkZEw5HRKGjvm4fXCgB7SfM8n+OoGqxI3Oc4jbnvGDqNW5iFJXo4ozMsad/QozO2INCucFpGRiZk/tP+fVIFvEUY4mqtU2gSlSCPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUiu8-0004Sy-Fd; Fri, 19 Jul 2024 10:23:52 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUiu7-000dp5-MA; Fri, 19 Jul 2024 10:23:51 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUiu7-005sRT-1q;
	Fri, 19 Jul 2024 10:23:51 +0200
Date: Fri, 19 Jul 2024 10:23:51 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Nitin Garg <nitin.garg@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] input: imx_sc_key: Enable wakeup according to dts
 property wakeup-source
Message-ID: <20240719082351.i3c5qj5cjuklkzy7@pengutronix.de>
References: <20240716213313.1584557-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716213313.1584557-1-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Hi Frank,

On 24-07-16, Frank Li wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> Enable default wakeup according to dts property 'wakeup-source'.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/input/keyboard/imx_sc_key.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index d18839f1f4f60..83025407065ba 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
>  
>  static int imx_sc_key_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct imx_key_drv_data *priv;
>  	struct input_dev *input;
> +	int wakeup;
	^
	bool

>  	int error;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -130,6 +132,8 @@ static int imx_sc_key_probe(struct platform_device *pdev)
>  
>  	INIT_DELAYED_WORK(&priv->check_work, imx_sc_check_for_events);
>  
> +	wakeup = of_property_read_bool(np, "wakeup-source");

Can you move this right infront of the device_init_wakeup() call?

>  	input = devm_input_allocate_device(&pdev->dev);
>  	if (!input) {
>  		dev_err(&pdev->dev, "failed to allocate the input device\n");
> @@ -151,6 +155,8 @@ static int imx_sc_key_probe(struct platform_device *pdev)
>  	priv->input = input;
>  	platform_set_drvdata(pdev, priv);
>  
> +	device_init_wakeup(&pdev->dev, !!wakeup);
					^
The !! shouldn't be necessary with type of 'bool'.

Regards,
  Marco

> +
>  	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
>  					 true);
>  	if (error) {
> -- 
> 2.34.1
> 
> 
> 

