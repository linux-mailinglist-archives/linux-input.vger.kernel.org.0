Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAA66D2FD
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 19:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfGRRna (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jul 2019 13:43:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46547 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGRRn3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 13:43:29 -0400
Received: by mail-pg1-f196.google.com with SMTP id i8so13200994pgm.13;
        Thu, 18 Jul 2019 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bgJaz1/uwNYSJBUmjmeSrZLCTFJJ09iSPeZA2mJT8xo=;
        b=jSA3GDW7q7/BWdUH0lWs6dDlQT1GteQ8P2Pasx/o5ffW7YRBkZ2Wk6f+fb+LwvZG7g
         HKVVl1J1IF9CmN32taOk926NyyIpVkkkNe3bwd8SrNsfgCuQlNxhQztZp+swBgMOhiEb
         wAQ7tUkbXVsDh8URLwhmfVGxNcmB6wGX44QW2aXR8nPS9A+qzrOcae020HfkDluuTh0F
         vaEXNCL4HXAtleCPnnDi8jxHKOmv8F7mV9Gw+kPhQUanjxgUYkmAp4cSWUZrJe2NG0IP
         Ekq824XHUdWkw8k3u0QvANKGyr7nVjQZbnukuuv57xn5lTRkuC5kPba57IOhBwaO/dUC
         MKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgJaz1/uwNYSJBUmjmeSrZLCTFJJ09iSPeZA2mJT8xo=;
        b=AX20IgoednxKpLA/x5o2CbI0Iy2EOMx4oxvVp+boWZ5DmbI+mzASYHw1iXIrl5H7sE
         EMll/czsTGNl51NJG+/QXMUU776tn47W3gl20o/fuRsyGYrdM/PP3u9y5PqcYbhf6yxz
         OYqgyDCzAEGk+D+iHNFV0mIRCEngwKGpss9WYCSAzcYY/JwfmVjz/7u6nU2MRZAWN6TZ
         K2aQO+ZPAwquq7Y6kPAhV98NvEhFQ4wNX5r3zBBzDdqtsFWePMmDu7Td0692bAit5ozA
         Pux5N2AOnDIU30UMB3qYjloVmd2bMfMgnbdbrGV30fxgjSQK3FUmnYvGZeEOSvw5xepI
         Me1g==
X-Gm-Message-State: APjAAAWRxQWVOA3SL7xFqQ8e4BT6Md9KoSNzKo0MVlL2ZcSaq2VBcaYD
        mcRaTSqwIjbggmUJMZ0MM8VH5bYYZ/rT6gHZ8Eg=
X-Google-Smtp-Source: APXvYqwdE8wuCUFNJABcqrDglCMyaBxnEACRCfn/ezV0ammEfC1xrVkt0LxjW5WPsNQYND8JML6evEGdmxbbQAPJkcg=
X-Received: by 2002:a63:6eca:: with SMTP id j193mr47995397pgc.74.1563471808970;
 Thu, 18 Jul 2019 10:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190702003740.75970-1-luzmaximilian@gmail.com> <20190702003740.75970-2-luzmaximilian@gmail.com>
In-Reply-To: <20190702003740.75970-2-luzmaximilian@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Jul 2019 20:43:18 +0300
Message-ID: <CAHp75Ve2rPnocQ6RhdqOwEVSGdQ3v1cFoAc=KFfq2-2sDqji2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: Fix device check for surfacepro3_button
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

On Tue, Jul 2, 2019 at 3:38 AM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Do not use the surfacepro3_button driver on newer Microsoft Surface
> models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> and possibly future generations) use the same device as the Surface Pro
> 4 to represent their volume and power buttons (MSHW0040), but their
> acutal implementation is significantly different. This patch ensures
> that the surfacepro3_button driver is only used on the Pro 3 and 4
> models, allowing a different driver to bind on other models.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Assuming it will go thru Input subsystem.

> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/x86/surfacepro3_button.c | 38 +++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
> index 47c6d000465a..0e2c7dfafd9f 100644
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
> @@ -142,6 +148,34 @@ static int surface_button_resume(struct device *dev)
>  }
>  #endif
>
> +/*
> + * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
> + * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
> + * device by checking for the _DSM method and OEM Platform Revision.
> + */
> +static int surface_button_check_MSHW0040(struct acpi_device *dev)
> +{
> +       acpi_handle handle = dev->handle;
> +       union acpi_object *result;
> +       u64 oem_platform_rev = 0;
> +
> +       // get OEM platform revision
> +       result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
> +                                        MSHW0040_DSM_REVISION,
> +                                        MSHW0040_DSM_GET_OMPR,
> +                                        NULL, ACPI_TYPE_INTEGER);
> +
> +       if (result) {
> +               oem_platform_rev = result->integer.value;
> +               ACPI_FREE(result);
> +       }
> +
> +       dev_dbg(&dev->dev, "OEM Platform Revision %llu\n", oem_platform_rev);
> +
> +       return oem_platform_rev == 0 ? 0 : -ENODEV;
> +}
> +
> +
>  static int surface_button_add(struct acpi_device *device)
>  {
>         struct surface_button *button;
> @@ -154,6 +188,10 @@ static int surface_button_add(struct acpi_device *device)
>             strlen(SURFACE_BUTTON_OBJ_NAME)))
>                 return -ENODEV;
>
> +       error = surface_button_check_MSHW0040(device);
> +       if (error)
> +               return error;
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
