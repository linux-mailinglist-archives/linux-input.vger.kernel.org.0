Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7D9132D98
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgAGRwX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:52:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:49670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728358AbgAGRwX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 12:52:23 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B5052073D;
        Tue,  7 Jan 2020 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578419542;
        bh=N8kKuZH+IiH6SzhPc6h2mqRI8IEhFlVh6ta+BjiG0PA=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=ybRlfiE8lpreqNDlmuq0T6s79Vk91yUUXBueGQJwCTKHg0CwwBoLldVavaNiR5c2i
         bGGVFO9iCfDMwDucVKX23f2QJV9gtQw9fLOBSf4W7e0SGBSuEd16lAp5F8k9Uc2sV6
         HRVEpzGgo5tFSXUv2uwUFX9Lr/mCTssneGSpO0g8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200107120317.GB8083@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-5-masneyb@onstation.org> <20200105083534.01EB12071A@mail.kernel.org> <20200107120317.GB8083@onstation.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator bindings
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 07 Jan 2020 09:52:21 -0800
Message-Id: <20200107175222.6B5052073D@mail.kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Brian Masney (2020-01-07 04:03:17)
> On Sun, Jan 05, 2020 at 12:35:33AM -0800, Stephen Boyd wrote:
> > Quoting Brian Masney (2019-12-04 16:25:00)
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    vibrator {
> > > +        compatible =3D "clk-vibrator";
> > > +
> > > +        vcc-supply =3D <&pm8941_l19>;
> > > +
> > > +        clocks =3D <&mmcc CAMSS_GP1_CLK>;
> > > +        clock-names =3D "core";
> > > +        clock-frequency =3D <24000>;
> > > +
> > > +        enable-gpios =3D <&msmgpio 60 GPIO_ACTIVE_HIGH>;
> > > +
> > > +        pinctrl-names =3D "default";
> > > +        pinctrl-0 =3D <&vibrator_pin>;
> >=20
> > I'm still trying to wrap my head around this. I think we can have a pwm
> > provider in a clk controller node (so imagine &mmcc has #pwm-cells) and
> > then this 'clk-vibrator' binding wouldn't exist? Instead we would have
> > some sort of binding for a device that expects a pwm and whatever else
> > is required, like the enable gpio and power supply. Is there an actual
> > hardware block that is this way? Does it have a real product id and is
> > made by some company? Right now this looks a little too generic to not
> > just be a catch-all for something that buzzes.
>=20
> So have some of the Qualcomm clocks like this one register with both the
> clk and the pwm frameworks? I feel that approach would better represent
> the hardware in device tree.

That is one option. Or another option would be to have another node that
"adapts" a clk signal to a pwm provider. Similar to how we adapt a gpio
to make a clk gate or mux. Something like:

	gcc: clock-controller@f00d {
		reg =3D <0xf00d 0xd00d>;
		#clock-cells =3D <1>;
	};


	pwm {
		compatible =3D "pwm-clk";
		#pwm-cells =3D <0>;
		clocks =3D <&gcc 45>;
		assigned-clocks =3D <&gcc 45>;
		assigned-clock-rates =3D <1400000>;
	};

And then the pwm-clk driver would adjust the duty cycle to generate a
pwm.

>=20
> If we did that, then the pwm-vibra driver in the input subsystem could
> be used.

