Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F9C7565E
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 19:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfGYR6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 13:58:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46207 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfGYR6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 13:58:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so23668067plz.13;
        Thu, 25 Jul 2019 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpXeI3bjGZJFrAoMRGWEMRsLJE/ZUctqhpPZgA4Uju4=;
        b=ok+ytzS/Q9CbY/1VOtr6oEyeKil7vtncL3AnGuH9fdCXnD2A3GhbiqokFNplhJe3G/
         URl/lfz/oqLFXBH1zlNAzZl+er5dJT4I0aDzQ334dCuaHSP6RYp5i51mgT8dOvggKnH4
         58xT2Kt0AH2DICErB3525JLaUXiMmDdKIZhij64A0D6ESK/QbKu2cfMf/hGLml3RMAKX
         72hrZ1d/ATtOmyfTyg0iaEIwOyoLXfNsWa57EYWC0VjAQ7/37np0/o+omNVxxi5cpY9W
         r7HEh47aN1eWyA4lIoY+by12qXRtCcuhqdC+uLDYxKFrbIohVL7qaoYMspwy7zRKK4tM
         bFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpXeI3bjGZJFrAoMRGWEMRsLJE/ZUctqhpPZgA4Uju4=;
        b=fKQpVDrYJUuTCrb1s6auTI8p/lQez5/Qrjuzv3/yVDvSgzDS6AqyN1DkIwf3siSxPY
         bTK3TT0ijI5zqh2LvbrVmho6UQ7kGUDeIckkFuZuxulZ+wRO3zBvX4pR0WB8bbKEedLX
         rK10FkZWmDug2Z2Zd8Kv1MwXnHAiYlD78ISi3TXIbEu/to568SAV+2Xc+hEOngkatgmT
         J+IgVVvFDeEqItclDJWysVXu1oSAEanO+PrbSQoaVhd5dvwPyCIbCVubKQo/02THOppm
         GcQziTs/SrcFAqYumgVG+U179J2AqivWJvw37ev03EYAd4SHXhWq0Nb6grCgvnZA6AMP
         RP2w==
X-Gm-Message-State: APjAAAU/huuFApT5jqHYOj366NOeVIJS8XehMAnwy38r2VGl65C/HS/c
        SKvvPPwyisvjAz38KgLWdNvPingl81cododNtkY=
X-Google-Smtp-Source: APXvYqz4A+vOh0bYalI3BQl0fT/OksBSxz+ankbzQWNMIQ4XulhQSKCsGcPC5zSqhii/b2k5b1DFsutGteopFql21Po=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr91300116plt.255.1564077485133;
 Thu, 25 Jul 2019 10:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190720150511.95076-1-luzmaximilian@gmail.com> <20190720150511.95076-2-luzmaximilian@gmail.com>
In-Reply-To: <20190720150511.95076-2-luzmaximilian@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Jul 2019 20:57:53 +0300
Message-ID: <CAHp75Ve+3c-TFeN3Dh-DB75Rjft8mY2DA8vNkrFyp7JK-ZOjDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/x86: surfacepro3_button: Fix device check
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

On Sat, Jul 20, 2019 at 6:05 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Do not use the surfacepro3_button driver on newer Microsoft Surface
> models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> and possibly future generations) use the same device as the Surface Pro
> 4 to represent their volume and power buttons (MSHW0040), but their
> actual implementation is significantly different. This patch ensures
> that the surfacepro3_button driver is only used on the Pro 3 and 4
> models, allowing a different driver to bind on other models.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

assuming it will go thru Input subsystem.

> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/x86/surfacepro3_button.c | 47 +++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
> index 47c6d000465a..ec515223f654 100644
> --- a/drivers/platform/x86/surfacepro3_button.c
> +++ b/drivers/platform/x86/surfacepro3_button.c
> @@ -20,6 +20,12 @@
>  #define SURFACE_BUTTON_OBJ_NAME                "VGBI"
>  #define SURFACE_BUTTON_DEVICE_NAME     "Surface Pro 3/4 Buttons"
>
> +#define MSHW0040_DSM_REVISION          0x01
> +#define MSHW0040_DSM_GET_OMPR          0x02    // get OEM Platform Revision
> +static const guid_t MSHW0040_DSM_UUID =
> +       GUID_INIT(0x6fd05c69, 0xcde3, 0x49f4, 0x95, 0xed, 0xab, 0x16, 0x65,
> +                 0x49, 0x80, 0x35);
> +
>  #define SURFACE_BUTTON_NOTIFY_TABLET_MODE      0xc8
>
>  #define SURFACE_BUTTON_NOTIFY_PRESS_POWER      0xc6
> @@ -142,6 +148,44 @@ static int surface_button_resume(struct device *dev)
>  }
>  #endif
>
> +/*
> + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
> + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
> + * device by checking for the _DSM method and OEM Platform Revision.
> + *
> + * Returns true if the driver should bind to this device, i.e. the device is
> + * either MSWH0028 (Pro 3) or MSHW0040 on a Pro 4 or Book 1.
> + */
> +static bool surface_button_check_MSHW0040(struct acpi_device *dev)
> +{
> +       acpi_handle handle = dev->handle;
> +       union acpi_object *result;
> +       u64 oem_platform_rev = 0;       // valid revisions are nonzero
> +
> +       // get OEM platform revision
> +       result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> +                                        MSHW0040_DSM_REVISION,
> +                                        MSHW0040_DSM_GET_OMPR,
> +                                        NULL, ACPI_TYPE_INTEGER);
> +
> +       /*
> +        * If evaluating the _DSM fails, the method is not present. This means
> +        * that we have either MSHW0028 or MSHW0040 on Pro 4 or Book 1, so we
> +        * should use this driver. We use revision 0 indicating it is
> +        * unavailable.
> +        */
> +
> +       if (result) {
> +               oem_platform_rev = result->integer.value;
> +               ACPI_FREE(result);
> +       }
> +
> +       dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> +
> +       return oem_platform_rev == 0;
> +}
> +
> +
>  static int surface_button_add(struct acpi_device *device)
>  {
>         struct surface_button *button;
> @@ -154,6 +198,9 @@ static int surface_button_add(struct acpi_device *device)
>             strlen(SURFACE_BUTTON_OBJ_NAME)))
>                 return -ENODEV;
>
> +       if (!surface_button_check_MSHW0040(device))
> +               return -ENODEV;
> +
>         button = kzalloc(sizeof(struct surface_button), GFP_KERNEL);
>         if (!button)
>                 return -ENOMEM;
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko
