Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 567A37BF94C
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 13:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjJJLKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 07:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjJJLKC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 07:10:02 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC31EA9
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 04:10:00 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-495d687b138so1826617e0c.3
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 04:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696936200; x=1697541000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCYF5qT9Gs8IkTnnIfRUFKntaORMi6z87ONR0oJTVDQ=;
        b=C5u5QACxDqFmgS22h975qnPRhVJRK0lqoBbCBcPuMAuI9javRqL+IJfPQ3T7DO2nbM
         dIm6Lyq4E8+J0uFZXy/DlTUkBKcSJB3o+1KtJOELKtsX0ZShVJJkguQoVtGds8Dz1yMY
         B4JDSn771MggeNzu/Bcxnqj+jTf2QpdGqTIyYncQOVdXKBYOLfepiKncbPRRo/H7aRsR
         gvac1+HMy8GmQM19Vrvpx0lRB9MzLt+IsK4Y/EYQ1GV7TbKiywxY8q7GCKRZawiw/+a4
         a0QHV6Dz3YU7AF6tpwhONklWChnl42CB8nc4msmAHJf7ZLiXp4wsG4TwPRJTRBoJmq/n
         /xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696936200; x=1697541000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCYF5qT9Gs8IkTnnIfRUFKntaORMi6z87ONR0oJTVDQ=;
        b=hQhFlNl6wVdaMWPct5eDi1+7Le5VMCwmvr3qLJDF7fTqDN1tb7Wr2uiSt/MikXwrtD
         7qeMxSLKOeNqjE1NVPsL0QmAc7PNKxmRYTSvH/bR0nCtz4Zfp7jlf2Y/vm45RbdnExHz
         ULlIwazp97pZtZn14spaLfGpaMoz3S/cNIJmdTSvj5i/LjA0mRr9r3pl0snZX79URONQ
         ZIxs/GaABzn7HspSXD2LymURC7NyXFr/SqnYIbHJhO5cGGHwUEVdbhIt0S45TT+RFCxA
         D/p1hhiiTHDA03ZKT1r44AO/vlri6KHClmNqcTFYFxdVsTmvOfUWP4WmD4tUO78l7mKU
         4akQ==
X-Gm-Message-State: AOJu0Yx+eXXBOjpFmNF0IYx5SxKHZKDydeL921Wi6cJseIDcYw34bJtA
        d7NUrdShctjlWDmg7bEFHHgRfFLlacH/AMP93YPDuA==
X-Google-Smtp-Source: AGHT+IG8EjKGLHcnRs66KBlvSVDW7XewFvqtnC+gvRCdLGJTRcz5KkRFMmp9YsubRZ0+HFgXMzlZdGl+PFDx9vN6yg8=
X-Received: by 2002:a05:6122:2641:b0:496:a6cc:7ffe with SMTP id
 dr1-20020a056122264100b00496a6cc7ffemr11008131vkb.13.1696936199801; Tue, 10
 Oct 2023 04:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-1-c8f5f403e856@skole.hr>
In-Reply-To: <20231009-pxa-gpio-v7-1-c8f5f403e856@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 13:09:48 +0200
Message-ID: <CAMRc=Mcb5WpTyGyb20Kd_ycOGKPywhuGc9wFoxCcjtZ_oHC46A@mail.gmail.com>
Subject: Re: [PATCH RFT v7 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 9, 2023 at 8:34=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
>
> Convert this function to use the new GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/spitz.c      | 13 ++++++-------
>  drivers/usb/host/ohci-pxa27x.c |  5 +++++
>  2 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index cc691b199429..535e2b2e997b 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -649,23 +649,22 @@ static inline void spitz_mmc_init(void) {}
>   * USB Host
>   ***********************************************************************=
*******/
>  #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
> +GPIO_LOOKUP_SINGLE(spitz_usb_host_gpio_table, "pxa27x-ohci", "gpio-pxa",
> +               SPITZ_GPIO_USB_HOST, "usb-host", GPIO_ACTIVE_LOW);
> +
>  static int spitz_ohci_init(struct device *dev)
>  {
> -       int err;
> -
> -       err =3D gpio_request(SPITZ_GPIO_USB_HOST, "USB_HOST");
> -       if (err)
> -               return err;
> +       gpiod_add_lookup_table(&spitz_usb_host_gpio_table);
>
>         /* Only Port 2 is connected, setup USB Port 2 Output Control Regi=
ster */
>         UP2OCR =3D UP2OCR_HXS | UP2OCR_HXOE | UP2OCR_DPPDE | UP2OCR_DMPDE=
;
>
> -       return gpio_direction_output(SPITZ_GPIO_USB_HOST, 1);
> +       return 0;
>  }
>
>  static void spitz_ohci_exit(struct device *dev)
>  {
> -       gpio_free(SPITZ_GPIO_USB_HOST);
> +       gpiod_remove_lookup_table(&spitz_usb_host_gpio_table);
>  }
>
>  static struct pxaohci_platform_data spitz_ohci_platform_data =3D {
> diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27=
x.c
> index 357d9aee38a3..a809ba0bb25e 100644
> --- a/drivers/usb/host/ohci-pxa27x.c
> +++ b/drivers/usb/host/ohci-pxa27x.c
> @@ -121,6 +121,7 @@ struct pxa27x_ohci {
>         void __iomem    *mmio_base;
>         struct regulator *vbus[3];
>         bool            vbus_enabled[3];
> +       struct gpio_desc *usb_host;
>  };
>
>  #define to_pxa27x_ohci(hcd)    (struct pxa27x_ohci *)(hcd_to_ohci(hcd)->=
priv)
> @@ -447,6 +448,10 @@ static int ohci_hcd_pxa27x_probe(struct platform_dev=
ice *pdev)
>         pxa_ohci =3D to_pxa27x_ohci(hcd);
>         pxa_ohci->clk =3D usb_clk;
>         pxa_ohci->mmio_base =3D (void __iomem *)hcd->regs;
> +       pxa_ohci->usb_host =3D devm_gpiod_get_optional(&pdev->dev, "usb-h=
ost", GPIOD_OUT_LOW);
> +       if (IS_ERR(pxa_ohci->usb_host))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(pxa_ohci->usb_ho=
st),
> +                               "failed to get USB host GPIO\n");
>
>         for (i =3D 0; i < 3; ++i) {
>                 char name[6];
>
> --
> 2.42.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
