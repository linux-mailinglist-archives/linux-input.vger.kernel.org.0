Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8395B42B317
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 05:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbhJMDIl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 23:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhJMDIl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 23:08:41 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE2DC061570
        for <linux-input@vger.kernel.org>; Tue, 12 Oct 2021 20:06:38 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y7so1182920pfg.8
        for <linux-input@vger.kernel.org>; Tue, 12 Oct 2021 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vKPb/9RFGYAl493wgsZoeMyZ2xOIKqIULjieFrl/gcc=;
        b=nc5x6GzCrYR/xET20v6qKTz6F1zYnsthzl9OD8H3izojzzxUiMgECEl9mdv4m2Ldbi
         yAEzW58wlUEoxAo5Xc8E2147W3P9JGf7vyL0czqI9YMIQR2+4uvQ9xUZxptwoFD0Plpe
         d5lgGH/CfK+6z3uOM26Onc4gms8+lCTiEWjQFvMTjtebUq7OoO70LCMmTyNCVPG6Rmkp
         OqUyVkMUsHfHRdD/LxAp8KOTpY4WBZ1511CUqL/exAVTv7vEbVaiXIX6PX75F/7Isqr4
         E7EvktK/pwG25UyDRwppbQRRMYpsQwimPm7g5ztvyNydByMWiNIrHkLxlSc+cj7n0E20
         PJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vKPb/9RFGYAl493wgsZoeMyZ2xOIKqIULjieFrl/gcc=;
        b=ThPqS8X8XRtAVfFUooX7NEuMn54R50Kvj0Ywq1NDE3XPMl9VcB/zLccKIZywTToiAF
         BvznGScQl3RH1q5gKQd5CTXwGE8v15k2F+k2CGXFa7mviZozSs+maObceY1LsyO13J9Y
         3w9R6D1/CrOp/7N5vgg3qZLuhe3++cPlSL8ZFGnf0ZfEE7UsTwG1OB9mqS316ornsdeR
         WgLEMwCZJgkfQhZXcSfaj2mdqyyC8NBSUG7CgzuvOZL3xRbMaPpFDAWr0pV9Cvpjv0Ax
         XC9x3wPbONkY6UVtLUImW4SzYwO4IMZMkkubz8W4Zs/5p37OtkubgxRGYPDVTftFg83v
         kfCA==
X-Gm-Message-State: AOAM533BEkHLk+x7qugEtqi1B608C83HdCR4lfBiasS+pMbuDitsA3s6
        +VnccC+oMGESAJ1GLLpn2X4=
X-Google-Smtp-Source: ABdhPJx3iRsvVxw2/9LvyIkG8IdFjgDvhiHJVVwvvTdQiO0dvz2+5VXh1mrysIbh+AYwAMSABiXB2w==
X-Received: by 2002:a63:e10d:: with SMTP id z13mr25558606pgh.375.1634094398157;
        Tue, 12 Oct 2021 20:06:38 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id t2sm4146247pjf.1.2021.10.12.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 20:06:37 -0700 (PDT)
Date:   Tue, 12 Oct 2021 20:06:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: snvs_pwrkey - Add clk handling
Message-ID: <YWZNOoL2cCeuswwo@google.com>
References: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
 <20211005200005.bau4trn26wu23bpw@pengutronix.de>
 <YWTpg35wyYS1uoFZ@google.com>
 <20211012073959.4wnkarxwtrmuxtuz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012073959.4wnkarxwtrmuxtuz@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Tue, Oct 12, 2021 at 09:39:59AM +0200, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Mon, Oct 11, 2021 at 06:48:51PM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 05, 2021 at 10:00:05PM +0200, Uwe Kleine-König wrote:
> > > On Wed, Sep 22, 2021 at 11:43:00AM +0200, Uwe Kleine-König wrote:
> > > > On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> > > > associated clock. Accessing the registers requires that this clock is
> > > > enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
> > > > having the clock enabled results in a complete hang of the machine.
> > > > (This usually only happens if snvs_pwrkey is built as a module and the
> > > > rtc-snvs driver isn't already bound because at bootup the required clk
> > > > is on and only gets disabled when the clk framework disables unused clks
> > > > late during boot.)
> > > > 
> > > > This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
> > > > snvs clock to pwrkey").
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > This patch fixes a hard machine hang that occurs on an i.MX8MP based
> > > machine in ~10% of the boot ups. In my eyes it's suitable to be applied
> > > before v5.14 even.
> > > 
> > > Any feedback on it?
> > 
> > Sorry for the delay. As you may know I strongly dislike dev_err_probe()
> > as it conflates the 2 issue - error printing and noting the deferral
> > event that should be implemented by the resource providers (and I
> > believe Rob had WIP patches to push this reporting down too providers).
> 
> I didn't know your dislike (and I probably will forget it again soon,
> given that there seems to be disagreement among maintainers :-), and
> from your words I don't understand it. The improved idea is that
> devm_clk_get_optional() already registers the deferral event for the
> clk? My first intuition is that this won't work, so I'd like to see the
> WIP series. (Added Rob to Cc.) Someone has a link?

I think this is here:

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=dev_err-removal

I do not think it adds calls to device_set_deferred_probe_reason() but
that should be trivial to add, given we have device pointer and ID of
the resource, which should be enough to track it.

> 
> Also I don't share that sentiment, given that today
> devm_clk_get_optional() and all the other resource providers don't do
> the necessary stuff for deferral handling, I strongly prefer to use the
> mechanism that is available today (even if it might be possible to
> improve it) instead of open coding it. And if it's only because once the
> improved variant is available it's easier to identify the code locations
> that need adaption if they all use a common function instead of
> identifying something like
> 
> 	clk = devm_clk_get_optional(&pdev->dev, NULL);
> 	if (IS_ERR(clk)) {
> 		error = PTR_ERR(clk);
> 		if (error != -EPROBE_DEFER)
> 			dev_err(pdev->dev, "Failed to get clk: %pe\n", clk)
> 		else
> 			device_set_deferred_probe_reason(dev, oh_I_need_a_struct_va_format_how_do_I_get_this?);

You do not, you happily ignore it and wait for providers to do it for
you instead of forcing the change through all drivers.

> 		return error;
> 	}
> 
> instead of
> 
> 	clk = devm_clk_get_optional(&pdev->dev, NULL);
> 	if (IS_ERR(clk))
> 		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clock\n");
> 	
> Even if the driver does not call device_set_deferred_probe_reason(), the
> additional check for error != -EPROBE_DEFER is ugly, isn't it?

I'd simply do

	clk = devm_clk_get_optional(...);
	error = PTR_ERR_OR_ZERO(clk);
	if (error) {
		dev_err(&pdev->dev, "...", error);
		return error;
	}

> 
> > Could you p lease resubmit with "normal" dev_err()/dev_warn()/etc and I
> > will be happy to apply.
> 
> Is the above the variant you prefer? Maybe without the call to
> device_set_deferred_probe_reason()? Or maybe even without the check for
> -EPROBE_DEFER (which however might result in wrong error messages which
> is IMHO worse than the ugliness of the additional check)?

Why are they wrong? They are not. They would literally say that some
resource was not obtained because it is not ready.

> 
> Please advice. Given that adding clk handling prevents a machine hang,
> I'm willing to add it in the way you prefer, even if I don't agree to
> your reasoning.

The form above would work for me.

Thank you.

-- 
Dmitry
