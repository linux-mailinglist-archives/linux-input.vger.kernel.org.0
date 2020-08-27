Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5613525417C
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgH0JHv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgH0JHu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:07:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D41C061264;
        Thu, 27 Aug 2020 02:07:50 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 2so2286270pjx.5;
        Thu, 27 Aug 2020 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekoTJ+wlAZFN+GzrxYCQ4Ixwm8SK1FJvBfOhc61WgDM=;
        b=GSFqgWPQRl5N3pPCbulo2oeEInSnQSiLWmy/aBArGMPRhHMmtQEdSI/Br1qBcFKubi
         krJp7NAF6/1VErWdvAg8YcXgIUWkfh2luBaqJousRKlnpjr3St0aDoXu+Bd3/0XGJZ7g
         5LZPSlHbTtv+MkV79LBDvkkYSOfPVxIevShjxYGa45zhkxTQqAeKWOD3K+MBeL45BZt/
         n/e68azZEDZIgK6km3DEvnKxJerz1+tfWAJVw5ooYvxLNxSkZPFyhEv5ylh8SsXr7qRh
         AUgh1/v2cWdQYNGmpGlG3bTyBXcNKh/+FLOu/JXqm6OwhJzKNbYAOh3lvpF3KnLKkQep
         viTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekoTJ+wlAZFN+GzrxYCQ4Ixwm8SK1FJvBfOhc61WgDM=;
        b=p7D4i+ibSYqzO5iVhsyaPnCLl5B4BdLGI4nchzW2i5xJtNWAx5mGxj43ZvLhRaRq64
         dFB+4O1Mx7kZ63Q7TJbSQyjahkG6+V5txrF7wmRJRfTk0pGI4R9WZ7PFdJV9aasb/98k
         /xZ4gL2SKqRGGhZQUnLoRCBN3/bR0e6uyMFi+0KtrYAbqaYBbfja94Erx4p8rJVgqG8D
         hcIemr4skVKyDyfiEq+IJiiNFNLvpJ4SvdHlBAnaNvQgxoN6tfaVG38nETdDPWr6XA6x
         DYdTBpfju8dpngYKhTJoy2ikI9ZjabeSaUm80TzVKFMAqwv2yvfqbVeb/RNjoriF3jpG
         BnOQ==
X-Gm-Message-State: AOAM532RVQol9zYhTooMWSWzozZ7Pj9YFwU4gdqV/oN4pxzNQeA8RUi3
        q87vgKa/izqfFnN1ggxr6806NhbXprVe2zHEm2e/mpoHeHxxhC/f
X-Google-Smtp-Source: ABdhPJzEU6uLULOEJGGOBw8BvM1p0rrcGxz3Eb4wkZ7wRZiZHq+BTV1F6ByWVqB5HzJP7yca8TjkBvUWw4e42bHUuBQ=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr9436007pjb.181.1598519269631;
 Thu, 27 Aug 2020 02:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-5-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-5-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:07:32 +0300
Message-ID: <CAHp75VdPm2C_PzN7jXrNsCMf55R8ZkSwyxM3-GPTdJyL8+5EFA@mail.gmail.com>
Subject: Re: [PATCH 05/24] Input: pwm-beeper - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/misc/pwm-beeper.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
> index d6b12477748a..8c0085e8c552 100644
> --- a/drivers/input/misc/pwm-beeper.c
> +++ b/drivers/input/misc/pwm-beeper.c
> @@ -132,13 +132,8 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         beeper->pwm = devm_pwm_get(dev, NULL);
> -       if (IS_ERR(beeper->pwm)) {
> -               error = PTR_ERR(beeper->pwm);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request PWM device: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(beeper->pwm))
> +               return dev_err_probe(dev, PTR_ERR(beeper->pwm), "Failed to request PWM device\n");
>
>         /* Sync up PWM state and ensure it is off. */
>         pwm_init_state(beeper->pwm, &state);
> @@ -151,13 +146,9 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>         }
>
>         beeper->amplifier = devm_regulator_get(dev, "amp");
> -       if (IS_ERR(beeper->amplifier)) {
> -               error = PTR_ERR(beeper->amplifier);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get 'amp' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(beeper->amplifier))
> +               return dev_err_probe(dev, PTR_ERR(beeper->amplifier),
> +                                    "Failed to get 'amp' regulator\n");
>
>         INIT_WORK(&beeper->work, pwm_beeper_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
