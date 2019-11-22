Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3C0107AD4
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 23:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKVWso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 17:48:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35881 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVWso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 17:48:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id d7so3723186pls.3;
        Fri, 22 Nov 2019 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0huokCXbHocAZIGMX/c3HM5bh9PEhnRGgnHytZrJQDA=;
        b=DDEHS3WE529zL/qw3QVeilPLFKDV2WyWuo0yxpBJtoCi9HW+jhbMijVTilgXKZVaTG
         nFGfBpPqCB4+jZy1nxI/MmErrqzZ+FiYK0ughrTVz3V7Utafj3qNu9pMyAWt10bl438B
         woAUEHUDDDNWAcWvOp/fiF6Z7GitEIz37P2qo4FaNbfysgtxr7lTJ1ONxCepjAIzPTN1
         FJcbUGAAdZVw6If864xwh3yyS0glRasOMqM0xSsbqjFRvtLkn1ycVioByNiEJUvynOrG
         Ni+lCWhiL0i+U5oWGrfYdEoAFV4H32LabXWi51aQUUb4PSQGVeNhAG7/P9Y8kwOFZ2Et
         2AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0huokCXbHocAZIGMX/c3HM5bh9PEhnRGgnHytZrJQDA=;
        b=JUOsBy0Qy2VGBP0GooOss0EehvKHlbaUjsYfGq6IKVK7DU3HrpY+aCRN60XgKEMtSn
         iB1svoNKinYwEpPGXcEryVGnmvUpPqt62c39KXJgrhKMxnkKQU4QCRlvSEWoEAgvmeBS
         0BJB9zkowBB/UoA3gTzo5SdaC+py5IboKf0HCqRrHgyid2KJj8zqt4hPTpW4YqZozum4
         BxGDJ/Keuce3bGyxTb1d8Q2MRzNsVBu8bhVYamttL8klGpTcVlZPb0S2L4AXzXl0+J/Y
         gR0UpnM7E79fAZPKZBfVIIBfN8m2fYa6Gh6Msak48Qq4Ho+AonybZJ1ebHz6aI/zr+I9
         0F5w==
X-Gm-Message-State: APjAAAWfu6T+L/FWbN70YdT0IDSgMmR6X/aeBDhBCUC090Rxsrh6oya1
        Ui92ShLOBZuL5TvRSkmODZg=
X-Google-Smtp-Source: APXvYqxj7VYmSOwpqPEcZ5ENTsGe+GG3HUaLo9ukNI6OqLpNjv/o+YEIei3ZdLi9Xgpf1haq4VcYeQ==
X-Received: by 2002:a17:902:a709:: with SMTP id w9mr16819525plq.235.1574462923136;
        Fri, 22 Nov 2019 14:48:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y26sm8834040pfo.76.2019.11.22.14.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:48:42 -0800 (PST)
Date:   Fri, 22 Nov 2019 14:48:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     robin <robin@protonic.nl>, Marco Felsch <m.felsch@pengutronix.de>,
        "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Message-ID: <20191122224840.GE248138@dtor-ws>
References: <20190904062329.97520-1-robin@protonic.nl>
 <20190912201300.GA636@penguin>
 <803592d161b9ca75d6ac1c2c54e891a1@protonic.nl>
 <VE1PR04MB663896B94C68B5EF9AE0BE36898C0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <20190916233701.GH237523@dtor-ws>
 <20191120092749.7rru5fj7eybs4tl6@pengutronix.de>
 <fb98fa1fde9a367d7ab33d04a5804684@protonic.nl>
 <VE1PR04MB6638D79F8C929100F6D96479894E0@VE1PR04MB6638.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6638D79F8C929100F6D96479894E0@VE1PR04MB6638.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 21, 2019 at 01:17:56PM +0000, Robin Gong wrote:
> 
> On 2019-11-21 0:33, robin <robin@protonic.nl> wrote:
> > On 2019-11-20 10:27, Marco Felsch wrote:
> > > Hi Robin,
> > >
> > > On 19-09-16 16:37, Dmitry Torokhov wrote:
> > >> On Mon, Sep 16, 2019 at 07:45:37AM +0000, Robin Gong wrote:
> > >> > On 2019/9/13 15:31 robin <robin@protonic.nl> wrote:>
> > >> > > Hi Dmitry,
> > >> > >
> > >> > > On 2019-09-12 22:13, Dmitry Torokhov wrote:
> > >> > > > Hi Robin,
> > >> > > >
> > >> > > > On Wed, Sep 04, 2019 at 06:23:29AM +0000, Robin van der Gracht
> > wrote:
> > >> > > >> The first generation i.MX6 processors does not send an
> > >> > > >> interrupt when the power key is pressed. It sends a power down
> > >> > > >> request interrupt if the key is released before a hard
> > >> > > >> shutdown (5 second press). This should allow software to bring down
> > the SoC safely.
> > >> > > >>
> > >> > > >> For this driver to work as a regular power key with the older
> > >> > > >> SoCs, we need to send a keypress AND release when we get the
> > >> > > >> power down request irq.
> > >> > > >>
> > >> > > >> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > >> > > >> ---
> > >> > > >> @@ -67,13 +83,17 @@ static irqreturn_t
> > >> > > >> imx_snvs_pwrkey_interrupt(int irq, void *dev_id)  {
> > >> > > >>  	struct platform_device *pdev = dev_id;
> > >> > > >>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
> > >> > > >> +	unsigned long expire = jiffies;
> > >> > > >>  	u32 lp_status;
> > >> > > >>
> > >> > > >>  	pm_wakeup_event(pdata->input->dev.parent, 0);
> > >> > > >>
> > >> > > >>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> > >> > > >> -	if (lp_status & SNVS_LPSR_SPO)
> > >> > > >> -		mod_timer(&pdata->check_timer, jiffies +
> > >> > > >> msecs_to_jiffies(DEBOUNCE_TIME));
> > >> > > >> +	if (lp_status & SNVS_LPSR_SPO) {
> > >> > > >> +		if (pdata->minor_rev > 0)
> > >> > > >> +			expire = jiffies + msecs_to_jiffies(DEBOUNCE_TIME);
> > >> > > >> +		mod_timer(&pdata->check_timer, expire);
> > >> > > >
> > >> > > > Why do we even need to fire the timer in case of the first
> > >> > > > generation hardware? Just send press and release events directly from
> > the ISR.
> > >> > That timer looks like a software debounce to prevent unexpected and
> > >> > meaningless interrupt/event caused by quick press/release.
> > >>
> > >> Right, but in case of the first generation hardware we schedule the
> > >> timer immediately (expire == 0) and do not check state of the
> > >> hardware in the timer handler, but rather simply emit down/up events,
> > >> so we do not really get any benefit from the timer (again, I am
> > >> talking about first generation hardware only).
> > >
> > > Did you prepared a v4? Just ask to avoid a duplicated work :)
> > 
> > No I haven't. Not sure what the public wants. Use timer, don't use timer..
> > 
> > v3 has had long term testing though ;)
> Sorry for that I miss the mail.
> Understood a little bit confusion about immediate timer for
> the first press, just stand on the view of clean code shape.
> But I'm okay if you prefer to remove timer in the first interrupt
> generation.

Yes, please prepare v4 without the timer for the first generation of the
hardware.

Thanks.

-- 
Dmitry
