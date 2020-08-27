Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019B0254181
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgH0JId (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgH0JIc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:08:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851E9C061264;
        Thu, 27 Aug 2020 02:08:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so2918304pgf.0;
        Thu, 27 Aug 2020 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i9X2UtVlBwzcXg8Ynim+xGN7j0zhHHAFE/jv+OARXLA=;
        b=O1WEm2RgVF4KMAyp/R7RMYzxFkBdRqyFdP5YXQB8JmhF5wIrIOedyLnxENAQy1TEY5
         Z34mH5MpnYlQF7VtpQHQAnEu87Pk6tEmEqEqgaQ5CYtl+w4YQEqCySUpgZfAFLlj5EAa
         /1v0q0Na0u+NBJLx6EtnFntpzgs35rsRjpuUpuw/uTDUD1OwpqlXyQdDztup2vB+P0VK
         BlF8Gg6djtUXOmG0BvbklaCLdpiWM3Ng55NuRb0/KLlurBJsqFlY1HK8UXjI55jbdoe4
         2S/pXfzXdQE8qqDNf0RjsVMBe75BOlEajSysboltkOhiD5EJfv/3L/QQZ8vh7KNSFOD4
         2fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9X2UtVlBwzcXg8Ynim+xGN7j0zhHHAFE/jv+OARXLA=;
        b=PbwSWMbzHuhorI1pqMIe9qioyT1Ra0/+Zh3pyfdLGP9W82uQOI1Dbp68cqkZ74aRt8
         hGJB+4u+5oGaIhKhjZ/nyK3noos64xAg4zca2aabkR2wjy9A/C03H5Qw58XfA6vgIqxa
         pVTz52XGDSFGK2qIjwJDpi1jEnJ4l2RrYcjC/OpHgY2cOCcomaMGxZTmmxO5rSa5Xur2
         SwTiBkE7k76hyjXCK2hFOC60ixUFChr9U1HrRME3w6DyjcdK47L9PgRNsJqG8XW1Y3kz
         LVMQmc56Qaol40sLtuu2ULGJvv+f/qsFhOruUmdpPwTL+VLoYd+GtNaPGkNowChWcQm3
         3GRA==
X-Gm-Message-State: AOAM5335CU0SiZcvLAVyUbWMJ17EpG0Pb03J3rDmC9gJz93x/Ga8UccA
        JuwiEQ7yEsjMuHJfqe6he7N+inH8HlmzgsXFekA=
X-Google-Smtp-Source: ABdhPJzeCQ5ewTW2aNXBMk9DzvNcEBXy71O7VWpUr6UWwiUL9QhgmJNIAuh8z2nJ2LmwPl2y6hWnamfnmFmp9ksz3Dc=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr13370105pgh.74.1598519312070;
 Thu, 27 Aug 2020 02:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-7-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-7-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:08:15 +0300
Message-ID: <CAHp75VdqgEvcs_LAHBV=O57vVMVrjUnfVr3anzJmtFMKYyeMkw@mail.gmail.com>
Subject: Re: [PATCH 07/24] Input: rotary_encoder - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/misc/rotary_encoder.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
> index 6d613f2a017c..ea56c9f4975a 100644
> --- a/drivers/input/misc/rotary_encoder.c
> +++ b/drivers/input/misc/rotary_encoder.c
> @@ -236,12 +236,8 @@ static int rotary_encoder_probe(struct platform_device *pdev)
>                 device_property_read_bool(dev, "rotary-encoder,relative-axis");
>
>         encoder->gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
> -       if (IS_ERR(encoder->gpios)) {
> -               err = PTR_ERR(encoder->gpios);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(dev, "unable to get gpios: %d\n", err);
> -               return err;
> -       }
> +       if (IS_ERR(encoder->gpios))
> +               return dev_err_probe(dev, PTR_ERR(encoder->gpios), "unable to get gpios\n");
>         if (encoder->gpios->ndescs < 2) {
>                 dev_err(dev, "not enough gpios found\n");
>                 return -EINVAL;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
