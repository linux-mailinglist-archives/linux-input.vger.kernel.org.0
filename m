Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8D2E7E29
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 02:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJ2BqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 21:46:01 -0400
Received: from vps.xff.cz ([195.181.215.36]:52226 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727379AbfJ2BqB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 21:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572313559; bh=bhzP3bhLk0Yol8s//otk/IDBmGkxLhl6fpdcUqfP75w=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=JpS+61pbJDVyKblhRaIm8JKjWkdojeV3KkxIdJT7+eXBFH95J36s8aeAEdwN/SCmT
         mbtRRj0QAxxeQABDjCt+q665021+BQa2joEzZStqmCaz6bSZi7FpMfanHh5s2LbpoA
         qHs9wXu4OYQVXaCynhiU9hEUyQ7giGGeUGr+Ho/I=
Date:   Tue, 29 Oct 2019 02:45:59 +0100
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
Message-ID: <20191029014559.gif3ay7anq24un2i@core.my.home>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029001250.GB57214@dtor-ws>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 28, 2019 at 05:12:50PM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 29, 2019 at 12:56:26AM +0100, Ondřej Jirman wrote:
> > On Mon, Oct 28, 2019 at 04:38:28PM -0700, Dmitry Torokhov wrote:
> > > > +
> > > > +	error = dev_pm_set_wake_irq(dev, irq);
> > > > +	if (error) {
> > > > +		dev_err(dev, "Could not set wake IRQ\n");
> > > > +		return error;
> > > > +	}
> > > > +
> > > 
> > > I wonder if we could teach platform driver core to handle this for us.
> > 
> > Not sure, some drivers do enable/disable wake_irq by hand in suspend/resume
> > callbacks, so it would probably need to be opt-in somehow. I guess calling the
> > function like this is one way to make it opt-in.
> > 
> > The other way may be by passing a flag somewhere, like to
> > request_threaded_irq. Did you have something more concrete in mind?
> 
> I think it is perfectly fine to continue using enable_irq_wake and
> disable_irq_wake from the driver while marking irq as being wake irq
> form the core.

I see, it looks like irq_set_irq_wake will track the calls via wake_depth

https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L714

But all irqs are not necessarily wake irqs, no? So it still may need to be
opt-in somehow.

Anyway, I'm no PM expert. I started looking at PM code about two weeks ago, and
I really don't feel like I can contribute much to these kinds of decisions with
my current level of understanding, right now.

regards,
	o.

> Thanks.
> 
> -- 
> Dmitry
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191029001250.GB57214%40dtor-ws.
