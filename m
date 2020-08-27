Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2E32541AE
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgH0JN1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0JN1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:13:27 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA3AC061264;
        Thu, 27 Aug 2020 02:13:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kx11so2272433pjb.5;
        Thu, 27 Aug 2020 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XXHXhpBAgNDDc+VXuNGIg5n4cnOPdCwxQ4cIoKblPCA=;
        b=F9IbqEsDjQtkoHhwFuwj9yOAvQN450AiQ9aP0i81Q2tkrR+acBSZSV6d83xqhmFeCr
         aXiT49+rrw5qdUAAcMffg5iBuMhYdAdOMUINZa2xc7AB4RyB24I1CD1gEYK5WmOBnT6N
         692qZguEo309RgeDrcQkABcnMN2Y9WXrIANCcni0xdrAgmWOW7O14T5Cos4UOOLHYU5R
         5Utjyxnjj8o4gqjXy6gA7vpVoq+Rn1U4BS+kje9kMrK6oaWtTEeVZKw+l5OdLJ5XsnpO
         pPGC/LgMCN5vED0LfDwEbIbuolCo86mC2+n/5oEKif5hHi4uHW+NMWNfKI0s3HEEsrG4
         mW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXHXhpBAgNDDc+VXuNGIg5n4cnOPdCwxQ4cIoKblPCA=;
        b=WBw+zUzr1Q8GBvr3H12UZf9jBimzVxfZ8o5Gm/STFvMla+Acb6+dh/lRi1SVyG8VLK
         GuEw+2Z15kkwTB8P2WkrdL4tGi6X66yPtXJjX3Js3s8p3JnQv3ZfKvcz7Gbpg/+o5LOF
         akVTc5J5rR+lRNvQ7d3bXb3AGaFTT4HFb/6z3DGtqoF4jc1Tjk6drVt7CrymSG818DL4
         Q9bpAEMRIkHl1c7lQoiSOpsR66ku77JqF0Twc5CjEmFPhqHxqzOy8fVZ/aRm1qC1agS4
         czMe5tjrxQm1ni2Tu7pU0amG1dy8sJQ6p9RElGe9drDHjvwjQwcn9KSBi145bddOOr9c
         QXhQ==
X-Gm-Message-State: AOAM531bUb3hwnJxgk9P38Pks9F+MsyLhzipbcksPGx7PvtNHtI6qbqb
        l2B5QEeopbaaIieZ6oWp8CSpg9RsFYcOCZiz7XjLDXjbcc1/eMcX
X-Google-Smtp-Source: ABdhPJzmwYnqVXuyvxbV/uRaX68QFTVLR+JvoCqtQ7m9YSoAvIUo0xVLN+o8m/6YMTkqTTOsf7IaLz06obiCkNmCc3A=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr10163144pjz.228.1598519606355;
 Thu, 27 Aug 2020 02:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-15-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-15-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:13:09 +0300
Message-ID: <CAHp75Vef81HYbXdi=KYUM+9c-g9XoQ4tXjQ_VLr_1t9QWL2Vtw@mail.gmail.com>
Subject: Re: [PATCH 15/24] Input: elants_i2c - Simplify with dev_err_probe()
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

On Wed, Aug 26, 2020 at 9:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index b0bd5bb079be..ad299eb333f1 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1245,24 +1245,14 @@ static int elants_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, ts);
>
>         ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
> -       if (IS_ERR(ts->vcc33)) {
> -               error = PTR_ERR(ts->vcc33);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vcc33' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vcc33))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vcc33),
> +                                    "Failed to get 'vcc33' regulator\n");
>
>         ts->vccio = devm_regulator_get(&client->dev, "vccio");
> -       if (IS_ERR(ts->vccio)) {
> -               error = PTR_ERR(ts->vccio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vccio' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vccio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
> +                                    "Failed to get 'vccio' regulator\n");
>
>         ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ts->reset_gpio)) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
