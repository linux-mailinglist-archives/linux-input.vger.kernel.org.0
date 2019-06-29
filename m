Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00FB5ABBE
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2019 16:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfF2OXJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Jun 2019 10:23:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42393 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfF2OXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Jun 2019 10:23:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so4373087pff.9;
        Sat, 29 Jun 2019 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xEfydo9paW2HOZ6S6JAAyYluhxKfXdLEGV4giLdU65Y=;
        b=LbG688uvp08V1ieUOUUu1suFh/S/fF5YR1oLZ0BaKje0euoA7e3Jn2GwxrQiBOi/3N
         ixCEYlGzvWNCFkuvvzu5TaGwqYG0nk/QE66XfeK2GATcwO8AJMPqGG1XvHzGp9UbIWlo
         4JvldJm16y7eyKBGbyZmexPvQnOv+JhFW7XntbtuyaUEwQ5s/gKpC0DnCvxp051308co
         ucDbppJWlA+3WFa6Vyk/hAkmwQdevXUv5nxVHlGAP28Fj58ivlzXSJ03LqFjdVRoh8lh
         Ma4j+r2JM2ElLtIpCvMeSL6d570oAGQGAIgBC8rFcdwvKfeR0b9H5ePN4+oBEeH72JIe
         KJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xEfydo9paW2HOZ6S6JAAyYluhxKfXdLEGV4giLdU65Y=;
        b=tC4222AdvVelqscNSaB3o4stUL/tcsgMo6xjr12qEAWJ+TnbPqfY3kwKle/GHtH/fU
         u9KWm4c19vNkkE/mktLkpYZMTTMIYCqedsC8Qa76q415WCiXOLP+8Tpj9Ad2p56u0+rY
         YmJ+p+hzpJeiQN//xj0HnbEgVe9QViCZ3lkF9gC5KzhOXWFZj1R5Q+YRFAMyg+fwoi8l
         LtDOzcPa9jbTMuzZtC8nHOrVi9lcq94Lvyv5IgU8EfaJf2wK6EUVaj6h1CLd8uR1mRAU
         SR3ljjqTVKTsaIgyBTV9ye2s3zh+oSZYTv5AyqIPf3lVYL0FpVgz48ynxSJi7nco4/vy
         tbcQ==
X-Gm-Message-State: APjAAAUSYQkSJm9V016IbsPNthaoCEB/5M/9CrNlXq8jTyD9nzt1NrfI
        mQYxyLwzpkOtkDB9KxbI2YkR01ebrhGLGOHVrCRr+yhwkow=
X-Google-Smtp-Source: APXvYqzOM0xYT5XJGtDetSi9vKDR+vWF8wlwetD1OrYidHol6Jc0TtoZTcmRgBmaUIisuCE/lf5eP6K70R9B3cZoIzM=
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr20059967pjb.132.1561818188126;
 Sat, 29 Jun 2019 07:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190620115056.4169-1-luzmaximilian@gmail.com> <20190620115056.4169-3-luzmaximilian@gmail.com>
In-Reply-To: <20190620115056.4169-3-luzmaximilian@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 17:22:57 +0300
Message-ID: <CAHp75VfoVO+QqTnGadfc4eNxTYL2pNkH446aPmOwOVEpqQ1RTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: soc_button_array for newer surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 20, 2019 at 2:51 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Power and volume button support for 5th and 6th genration Microsoft
> Surface devices via soc_button_array.
>
> Note that these devices use the same MSHW0040 device as on the Surface
> Pro 4, however the implementation is different (GPIOs vs. ACPI
> notifications). Thus some checking is required to ensure we only load
> this driver on the correct devices.
>

Either I need an Ack from Dmitry, or it should go via his tree.

> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/input/misc/soc_button_array.c | 134 +++++++++++++++++++++++---
>  1 file changed, 122 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> index 5e59f8e57f8e..157f53a2bd51 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -25,6 +25,17 @@ struct soc_button_info {
>         bool wakeup;
>  };
>
> +/**
> + * struct soc_device_data - driver data for different device types
> + * @button_info: specifications of buttons, if NULL specification is assumed to
> + *               be present in _DSD
> + * @check: device-specific check (NULL means all will be accepted)
> + */
> +struct soc_device_data {
> +       struct soc_button_info *button_info;
> +       int (*check)(struct device *dev);
> +};
> +
>  /*
>   * Some of the buttons like volume up/down are auto repeat, while others
>   * are not. To support both, we register two platform devices, and put
> @@ -310,6 +321,7 @@ static int soc_button_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         const struct acpi_device_id *id;
> +       struct soc_device_data *device_data;
>         struct soc_button_info *button_info;
>         struct soc_button_data *priv;
>         struct platform_device *pd;
> @@ -320,18 +332,20 @@ static int soc_button_probe(struct platform_device *pdev)
>         if (!id)
>                 return -ENODEV;
>
> -       if (!id->driver_data) {
> +       device_data = (struct soc_device_data *)id->driver_data;
> +       if (device_data && device_data->check) {
> +               error = device_data->check(dev);
> +               if (error)
> +                       return error;
> +       }
> +
> +       if (device_data && device_data->button_info) {
> +               button_info = (struct soc_button_info *)
> +                               device_data->button_info;
> +       } else {
>                 button_info = soc_button_get_button_info(dev);
>                 if (IS_ERR(button_info))
>                         return PTR_ERR(button_info);
> -       } else {
> -               button_info = (struct soc_button_info *)id->driver_data;
> -       }
> -
> -       error = gpiod_count(dev, NULL);
> -       if (error < 0) {
> -               dev_dbg(dev, "no GPIO attached, ignoring...\n");
> -               return -ENODEV;
>         }
>
>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -357,12 +371,32 @@ static int soc_button_probe(struct platform_device *pdev)
>         if (!priv->children[0] && !priv->children[1])
>                 return -ENODEV;
>
> -       if (!id->driver_data)
> +       if (!device_data || !device_data->button_info)
>                 devm_kfree(dev, button_info);
>
>         return 0;
>  }
>
> +
> +static int soc_device_check_generic(struct device *dev)
> +{
> +       int gpios;
> +
> +       gpios = gpiod_count(dev, NULL);
> +       if (gpios < 0) {
> +               dev_dbg(dev, "no GPIO attached, ignoring...\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct soc_device_data soc_device_ACPI0011 = {
> +       .button_info = NULL,
> +       .check = soc_device_check_generic,
> +};
> +
> +
>  /*
>   * Definition of buttons on the tablet. The ACPI index of each button
>   * is defined in section 2.8.7.2 of "Windows ACPI Design Guide for SoC
> @@ -377,9 +411,85 @@ static struct soc_button_info soc_button_PNP0C40[] = {
>         { }
>  };
>
> +static struct soc_device_data soc_device_PNP0C40 = {
> +       .button_info = soc_button_PNP0C40,
> +       .check = soc_device_check_generic,
> +};
> +
> +
> +/*
> + * Special device check for Surface Book 2 and Surface Pro (2017).
> + * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
> + * devices use MSHW0040 for power and volume buttons, however the way they
> + * have to be addressed differs. Make sure that we only load this drivers
> + * for the correct devices by checking the OEM Platform Revision provided by
> + * the _DSM method.
> + */
> +#define MSHW0040_DSM_REVISION          0x01
> +#define MSHW0040_DSM_GET_OMPR          0x02    // get OEM Platform Revision
> +static const guid_t MSHW0040_DSM_UUID =
> +       GUID_INIT(0x6fd05c69, 0xcde3, 0x49f4, 0x95, 0xed, 0xab, 0x16, 0x65,
> +                 0x49, 0x80, 0x35);
> +
> +static int soc_device_check_MSHW0040(struct device *dev)
> +{
> +       acpi_handle handle = ACPI_HANDLE(dev);
> +       union acpi_object *result;
> +       u64 oem_platform_rev = 0;
> +       int gpios;
> +
> +       // get OEM platform revision
> +       result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> +                                        MSHW0040_DSM_REVISION,
> +                                        MSHW0040_DSM_GET_OMPR, NULL,
> +                                        ACPI_TYPE_INTEGER);
> +
> +       if (result) {
> +               oem_platform_rev = result->integer.value;
> +               ACPI_FREE(result);
> +       }
> +
> +       if (oem_platform_rev == 0)
> +               return -ENODEV;
> +
> +       dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> +
> +       /*
> +        * We are _really_ expecting GPIOs here. If we do not get any, this
> +        * means the GPIO driver has not been loaded yet (which can happen).
> +        * Try again later.
> +        */
> +       gpios = gpiod_count(dev, NULL);
> +       if (gpios < 0)
> +               return -EAGAIN;
> +
> +       return 0;
> +}
> +
> +/*
> + * Button infos for Microsoft Surface Book 2 and Surface Pro (2017).
> + * Obtained from DSDT/testing.
> + */
> +static struct soc_button_info soc_button_MSHW0040[] = {
> +       { "power", 0, EV_KEY, KEY_POWER, false, true },
> +       { "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
> +       { "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false },
> +       { }
> +};
> +
> +static struct soc_device_data soc_device_MSHW0040 = {
> +       .button_info = soc_button_MSHW0040,
> +       .check = soc_device_check_MSHW0040,
> +};
> +
> +
>  static const struct acpi_device_id soc_button_acpi_match[] = {
> -       { "PNP0C40", (unsigned long)soc_button_PNP0C40 },
> -       { "ACPI0011", 0 },
> +       { "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
> +       { "ACPI0011", (unsigned long)&soc_device_ACPI0011 },
> +
> +       /* Microsoft Surface Devices (5th and 6th generation) */
> +       { "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
> +
>         { }
>  };
>
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko
