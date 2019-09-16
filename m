Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D02B44A0
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 01:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfIPXhH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 19:37:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33383 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfIPXhH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 19:37:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so923183pfl.0;
        Mon, 16 Sep 2019 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=URI/yswFiE1ZSmwaedQfzMb8JEkdgI6WBChh6fIJ4KY=;
        b=KzSJYltu0IkNVl6391cXV9865+14apc48Gk8wU+926ikZOW8xQr4xnIv/C4FKddD0T
         D4CvZ0VBmYb2HjjAi1O2glqu0SZeO0tVYJTnVUyB6S9o5eNyxE4BmjtK2XuYDFu0wCWi
         7vIDLjhKxkBnCSEBZpIabXsVIcYEnfiUbKfaOJwRdmpsaMlYFDKzlzdo7UTVwXGEXkwi
         6GlcQNdB0zPhCfxeGCBnIYZgo8BH3smOINeYvNVdPut753Ds7yMkn2Y8oDcEzeOVRdWk
         OQmy7JQ4eGLQTYvPry6tPYZ7VG/JmST0GSx9Sa5VsHsVJ/BvymsSTxPYW59Qvhhmlx5L
         41vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=URI/yswFiE1ZSmwaedQfzMb8JEkdgI6WBChh6fIJ4KY=;
        b=WDbOfn+mn1Vo/mXGsZnK8lMi3IAQsQeH7BeZZFwUZ4YCZVFvc+GjSfbKlQT7Jo8BY7
         XOfyagoxKC317uwAFjzV/rderyysSnQYSKIoJKBi5rXT4fUTYbr5xnmq6fkkqflYjKcY
         SEdIONL8AdtswkM0WpblBory3f54y0QpcxW1lp6mCL2HHHsyDKsAwEDEaweaMpBmYLU/
         HsxUajtdtcjB9Zfvo2Spbqw6nEVuy3dbxoXa5OiVoGCL/9Pc6sckkXit/PxNiJn1zyjL
         fyJjwU7lQnmoJSG6EkiyHwu6356QJnkxSSz8QvBkER90x0n1YyEVpsltUhI6IqeIwgaL
         2KnQ==
X-Gm-Message-State: APjAAAVc10U3vYoA2IK2gJFhNrMPqG4GhWfxLJ0WSgZlXcAphQzlyOh6
        k5MxIS7GNKUFGISt4dbp0+8=
X-Google-Smtp-Source: APXvYqy5fuCh1asq2msnIG6advWVrJd9emc2wATGBbqJFZGUFr5OeSxdpGSFqchnkVWLRSg/dNV+xQ==
X-Received: by 2002:a17:90a:ba90:: with SMTP id t16mr1913997pjr.104.1568677024675;
        Mon, 16 Sep 2019 16:37:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i19sm275722pjx.1.2019.09.16.16.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 16:37:03 -0700 (PDT)
Date:   Mon, 16 Sep 2019 16:37:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     robin <robin@protonic.nl>,
        "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Message-ID: <20190916233701.GH237523@dtor-ws>
References: <20190904062329.97520-1-robin@protonic.nl>
 <20190912201300.GA636@penguin>
 <803592d161b9ca75d6ac1c2c54e891a1@protonic.nl>
 <VE1PR04MB663896B94C68B5EF9AE0BE36898C0@VE1PR04MB6638.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB663896B94C68B5EF9AE0BE36898C0@VE1PR04MB6638.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 16, 2019 at 07:45:37AM +0000, Robin Gong wrote:
> On 2019/9/13 15:31 robin <robin@protonic.nl> wrote:> 
> > Hi Dmitry,
> > 
> > On 2019-09-12 22:13, Dmitry Torokhov wrote:
> > > Hi Robin,
> > >
> > > On Wed, Sep 04, 2019 at 06:23:29AM +0000, Robin van der Gracht wrote:
> > >> The first generation i.MX6 processors does not send an interrupt when
> > >> the power key is pressed. It sends a power down request interrupt if
> > >> the key is released before a hard shutdown (5 second press). This
> > >> should allow software to bring down the SoC safely.
> > >>
> > >> For this driver to work as a regular power key with the older SoCs,
> > >> we need to send a keypress AND release when we get the power down
> > >> request irq.
> > >>
> > >> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > >> ---
> > >> @@ -67,13 +83,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int
> > >> irq, void *dev_id)  {
> > >>  	struct platform_device *pdev = dev_id;
> > >>  	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
> > >> +	unsigned long expire = jiffies;
> > >>  	u32 lp_status;
> > >>
> > >>  	pm_wakeup_event(pdata->input->dev.parent, 0);
> > >>
> > >>  	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
> > >> -	if (lp_status & SNVS_LPSR_SPO)
> > >> -		mod_timer(&pdata->check_timer, jiffies +
> > >> msecs_to_jiffies(DEBOUNCE_TIME));
> > >> +	if (lp_status & SNVS_LPSR_SPO) {
> > >> +		if (pdata->minor_rev > 0)
> > >> +			expire = jiffies + msecs_to_jiffies(DEBOUNCE_TIME);
> > >> +		mod_timer(&pdata->check_timer, expire);
> > >
> > > Why do we even need to fire the timer in case of the first generation
> > > hardware? Just send press and release events directly from the ISR.
> That timer looks like a software debounce to prevent unexpected and
> meaningless interrupt/event caused by quick press/release.   

Right, but in case of the first generation hardware we schedule the
timer immediately (expire == 0) and do not check state of the hardware
in the timer handler, but rather simply emit down/up events, so we do
not really get any benefit from the timer (again, I am talking about
first generation hardware only).

Thanks.

-- 
Dmitry
