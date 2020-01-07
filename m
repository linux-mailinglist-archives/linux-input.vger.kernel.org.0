Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C44132591
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 13:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgAGMDT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 07:03:19 -0500
Received: from onstation.org ([52.200.56.107]:59186 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgAGMDT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 07:03:19 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C829B3EE6F;
        Tue,  7 Jan 2020 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1578398598;
        bh=G1NgPRmqbaXrZt93MHof7xiFvsWe6mnmfknmDsCSABw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GA0fdnhnOSDm5j34rjSDsYJaMexcgJedMapRAkvYbkjiOTfLhhDYqXNnvO57AAsK1
         kDxUvPA5pzm4TWkzT+gSXhXnYN7pB+YqvFyQvCrwhdx59Vi9S1z2O4Pnc+JBa1MprS
         bu2enSjcwniB+kfLJFfY8gNVtjf6Ew9/NeesMMq0=
Date:   Tue, 7 Jan 2020 07:03:17 -0500
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
Message-ID: <20200107120317.GB8083@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
 <20191205002503.13088-5-masneyb@onstation.org>
 <20200105083534.01EB12071A@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105083534.01EB12071A@mail.kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 05, 2020 at 12:35:33AM -0800, Stephen Boyd wrote:
> Quoting Brian Masney (2019-12-04 16:25:00)
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    vibrator {
> > +        compatible = "clk-vibrator";
> > +
> > +        vcc-supply = <&pm8941_l19>;
> > +
> > +        clocks = <&mmcc CAMSS_GP1_CLK>;
> > +        clock-names = "core";
> > +        clock-frequency = <24000>;
> > +
> > +        enable-gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
> > +
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&vibrator_pin>;
> 
> I'm still trying to wrap my head around this. I think we can have a pwm
> provider in a clk controller node (so imagine &mmcc has #pwm-cells) and
> then this 'clk-vibrator' binding wouldn't exist? Instead we would have
> some sort of binding for a device that expects a pwm and whatever else
> is required, like the enable gpio and power supply. Is there an actual
> hardware block that is this way? Does it have a real product id and is
> made by some company? Right now this looks a little too generic to not
> just be a catch-all for something that buzzes.

So have some of the Qualcomm clocks like this one register with both the
clk and the pwm frameworks? I feel that approach would better represent
the hardware in device tree.

If we did that, then the pwm-vibra driver in the input subsystem could
be used.

Brian
