Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021311705F7
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2020 18:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgBZRX0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Feb 2020 12:23:26 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38742 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgBZRXZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Feb 2020 12:23:25 -0500
Received: by mail-wr1-f68.google.com with SMTP id e8so4098402wrm.5;
        Wed, 26 Feb 2020 09:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aLmTyqAd/P94kRIyBjL+cb/Y+cTLarFng2zpE1bkPwE=;
        b=U9mCjIWtwLbZtWh/eWgnPNP7lrTs1AJEZUNGnIwreIeBB/1Xo1px4bvLuMHzWgu5Ro
         +n+LTCC+FLWa7CX8wWw0XI/j5xBRkQTXzdbQxbZEq1fH+muqeA22bmxa/i6dyrUVFZPr
         I7Jr/37vMSpEdqt4ova00n28gHvUaWWbNl7EFoyqLZU6a3WF7mQEEbRs987Dmln2u2TI
         pIDMy7AjBobcCTrjcFYRf4ILOgrWDDsv6TbnJ08zD4fdNT4AYOWFn5srgkkMnN6rBFP0
         l+TbExYwpP44QMtX7+Lv1m7DrrMv5M+dUef/g9quDkSYYEhR8dNgFLIrkhgxxUHqPESf
         3x9Q==
X-Gm-Message-State: APjAAAV6sF1NilPzM0HWylJep4ro2X+JS1WocAoOhGin0xwa5v59UqnJ
        oaKYaP5Z1f+8Qz5pudDunlk=
X-Google-Smtp-Source: APXvYqyUjShzivLFLN+R84aLDGeH3LJmk13HXBtoRVbokmE0gc0Nd/SoVz2Mm3vNZuChMhpzJT59sA==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr6281250wrp.378.1582737803473;
        Wed, 26 Feb 2020 09:23:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id j12sm4121316wrt.35.2020.02.26.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 09:23:22 -0800 (PST)
Message-ID: <f3c4f7791c86235683541a3d51ed02631b784bf6.camel@andred.net>
Subject: Re: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our
 own events
From:   =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Horia Geanta <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Wed, 26 Feb 2020 17:23:21 +0000
In-Reply-To: <VE1PR04MB66385DDED7C654AE2181E08E89EA0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200225161201.1975-1-git@andred.net>
         <20200225161201.1975-6-git@andred.net>
         <VE1PR04MB66385DDED7C654AE2181E08E89EA0@VE1PR04MB6638.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-02-26 at 01:15 +0000, Robin Gong wrote:
> On 2020/02/26 André Draszik <git@andred.net> wrote: 
> > The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
> > 
> > This driver here should only return IRQ_HANDLED if the status register
> > indicates that the event we're handling in the irq handler was genuinely
> > intended for this driver. Otheriwse the interrupt subsystem will assume the
> > interrupt was handled successfully even though it wasn't at all.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > Cc: "Horia Geantă" <horia.geanta@nxp.com>
> > Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Anson Huang <Anson.Huang@nxp.com>
> > Cc: Robin Gong <yibin.gong@nxp.com>
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-input@vger.kernel.org
> > 
> > ---
> > v2:
> > * no changes
> > ---
> >  drivers/input/keyboard/snvs_pwrkey.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/snvs_pwrkey.c
> > b/drivers/input/keyboard/snvs_pwrkey.c
> > index 382d2ae82c9b..980867886b34 100644
> > --- a/drivers/input/keyboard/snvs_pwrkey.c
> > +++ b/drivers/input/keyboard/snvs_pwrkey.c
> > @@ -82,7 +82,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void
> > *dev_id)
> >  	clk_enable(pdata->clk);
> > 
> >  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> > -	if (lp_status & SNVS_LPSR_SPO) {
> > +	lp_status &= SNVS_LPSR_SPO;
> > +
> > +	if (lp_status) {
> >  		if (pdata->minor_rev == 0) {
> >  			/*
> >  			 * The first generation i.MX[6|7] SoCs only send an @@ -98,14
> > +100,14 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void
> > *dev_id)
> >  			mod_timer(&pdata->check_timer,
> >  			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> >  		}
> > -	}
> > 
> > -	/* clear SPO status */
> > -	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> > +		/* clear SPO status */
> > +		regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> But irq storm will come in once there is other interrupt triggered as unexpected,
> although I never met it before. Could we drop this patch now? Others are ok for me.

I don't have strong feelings about this patch, but this bit merely changes behaviour to
clear SP0 if SP0 was in fact != 0 in the first place, whereas before SP0 was always
cleared, even if it was == 0 anyway. Seems more logical in my eyes.


> Reviewed-by: Robin Gong <yibin.gong@nxp>
> > +	}
> > 
> >  	clk_disable(pdata->clk);
> > 
> > -	return IRQ_HANDLED;
> > +	return lp_status ? IRQ_HANDLED : IRQ_NONE;

If you're talking about this part, the rtc-snvs driver does the same in its interrupt handler.
In other words, this driver here could prevent the rtc-snvs driver from seeing its events.



Cheers,
Andre'

 
> >  }
> > 
> >  static void imx_snvs_pwrkey_act(void *pdata)
> > --
> > 2.23.0.rc1

