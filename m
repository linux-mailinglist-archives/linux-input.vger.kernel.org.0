Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA691094F5
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 22:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfKYVNb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 16:13:31 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41582 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfKYVNb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 16:13:31 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so7976522pfq.8;
        Mon, 25 Nov 2019 13:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/KuqJB5l3VS5YWmc0ZRh/KWLxhoYbWPz8odAlgDuw5E=;
        b=NKKJVh9N0BEXFJtAG/HZvrC45bHCRpqAZL7I9nZGpsPTNettqxVqNsm3WLBAubJnHm
         GhqcNR2nJhudApwm+ND9QK3ahkZEXJDrbYRxJnTKxQX4e6/SNjAyDzygP+ZKc01nTn6g
         xZdOMw9rZWHvRnNtiUj0KBYdWbottuDPH39VvbfbzvguoneDBBcNv3+ZVCqb6a+7+PXa
         +WVY9X20H6rXncAfrRCnItQ8L4miZrNU3OK1cXcOw6bHdzU8NHEVs5u28oauy0ngxLHe
         /8RyFl0MXjwstc1m6VUXQT58kJe1Bv9qK7vrdutHf3OK+QcU4JHWXxo9/koZGVaV2dLK
         1sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/KuqJB5l3VS5YWmc0ZRh/KWLxhoYbWPz8odAlgDuw5E=;
        b=nt2FCtCxmvUQdqWVHLncQl70dqDe5rZFr8AyxUHchdSvPAV07uRIEFqZVrvW74g5XU
         9Czu3agYZZretEUOVP1dl4isg7PcAhvHcapu87zTxXuO+QoKeoyHThfItGXa2/hsXBWc
         lJE3LjO/gKcxt/13F9LPcRtf/k3oDXTMKt2t33PAchrWBcGjEkfP6Q/LwSpYI5bGC0gK
         dEsqBuj4M4tvcMvcacPJNrHn72VdYibKY/en6tkBCDc1rR1xjcbErFdm26S+HPy8VBgw
         1qx7LDOjTT+x1ufqTvPYri4QU29NJj1KVjnAFG04/ABz7q45QI852Aw+hE/ItuBpOPzk
         SSlg==
X-Gm-Message-State: APjAAAU6rkivoDs52V8r67/RsIDmOPii6Rf0mlbUde8qEnLbMWHGi5f4
        /ukB3EcAvdpAXPN136HLrs0=
X-Google-Smtp-Source: APXvYqxew5KZZ0qrR2YDEIwvTVxAgRRS29CLv9+5Uv8FOh6XgoMumNo2U1uue2OLUxkoZs5+qbdvVg==
X-Received: by 2002:a63:3741:: with SMTP id g1mr15023503pgn.434.1574716409329;
        Mon, 25 Nov 2019 13:13:29 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 186sm9611305pfe.141.2019.11.25.13.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:13:28 -0800 (PST)
Date:   Mon, 25 Nov 2019 13:13:26 -0800
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
Subject: Re: [PATCH v4] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Message-ID: <20191125211326.GK248138@dtor-ws>
References: <20191125161210.8275-1-robin@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125161210.8275-1-robin@protonic.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 25, 2019 at 05:12:10PM +0100, Robin van der Gracht wrote:
> The first generation i.MX6 processors does not send an interrupt when the
> power key is pressed. It sends a power down request interrupt if the key is
> released before a hard shutdown (5 second press). This should allow
> software to bring down the SoC safely.
> 
> For this driver to work as a regular power key with the older SoCs, we need
> to send a keypress AND release when we get the power down request irq.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>

Applied, thank you.

> ---
> 
> Changes v3 -> v4:
>  * The key release irq handler is now emitting the press and release
>    events directly, instead of the debounce timer handler.
> 
>  drivers/input/keyboard/Kconfig       |  2 +-
>  drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++---
>  2 files changed, 26 insertions(+), 4 deletions(-)
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
> index 5342d8d45f81..4888e137cc5d 100644
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
> @@ -67,13 +69,29 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
> +	struct input_dev *input = pdata->input;
>  	u32 lp_status;
>  
> -	pm_wakeup_event(pdata->input->dev.parent, 0);
> +	pm_wakeup_event(input->dev.parent, 0);
>  
>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> -	if (lp_status & SNVS_LPSR_SPO)
> -		mod_timer(&pdata->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> +	if (lp_status & SNVS_LPSR_SPO) {
> +		if (pdata->minor_rev == 0) {
> +			/*
> +			 * The first generation i.MX6 SoCs only sends an
> +			 * interrupt on button release. To mimic power-key
> +			 * usage, we'll prepend a press event.
> +			 */
> +			input_report_key(input, pdata->keycode, 1);
> +			input_sync(input);
> +			input_report_key(input, pdata->keycode, 0);
> +			input_sync(input);
> +			pm_relax(input->dev.parent);
> +		} else {
> +			mod_timer(&pdata->check_timer,
> +			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> +		}
> +	}
>  
>  	/* clear SPO status */
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> @@ -94,6 +112,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	struct input_dev *input = NULL;
>  	struct device_node *np;
>  	int error;
> +	u32 vid;
>  
>  	/* Get SNVS register Page */
>  	np = pdev->dev.of_node;
> @@ -123,6 +142,9 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
> +	pdata->minor_rev = vid & 0xff;
> +
>  	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
>  
>  	/* clear the unexpected interrupt before driver ready */
> -- 
> 2.20.1
> 

-- 
Dmitry
