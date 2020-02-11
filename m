Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4AD158BA2
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 10:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgBKJNh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 04:13:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34840 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgBKJNh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 04:13:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so11294568wrt.2;
        Tue, 11 Feb 2020 01:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fnUMu4pdrqNFX9oeIZUUQ6fYDE2B/+8LMm/uQL//PeM=;
        b=J/ivblj7Xt7bKQ79U3H5Y8gAPzVDs/Ebce3JfZfLNKMPQEv/fCIzYTpHiwrlv+z+qp
         B2wMqYg6qJTxOAOAMXXMcnLp12gihul5BV4OEg42FG7xWYA3lQZIeL5NFaDI3AUSjXGc
         t2/cpIVFd1wwtz2XJNEvcMCr3e19EFll5S5RN/mHxbfeQ0vUf64slJh9hdrfpORrGuDN
         r+5jCDYTzKaXr7r1vq0qKpAopOiv4jzFVh8ncfvRid2WMJI4qEK3NgDHFbc6A1kJUL2I
         dqh5mqeIEi6fkEeOVuYo1UYmRRz4gkzrBknmmBJ6mAwuUfamzBOxPVMAw+GHSgaPiuXM
         TVUA==
X-Gm-Message-State: APjAAAVV9kj63EOa1cT08YlXZVE5zFx0YgFLkyXxfOM3mdT/pM1cxcRz
        IRADY6UbKHyQDSkcnOKLyKM=
X-Google-Smtp-Source: APXvYqw3OEyZRXzNlPFGVjPNLa8lT78loWRGL97Y3UrYi5z5pxUOWW2UgrZGBEy10MFKGjqTASbAsg==
X-Received: by 2002:a5d:6b90:: with SMTP id n16mr7783917wrx.410.1581412415300;
        Tue, 11 Feb 2020 01:13:35 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id y185sm3063112wmg.2.2020.02.11.01.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:13:34 -0800 (PST)
Message-ID: <7c3a08e97281a54105225fa4f212f5279d3fac30.camel@andred.net>
Subject: Re: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
From:   =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To:     Robin Gong <yibin.gong@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Horia Geanta <horia.geanta@nxp.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Date:   Tue, 11 Feb 2020 09:13:33 +0000
In-Reply-To: <VE1PR04MB6638761F5F8549C6528FE6B989180@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
         <20200130204516.4760-2-git@andred.net>
         <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
         <20200209223836.GA199269@dtor-ws>
         <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
         <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
         <20200210175554.GB199269@dtor-ws>
         <VE1PR04MB6638761F5F8549C6528FE6B989180@VE1PR04MB6638.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, 2020-02-11 at 01:54 +0000, Robin Gong wrote:
> On 2020/02/11 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote: 
> > On Mon, Feb 10, 2020 at 06:33:30AM +0000, Horia Geanta wrote:
> > > On 2/10/2020 4:03 AM, Robin Gong wrote:
> > > > On 2020/02/10 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > > > On Fri, Feb 07, 2020 at 08:10:22AM +0000, Horia Geanta wrote:
> > > > > > On 1/30/2020 10:45 PM, André Draszik wrote:
> > > > > > > @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct
> > > > > platform_device *pdev)
> > > > > > >  	if (pdata->irq < 0)
> > > > > > >  		return -EINVAL;
> > > > > > > 
> > > > > > > +	pdata->clk = devm_clk_get(&pdev->dev, "snvs-pwrkey");
> > > > > > > +	if (IS_ERR(pdata->clk)) {
> > > > > > > +		pdata->clk = NULL;
> > > > > > Using devm_clk_get_optional() would simplify error handling.
> > > > > 
> > > > > It sounds to me that this clock is not at all optional and the
> > > > > driver currently "works" only by accident and therefore optional is not
> > suitable here.
> > > > Yes, then we need to add all snvs clk in dts for on legacy i.MX
> > > > chips in this patchset to avoid any potential function broken.
> > 
> > How many are there? I am not too terribly opposed of having the driver handle
> > missing clk if there are very many legacy DTSes out there. But then we need to
> > handle it properly (i.e. current iteration does not handle referral properly for
> > example).
> There are four dtsi which have clock support in snvs-rtc  including i.mx7s/i.mx8mq/8mm/8mn. So for this patch set,
> it's better update
> i.mx8mX dtsi except i.mx7s.
> > > In that case the DT binding should be updated too, to make the clock
> > > mandatory.
> > 
> > I think this should be done in either case, as as far I understand the part can not
> > function without the clock and it worked purely by chance on some systems as
> > something else was turning the clock on.
> Yes, for all chips snvs clk management added, snvs clock also has to been add
> in snvs_pwrkey dts, but for others legacy chips like i.mx6X which have no snvs
> clk management, snvs clock is always on, so no need such clk in snvs_pwrkey
> dts either, optional is better.
> > Thanks.

It seems to me though that the clock should really be moved into the (parent) SNVS
node itself, rather than duplicating
the clock in the the power key node and in
the RTC node. Is that possible? (I don't know)...

To summarise, I'll post an updated patchset within the next couple days so to:

* keep the clock optional (for i.MX6 platforms)
* convert to devm_clk_get_optional()
* only enable the clock in interrupt handler and imx_imx_snvs_check_for_events()
  but not during driver loading
* update all four DTSIs: imx8mm.dtsi imx8mn.dtsi imx8mq.dtsi imx7s.dtsi
  Note that I'll only be able to test onn the i.MX7


Cheers,
Andre'


