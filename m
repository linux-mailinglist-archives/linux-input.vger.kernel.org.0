Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14610232BA5
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 08:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3GEb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 02:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3GEa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 02:04:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DD9C061794;
        Wed, 29 Jul 2020 23:04:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id il6so3612599pjb.0;
        Wed, 29 Jul 2020 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ComNkpy0mDYB1CNiEj1XOKVCQA9y437to2e9E5caCaU=;
        b=aKwkplrCz2NPVfcK7clzI4/PBXWv8w6qJoj51ShustB+6cHEFb0N/rOPITlMtLkePA
         7zIVKj6zdTL6qLKsOi/J60izP5mZ0e/2rt1NgsA5dn4J1HrDG4y7+d/aHOcK4K+lkuWw
         2H6dh73jKI0k71IXu4v7SdTE0Xng/+JQsb1dY618OpgcZ+Y/mnAaWNzpoX+A0/6bIW7F
         C8l9ceoYgVO0XlFn9XEZdH78mOWAp7BP50ncWrcfBZIC5FRTNDmw8gFwCAZi2faS3eev
         ahgHSK3KkqFjW3ydrfOPSuNhA/vdfuBMa2X7T4/AjR/flAWG90+VPHZdrcaqV+5m196K
         FYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ComNkpy0mDYB1CNiEj1XOKVCQA9y437to2e9E5caCaU=;
        b=ExoF5K7HYHhNDCytXoPae3V2xDgRWje+/P4nZAB2hdk6ez63Yq0pmimo42m30elRGP
         UoXnQtcqHrZZPrb95bia5SReWAUisKjmRgskOCwEmAxc6+CVqnP0XCfPVK6zbVjzo0ov
         iC6kwQ5cZzysCRJ/spSbr0fzkIHt9Rrt9EihkmnsTEIanTqWPNOTS0/fP+/BWmHu2ipm
         /mcJawxDV0Ijv0MRL/yfrW5mdjcEzj+YkKkjCgljaFxqXyNJC8arhKJs4/IERc5rmaB4
         ockGSy9rP+DoLRXcIO9irL1EDm8Nui2pTyEsiqRhoek6JvGCxqjvgwfPndhEUv1EmYRR
         +7PQ==
X-Gm-Message-State: AOAM531g2kExJyVe/cwZqc1byIF9tR/LrTdezinTkUaY5gvsU/na+Hkc
        XXK4cfQ7d0hU6X34dBXbH7k=
X-Google-Smtp-Source: ABdhPJwjd5kmrY/fNgHXgOLGocoGLlKHMUrCvfqRXqmWi6QlXeg6hdGvLmTIkKPpzMEqlJtMq5t15w==
X-Received: by 2002:a17:90b:3807:: with SMTP id mq7mr12483216pjb.221.1596089069935;
        Wed, 29 Jul 2020 23:04:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 9sm4533833pfy.177.2020.07.29.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:04:29 -0700 (PDT)
Date:   Wed, 29 Jul 2020 23:04:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
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
Message-ID: <20200730060426.GD1665100@dtor-ws>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
 <20200723074314.3304-3-horia.geanta@nxp.com>
 <20200729073323.pse772mh44bzgdai@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200729073323.pse772mh44bzgdai@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 29, 2020 at 09:33:23AM +0200, Marco Felsch wrote:
> Hi,
> 
> On 20-07-23 10:43, Horia Geantă wrote:
> > From: André Draszik <git@andred.net>
> > 
> > At the moment, enabling this driver without the SNVS RTC driver
> > being active will hang the kernel as soon as the power button
> > is pressed.
> > 
> > The reason is that in that case the SNVS isn't enabled, and
> > any attempt to read the SNVS registers will simply hang forever.
> > 
> > Ensure the clock is enabled (during the interrupt handler) to
> > make this driver work.
> > 
> > Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")
> > and commit edb190cb1734
> > ("rtc: snvs: make sure clock is enabled for interrupt handle")
> > for similar updates to the snvs rtc driver.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
> > Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
> > ---
> >  drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> > index 2f5e3ab5ed63..382d2ae82c9b 100644
> > --- a/drivers/input/keyboard/snvs_pwrkey.c
> > +++ b/drivers/input/keyboard/snvs_pwrkey.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of_address.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_wakeirq.h>
> > +#include <linux/clk.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> >  
> > @@ -38,6 +39,7 @@ struct pwrkey_drv_data {
> >  	int wakeup;
> >  	struct timer_list check_timer;
> >  	struct input_dev *input;
> > +	struct clk *clk;
> >  	u8 minor_rev;
> >  };
> >  
> > @@ -47,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
> >  	struct input_dev *input = pdata->input;
> >  	u32 state;
> >  
> > +	clk_enable(pdata->clk);
> >  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
> > +	clk_disable(pdata->clk);
> > +
> >  	state = state & SNVS_HPSR_BTN ? 1 : 0;
> >  
> >  	/* only report new event if status changed */
> > @@ -74,11 +79,13 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> >  
> >  	pm_wakeup_event(input->dev.parent, 0);
> >  
> > +	clk_enable(pdata->clk);
> > +
> >  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> >  	if (lp_status & SNVS_LPSR_SPO) {
> >  		if (pdata->minor_rev == 0) {
> >  			/*
> > -			 * The first generation i.MX6 SoCs only sends an
> > +			 * The first generation i.MX[6|7] SoCs only send an
> >  			 * interrupt on button release. To mimic power-key
> >  			 * usage, we'll prepend a press event.
> >  			 */
> > @@ -96,6 +103,8 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> >  	/* clear SPO status */
> >  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> >  
> > +	clk_disable(pdata->clk);
> 
> I'm not so happy about clk_enable/disable() during the interrupt
> routine since those routines should be handled fast. Since we assume
> that the clock is always oni

We do? I thought that the fact that clock might be off is the root of
the problem.

> I would rather call clk_prepare_enable()
> during probe() and keep the clock on.

clk_enable() must not sleep and is supposed to be lightweight. This
interrupt I believe is supposed to be infrequent, so having it here
should be fine and might save us some power.

> 
> > +
> >  	return IRQ_HANDLED;
> >  }
> >  
> > @@ -140,6 +149,23 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> >  	if (pdata->irq < 0)
> >  		return -EINVAL;
> >  
> > +	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
> > +	if (IS_ERR(pdata->clk))
> > +		return PTR_ERR(pdata->clk);
> > +
> > +	error = clk_prepare(pdata->clk);
> > +	if (error) {
> > +		dev_err(&pdev->dev, "failed to prepare the snvs clock\n");
> > +		return error;
> > +	}
> > +	error = devm_add_action_or_reset(&pdev->dev,
> > +			(void(*)(void *))clk_unprepare,
> > +			pdata->clk);
> 
> I'm not a fan about those casts. However, the intentation should be
> fixed.

Yes, can we please create a proper function for this (or maybe we will
finally get devm clk API?).

Thanks.

-- 
Dmitry
