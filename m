Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218E2133735
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 00:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgAGXSX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 18:18:23 -0500
Received: from onstation.org ([52.200.56.107]:35462 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgAGXSW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 18:18:22 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3FF903EE6F;
        Tue,  7 Jan 2020 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1578439101;
        bh=dPi/tlFFpKEhh6XGOkAwyWFcjw/UEJV74jJZmzMoFC4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HJOmLIqBjzocoa69Tgfssq8+Zhsh/tT9Ma4MDBktwAV8J8Eg9QpZQxspeRIIPCEly
         4OT73k4esnw71aA6YvcjVvjU51j2V3r36iUt/GxRhIcFoFUrIgm/Zoy3wrcNXGiPJk
         bzaaAwwrQzuZNwx8/a154IzGC6zRXEYe0O+vl7s8=
Date:   Tue, 7 Jan 2020 18:18:20 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator
 bindings
Message-ID: <20200107231820.GA13416@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
 <20191205002503.13088-5-masneyb@onstation.org>
 <20200105083534.01EB12071A@mail.kernel.org>
 <20200107120317.GB8083@onstation.org>
 <20200107175222.6B5052073D@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107175222.6B5052073D@mail.kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 07, 2020 at 09:52:21AM -0800, Stephen Boyd wrote:
> Quoting Brian Masney (2020-01-07 04:03:17)
> > On Sun, Jan 05, 2020 at 12:35:33AM -0800, Stephen Boyd wrote:
> > > Quoting Brian Masney (2019-12-04 16:25:00)
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +
> > > > +    vibrator {
> > > > +        compatible = "clk-vibrator";
> > > > +
> > > > +        vcc-supply = <&pm8941_l19>;
> > > > +
> > > > +        clocks = <&mmcc CAMSS_GP1_CLK>;
> > > > +        clock-names = "core";
> > > > +        clock-frequency = <24000>;
> > > > +
> > > > +        enable-gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +        pinctrl-names = "default";
> > > > +        pinctrl-0 = <&vibrator_pin>;
> > > 
> > > I'm still trying to wrap my head around this. I think we can have a pwm
> > > provider in a clk controller node (so imagine &mmcc has #pwm-cells) and
> > > then this 'clk-vibrator' binding wouldn't exist? Instead we would have
> > > some sort of binding for a device that expects a pwm and whatever else
> > > is required, like the enable gpio and power supply. Is there an actual
> > > hardware block that is this way? Does it have a real product id and is
> > > made by some company? Right now this looks a little too generic to not
> > > just be a catch-all for something that buzzes.
> > 
> > So have some of the Qualcomm clocks like this one register with both the
> > clk and the pwm frameworks? I feel that approach would better represent
> > the hardware in device tree.
> 
> That is one option. Or another option would be to have another node that
> "adapts" a clk signal to a pwm provider. Similar to how we adapt a gpio
> to make a clk gate or mux. Something like:
> 
> 	gcc: clock-controller@f00d {
> 		reg = <0xf00d 0xd00d>;
> 		#clock-cells = <1>;
> 	};
> 
> 
> 	pwm {
> 		compatible = "pwm-clk";
> 		#pwm-cells = <0>;
> 		clocks = <&gcc 45>;
> 		assigned-clocks = <&gcc 45>;
> 		assigned-clock-rates = <1400000>;
> 	};
> 
> And then the pwm-clk driver would adjust the duty cycle to generate a
> pwm.

OK, that makes sense.

I'll pick this up after someone from Qualcomm posts a patch that
implements the clock duty cycle. I'm willing to do that work if someone
explains the relationship between the m, n, and d values on these clocks.

Brian
