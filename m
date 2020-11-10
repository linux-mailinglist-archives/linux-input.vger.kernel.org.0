Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A162B2ACB8B
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 04:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbgKJDM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 22:12:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:44910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729454AbgKJDM7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 22:12:59 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65D592067B;
        Tue, 10 Nov 2020 03:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604977978;
        bh=xRWm36Xa8Lut2a+G6NApapBeKIBqQd3mIZYqmYlb2uE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VXTf+5MgoEw4EBiVcFsSztQst2rA4lYpRdsed7MDjH635zr6nynvpMjhBjSixqAa1
         MTdWVlnph4Y7SZ8m3wpuVho3V7aaVJ5sIsYCCpJqnxZsujPD/XsxbCDvpnZPENFKCC
         Xvkqsn0gth1cU7R649KJGOb15f/vZpsPz/UJ4u14=
Date:   Tue, 10 Nov 2020 11:12:52 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: imx50-kobo-aura: Enable eKTF2132
 touchscreen
Message-ID: <20201110031251.GZ31601@dragon>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
 <20201106112412.390724-4-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106112412.390724-4-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 06, 2020 at 12:24:12PM +0100, Jonathan Neuschäfer wrote:
> The Kobo Aura has an eKTF2132 touchscreen controller.
> 
> Although the vendor kernel toggles a reset pin (GPIO5-12) during the
> startup sequence, the touchscreen works without it.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> This patch requires "[PATCH] ARM: dts: imx50-kobo-aura: Add 'grp' suffix
> to pinctrl node names" in order to apply cleanly.
> (https://lore.kernel.org/lkml/20201031210729.2804471-1-j.neuschaefer@gmx.net/)
> ---
>  arch/arm/boot/dts/imx50-kobo-aura.dts | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx50-kobo-aura.dts b/arch/arm/boot/dts/imx50-kobo-aura.dts
> index b2fbee60271f2..82ce8c43be867 100644
> --- a/arch/arm/boot/dts/imx50-kobo-aura.dts
> +++ b/arch/arm/boot/dts/imx50-kobo-aura.dts
> @@ -120,7 +120,14 @@ &i2c1 {
>  	pinctrl-0 = <&pinctrl_i2c1>;
>  	status = "okay";
> 
> -	/* TODO: ektf2132 touch controller at 0x15 */
> +	touchscreen@15 {
> +		reg = <0x15>;
> +		compatible = "elan,ektf2132";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ts>;
> +		power-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> +		interrupts-extended = <&gpio5 13 IRQ_TYPE_EDGE_FALLING>;

It needs include of <dt-bindings/interrupt-controller/irq.h>.

  DTC     arch/arm/boot/dts/imx50-kobo-aura.dtb
Error: ../arch/arm/boot/dts/imx50-kobo-aura.dts:128.36-37 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:326: recipe for target 'arch/arm/boot/dts/imx50-kobo-aura.dtb' failed
make[2]: *** [arch/arm/boot/dts/imx50-kobo-aura.dtb] Error 1

Patch dropped.

Shawn

> +	};
>  };
> 
>  &i2c2 {
> @@ -240,6 +247,13 @@ MX50_PAD_SD3_D7__ESDHC3_DAT7		0x1d4
>  		>;
>  	};
> 
> +	pinctrl_ts: tsgrp {
> +		fsl,pins = <
> +			MX50_PAD_CSPI_MOSI__GPIO4_9		0x0
> +			MX50_PAD_SD2_D5__GPIO5_13		0x0
> +		>;
> +	};
> +
>  	pinctrl_uart2: uart2grp {
>  		fsl,pins = <
>  			MX50_PAD_UART2_TXD__UART2_TXD_MUX	0x1e4
> --
> 2.28.0
> 
