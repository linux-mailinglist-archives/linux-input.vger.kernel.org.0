Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274D1E83D8
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 10:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbfJ2JIK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 05:08:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48921 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfJ2JIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 05:08:10 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPNTu-0002XP-O9; Tue, 29 Oct 2019 10:08:02 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iPNTt-0007YZ-T6; Tue, 29 Oct 2019 10:08:01 +0100
Date:   Tue, 29 Oct 2019 10:08:01 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm: dts: sun8i: a83t: a711: Add touchscreen node
Message-ID: <20191029090801.zls2qns7rxcvmxor@pengutronix.de>
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-4-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029005806.3577376-4-megous@megous.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:04:51 up 164 days, 15:23, 99 users,  load average: 0.20, 0.17,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 19-10-29 01:58, Ondrej Jirman wrote:
> From: Mylène Josserand <mylene.josserand@bootlin.com>
> 
> Enable a FocalTech EDT-FT5x06 Polytouch touchscreen.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> index 568b90ece342..19f520252dc5 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> @@ -164,6 +164,22 @@
>  	status = "okay";
>  };
>  
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		interrupt-parent = <&r_pio>;
> +		interrupts = <0 7 IRQ_TYPE_EDGE_FALLING>; /* PL7 */
> +		reset-gpios = <&pio 3 5 GPIO_ACTIVE_LOW>; /* PD5 */
> +		vcc-supply = <&reg_ldo_io0>;
> +		touchscreen-size-x = <1024>;
> +		touchscreen-size-y = <600>;

Do you want this touchscreen as wakeup-src? If so please add the
property here. I've send patches converting the driver from the default
behaviour: https://patchwork.kernel.org/cover/11149039/ and all agreed
to break backward compatibility.

Regards,
  Marco

> +	};
> +};
> +
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -- 
> 2.23.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
