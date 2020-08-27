Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD050254187
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgH0JJ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgH0JJ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:09:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB24C061264;
        Thu, 27 Aug 2020 02:09:27 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z18so2298956pjr.2;
        Thu, 27 Aug 2020 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VMaFRTymEFwBHV3SyEmzpViQA2+oP8cVTUBnkZRPOI=;
        b=K7BJTksci2A0/LmRa1/Ye4ngvU7hfSfev083IqpAgOCotQASo/wvQpHw7zs5nysa1j
         fASnoDo7SyP02j45sLfILraQStGzM8eKHhzusfe+HtpAItQIl/rla0vYZfr+Nz19aMYC
         F+cktHb/7l6hTkvkQgqwaXAYaGnW05ZTj8EHnlDY/PQUv1tEhbeN5N9q1AcB3XRQ6h68
         bZzjdK1XpsOAGw9YIwCQmZtGhymVaPu0o8uoQIHsDUutQmGJrpASeBuhB9uTLxSb0WRx
         eP62ogRQoo79RJjiJH3UURDI7WmsiIv4NdlhiUqO/2l1YxU6sPHRenBvuA+NRdjnRIo5
         L+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VMaFRTymEFwBHV3SyEmzpViQA2+oP8cVTUBnkZRPOI=;
        b=KAEHN/ZeUhYrgSEgXXpKXxnidfz7dInO+0HvVPTYLiz7bUx1kkv/McNSEolQCYNHdy
         3Sq0zGn54OtK8zrvkGKiObPcLka2+1AJ9p0epUAAGggXx9KFjGWtt/PP7FH7DY4ibsKD
         Wz0Q0FUy5c+l4+umI7vPvhwq+0rc2F0Ll/vqP9xjFM61wAnl2ides8LvNKeLMFTQcBVM
         +zD8HSmgrX1er5BxoAyw3hisqT4bU5cPjSWc2fU/0KiWtCC7cmdeow6wf6dk6IyL3UJw
         seQ8MLoOyLPTclwvwgwcXeggn2CUsYOZLspjQ0bKIC+VqjocWDyx3zeY72re+t/6vwbf
         flTg==
X-Gm-Message-State: AOAM530Dx7yzdYfg4bM9xTDUcMHf7Hx1Rdc2aVX09VhtkBMu17K/77Za
        hzqm940f/R9XTT9kJ46UJGmgyZ2CjCCnP/kFvPk=
X-Google-Smtp-Source: ABdhPJxspzxvk5FlKjU3UUD5cxyqBKQtxciAZ8Vma0ORrBpFB5I/XMw6z4qylE00vcae9sOmk7f1hY8OFsZNkBMeRE4=
X-Received: by 2002:a17:90b:509:: with SMTP id r9mr10150414pjz.228.1598519366933;
 Thu, 27 Aug 2020 02:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-8-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-8-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:09:10 +0300
Message-ID: <CAHp75Vedvy73_uSoKpm=w2sgSWX8kzejhYF4Azc6Vh4T7hXEmg@mail.gmail.com>
Subject: Re: [PATCH 08/24] Input: elan_i2c - Simplify with dev_err_probe()
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index c599e21a8478..d703b0d5a3bd 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1229,13 +1229,8 @@ static int elan_probe(struct i2c_client *client,
>         mutex_init(&data->sysfs_mutex);
>
>         data->vcc = devm_regulator_get(dev, "vcc");
> -       if (IS_ERR(data->vcc)) {
> -               error = PTR_ERR(data->vcc);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(data->vcc))
> +               return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
>
>         error = regulator_enable(data->vcc);
>         if (error) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
