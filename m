Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D922029C7F
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 18:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390874AbfEXQtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 12:49:24 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46434 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390346AbfEXQtX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 12:49:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id r18so4381572pls.13;
        Fri, 24 May 2019 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Fl+pCsc5xkUmcECPowd4yxBNgbA084+jBwh/Q97ymc=;
        b=AWLrG+8Cq6qh5hLHBHjsxRMhFHEaO1Vp9YvkNQ57ms9VckR63mRPBzusZdN3Rh6pMQ
         rZFW0Qvy0F3oOS+bfj7IH+ZQ69U5tlw6xQHhpkGrAuPM0xY2g2vrF2nDnNsDAqxHbE8r
         RLSs7vdCfSe9oCAwuw3gPNGZgHNRUcTUDC3AzqaW9RHpQj+LgPYHxi4BPF4CNtYeBgX2
         Sm9kngvDGcxgXQMbetAH+uBXLPJWD7K6z5FUO+pV+TPXtf6bAeoNeXDC7ExZMAEBXVMC
         z6xPo/RbBM9UXh07Mmv1u8lGXcHgkxYQ/xcfBuYU2eAi1i1UuKg2KrJ2pzDfPzQu0eIk
         UCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Fl+pCsc5xkUmcECPowd4yxBNgbA084+jBwh/Q97ymc=;
        b=UK1WLlK7Hd2LIw/KDGAJgiUE1H9ZWhsVFYgcLEY3sx3Xkd+pTwMi35EpQVGGX0mW5U
         EVrZDLbY58imcMj+DbNGhDaMPQypEwaTlViTNPJMRFBPg0GG+gyIM0QuGsDVERxQG09+
         EBS3sPpWP9xPEQyA8MdK8pQgMMEyfm8NkmAkOi1qlyUDEJRbcATB01c/43J1b3NGE68U
         ZhXW4gOAVQy5d2gTXrJ0j6zw2doZZZkW8OP56pDaLLApywy+ImKIfKFeDF0hwbWbdN+c
         dymLTVjtx2+CRAxuCC/0cnEwy/mbOqB08Fytw6CaLtKimvo/ErUyJSDKaMPUgvwE+smd
         uSyQ==
X-Gm-Message-State: APjAAAXOCFuZ+v1lSXHxRnUPSWn2NjlrPKOWDohAqG7fse7Gy1XnHjIj
        R6zz6sDt/1GEgwnDZNc7hgbT53BGWyZnSCryF00=
X-Google-Smtp-Source: APXvYqyyPR11DXypiZGhxXSFgKI0dABNyJ+dNM096QAOso0rcvPnxyjwuVjX/1XFED6quda5v3NLLFn/8fwBHmLu2wI=
X-Received: by 2002:a17:902:24b:: with SMTP id 69mr17524490plc.255.1558716563115;
 Fri, 24 May 2019 09:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190523190913.5801-1-danct12@disroot.org>
In-Reply-To: <20190523190913.5801-1-danct12@disroot.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 May 2019 19:49:12 +0300
Message-ID: <CAHp75Vdh=ny16mEnDw0pMfUzyOcrA97AnXKfyW+BcEcZ-W1ryQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the CHUWI
 Hi10 Plus tablet.
To:     Daniel Smith <danct12@disroot.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 23, 2019 at 10:12 PM Daniel Smith <danct12@disroot.org> wrote:
>
> Added touch screen info for CHUWI Hi10 Plus tablet.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Daniel Smith <danct12@disroot.org>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index bd0856d2e825..1dbb53c3f1e7 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -91,6 +91,22 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
>         .properties     = chuwi_hi10_air_props,
>  };
>
> +static const struct property_entry chuwi_hi10_plus_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 0),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1914),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1283),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10plus.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data chuwi_hi10_plus_data = {
> +       .acpi_name      = "MSSL0017:00",
> +       .properties     = chuwi_hi10_plus_props,
> +};
> +
>  static const struct property_entry chuwi_vi8_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
>         PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
> @@ -605,6 +621,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
>                 },
>         },
> +       {
> +               /* Chuwi Hi10 Plus (CWI527) */
> +               .driver_data = (void *)&chuwi_hi10_plus_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 plus tablet"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +               },
> +       },
>         {
>                 /* Chuwi Vi8 (CWI506) */
>                 .driver_data = (void *)&chuwi_vi8_data,
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko
