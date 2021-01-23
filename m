Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7853013DA
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 09:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbhAWIGC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 03:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbhAWIFT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 03:05:19 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D1CC0613D6;
        Sat, 23 Jan 2021 00:04:39 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id y19so16129679iov.2;
        Sat, 23 Jan 2021 00:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBTlIdIvYUiPYakesEMFgdk0tMLS0w4p19XOCt6zOMg=;
        b=rnjaIvUuIL6LOgjxA3qOaFvZSIQE1YxiG7F9VypURp+e9TS/8sFoPo6MdZKWtxZ1vR
         xu1Z2I7gV1PQdeYOUA6CJQ/tJOgqq2ONpJ2/rl1tQP1N0ZMlUmsitDkhSnn/TibjLUcj
         BGht61dn+X5O8GMv8ndM1bFHTsW70znFBukfkPJlxzyauyBq5vX0+akJWtJPkLWehvNt
         9P6NqmtJvUiZm4n6o1O5zoev+7b4e5pItMogwQ2v615djGKTrNO42a6s4ZZCt0bWMd4O
         cQmkiHCdcltjNo+8WEkXpIMCuUuslDfi2XGM4Fy9IuqImGAatHvKGhNOBJz+XN01ezcy
         +NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBTlIdIvYUiPYakesEMFgdk0tMLS0w4p19XOCt6zOMg=;
        b=j8rZYkV8thRM1rGWlZ0p1btrl4jqNlrCav0SnAr6a44cUKK1KDeXsUWmrd/ZQjCoSK
         vb4g9dCtfEZRS8KEEnaY4rzrUg9myD0nnC0XfVg9RSkJPwC/5grTL3n825wkGi9G5q5g
         UjE84bYYTj6i62/YRbq/nIBFFYLoeFPFnX2rMn27PLyqGjVNCaXhJYkN6WCbmqcwJB98
         TapRTU7WZe3frWWmxFzzzWacqh2odT2NNTxXX62+0BQ7xULMlyS2iu0yNN6lwLeb2DlE
         /4+/3ATVAXAK/HYOQn+pBZemnrAhsgbz4ANAqHG9TJtZ9gSqGh+SFgPUYJ5av/YCGeA9
         +UQw==
X-Gm-Message-State: AOAM530qvM/nMtPw51z/Z7QwSA3D/f1j6sZU/9LHu9pz9Fgt+XoIVPaI
        pqdCx0MfTEY4hxI7L7IdrH0ZX8YbQ0mShuhLbOc=
X-Google-Smtp-Source: ABdhPJzdhBKQDFyQBIYgvZtmapH2u901GGnBij0WMkrtT0Kt8Q9iUugjS1f/dSspdy6lepUuNfEkRuIJeJf6E7f5tYY=
X-Received: by 2002:a5d:8909:: with SMTP id b9mr6120475ion.175.1611389078594;
 Sat, 23 Jan 2021 00:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20210121065643.342-1-alistair@alistair23.me> <20210121065643.342-7-alistair@alistair23.me>
 <20210122153231.qqiuwltvzzg52phg@pengutronix.de>
