Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCE81BBC4E
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 13:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgD1LVW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 07:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgD1LVV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 07:21:21 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6903AC03C1A9
        for <linux-input@vger.kernel.org>; Tue, 28 Apr 2020 04:21:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so21058679ljn.7
        for <linux-input@vger.kernel.org>; Tue, 28 Apr 2020 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6ZRdU9e07tZzgOsdunA0cTBT132cvqWJFBVXQnNwcx0=;
        b=ROWJnqcugDZ49qIxqrbxM3UbUFoSpHdJHm/ruVZjLt7i8G+4Mav4W7/rKP6ejP0jz2
         LougZe3x8A7wwkQTN858N1aVgIcCI6pEjl8+eESAr2HADFDtir3521pRbMhYZqhdbstF
         rwOiN/C1wuWF9pLxcSBwt5I6heHxR7x4xc8WknsOjcpdaAyYBC2j1G8WP8uspRXvS1Zq
         UgN9McTHYHzVBjmesKB29YqAUMjGfxYc7ASKqQXzC0m9Dru70+rgup8z+qUb4C25Uqy1
         +oYwp2GZAOrqwvyjtFHM/qBkEFvehAxIoYfI1PtIxU4FdZ3vMiMPKJF8GsKWa6/nR72S
         mLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6ZRdU9e07tZzgOsdunA0cTBT132cvqWJFBVXQnNwcx0=;
        b=BEQ/5MOrz2DJPH7wuJoaZYahjXc5Puc5GdHaGl9KnwKINp4+b4lByhPKNI/lqgc6h6
         ooyUQezxwGUmX640rrZhKxUulRblaE+/dpuIniLsHPe/5E8NaPyWg9wR+/9S/BuiSxQw
         xeSoMlq2hlCzdXihvkQUSQg7E2I2Dr/xZEbWx8MJsgWtBirmMNmFD3vUPGo3TrlqpvSL
         hOMqF5uqBQyLEaRm0BBPSuM3jlOV3JzrlegKu5p0QWTdH7S/nNIAxc/eqRpncK/K3eNJ
         WlZJXNj+IcvEzZm8ikY78E2jgMPV5mqxRtWabOcC208nlRyB803mWGj4M0w/b+L1EKWV
         J7wQ==
X-Gm-Message-State: AGi0PuZ0cUQpkl8kF8o7ysHzYu8ZeanG5GF3wN5f2IqA6p8dDBRB7afk
        /SmBag78tGpMgC8XE+QqyDzlXf38I+Awi++8n3eM3TJ7FhE=
X-Google-Smtp-Source: APiQypIHsWMWSj55L9kS9KUvDOLz/cYmJob/Li/kAXWO8Hvs1WFuPZMrmXFUm6dOHfMJkCJXNODrc7bUX580lUUuges=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr16768810ljo.168.1588072879839;
 Tue, 28 Apr 2020 04:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <1581410472-3225-2-git-send-email-haibo.chen@nxp.com> <20200310042643.GB192640@dtor-ws>
 <VI1PR04MB504032C19CA8D76AE845AE6A90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
 <20200419181000.GL166864@dtor-ws>
In-Reply-To: <20200419181000.GL166864@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 13:21:08 +0200
Message-ID: <CACRpkdaCe5WnYqiCDK-CdAn2fbdRLM4Yh=Mnu=b7mR+3Krq17g@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     BOUGH CHEN <haibo.chen@nxp.com>, Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 8:10 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Tue, Mar 10, 2020 at 07:15:35AM +0000, BOUGH CHEN wrote:
> >
> > > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Sent: 2020=E5=B9=B43=E6=9C=8810=E6=97=A5 12:27
> > > To: BOUGH CHEN <haibo.chen@nxp.com>
> > > Cc: linux-input@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > > Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before r=
equest
> > > the line as GPIO
> > >
> > > On Tue, Feb 11, 2020 at 04:41:12PM +0800, haibo.chen@nxp.com wrote:
> > > > From: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > + egalax_free_irq(ts);
> > >
> > > It sounds to me you want simply disable interrupts in suspend. Does n=
ot
> > > calling disable_irq() here suffice?
> >
>
> > Here why I want to disable interrupts here is because in the newest
> > gpio system, if the gpio is request as an irq, it can't be request as
> > a gpio anymore.  In the function egalax_wake_up_device(), we need to
> > request the irq pin as a gpio for a while, generate a signal to wake
> > up the device. So before request the pad as gpio, need first free irq
> > resource.
>
> This seems like a fairly common pattern and I wonder if our GPIO
> overlords can help us here.
>
> Linus, Mika, Andy, would it be possible to have an API that would allow
> driver to temporarily "take over" GPIO that is used for interrupts and
> drive it as output without resorting to freeing and re-acquiring irq?
> I.e. something like gpiod_irq_drive_output_start() and
> gpiod_irq_drive_output_end()?

Hans Verkuil had exactly this problem in the CEC GPIO driver,
drivers/media/platform/cec-gpio/cec-gpio.c

If you call disable_irq() on an irqchip implemented in a GPIO
driver using the generic GPIOLIB_IRQCHIP helper library (which
I really recommend) then the line can be switched to output,
used like such, then switched to input and enable_irq() be
called again.

See these commits:
commit 4e9439ddacea06f35acce4d374bf6bd0acf99bc8
"gpiolib: add flag to indicate if the irq is disabled"
commit 461c1a7d4733d1dfd5c47b040cf32a5e7eefbc6c
"gpiolib: override irq_enable/disable"

If your corresponding GPIO driver does not use GPIOLIB_IRQCHIP
then you have a bigger problem and we need to look into that.

Yours,
Linus Walleij
