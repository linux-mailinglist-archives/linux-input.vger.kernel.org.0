Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 165789D8C8
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 00:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfHZWA1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Aug 2019 18:00:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42798 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfHZWA0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Aug 2019 18:00:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id p3so11381046pgb.9;
        Mon, 26 Aug 2019 15:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QundPzgYfC/K73sFx47R4ZcLhuZTaRK8uTxQax5u8J8=;
        b=bH1h97nB8UQXZo1Akpx6/6dRrbOsMc4EWh45viwTK88KkkOt7rroHS5cpC4nmwdvXu
         0zidSiMECchfEMwIamoVHDvsVJM9WuLKacA0w6TZTC5qXSAkH6NYzvUeGsvH07rRuW0X
         ELRYlgkaKChO1eGdgrzA5xWxSnQlahdeVtFVkvXDR6N1uu32EFjDYmJJJeikxR8UBJ3b
         L+LVy/uMhaT6c8wRFXanroLx50hz9kiouOTNQllmON8T4G3k+uyGuNhDkCgwT6unB/+D
         u6iI0CIQqjqD+DqT6ig4S89w5PQDXOD6M91Di2YUmxzVgwxREk1KXEGvS4BzMrVabfq5
         Z2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QundPzgYfC/K73sFx47R4ZcLhuZTaRK8uTxQax5u8J8=;
        b=oPuygbL0Rlt6hSRKgtcBaCShMemclLZM4qmwv5g81iTlaOVC5bY4M2Cw/SsnjeedpV
         CQE75ZxQFiXO2fNtvRpF9rwFagryDr4yVh+wogoVayQk8Ja/307Qr8kNuVVj7pJnYuoi
         ndd4UisYApBHACzPDeYN+KnpStOY7lLApdU8fnjH+hzDfzkRTR6rBdoFxdJ3PnZ7zPtk
         eT6W3+nv+TPB/uG5hvoFtcQNn4eLnQ2cIAZ60vem6CEHIl/smh3iexmsBPLn8yCNGMKb
         8759EboNGM12SVrd+GFQjSmoPazaSWhaBDxtngq7QzTuWJ1eJpklW3lYKA+4uIX/c6QZ
         d27w==
X-Gm-Message-State: APjAAAWPDFi292Xquvm69pA+xjmCxLq97soqq8I5m91/D0/ZBnwon9hC
        +ZO4Zf4x7jaSU7m+UeocMO4=
X-Google-Smtp-Source: APXvYqzWxoRcFFhqCWqeVbZS+EnvG3Nk1HyugsCQ5YnNomlIVcOQgAanuXy6QByI5JLqwPLVGiUZPA==
X-Received: by 2002:a65:5043:: with SMTP id k3mr5303984pgo.406.1566856825427;
        Mon, 26 Aug 2019 15:00:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b18sm5474156pfi.160.2019.08.26.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 15:00:24 -0700 (PDT)
Date:   Mon, 26 Aug 2019 15:00:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190826220022.GA7663@dtor-ws>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823071021.5598-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Fri, Aug 23, 2019 at 09:10:21AM +0200, Linus Walleij wrote:
> This switches the TSC2007 to use a GPIO descriptor to read
> the pendown GPIO line.
> 
> As this will make the gpiolib start to respect polarity
> inversion flags on the GPIO lines, drop the inversion when
> reading the line with gpio_get_value(), fix two offenders
> in the i.MX device trees, and also emphasize the importance
> of marking the polarity right in the device tree bindings.
> 
> Cc: Denis Carikli <denis@eukrea.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop inversion on the GPIO descriptor value, rely on the
>   gpiolib to handle polarity inversion.
> - Comb through device trees, identify two offenders, fix
>   them as part of the patch for a clean cut.
> - Also fix the device tree bindings.
> ---
>  .../bindings/input/touchscreen/tsc2007.txt         |  5 +++--
>  arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |  3 ++-
>  arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi       |  3 ++-
>  drivers/input/touchscreen/tsc2007.h                |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c           | 14 +++++++-------
>  5 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> index ed00f61b8c08..b08b54d49699 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> @@ -7,7 +7,8 @@ Required properties:
>  
>  Optional properties:
>  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> -  The penirq pin goes to low when the panel is touched.
> +  The penirq pin goes to low when the panel is touched, so make sure to tag
> +  the GPIO line with GPIO_ACTIVE_LOW.

I think this is too strong. I am sure that one can come up with a way to
connect the attention signal though polarity inverter and then one would
have to specify GPIO_ACTIVE_HIGH in the DT.

Can we say:

The penirq pin goes to low when the panel is touched, so GPIO line
should normally be tagged with GPIO_ACTIVE_LOW.

Thanks.

-- 
Dmitry
