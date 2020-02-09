Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BE4156CE1
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2020 23:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBIWim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Feb 2020 17:38:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39256 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgBIWil (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Feb 2020 17:38:41 -0500
Received: by mail-pg1-f194.google.com with SMTP id j15so2861699pgm.6;
        Sun, 09 Feb 2020 14:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=viMGruOG1jCZUXMu+S3mzXnhGnr2IgHNYMxCSKKh4Nc=;
        b=LIIgNjiUgKkKaVVXHKRdajm65ZvbHkrCZa4bMUEmHrcgUFP4tHshvkJ840Dc4J/zan
         BMxHWABfZY6hTxS3wHQ65RmMijAgW2gPoIxnVOaNmNBpPnuTSXbOvXa1PEFJsrZ/yaK+
         3naQUyt84xVoah8HXzI5dYgpgv31UKtjWsbnn3bv4Pt2vWwCen6mw4hZ/VTKIJDp2t2e
         otIN3pfJbu/6OA+m5pn2o11Q1yEy6dYZuYMFt51dAQhDY0Ury6zwyoZa9e+3WvquVFhw
         qrzbv5yfhEQJM1Xv63iTbgmpZWcPukkBkwUcUT059m5GcA0/ttpob3ZF9AP9d6gvCpqh
         308A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=viMGruOG1jCZUXMu+S3mzXnhGnr2IgHNYMxCSKKh4Nc=;
        b=ed9YHpH1gt9M4fjkNTOwq91mIGR402P3gzfb8KtdFVcAKglChh5uNbAodwSaWIY758
         HSOb7JiVQA/CdFXI8m/QkuDTGIGMNuWT8kljBjEcUsfpPKLvCqgjWKrLSrsySQvkbTQo
         OwwKBXUPTGzmHqxZCJR6cQgT845JckO1ynG1SJZ5gbuv9xMhZHKGkPRWVfGr/gBT445T
         hDjhlbZn2Su83P7ExiAHR14lX+NJAdpvFDjkW7EaRpwML4YfKntVKYNk1sAhLU1dFiAz
         JT/9/HzYtMCcHGre51GV7jQmSzQoBvgXVR5H1yibPEWaUk74+QGqweAJ02jLW79EoUlP
         mrYg==
X-Gm-Message-State: APjAAAUxJTK850uKfpdbfgGztKOoIovj1r/ulxIeq/+sHEdiAE4IA0VA
        zpjMnMT6pkG8GV0u3XwA4O4=
X-Google-Smtp-Source: APXvYqzKZWT9r2WimNRYcuopBkOAfSQWZMZqv3jI5fZK/5+JusC3Y5A2EGwNrZYbZK2ERqdr0hnUSw==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr10045616pfo.45.1581287919219;
        Sun, 09 Feb 2020 14:38:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 76sm10154918pfx.97.2020.02.09.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 14:38:38 -0800 (PST)
Date:   Sun, 9 Feb 2020 14:38:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Horia Geanta <horia.geanta@nxp.com>
Cc:     =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Message-ID: <20200209223836.GA199269@dtor-ws>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
 <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 07, 2020 at 08:10:22AM +0000, Horia Geanta wrote:
> On 1/30/2020 10:45 PM, André Draszik wrote:
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
> > Cc: Anson Huang <Anson.Huang@nxp.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: "Horia Geantă" <horia.geanta@nxp.com>
> > Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-input@vger.kernel.org
> > ---
> >  drivers/input/keyboard/snvs_pwrkey.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> > index 2f5e3ab5ed63..c29711d8735c 100644
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
> > @@ -72,6 +74,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> >  	struct input_dev *input = pdata->input;
> >  	u32 lp_status;
> >  
> > +	if (pdata->clk)
> > +		clk_enable(pdata->clk);
> > +
> clk framework handles NULL pointers internally, the check is redundant.
> 
> >  	pm_wakeup_event(input->dev.parent, 0);
> >  
> >  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> > @@ -96,6 +101,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
> >  	/* clear SPO status */
> >  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
> >  
> > +	if (pdata->clk)
> > +		clk_disable(pdata->clk);
> > +
> >  	return IRQ_HANDLED;
> >  }
> >  
> > @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
> >  	if (pdata->irq < 0)
> >  		return -EINVAL;
> >  
> > +	pdata->clk = devm_clk_get(&pdev->dev, "snvs-pwrkey");
> > +	if (IS_ERR(pdata->clk)) {
> > +		pdata->clk = NULL;
> Using devm_clk_get_optional() would simplify error handling.

It sounds to me that this clock is not at all optional and the driver
currently "works" only by accident and therefore optional is not
suitable here.

> 
> > +	} else {
> > +		error = clk_prepare_enable(pdata->clk);

So if you enable clock here and do not disable it, why do you need to
enable it again in interrupt?

Thanks.

-- 
Dmitry
