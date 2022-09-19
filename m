Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997DE5BD12E
	for <lists+linux-input@lfdr.de>; Mon, 19 Sep 2022 17:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiISPjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Sep 2022 11:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiISPjE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Sep 2022 11:39:04 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF5A2A712
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:39:03 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id g6so2574715ild.6
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BX7NuzQ6XgAPzRdnKZ+P3fDJ1+/q78cG6We8i9CBSbc=;
        b=BDV0fOA4UWJzf7YXD7DEM9JCmyp3gP414pyuW6wGq3ERmQkzQyIx8kaUZRrG849JVV
         izx74sgrQJZbdI6D9S3QS0KEtV4ouzSjz3E/ypCO1vxDH6BPvEOugRL54JSS6e5g+zYl
         RDDP1Jd0lWgRkZeTsIN7v28nC1GfBfxBjLGi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BX7NuzQ6XgAPzRdnKZ+P3fDJ1+/q78cG6We8i9CBSbc=;
        b=dxvGvFdmDoLvfa3exeq6J2nEhXNGsFtUqpFEurrKJRQjC3fqI526aJxwi5W0VDwbGV
         tRcbcKrI7VG4YlOmfNWdnbeiIO90/T/DEzBLykIRkQlS4VrV8coHpBuWk1tc674qfl2R
         uc9RCrAt1xy+zwLIeE8wRyhMrMmQylO0mO5GfRP0f5TEEH2UhNt8Vy36Qox3DNvjLRqF
         LADpBiD/u2+zjOOZVVNVjOOPXcBypHimpFZsppTt1117Ad1z1EUpU4QPJQ5gcPrFl3E/
         BV+AXpMOXevFhajE5uh+ZcuKETYAGgWR4cDu5yqCXPN/n6g8+3L6Aa5Xc9b4pDqn4vUY
         p78g==
X-Gm-Message-State: ACrzQf36TJcZy9GbPbv/A7VT7HLtXxg1Sxnn2JRvckugW1Nwbh3vFQev
        gtP76NGDIILQGMAqDHj5C000Lbjd/0zQrQ==
X-Google-Smtp-Source: AMsMyM441PR/ieyfqPMojS2lZ7tm6Fo1PPci1fWL1D3w9YNiU0pDnDlppKiv9v3UJT5PTOhkNBRLtw==
X-Received: by 2002:a05:6e02:1a09:b0:2f1:47f0:d351 with SMTP id s9-20020a056e021a0900b002f147f0d351mr7571949ild.125.1663601942735;
        Mon, 19 Sep 2022 08:39:02 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id m41-20020a056638272900b0035aa9bf9d3dsm2575993jav.12.2022.09.19.08.39.02
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 08:39:02 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id r134so23195559iod.8
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:39:02 -0700 (PDT)
X-Received: by 2002:a05:6638:4110:b0:35a:6d6b:57f7 with SMTP id
 ay16-20020a056638411000b0035a6d6b57f7mr8368005jab.134.1663601942057; Mon, 19
 Sep 2022 08:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220914235801.1731478-1-rrangel@chromium.org>
 <20220914155914.v3.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid> <Yyg8XZHrPZaKcWHa@smile.fi.intel.com>
In-Reply-To: <Yyg8XZHrPZaKcWHa@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 19 Sep 2022 09:38:51 -0600
X-Gmail-Original-Message-ID: <CAHQZ30C3AhB4avt2--Wz5b0NpwCRP80QybE9J6cCqq24Zx5rZA@mail.gmail.com>
Message-ID: <CAHQZ30C3AhB4avt2--Wz5b0NpwCRP80QybE9J6cCqq24Zx5rZA@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] i2c: acpi: Use ACPI wake capability bit to set wake_irq
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tim Van Patten <timvp@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 19, 2022 at 3:54 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 14, 2022 at 05:57:55PM -0600, Raul E Rangel wrote:
> > Device tree already has a mechanism to pass the wake_irq. It does this
> > by looking for the wakeup-source property and setting the
> > I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> > ACPI interrupt wake flag to determine if the interrupt can be used to
> > wake the system. Previously the i2c drivers had to make assumptions and
> > blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> > If there is a device with an Active Low interrupt and the device gets
> > powered off while suspending, the interrupt line will go low since it's
> > no longer powered and wakes the system. For this reason we should
> > respect the board designers wishes and honor the wake bit defined on the
> > interrupt.
>
> Okay, let's go with this variant, but I'm afraid that in time we may come up
> to the proposed (generic structure for ACPI IRQ parameters which can be used
> in a few places).
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Convert wake_capable to bool
> > - Only update wake_capable pointer once
> > - Move wake_capable local into local block
> >
> > Changes in v2:
> > - Look at wake_cabple bit for IRQ/Interrupt resources
> >
> >  drivers/i2c/i2c-core-acpi.c | 33 ++++++++++++++++++++++++---------
> >  drivers/i2c/i2c-core-base.c |  8 +++++++-
> >  drivers/i2c/i2c-core.h      |  4 ++--
> >  3 files changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> > index c762a879c4cc6b..b3d68a9659ff4f 100644
> > --- a/drivers/i2c/i2c-core-acpi.c
> > +++ b/drivers/i2c/i2c-core-acpi.c
> > @@ -137,6 +137,11 @@ static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
> >       {}
> >  };
> >
> > +struct i2c_acpi_irq_context {
> > +     int irq;
> > +     bool wake_capable;
> > +};
> > +
> >  static int i2c_acpi_do_lookup(struct acpi_device *adev,
> >                             struct i2c_acpi_lookup *lookup)
> >  {
> > @@ -170,11 +175,14 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
> >
> >  static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  {
> > -     int *irq = data;
> > +     struct i2c_acpi_irq_context *irq_ctx = data;
> >       struct resource r;
> >
> > -     if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
> > -             *irq = i2c_dev_irq_from_resources(&r, 1);
> > +     if (irq_ctx->irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r)) {
> > +             irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
> > +             irq_ctx->wake_capable =
> > +                     !!(r.flags & IORESOURCE_IRQ_WAKECAPABLE);
> > +     }

>
> Maybe
>
>         if (irq_ctx->irq > 0)
>                 return 1;
>
>         if (!acpi_dev_resource_interrupt(ares, 0, &r))
>                 return 1;
>
>         irq_ctx->irq = i2c_dev_irq_from_resources(&r, 1);
>         irq_ctx->wake_capable = !!(r.flags & IORESOURCE_IRQ_WAKECAPABLE);
>
> ?
>
> >       return 1; /* No need to add resource to the list */
> >  }
>

