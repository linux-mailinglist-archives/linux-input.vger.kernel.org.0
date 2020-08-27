Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B647725416D
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgH0JEN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JEJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:04:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D934C061264;
        Thu, 27 Aug 2020 02:04:09 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kx11so2260483pjb.5;
        Thu, 27 Aug 2020 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kQIjPvNcruWdrhRT1Dcg3GsN3olXB1w8GX5PGyVfAGc=;
        b=X0CERTCNwahFGetwbkDcwpbax7bi81njvVK3YhQeTYQ1Ox53DBa53nrSRR+ByOe2NM
         SMfng7Z/7T9BiCJxPniaMBgWWOb4dQ4S4IRpAlqiG1KFHrLDD+pR0lZaPPTYxtyGSWeg
         6Y1Xe9/UwWF4h+HNraqFnKzlj+oUpgdgvjXGyuyMUk7+TwqaeCwcHj9ESNWxHctbn2xA
         LQ20v5Z8m06CxmD1UTZ6fywFBA/HMn+6Drre2hNAbVAINqjZzM79jkBoeUuac7mbXW3M
         GYoxD1LMQ/2Ib2zeTl45sjnHVOvbW5SlxWIxXRJpbpCqfJhN2Dj9CYJVlxFf5lm37T7l
         g7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQIjPvNcruWdrhRT1Dcg3GsN3olXB1w8GX5PGyVfAGc=;
        b=CEaAni0QkIZM5quqXQ4GFYXSaWhKLMF21biv/ZwRmUcoTTPgG87iT2u18qSRUI1/kj
         Enh0xjIJfRAcqCiwH+YBrEJ6pMMfFqnqKOHbnCq4uOJ7FrCJTleb/zhUk30kGQdvMJSF
         sAtU8mUza7pN3cClJJU+HmnWmgLI0ZTzBtJE5zTkaB2GSDaB92yy60iNvKx/VCgYdpUm
         Ww+mLEgvkTqbmA8UGa7HA0A9Ix3pzgrMfedzXLi5IzLtH4x3dUVRNTQF9TyKkMwhhRdo
         CTsCfqBcB6vx6aKbu6nxxyioOEClpCQ250BMcEHMWk4rdqZsKbQ3inREkOFWcvQ1K8jn
         47wQ==
X-Gm-Message-State: AOAM530SMJU2Ckh6uOYvId8XzPswicr6QjHRumUnBD/ISVh1Is0ikF+K
        oCspt4UFt/i60cVVNcGLBIavxIM9KjBoI0xLDO4=
X-Google-Smtp-Source: ABdhPJxtLGlvQf+9FVDIBVpN/W71XHXcPr5afe3Yg/33ozosb9y2WQz05PzzZ19bvqEjU98ctWB3AaL+/KljE7z035c=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr10132669pjz.228.1598519048706;
 Thu, 27 Aug 2020 02:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-4-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-4-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:03:52 +0300
Message-ID: <CAHp75Vey_w7m4TZM9+=df-FMO6YW5DiSMQsupZsMb92Awg_x1Q@mail.gmail.com>
Subject: Re: [PATCH 04/24] Input: gpio-vibra - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 9:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
>         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");

Can it be rather
  if (IS_ERR())
    return dev_err_probe(dev, PTR_ERR());
w/o err be involved?

>         vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
>         err = PTR_ERR_OR_ZERO(vibrator->gpio);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "Failed to request main gpio\n");

Ditto.


-- 
With Best Regards,
Andy Shevchenko
