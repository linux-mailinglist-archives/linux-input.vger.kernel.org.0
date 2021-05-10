Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA93379837
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 22:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhEJUS6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 16:18:58 -0400
Received: from vps.xff.cz ([195.181.215.36]:34848 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhEJUS6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 16:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1620677872; bh=/RHu2XVx/BEg2sOi/KftSIMC+UAohdWkDmidWFO62U8=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=jcAiEAY111Ib0XpA9/l2f5iuK1Mjaa3+xvrrzHCv+LyENokgOSE91KG2y8QqTKcZI
         TwMy5+U787bDAjMpb4RUJyiDUhrhTsLW9aYZiAzF1mWm8FDUO0MyEo4962+IImVM4o
         gI/Q05aD5WG+N7Ze9UjUDAqLCePprN4MzYXeLQQE=
Date:   Mon, 10 May 2021 22:17:51 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210510201751.xs5lq5a3kcvp5fpq@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
 <20210510194848.g7cgty3lirxkht5g@core>
 <YJmS9NqGFGem6gxg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJmS9NqGFGem6gxg@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 11:09:24PM +0300, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 09:48:48PM +0200, Ondřej Jirman wrote:
> > On Mon, May 10, 2021 at 09:31:08PM +0200, Stephan Gerhold wrote:
> 
> > > +	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
> > > +	if (IS_ERR(tsdata->iovcc)) {
> > > +		error = PTR_ERR(tsdata->iovcc);
> > > +		if (error != -EPROBE_DEFER)
> > > +			dev_err(&client->dev,
> > > +				"failed to request iovcc regulator: %d\n", error);
> > 
> > Please use dev_err_probe instead. If this pattern is used for vcc-supply, maybe
> > change that too. Maybe also consider using a bulk regulator API.
> 
> Dmitry seems is having something against it last time I remember it was
> discussed with him.

It basically does the same thing this does, except that you can figure out
the failure later on from sysfs more easily just by looking at:

   /sys/kernel/debug/devices_deferred

And you'll see the error message there to help you figure out the dependency
that failed. What's to hate about this? :)

kind regards,
	o.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
