Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E505B1737
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 04:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfIMCke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 22:40:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33878 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIMCke (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 22:40:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id d3so12630501plr.1;
        Thu, 12 Sep 2019 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o10bTPI1fGjtaNVr4lSeeHoUxfwk3uBoK8DuweeUXb8=;
        b=AucsQVseCLmfa6f68FGaHKvutY86bgCEDYee7FhydkZRh7iDmqpC8uCPiTjaNDPGpD
         KL0g4B+x3ZHdqBkhsi1sotu3iWGE5AAdb/LwWvk5jipRKIujP/ONZIJz2F+kHz6IGcTH
         be5ak9geKw1tkLfXO0eewdHpwmKv6gRAgpD1o4O2pvDNdSkJtWOlsQ7SRRtvp1nOFcfM
         Ehg4cPUtobvM4Lkq/QYbtGKzRWS/I6PxuXBuWnB9cJCDjCJvcsR5Ow7eB0E8+H9I2mK0
         lZX6lkHpb3wlRSkKqgMMATOEkJP4mCN3OFkukQ6Q+yXkHLtlummxBNaXSsFUd45ZRuyI
         AI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o10bTPI1fGjtaNVr4lSeeHoUxfwk3uBoK8DuweeUXb8=;
        b=a0m91J0pM5M/KXnMdwX6LYioJGGNPpEPy0HlAtB2cc4Xw/XLDscHvZrE9HZU6WsszO
         Kfr5blA63eOoYk6L8NFjYnfOjt9M4pbQlUyGo0vjz0X/gpf/BOPy6qjRbwOMqtHJmF2X
         JJH/2ycdIGH2Q7yJl7rmg0hsg3tZv1LzW7iyhWZEpR0dt0E1+wpy3tn5x0UpovI2JVkJ
         PfSZIk6hoe/Ylkrt2Ilp3wf7RNJ84fIurMhsL4nwH4bCl5CJUhReCK7/7HANvYe01g7H
         abCJMTRF+3VIB3skrHYomWxRX9F0/hZ0rwWYaoh8POMEbk0j4C9qVwgu7dFWvy6Tk3yg
         5N/Q==
X-Gm-Message-State: APjAAAXbCPSr9Nn5rdCaXshSsZ3jmQw+UYt7ezQCvQHZztQR/zOkTj2n
        8D3lB8g32d1p5NCRMQezlkc=
X-Google-Smtp-Source: APXvYqwN2ZoOUxJYfpw2vYhfd2BDQQ5qh0TfD2HVwYWe9asnPcx8vFEbsYxRUP6NyYikhLivIf12fQ==
X-Received: by 2002:a17:902:aa06:: with SMTP id be6mr41582114plb.94.1568342432557;
        Thu, 12 Sep 2019 19:40:32 -0700 (PDT)
Received: from localhost (c-73-158-250-148.hsd1.ca.comcast.net. [73.158.250.148])
        by smtp.gmail.com with ESMTPSA id l23sm4812673pgj.53.2019.09.12.19.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 19:40:31 -0700 (PDT)
Date:   Thu, 12 Sep 2019 21:13:00 +0100
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        RobinGong <yibin.gong@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Message-ID: <20190912201300.GA636@penguin>
References: <20190904062329.97520-1-robin@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904062329.97520-1-robin@protonic.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Robin,

On Wed, Sep 04, 2019 at 06:23:29AM +0000, Robin van der Gracht wrote:
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
> 
> Changes v2 -> v3:
>  - Drop alt compatible string for identifying first revision snvs hardware,
>    read minor revision from register instead.
>  - Drop imx6qdl.dtsi modification and device-tree binding documentation.
>  - Add an additional input_sync() to create 2 seperate input reports for press
>    and release.
> 
>  drivers/input/keyboard/Kconfig       |  2 +-
>  drivers/input/keyboard/snvs_pwrkey.c | 28 ++++++++++++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
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
> index 5342d8d45f81..828580eee0d2 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -19,6 +19,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  
> +#define SNVS_HPVIDR1_REG 0xF8
>  #define SNVS_LPSR_REG	0x4C	/* LP Status Register */
>  #define SNVS_LPCR_REG	0x38	/* LP Control Register */
>  #define SNVS_HPSR_REG	0x14
> @@ -37,6 +38,7 @@ struct pwrkey_drv_data {
>  	int wakeup;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
> +	u8 minor_rev;
>  };
>  
>  static void imx_imx_snvs_check_for_events(struct timer_list *t)
> @@ -45,6 +47,20 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
>  	struct input_dev *input = pdata->input;
>  	u32 state;
>  
> +	if (pdata->minor_rev == 0) {
> +		/*
> +		 * The first generation i.MX6 SoCs only sends an interrupt on
> +		 * button release. To mimic power-key usage, we'll prepend a
> +		 * press event.
> +		 */
> +		input_report_key(input, pdata->keycode, 1);
> +		input_sync(input);
> +		input_report_key(input, pdata->keycode, 0);
> +		input_sync(input);
> +		pm_relax(input->dev.parent);
> +		return;
> +	}
> +
>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>  
> @@ -67,13 +83,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
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
> +		if (pdata->minor_rev > 0)
> +			expire = jiffies + msecs_to_jiffies(DEBOUNCE_TIME);
> +		mod_timer(&pdata->check_timer, expire);

Why do we even need to fire the timer in case of the first generation
hardware? Just send press and release events directly from the ISR.

Thanks.

-- 
Dmitry
