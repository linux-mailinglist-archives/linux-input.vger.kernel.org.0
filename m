Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CC9233EB7
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 07:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730173AbgGaFmB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 01:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730170AbgGaFmB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 01:42:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958D7C061574
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 22:42:00 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k1Nnj-0005xl-HN; Fri, 31 Jul 2020 07:41:51 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k1Nne-0002Rb-PM; Fri, 31 Jul 2020 07:41:46 +0200
Date:   Fri, 31 Jul 2020 07:41:46 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Ondrej Jirman <megous@megous.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Luca Weiss <luca@z3ntu.xyz>,
        Tomas Novotny <tomas@novotny.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/4] ARM: dts: sun8i-a83t-tbs-a711: Add support for
 the vibrator motor
Message-ID: <20200731054146.3d64tchfvbb6gfwj@pengutronix.de>
References: <20200730132446.3139980-1-megous@megous.com>
 <20200730132446.3139980-4-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730132446.3139980-4-megous@megous.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:40:39 up 258 days, 20:59, 248 users,  load average: 0.14, 0.11,
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

Hi Ondrej,

On 20-07-30 15:24, Ondrej Jirman wrote:
> The board has a vibrator motor. Hook it to the input subsystem.
> 
> According to the PMIC specification, LDO needs to be enabled (value 0b11)
> to achieve the specified max driving current of 150mA. We can't drive
> the motor with just GPIO mode.
> 
> In GPIO mode the chip is probably just using the regular CMOS logic
> output circuitry (typically limited to around 20-35mA, but not specified
> in this datasheet).
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> index bfc9bb277a49..a278a1e33930 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> @@ -99,6 +99,11 @@ panel_input: endpoint {
>  		};
>  	};
>  
> +	vibrator {
> +		compatible = "gpio-vibrator";
> +		vcc-supply = <&reg_ldo_io1>;
> +	};

Please keep the alphabetical order. I also would merge patch 3 and 4
into one since they are realted changes.

Regards,
  Marco

> +
>  	reg_gps: reg-gps {
>  		compatible = "regulator-fixed";
>  		regulator-name = "gps";
