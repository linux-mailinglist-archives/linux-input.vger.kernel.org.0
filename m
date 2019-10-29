Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF3E8883
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 13:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387828AbfJ2Mne (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 08:43:34 -0400
Received: from vps.xff.cz ([195.181.215.36]:32896 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727675AbfJ2Mne (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 08:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572353011; bh=k3Nz5ZjLe0bnhm7wv+maW9ij16pFEqan6p8GTLgONJE=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=lB3OlaK+8qw1a9OhXelLYEtS7kgLE3SNVXasH07XVZyr5LOr2fUFsp3FKKr1EpZi5
         eBsbPmfSk7r1Ml/o0ED8JU5AZLsfeW1+/haYNRQYuErqWcPvKJzqY4KfLZECEJMmMb
         Cunx4bJni6LzSFIVbwFU+qrSEhiVGx7L+5HYYd4Q=
Date:   Tue, 29 Oct 2019 13:43:31 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] Re: [PATCH] input: sun4i-lradc-keys: Add wakup
 support
Message-ID: <20191029124331.7yh5kccsq2syxm47@core.my.home>
Mail-Followup-To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191028221502.3503543-1-megous@megous.com>
 <20191028233828.GA57214@dtor-ws>
 <20191028235626.5afvszxtppsieywi@core.my.home>
 <20191029001250.GB57214@dtor-ws>
 <20191029014559.gif3ay7anq24un2i@core.my.home>
 <20191029041804.GF57214@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029041804.GF57214@dtor-ws>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 28, 2019 at 09:18:04PM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 29, 2019 at 02:45:59AM +0100, Ondřej Jirman wrote:
> > On Mon, Oct 28, 2019 at 05:12:50PM -0700, Dmitry Torokhov wrote:
> > > On Tue, Oct 29, 2019 at 12:56:26AM +0100, Ondřej Jirman wrote:
> > > > On Mon, Oct 28, 2019 at 04:38:28PM -0700, Dmitry Torokhov wrote:
> > > > > > +
> > > > > > +	error = dev_pm_set_wake_irq(dev, irq);
> > > > > > +	if (error) {
> > > > > > +		dev_err(dev, "Could not set wake IRQ\n");
> > > > > > +		return error;
> > > > > > +	}
> > > > > > +
> > > > > 
> > > > > I wonder if we could teach platform driver core to handle this for us.
> > > > 
> > > > Not sure, some drivers do enable/disable wake_irq by hand in suspend/resume
> > > > callbacks, so it would probably need to be opt-in somehow. I guess calling the
> > > > function like this is one way to make it opt-in.
> > > > 
> > > > The other way may be by passing a flag somewhere, like to
> > > > request_threaded_irq. Did you have something more concrete in mind?
> > > 
> > > I think it is perfectly fine to continue using enable_irq_wake and
> > > disable_irq_wake from the driver while marking irq as being wake irq
> > > form the core.
> > 
> > I see, it looks like irq_set_irq_wake will track the calls via wake_depth
> > 
> > https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L714
> > 
> > But all irqs are not necessarily wake irqs, no? So it still may need to be
> > opt-in somehow.
> 
> I thought we'd do that for IRQ named "wakeirq" or the very first IRQ if
> there is no named IRQ, and when we have the "wakeup-source" property,
> similarly to what we do in I2C bus.

I see. I've looked at drivers using dev_pm_set_wake_irq and
dev_pm_set_dedicated_wake_irq and not many platform drivers would potentially
benefit (~25 out of 2300), of those only some use OF and are platform
drivers, maybe 15-20:

https://elixir.bootlin.com/linux/latest/ident/dev_pm_set_wake_irq
https://elixir.bootlin.com/linux/latest/ident/dev_pm_set_dedicated_wake_irq

I don't think it's worth it.

regards,
	o.

> Thanks.
> 
> -- 
> Dmitry
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
