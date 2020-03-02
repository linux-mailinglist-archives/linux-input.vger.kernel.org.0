Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16AEE175CA9
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 15:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgCBONf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 09:13:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41668 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgCBONf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 09:13:35 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so10373737oie.8;
        Mon, 02 Mar 2020 06:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ws2B6l6NIJSFRXDPIqA5jSMWVs7TmLxkRxy3tQa87pU=;
        b=dmtTA6Aya7x6bFPVvcNOrR04oXA2P2k1XJ0hOGU4StZS5CGenvFNd083gK2DF42Mke
         +BVMpjHSoGfxfRLJBJeDstRhl9l0CoEXM27TMRg0Y69h544kIPgir+py+plKCLRXrZAC
         Vo3yZI56HkCnXpwhHMguhXc29+HIkbqWjHqAWX4mtej8AorOvJFe3sPAU0pKEYIvzrfF
         cMutkxJLJByC+Xv1518Co0IrBKLUlvMIDxCLbe5adLaIeFHHs3zf1kivXvFx87V5gIQF
         O7usWTxbtA4g7w91JghcgHSC+uQOAYl2vyuV4Xz/EIf5gMPEyFbyxU8k2wfF5Lwz9xHt
         3JLg==
X-Gm-Message-State: APjAAAUR4YvLHclFjvMVjdZg6W4wECpKUWElUgAtaTr9bidnzYzX3Uku
        UgGtFqh0yq9HdihQ2J806soU2X4j6ikr2Zf9XlE=
X-Google-Smtp-Source: APXvYqxc30QQ9pF6wru8kNRGnSUWQtitDVWX70yYiEahlGuWpiD550st9Aj0VJTOK9dZ5LHS2cvequPflqzhHL793jk=
X-Received: by 2002:aca:ed04:: with SMTP id l4mr11923714oih.54.1583158414290;
 Mon, 02 Mar 2020 06:13:34 -0800 (PST)
MIME-Version: 1.0
References: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
In-Reply-To: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Mar 2020 15:13:23 +0100
Message-ID: <CAMuHMdVmsDVJRWp2uzVs0BKp-CjAcc6PS-1wBPT8J+UZr1O7CA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg22d-sodimm: Enable touchscreen
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <chris.paterson2@renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marian-Cristian,

On Tue, Feb 4, 2020 at 10:23 AM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> In one of the iWave-G22D development board variants, called Generic SODIMM
> Development Platform, we have an LCD with touchscreen. The resistive touch
> controller, STMPE811 is on the development board and is connected through
> the i2c5 of the RZ-G1E.
>
> Additionally, this controller should generate an interrupt to the CPU and
> it is connected through GPIO4,4 to the GIC.
>
> Touch was tested with one of our iW-RainboW-G22D-SODIMM RZ/G1E development
> platforms.
>
> More details on the iWave website:
> https://www.iwavesystems.com/rz-g1e-sodimm-development-kit.html
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -128,6 +128,47 @@
>         status = "okay";
>         clock-frequency = <400000>;
>
> +       stmpe811@44 {
> +               compatible = "st,stmpe811";

According to the DT bindings, this must be "st,stmpe-ts", but the example
also uses "st,stmpe811"?

> +               #address-cells = <1>;
> +               #size-cells = <0>;

Not documented in the DT bindings (but used in the example).

> +               reg = <0x44>;
> +               interrupt-parent = <&gpio4>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;

This should be "<4 IRQ_TYPE_LEVEL_LOW>", to refer to GP4_4.

> +               irq-gpio = <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;

"irq-gpio" is not documented in the DT bindings.

> +               pinctrl-0 = <&touch>;
> +               pinctrl-names = "default";
> +               id = <0>;
> +               blocks = <0x5>;
> +               irq-trigger = <0x1>;

Above 3 are not documented.

> +
> +               stmpe_touchscreen {

Missing unit-address.

> +                       compatible = "st,stmpe-ts";
> +                       reg = <0>;
> +                       /* 3.25 MHz ADC clock speed */
> +                       st,adc-freq = <3>;
> +                       /* 8 sample average control */
> +                       st,ave-ctrl = <2>;
> +                       /* 7 length fractional part in z */
> +                       st,fraction-z = <7>;
> +                       /*
> +                        * 50 mA typical 80 mA max touchscreen drivers
> +                        * current limit value
> +                        */
> +                       st,i-drive = <0>;

Bindings say <0> corresponds to 20 mA.
Either the comment is wrong, or this should be <1>.

> +                       /* 12-bit ADC */
> +                       st,mod-12b = <1>;
> +                       /* internal ADC reference */
> +                       st,ref-sel = <0>;
> +                       /* ADC converstion time: 80 clocks */
> +                       st,sample-time = <4>;
> +                       /* 1 ms panel driver settling time */
> +                       st,settling = <3>;
> +                       /* 5 ms touch detect interrupt delay */
> +                       st,touch-det-delay = <4>;

Bindings say <4> corresponds to 1 ms.
Either the comment is wrong, or this should be <5>.

> +               };
> +       };
> +
>         sgtl5000: codec@a {
>                 compatible = "fsl,sgtl5000";
>                 #sound-dai-cells = <0>;
> @@ -181,6 +222,11 @@
>                 function = "ssi";
>         };
>
> +       touch: stmpe811 {
> +               groups = "intc_irq0";
> +               function = "intc";

This does not match using GP4_4 for the interrupt.

Either you use GP4_4:

    interrupt-parent = <&gpio4>;
    interrupts = <4 IRQ_TYPE_LEVEL_LOW>;

which doesn't require any explicit pin control setup (the gpio-rcar
driver takes care of that),
or you use IRQ0:

    interrupt-parent = <&irqc>;
    interrupts = <0 IRQ_TYPE_LEVEL_LOW>;

The latter does require explicit pin control setup.

> +       };
> +
>         usb0_pins: usb0 {
>                 groups = "usb0";
>                 function = "usb0";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
