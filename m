Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE6630076B
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 16:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbhAVPdU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 10:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729186AbhAVPdR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 10:33:17 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DED8C061786
        for <linux-input@vger.kernel.org>; Fri, 22 Jan 2021 07:32:36 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yQK-0006rl-F9; Fri, 22 Jan 2021 16:32:32 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yQJ-00007J-9C; Fri, 22 Jan 2021 16:32:31 +0100
Date:   Fri, 22 Jan 2021 16:32:31 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, alistair23@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arch/arm: reMarkable2: Enable wacom_i2c
Message-ID: <20210122153231.qqiuwltvzzg52phg@pengutronix.de>
References: <20210121065643.342-1-alistair@alistair23.me>
 <20210121065643.342-7-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121065643.342-7-alistair@alistair23.me>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:15:16 up 51 days,  5:21, 28 users,  load average: 0.33, 0.24,
 0.11
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

thanks for the patch.

On 21-01-20 22:56, Alistair Francis wrote:
> Enable the wacom_i2c touchscreen for the reMarkable2.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  arch/arm/boot/dts/imx7d-remarkable2.dts | 41 +++++++++++++++++++++++++
>  arch/arm/configs/imx_v6_v7_defconfig    |  1 +

Those two changes should be splitted and the dts patch should be named:
"ARM: dts: imx7d: remarkable2: add wacom digitizer device".

>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d-remarkable2.dts b/arch/arm/boot/dts/imx7d-remarkable2.dts
> index fba55a0e028a..8052d884a5e5 100644
> --- a/arch/arm/boot/dts/imx7d-remarkable2.dts
> +++ b/arch/arm/boot/dts/imx7d-remarkable2.dts
> @@ -150,6 +150,30 @@ &dma_apbh {
>  	status = "disabled";
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1>;

No need to specify the sleep state if both are using the same pinctrl
config.

> +	status = "okay";
> +
> +	digitizer: wacom-i2c@9 {

this should be:
        wacom_digitizer: digitizer@9 {

> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&pinctrl_wacom>;
> +		pinctrl-1 = <&pinctrl_wacom>;

Same here, sleep and default refer to the same state.

> +		compatible = "wacom,wacom-i2c";
> +		reg = <0x09>;

compatible and reg are always the first to properties.

> +		interrupt-parent = <&gpio1>;
> +		interrupts = <1 2>;

Please use defines.

> +		flip-tilt-x;
> +		flip-tilt-y;
> +		flip-pos-x;
> +		flip-pos-y;
> +		flip-distance;
> +		vdd-supply = <&reg_digitizer>;

Where is this regulator added?

> +	};
> +};
> +
>  &sdma {
>  	status = "okay";
>  };
> @@ -221,6 +245,16 @@ &wdog1 {
>  };
>  
>  &iomuxc_lpsr {
> +	pinctrl_wacom: wacomgrp {
> +		fsl,pins = <
> +			/*MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0	0x00000074 /* WACOM RESET */
> +			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x00000034 /* WACOM INT */
> +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x00000074 /* PDCTB */
> +			/*MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x00000014 /* FWE */
> +			/*MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x00000014 /* WACOM PWR ENABLE */
> +		>;
> +	};

Pls, sort this alphabetical.

> +
>  	pinctrl_digitizer_reg: digitizerreggrp {
>  		fsl,pins = <
>  			/* DIGITIZER_PWR_EN */
> @@ -236,6 +270,13 @@ MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0x59
>  		>;
>  	};
>  
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX7D_PAD_I2C1_SDA__I2C1_SDA		0x4000007f
> +			MX7D_PAD_I2C1_SCL__I2C1_SCL		0x4000007f
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index fa9229616106..2fc8dc6a8b0a 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -167,6 +167,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
>  CONFIG_TOUCHSCREEN_EGALAX=y
>  CONFIG_TOUCHSCREEN_GOODIX=y
>  CONFIG_TOUCHSCREEN_ILI210X=y
> +CONFIG_TOUCHSCREEN_WACOM_I2C=y
>  CONFIG_TOUCHSCREEN_MAX11801=y
>  CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
>  CONFIG_TOUCHSCREEN_EDT_FT5X06=y
> -- 
> 2.29.2
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
