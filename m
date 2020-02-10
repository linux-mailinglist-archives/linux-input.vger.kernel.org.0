Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8770C157E5B
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 16:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgBJPHq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 10:07:46 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33942 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbgBJPHq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 10:07:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so9491916oig.1;
        Mon, 10 Feb 2020 07:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=99IjyZRCichdgCW3F/3u8MhsTEbiC4zT5SHMd3xW+xg=;
        b=VSk3o9uSqPwNbim3N5mwMt3+CHVX1QgeGm7Gbd98BFccdZdehY661UGQtC3YVtH2BI
         Z0wIsQfj7JKVdv1yT8eVg0Xehx35skmMpDWhKak5wgXYe8OcqPnfMwcIsTLJw7d2gjRc
         YNZggpLtzc50ekKjePNl8P59f9yNZ8eC7RmE2c0Davv1BjHV8aUHkyhNUgUTPj2y/WE9
         oxwZPaAeQTQY5nRxnMbv1SRG7xFkUiimBYFCiXCwsVimUSVOWt+KfjQW0nxuiB6js8hf
         CLzCiCyL82mmDV/hBXwtvzCPTP134FddTbESTTf+zk6fHBtjqP+FT/1V0FazGZ0RUDEq
         h8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=99IjyZRCichdgCW3F/3u8MhsTEbiC4zT5SHMd3xW+xg=;
        b=S/+7VagDaL+gcw5Da/r6QLcsE72ep8dWkFXvE04+PZ7m8ot1BpThZw/qca3/s2e0o9
         shgXx05ugdF1cJJhbuSmE/jxnEbtAzu1rNOcUIOcDKBa/yn1Q7Fcpon2MsI+5QkON4GF
         0KeJ9jcy4xwPyiqbnlqIBmochZRFNT2wJot5A43XWlIYHhriwiqAT+jxWt+V1fb2UlDb
         9hFWsw8+t37sMKPklsVrIaYn1ciZ+w6J6f616YKkVhm+rJyvacmuV8wCY9Y/pu+E5bGz
         A/gd66wsYzUt3XxrRuySgKBsBleOIr76JKsn/lZERz+q19QDEtIfrQa/wD84wRu2x0ES
         Mukw==
X-Gm-Message-State: APjAAAUdRanJNfNBDmMMHb+0ZKZlpZQLla/u0Xes3eGjDCbQUSl7af34
        vQfjWXyi2N+KNAkXvKqNGkXFZMW8wudzt9X+1bo=
X-Google-Smtp-Source: APXvYqx9oJ3ga7VEkKCfniKF8/qnSx9m2zXpK2xfK2762sShhrAC/pVKFQ5DqsAH9QWDxPtLsK+gMJLYqJJkkYdPYrA=
X-Received: by 2002:aca:a98c:: with SMTP id s134mr1116659oie.77.1581347265131;
 Mon, 10 Feb 2020 07:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20200209145628.649409-1-luca@z3ntu.xyz>
In-Reply-To: <20200209145628.649409-1-luca@z3ntu.xyz>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 10 Feb 2020 10:07:34 -0500
Message-ID: <CAGngYiUCC10epFwLO7wXMT-ko2g-zXRDecMwaK5=Y4nCCHHVEw@mail.gmail.com>
Subject: Re: [PATCH] Input: ili210x - fix return value of is_visible function
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Luca,

Good catch. That's what happens when I post a patch I can't test :)

Reviewed-by: Sven Van Asbroeck <TheSven73@gmail.com>

On Sun, Feb 9, 2020 at 9:58 AM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> The is_visible function expects the permissions associated with an
> attribute of the sysfs group or 0 if an attribute is not visible.
>
> Change the code to return the attribute permissions when the attribute
> should be visible which resolves the warning:
>
>   Attribute calibrate: Invalid permissions 01
>
> Fixes: cc12ba1872c6 ("Input: ili210x - optionally show calibrate sysfs attribute")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/input/touchscreen/ili210x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 37526baff8a6..199cf3daec10 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -351,7 +351,7 @@ static umode_t ili210x_calibrate_visible(struct kobject *kobj,
>         struct i2c_client *client = to_i2c_client(dev);
>         struct ili210x *priv = i2c_get_clientdata(client);
>
> -       return priv->chip->has_calibrate_reg;
> +       return priv->chip->has_calibrate_reg ? attr->mode : 0;
>  }
>
>  static const struct attribute_group ili210x_attr_group = {
> --
> 2.25.0
>
