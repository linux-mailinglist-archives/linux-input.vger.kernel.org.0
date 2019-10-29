Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FCFE8660
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 12:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731765AbfJ2LNn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 07:13:43 -0400
Received: from vps.xff.cz ([195.181.215.36]:59982 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731826AbfJ2LNn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 07:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572347620; bh=Obh7tvfkovm1tGf8wM3sGTB+Ja4afeHSPQtadzplAcc=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=RYCBY6vNV4YeeENeH3RNTeWeZG3kO3f0QWxALt4GLNgqTCg0brQtQhmuBq9x/Y49n
         fpvK97qY0FSViYwMAY/jfp39tdfeEsIEd14Mo5FallMrTTMm9iLTviBLEwaIE+1V4r
         n582CF6f19v/OQIz5a+UGsXA3vIgefQhMA2yzP9s=
Date:   Tue, 29 Oct 2019 12:13:39 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm: dts: sun8i: a83t: a711: Add touchscreen node
Message-ID: <20191029111339.7okiyig3tbehn5kj@core.my.home>
Mail-Followup-To: Marco Felsch <m.felsch@pengutronix.de>,
        linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-4-megous@megous.com>
 <20191029090801.zls2qns7rxcvmxor@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029090801.zls2qns7rxcvmxor@pengutronix.de>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Marco,

On Tue, Oct 29, 2019 at 10:08:01AM +0100, Marco Felsch wrote:
> Hi,
> 
> On 19-10-29 01:58, Ondrej Jirman wrote:
> > From: Mylène Josserand <mylene.josserand@bootlin.com>
> > 
> > Enable a FocalTech EDT-FT5x06 Polytouch touchscreen.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > index 568b90ece342..19f520252dc5 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > @@ -164,6 +164,22 @@
> >  	status = "okay";
> >  };
> >  
> > +&i2c0 {
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +
> > +	touchscreen@38 {
> > +		compatible = "edt,edt-ft5x06";
> > +		reg = <0x38>;
> > +		interrupt-parent = <&r_pio>;
> > +		interrupts = <0 7 IRQ_TYPE_EDGE_FALLING>; /* PL7 */
> > +		reset-gpios = <&pio 3 5 GPIO_ACTIVE_LOW>; /* PD5 */
> > +		vcc-supply = <&reg_ldo_io0>;
> > +		touchscreen-size-x = <1024>;
> > +		touchscreen-size-y = <600>;
> 
> Do you want this touchscreen as wakeup-src? If so please add the
> property here. I've send patches converting the driver from the default
> behaviour: https://patchwork.kernel.org/cover/11149039/ and all agreed
> to break backward compatibility.

Not at this moment, thank you.

regards,
	o.

> Regards,
>   Marco
> 
> > +	};
> > +};
> > +
> >  &i2c1 {
> >  	clock-frequency = <400000>;
> >  	status = "okay";
> > -- 
> > 2.23.0
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