In-Reply-To: <20210122153231.qqiuwltvzzg52phg@pengutronix.de>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Sat, 23 Jan 2021 00:04:12 -0800
Message-ID: <CAKmqyKPey8xSfWPuiwR__h-tQBBZ+WjtbC1aO8umSzpBWC=xkw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arch/arm: reMarkable2: Enable wacom_i2c
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Alistair Francis <alistair@alistair23.me>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 22, 2021 at 7:32 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi,
>
> thanks for the patch.
>
> On 21-01-20 22:56, Alistair Francis wrote:
> > Enable the wacom_i2c touchscreen for the reMarkable2.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  arch/arm/boot/dts/imx7d-remarkable2.dts | 41 +++++++++++++++++++++++++
> >  arch/arm/configs/imx_v6_v7_defconfig    |  1 +
>
> Those two changes should be splitted and the dts patch should be named:
> "ARM: dts: imx7d: remarkable2: add wacom digitizer device".
>
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
> > index fba55a0e028a..8052d884a5e5 100644
> > --- a/arch/arm/boot/dts/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
> > @@ -150,6 +150,30 @@ &dma_apbh {
> >       status = "disabled";
> >  };
> >
> > +&i2c1 {
> > +     clock-frequency = <400000>;
> > +     pinctrl-names = "default", "sleep";
> > +     pinctrl-0 = <&pinctrl_i2c1>;
> > +     pinctrl-1 = <&pinctrl_i2c1>;
>
> No need to specify the sleep state if both are using the same pinctrl
> config.
>
> > +     status = "okay";
> > +
> > +     digitizer: wacom-i2c@9 {
>
> this should be:
>         wacom_digitizer: digitizer@9 {
>
> > +             pinctrl-names = "default", "sleep";
> > +             pinctrl-0 = <&pinctrl_wacom>;
> > +             pinctrl-1 = <&pinctrl_wacom>;
>
> Same here, sleep and default refer to the same state.
>
> > +             compatible = "wacom,wacom-i2c";
> > +             reg = <0x09>;
>
> compatible and reg are always the first to properties.
>
> > +             interrupt-parent = <&gpio1>;
> > +             interrupts = <1 2>;
>
> Please use defines.

I have addressed all your comments.

>
> > +             flip-tilt-x;
> > +             flip-tilt-y;
> > +             flip-pos-x;
> > +             flip-pos-y;
> > +             flip-distance;
> > +             vdd-supply = <&reg_digitizer>;
>
> Where is this regulator added?

It's already in the DT, it will be added with the initial commit
(which is currently on the list).

Alistair

>
> > +     };
> > +};
> > +
> >  &sdma {
> >       status = "okay";
> >  };
> > @@ -221,6 +245,16 @@ &wdog1 {
> >  };
> >
> >  &iomuxc_lpsr {
> > +     pinctrl_wacom: wacomgrp {
> > +             fsl,pins = <
> > +                     /*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0   0x00000074 /* WACOM RESET */
> > +                     MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1     0x00000034 /* WACOM INT */
> > +                     MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4     0x00000074 /* PDCTB */
> > +                     /*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5   0x00000014 /* FWE */
> > +                     /*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6   0x00000014 /* WACOM PWR ENABLE */
> > +             >;
> > +     };
>
> Pls, sort this alphabetical.
>
> > +
> >       pinctrl_digitizer_reg: digitizerreggrp {
> >               fsl,pins = <
> >                       /* DIGITIZER_PWR_EN */
> > @@ -236,6 +270,13 @@ MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16        0x59
> >               >;
> >       };
> >
> > +     pinctrl_i2c1: i2c1grp {
> > +             fsl,pins = <
> > +                     MX7D_PAD_I2C1_SDA__I2C1_SDA             0x4000007f
> > +                     MX7D_PAD_I2C1_SCL__I2C1_SCL             0x4000007f
> > +             >;
> > +     };
> > +
> >       pinctrl_uart1: uart1grp {
> >               fsl,pins = <
> >                       MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX    0x79
> > diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> > index fa9229616106..2fc8dc6a8b0a 100644
> > --- a/arch/arm/configs/imx_v6_v7_defconfig
> > +++ b/arch/arm/configs/imx_v6_v7_defconfig
> > @@ -167,6 +167,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
> >  CONFIG_TOUCHSCREEN_EGALAX=y
> >  CONFIG_TOUCHSCREEN_GOODIX=y
> >  CONFIG_TOUCHSCREEN_ILI210X=y
> > +CONFIG_TOUCHSCREEN_WACOM_I2C=y
> >  CONFIG_TOUCHSCREEN_MAX11801=y
> >  CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
> >  CONFIG_TOUCHSCREEN_EDT_FT5X06=y
> > --
> > 2.29.2
> >
> >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
