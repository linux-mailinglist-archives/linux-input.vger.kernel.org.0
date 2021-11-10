Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DB644C608
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 18:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhKJRj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 12:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhKJRj6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 12:39:58 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B628AC061766;
        Wed, 10 Nov 2021 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KlxesLbWPDNXnoH7U/Oi4/4ZNt/bBTzHwkDgmf86Hwg=; b=k5h77rlfxFgN394lib723UsbiC
        gZdAW788aWrEruU9eYofr8azJIOH7uxyusGDBb82Sn+8fDjquCMkwsKwSEXXcVz3lpNaeXGQwzeTe
        93DeqK1pdqmdL6u3ZslsioXuEC66aqiavxLejWlufrfrjgtZ6YsjiEh2kLuLsZklJ05s=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mkrWy-0000B7-GL; Wed, 10 Nov 2021 18:37:04 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1mkrWp-00043U-7S; Wed, 10 Nov 2021 18:36:55 +0100
Date:   Wed, 10 Nov 2021 18:36:54 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alistair Francis <alistair23@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
Message-ID: <20211110183654.61328998@kemnade.info>
In-Reply-To: <CAKmqyKNx00ecsAyOjtLk8i6r75WD0uw=nd=fd9z44yBuau+Vdw@mail.gmail.com>
References: <20211103114830.62711-1-alistair@alistair23.me>
        <20211103114830.62711-3-alistair@alistair23.me>
        <20211105152154.20f5cbd1@aktux>
        <CAKmqyKNx00ecsAyOjtLk8i6r75WD0uw=nd=fd9z44yBuau+Vdw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 10 Nov 2021 22:59:50 +1000
Alistair Francis <alistair23@gmail.com> wrote:

[...]
> >  
> > > +            reset-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>;  
> >
> > hmm, if the reset gpio at the chip is active low (I guess it is) that
> > would indicate an inverter between SoC and gpio. So a nonstandard setup
> > as an example, probably not a good idea.  
> 
> It seems to be common for the cypress,tt2100, as the original
> documentation and the rM2 both do this. Does the Kobo not do this?
> 

You have a kind of double inversion here, so things are automagically fixed.
IMHO to describe it correctly would be to set GPIO_ACTIVE_LOW here
and in the driver

	/* Reset the gpio to be in a reset state */
	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
	if (IS_ERR(ts->reset_gpio)) {
		rc = PTR_ERR(ts->reset_gpio);
		dev_err(dev, "Failed to request reset gpio, error %d\n", rc);
		return rc;
	}
	gpiod_set_value(ts->reset_gpio, 0);

That is the way how other active-low reset lines are handled.

Regards,
Andreas