Done

> Also not sure why the callback is not called i2c_acpi_add_irq_resource().
> But it probably can be done in a separate change.
>

I had the same thought. I went ahead and added it into this change
since I already
refactored the logic like you suggested above.

> > @@ -182,31 +190,38 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
> >  /**
> >   * i2c_acpi_get_irq - get device IRQ number from ACPI
> >   * @client: Pointer to the I2C client device
> > + * @wake_capable: Set to true if the IRQ is wake capable
> >   *
> >   * Find the IRQ number used by a specific client device.
> >   *
> >   * Return: The IRQ number or an error code.
> >   */
> > -int i2c_acpi_get_irq(struct i2c_client *client)
> > +int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
> >  {
> >       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> >       struct list_head resource_list;
> > -     int irq = -ENOENT;
> > +     struct i2c_acpi_irq_context irq_ctx = {
> > +             .irq = -ENOENT,
> > +     };
> >       int ret;
> >
> >       INIT_LIST_HEAD(&resource_list);
> >
> >       ret = acpi_dev_get_resources(adev, &resource_list,
> > -                                  i2c_acpi_add_resource, &irq);
> > +                                  i2c_acpi_add_resource, &irq_ctx);
> >       if (ret < 0)
> >               return ret;
> >
> >       acpi_dev_free_resource_list(&resource_list);
> >
> > -     if (irq == -ENOENT)
> > -             irq = acpi_dev_gpio_irq_get(adev, 0);
> > +     if (irq_ctx.irq == -ENOENT)
> > +             irq_ctx.irq = acpi_dev_gpio_irq_wake_get(adev, 0,
> > +                                                      &irq_ctx.wake_capable);
> > +
> > +     if (wake_capable)
> > +             *wake_capable = irq_ctx.wake_capable;
> >
> > -     return irq;
> > +     return irq_ctx.irq;
> >  }
> >
> >  static int i2c_acpi_get_info(struct acpi_device *adev,
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 91007558bcb260..c4debd46c6340f 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -487,8 +487,14 @@ static int i2c_device_probe(struct device *dev)
> >                       if (irq == -EINVAL || irq == -ENODATA)
> >                               irq = of_irq_get(dev->of_node, 0);
> >               } else if (ACPI_COMPANION(dev)) {
> > -                     irq = i2c_acpi_get_irq(client);
> > +                     bool wake_capable;
> > +
> > +                     irq = i2c_acpi_get_irq(client, &wake_capable);
>
> > +
>
> Unneeded blank line.
>
Done

> > +                     if (irq > 0 && wake_capable)
> > +                             client->flags |= I2C_CLIENT_WAKE;
> >               }
>
> > +
>
> Ditto. (This even looks like a stray change)
>
Done
> >               if (irq == -EPROBE_DEFER) {
> >                       status = irq;
> >                       goto put_sync_adapter;
> > diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> > index 87e2c914f1c57b..1247e6e6e97517 100644
> > --- a/drivers/i2c/i2c-core.h
> > +++ b/drivers/i2c/i2c-core.h
> > @@ -61,11 +61,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
> >  #ifdef CONFIG_ACPI
> >  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> >
> > -int i2c_acpi_get_irq(struct i2c_client *client);
> > +int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable);
> >  #else /* CONFIG_ACPI */
> >  static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
> >
> > -static inline int i2c_acpi_get_irq(struct i2c_client *client)
> > +static inline int i2c_acpi_get_irq(struct i2c_client *client, bool *wake_capable)
> >  {
> >       return 0;
> >  }
> > --
> > 2.37.3.968.ga6b4b080e4-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I'll send out a V4 series in a few minutes with all the latest changes.
Thanks!
