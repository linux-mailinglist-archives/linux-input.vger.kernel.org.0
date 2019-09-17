Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEC4B56E2
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 22:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfIQU0I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 16:26:08 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38765 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfIQU0I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 16:26:08 -0400
Received: by mail-oi1-f195.google.com with SMTP id 7so4057737oip.5;
        Tue, 17 Sep 2019 13:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LE6muq6DF6isoZR/jFwLhHoNo1OQsllS8+mpGqFMlcI=;
        b=qsWGGK0jpwo2WoUgAUlCYEjWfOU8pLwxRCHLp3P1rk90uCwh+vHu0Q6SvV2lm96PRP
         Lk3Nc9J7iBKfUBLVmx4uj3e3q0Jfy5TaAxUyMolU8zXDm99JGIIRJP+QGOPWQS54sQdb
         PlRYrgdEAi4eqN9ORNo8uNm5FRbmZ+7+k01Bp8bC8+OFEdpstvOVEzEQfNLITTUINzj3
         v4DNZb9qWML0ZVJZSaIiOlYaCgpA3CJYGx5xdN4a8Oasndq9UuqufDOifICak0EIhpZD
         DX5KrzoOM1B4WlRZ++LCTcb/xt2LC8yTmuhEVDs1GTfQpFDTiraF/KDvGQuqp/F1qJVD
         EL7A==
X-Gm-Message-State: APjAAAXLA+3qDEZEyd44Hcwd7tsyyfM/iKCraJujh2h+4/tWGbzGoTwh
        Nqc3eDZEfDCBXKGJipqQvQ==
X-Google-Smtp-Source: APXvYqz9R0jVNNt++vA8IX57/Plgke+2Op/5SKkfm76NEAH8w/fGzSLq8DkTcIvLsJPOensO7/vbJg==
X-Received: by 2002:aca:ba57:: with SMTP id k84mr4970810oif.167.1568751966435;
        Tue, 17 Sep 2019 13:26:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v132sm1137445oif.34.2019.09.17.13.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 13:26:05 -0700 (PDT)
Date:   Tue, 17 Sep 2019 15:26:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190917202605.GA8121@bogus>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
 <20190826220022.GA7663@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826220022.GA7663@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 26, 2019 at 03:00:22PM -0700, Dmitry Torokhov wrote:
> Hi Linus,
> 
> On Fri, Aug 23, 2019 at 09:10:21AM +0200, Linus Walleij wrote:
> > This switches the TSC2007 to use a GPIO descriptor to read
> > the pendown GPIO line.
> > 
> > As this will make the gpiolib start to respect polarity
> > inversion flags on the GPIO lines, drop the inversion when
> > reading the line with gpio_get_value(), fix two offenders
> > in the i.MX device trees, and also emphasize the importance
> > of marking the polarity right in the device tree bindings.
> > 
> > Cc: Denis Carikli <denis@eukrea.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Drop inversion on the GPIO descriptor value, rely on the
> >   gpiolib to handle polarity inversion.
> > - Comb through device trees, identify two offenders, fix
> >   them as part of the patch for a clean cut.
> > - Also fix the device tree bindings.
> > ---
> >  .../bindings/input/touchscreen/tsc2007.txt         |  5 +++--
> >  arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |  3 ++-
> >  arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi       |  3 ++-
> >  drivers/input/touchscreen/tsc2007.h                |  4 +++-
> >  drivers/input/touchscreen/tsc2007_core.c           | 14 +++++++-------
> >  5 files changed, 17 insertions(+), 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> > index ed00f61b8c08..b08b54d49699 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> > @@ -7,7 +7,8 @@ Required properties:
> >  
> >  Optional properties:
> >  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> > -  The penirq pin goes to low when the panel is touched.
> > +  The penirq pin goes to low when the panel is touched, so make sure to tag
> > +  the GPIO line with GPIO_ACTIVE_LOW.
> 
> I think this is too strong. I am sure that one can come up with a way to
> connect the attention signal though polarity inverter and then one would
> have to specify GPIO_ACTIVE_HIGH in the DT.
> 
> Can we say:
> 
> The penirq pin goes to low when the panel is touched, so GPIO line
> should normally be tagged with GPIO_ACTIVE_LOW.

Acked-by: Rob Herring <robh@kernel.org>
