Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B295C3A8AF6
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 23:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhFOVWY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 17:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOVWX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 17:22:23 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA34C061574;
        Tue, 15 Jun 2021 14:20:17 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id k16so686453ios.10;
        Tue, 15 Jun 2021 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97TJcAjBd1iZqMFhsvySC1UyoWAf8puuK3z+QG0Byvk=;
        b=TxpQGW5rosQ4pTG+SGARWldmvvcDyz4oHwmarDH+PCIhx5jlGKTHL+VhbnAv/LANkz
         ELGmhMSqOUUmnyepQVOhKu4qyGMTeYsaVvukX0KyLPgp8ajz4XOvtkOo1coyb8hAI+QM
         fo8MgpJ+hWm0NcuXRiexySVyHluMvBGxosrIKV4A4TcDbg9K7jn8aeD+qozL34yNk4l3
         rPtLA94UrCKkXARlSs7eA+BnkNg5naXo4pm4D0uXmyAHRIv4FR4DXpYIUm2yCdGeQ9dt
         6O6PB95znaNggudJ89TwSZTFl99dJ4otDyFyzxZ0cjldys1fcLmLSD8sgsTkhcWsyQG1
         ly6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97TJcAjBd1iZqMFhsvySC1UyoWAf8puuK3z+QG0Byvk=;
        b=lvz5mCrQIUwf4wXCgmV+S5Ife1+TCRl0YEDNN1BDb4XgoiUPOSyjpdU+ppxLgYB9Vv
         EWussCU3HFmBq+TPwj91jUzOtkzGMJNuJqQ/kJvu3JGQ5bfxbs+JTsgy/SlM364t+B4J
         PeG7Xm3abbWaPZrSSI6KOKWY+wxIigX9Ty1Hs3KUbJOmc5DPHGa4Jxs0OGIfUxB56SWF
         Afqw82pnr3EysqfYAmeq1i2ZHyYieNNjniiafM7QZKO60vP2cJRFtDcf1vRoNAWO/uWG
         wmMAmj1/f7u2dWte/4+OuXa9Hphi+Q6NLWxtMWt4DYsrqjM1Se57vXtk4eOqxJzrT2Yz
         nkrA==
X-Gm-Message-State: AOAM532lV5G+utG2Jyo3PXtA/5+E385Dr3Re9f427PhvuTZFp0v0ESt7
        0T+8C/oX0oreVlYc36PK3RduCfjp9QQqFiDAMz0=
X-Google-Smtp-Source: ABdhPJwmvU6CUatjHUrciHtdutGCcA865MCqv5dHeA63UWt2s5cANU0CIqkx+02hb+gcbDRWwVCkMghxYCtxnMeM5us=
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr987287jak.91.1623792015795;
 Tue, 15 Jun 2021 14:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210615103014.798-1-alistair@alistair23.me> <20210615103014.798-4-alistair@alistair23.me>
 <YMjbi2sz/y0RFG3z@google.com>
In-Reply-To: <YMjbi2sz/y0RFG3z@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 16 Jun 2021 07:19:49 +1000
Message-ID: <CAKmqyKOH_vrb=BTUC-1pQrGv5WooSU9jWnx2jGaf9OBV4rGLug@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        pinglinux@gmail.com, tatsunosuke.tobita@wacom.com,
        junkpainting@gmail.com, ping.cheng@wacom.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 16, 2021 at 2:55 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Jun 15, 2021 at 08:30:08PM +1000, Alistair Francis wrote:
> > Allow the wacom-i2c device to be exposed via device tree.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index 22826c387da5..6053595f2b30 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/irq.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/of.h>
> >  #include <asm/unaligned.h>
> >
> >  #define WACOM_CMD_QUERY0     0x04
> > @@ -241,10 +242,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
> >
> > +static const struct of_device_id wacom_i2c_of_match_table[] = {
> > +     { .compatible = "wacom,i2c-30" },
>
> What is this compatible?

Sorry, I updated it here but missed the previous patch documentation.

It's wacom, connected via I2C and then version 30.

I'll fixup the documentation.

Alistair

>
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
> > +
> >  static struct i2c_driver wacom_i2c_driver = {
> >       .driver = {
> >               .name   = "wacom_i2c",
> >               .pm     = &wacom_i2c_pm,
> > +             .of_match_table = wacom_i2c_of_match_table,
> >       },
> >
> >       .probe          = wacom_i2c_probe,
> > --
> > 2.31.1
> >
>
> --
> Dmitry
