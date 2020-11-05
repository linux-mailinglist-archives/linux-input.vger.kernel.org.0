Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71222A7895
	for <lists+linux-input@lfdr.de>; Thu,  5 Nov 2020 09:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgKEIJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Nov 2020 03:09:05 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43120 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEIJF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Nov 2020 03:09:05 -0500
Received: by mail-ed1-f67.google.com with SMTP id b9so551018edu.10;
        Thu, 05 Nov 2020 00:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VN2SNhST5biqDVcxltQIhYUxuznuc4xOUZgsRFlyXuE=;
        b=tyWBKbhe0Mtg8+k1yLlIW+EdnYFeHwrcOgNrwMmrdn8AYH1dCWSaG5KiSGtKPwfbcb
         zfCEBozp2pJ0LpXSJzQv+2osSP69j9jsacrJWAyrpFizVKzvcUC2B8AdlRobqKMXjAId
         EVJ9AWPiVBrgQXUe+dQJ2Q5EgjbF3GdR38U1cD/LSgHBY2GxJtsKd3RuWAjNkDT9yN4r
         bDJiqCZK2vWXGm6dsImJg8Un9c8Um1VstXkq6klY+Dc+pisE0hTPP/vCJgykzmKXhEx9
         ErPCNpPXxA59Gf1WmZ7+kIFv8Mmv9gALmcrtMuJJImoPcE0WZbkoQBMSLGtd/OnEA6Hw
         qpJg==
X-Gm-Message-State: AOAM530dDV8Kx38sNgTYqFEouYt32l0xo+wpGzEvPSV6jKJW6WyWuWKJ
        iYxq8MUBynd5tDestrcP7rg=
X-Google-Smtp-Source: ABdhPJxd+6Pg5alxWbpWPvEy7Y+00ctaABN4nx3GTEKIZ2UZaS3xKMNHx8vvlh5hhS/GKjlkhTS7Zg==
X-Received: by 2002:a05:6402:185:: with SMTP id r5mr1350938edv.263.1604563742891;
        Thu, 05 Nov 2020 00:09:02 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id a10sm416960edn.77.2020.11.05.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 00:09:01 -0800 (PST)
Date:   Thu, 5 Nov 2020 09:09:00 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3 v2] Input: atmel_mxt_ts - Fix up inverted RESET
 handler
Message-ID: <20201105080900.GA17235@kozik-lap>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104153032.1387747-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:30:30PM +0100, Linus Walleij wrote:
> This driver uses GPIO descriptors to drive the touchscreen
> RESET line. In the existing device trees this has in
> conflict with intution been flagged as GPIO_ACTIVE_HIGH
> and the driver then applies the reverse action by
> driving the line low (setting to 0) to enter
> reset state and driving the line high (setting to 1) to
> get out of reset state.
> 
> The correct way to handle active low GPIO lines is to
> provide the GPIO_ACTIVE_LOW in the device tree (thus
> properly describing the hardware) and letting the GPIO
> framework invert the assertion (driving high) to a low
> level and vice versa.
> 
> This is considered a bug since the device trees are
> incorrectly mis-specifying the line as active high.
> 
> Fix the driver and all device trees specifying a reset
> line.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch fixing this confusion before adding the
>   new YAML bindings.
> - CC some misc maintainers and mailing lists that should
>   be aware that we do this change.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
