Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8A35BD0B3
	for <lists+linux-input@lfdr.de>; Mon, 19 Sep 2022 17:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiISPWL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Sep 2022 11:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiISPVs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Sep 2022 11:21:48 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3061A38683
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:20:48 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id a14so3812162ild.0
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YLOApTarCsOqUAlgmIHrRc/X2zACHEMKuKTBUNKzFw4=;
        b=fAUA2XlM5yhDxFmaaD7YX83jPOwHgHi9hjjWMHaCofYsDkqiSjsHLy4jwa+8hjRjTY
         eKsYK95pUXwJFcy2Z6VLyBfHo1q9zlFdklB+FYaWC/eP+qJRlFt42I/+KYt/EzwWayat
         5aNWkeprK/CqunbtcA+LBEAz26gHmYdfGGNls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YLOApTarCsOqUAlgmIHrRc/X2zACHEMKuKTBUNKzFw4=;
        b=LgPIAQw/ciwYmqVzvAdp8JRX7DXzMelDU6YVKgaNw0dfqkawXq+dGnWA0OUESmzI/F
         /JKMUjtX6E6JgIC6zZ3d2XfxUHv5ZmbBu9WshM4KTcCgg7gqV+T7SpknZtXfK/x+EtLp
         6JHyzw/eB0DaOMhzckCyw9cnYNxA06Ws325dSr45j34mjg8cfkJ9XXR9zRooZYU4Lia2
         XTRdjCKc5Pkf2o3XWmvtnWgswe7dHHteU5Ryz8oUke7vRpLcYlfUcVUtO4RR+uSVcIcI
         ME7l9M8Cb75MrmuL3LumaPPT/M4SMzcPDODuXo7f3LiBbUWC7ZYJa4RNHzUiGR5MxyNy
         2utA==
X-Gm-Message-State: ACrzQf14e3Br/bMQzzk0/K58IaFVgeHzt/9x+P/f+Oxb7/3y0hp0d13C
        IEqGRHGEFB+i5sekxokM59T/apSSX/IZAA==
X-Google-Smtp-Source: AMsMyM7k0P7CAW1MkZzRyTiaMRDHnBWPP0YvKwWfoeliTG8goyB6v+g4pljYRsH+CQBvGahFU1ff3A==
X-Received: by 2002:a05:6e02:2145:b0:2f4:8c94:dcbc with SMTP id d5-20020a056e02214500b002f48c94dcbcmr7777785ilv.161.1663600847959;
        Mon, 19 Sep 2022 08:20:47 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id a1-20020a92c701000000b002e988fe84d1sm12035739ilp.58.2022.09.19.08.20.46
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 08:20:47 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id 138so22140142iou.9
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:20:46 -0700 (PDT)
X-Received: by 2002:a05:6602:2d44:b0:6a1:b558:272d with SMTP id
 d4-20020a0566022d4400b006a1b558272dmr7433211iow.7.1663600846333; Mon, 19 Sep
 2022 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220914235801.1731478-1-rrangel@chromium.org>
 <20220914155914.v3.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4@changeid> <Yyg8RU2k6ZCRuqri@smile.fi.intel.com>
In-Reply-To: <Yyg8RU2k6ZCRuqri@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 19 Sep 2022 09:20:33 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BcM2n+bvv8CTRYpC4xhzJGr9k9=o0bJk-adDnpxsqABg@mail.gmail.com>
Message-ID: <CAHQZ30BcM2n+bvv8CTRYpC4xhzJGr9k9=o0bJk-adDnpxsqABg@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
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
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 19, 2022 at 3:54 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 14, 2022 at 05:57:53PM -0600, Raul E Rangel wrote:
> > The ACPI spec defines the SharedAndWake and ExclusiveAndWake share type
> > keywords. This is an indication that the GPIO IRQ can also be used as a
> > wake source. This change exposes the wake_capable bit so drivers can
> > correctly enable wake functionality instead of making an assumption.
>
> With two nit-picks below
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
> >   unrelated drivers.
> > - Converted wake_capable parameter to bool.
> >
> > Changes in v2:
> > - Fixed call site in mlxbf_gige_probe
> >
> >  drivers/gpio/gpiolib-acpi.c | 17 ++++++++++++++---
> >  drivers/gpio/gpiolib-acpi.h |  2 ++
> >  include/linux/acpi.h        | 22 ++++++++++++++++++----
> >  3 files changed, 34 insertions(+), 7 deletions(-)
> >

> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index 9be1376f9a627f..c703f095993a2c 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -741,6 +741,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
> >               lookup->info.pin_config = agpio->pin_config;
> >               lookup->info.debounce = agpio->debounce_timeout;
> >               lookup->info.gpioint = gpioint;
> > +             lookup->info.wake_capable = agpio->wake_capable ==
> > +                                         ACPI_WAKE_CAPABLE;
>
> Can be still on one line.
>

I used clang-format to format the code. Apparently that still uses the
80 char limit. I've gone ahead and manually changed it.

> >               /*
> >                * Polarity and triggering are only specified for GpioInt
> > @@ -987,10 +989,12 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
> >  }
> >
> >  /**
> > - * acpi_dev_gpio_irq_get_by() - Find GpioInt and translate it to Linux IRQ number
> > + * acpi_dev_gpio_irq_wake_get_by() - Find GpioInt and translate it to Linux IRQ
> > + *                                   number
> >   * @adev: pointer to a ACPI device to get IRQ from
> >   * @name: optional name of GpioInt resource
> >   * @index: index of GpioInt resource (starting from %0)
> > + * @wake_capable: Set to true if the IRQ is wake capable
> >   *
> >   * If the device has one or more GpioInt resources, this function can be
> >   * used to translate from the GPIO offset in the resource to the Linux IRQ
> > @@ -1002,9 +1006,13 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
> >   * The function takes optional @name parameter. If the resource has a property
> >   * name, then only those will be taken into account.
> >   *
> > + * The GPIO is considered wake capable if the GpioInt resource specifies
> > + * SharedAndWake or ExclusiveAndWake.
> > + *
> >   * Return: Linux IRQ number (> %0) on success, negative errno on failure.
> >   */
> > -int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index)
> > +int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
> > +                               int index, bool *wake_capable)
> >  {
> >       int idx, i;
> >       unsigned int irq_flags;
> > @@ -1061,13 +1069,16 @@ int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int ind
> >                               dev_dbg(&adev->dev, "IRQ %d already in use\n", irq);
> >                       }
> >
> > +                     if (wake_capable)
> > +                             *wake_capable = info.wake_capable;
> > +
> >                       return irq;
> >               }
> >
> >       }
> >       return -ENOENT;
> >  }
> > -EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_get_by);
> > +EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
> >
> >  static acpi_status
> >  acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
> > diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
> > index e476558d947136..1ac6816839dbce 100644
> > --- a/drivers/gpio/gpiolib-acpi.h
> > +++ b/drivers/gpio/gpiolib-acpi.h
> > @@ -18,6 +18,7 @@ struct acpi_device;
> >   * @pin_config: pin bias as provided by ACPI
> >   * @polarity: interrupt polarity as provided by ACPI
> >   * @triggering: triggering type as provided by ACPI
> > + * @wake_capable: wake capability as provided by ACPI
> >   * @debounce: debounce timeout as provided by ACPI
> >   * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
> >   */
> > @@ -28,6 +29,7 @@ struct acpi_gpio_info {
> >       int pin_config;
> >       int polarity;
> >       int triggering;
> > +     bool wake_capable;
> >       unsigned int debounce;
> >       unsigned int quirks;
> >  };
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 6f64b2f3dc5479..d3121cef6cc3bc 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -1202,7 +1202,8 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
> >                               struct acpi_resource_gpio **agpio);
> >  bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> >                              struct acpi_resource_gpio **agpio);
> > -int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index);
> > +int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
> > +                               int index, bool *wake_capable);
> >  #else
> >  static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
> >                                             struct acpi_resource_gpio **agpio)
> > @@ -1214,16 +1215,29 @@ static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> >  {
> >       return false;
> >  }
> > -static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
> > -                                        const char *name, int index)
> > +static inline int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev,
> > +                                             const char *name, int index,
> > +                                             bool *wake_capable)
> >  {
> >       return -ENXIO;
> >  }
> >  #endif
> >
> > +static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
> > +                                        const char *name, int index)
> > +{
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, name, index, NULL);
> > +}
> > +
> >  static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
> >  {
> > -     return acpi_dev_gpio_irq_get_by(adev, NULL, index);
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, NULL);
> > +}
>

> > +static inline int acpi_dev_gpio_irq_wake_get(struct acpi_device *adev,
> > +                                          int index, bool *wake_capable)
> > +{
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, wake_capable);
> >  }
>
> I would put this first in the group of these three helpers, so irq_get_by and
> irq_get will be the last (from more parameters to less parameters).
>

Done

> >  /* Device properties */
> > --
> > 2.37.3.968.ga6b4b080e4-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for the review!
