Return-Path: <linux-input+bounces-709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF7980E563
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 09:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4146C2816D0
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 08:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744C718037;
	Tue, 12 Dec 2023 08:02:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DF4A0;
	Tue, 12 Dec 2023 00:02:01 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso1790793276.1;
        Tue, 12 Dec 2023 00:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368121; x=1702972921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjnHuBn/sh8CWIcWiOxIEa34FZ6IyXTSmbDfg8QhKyM=;
        b=sPD5mMyfs7ro6kr/xKE0vMQ3L0RYGIfWEqn7BwSE4sqHY7YOBJZG2h4pDNOAKgd/pS
         cO6P7nk0mKVtOufsJCO0BfuyMxytCJosvVWctP1/ICiFjHKor1bITzcXsEOSvtDQbBve
         UezQCbe3FdeSLivyWpMCGmCqM/dHvGHGr9UleapreQKq30h1c7IckpdudYJEVWu1IINK
         SuBBhrrzRi4N8z9WL/1k3EfXXjh1rP3KLBhGnVAB1IJHnL5NWWTjG+btBUETL8qz3QZz
         lS1zUzeqW+be+8I/C6ZjUFfVqdEwQx3nz64KUZIysCh1EkR3+i2dJfvAH+z1xSQlOsv0
         1+6g==
X-Gm-Message-State: AOJu0YzyMwD1INvIHqCweaOxq1hUru+YvuJevcsh5zbXFbnSJemDrXDP
	S5z6z6p/fevQQUUWh2SWU5hf0l32B2iRhg==
X-Google-Smtp-Source: AGHT+IF2e/Fov3My0EOuHH985V1mg9OYHbqnRET84fgK4LcM1KrsWruWcBtFRN3SOcplmC8zvPzdPA==
X-Received: by 2002:a25:9d09:0:b0:db7:dacf:3f9c with SMTP id i9-20020a259d09000000b00db7dacf3f9cmr3616624ybp.73.1702368120853;
        Tue, 12 Dec 2023 00:02:00 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id f1-20020a056902038100b00db5331d70d5sm3030036ybs.33.2023.12.12.00.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:02:00 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5b383b4184fso47757837b3.1;
        Tue, 12 Dec 2023 00:02:00 -0800 (PST)
X-Received: by 2002:a05:690c:300b:b0:5e1:7ac3:34bb with SMTP id
 ey11-20020a05690c300b00b005e17ac334bbmr1238801ywb.42.1702368120157; Tue, 12
 Dec 2023 00:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com> <20231211165708.161808-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231211165708.161808-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 09:01:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
Message-ID: <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, linux-input@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Dec 11, 2023 at 5:57=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Replace dev_err()->dev_err_probe() to simpilfy probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/input/misc/da9063_onkey.c
> +++ b/drivers/input/misc/da9063_onkey.c
> @@ -185,10 +185,9 @@ static int da9063_onkey_probe(struct platform_device=
 *pdev)
>
>         onkey =3D devm_kzalloc(&pdev->dev, sizeof(struct da9063_onkey),
>                              GFP_KERNEL);
> -       if (!onkey) {
> -               dev_err(&pdev->dev, "Failed to allocate memory.\n");
> -               return -ENOMEM;
> -       }
> +       if (!onkey)
> +               return dev_err_probe(&pdev->dev, -ENOMEM,
> +                                    "Failed to allocate memory.\n");

Please drop the error printing instead, the memory allocation core
code already takes care of that in case of OOM.

>
>         onkey->config =3D device_get_match_data(&pdev->dev);
>         if (!onkey->config)
> @@ -197,19 +196,17 @@ static int da9063_onkey_probe(struct platform_devic=
e *pdev)
>         onkey->dev =3D &pdev->dev;
>
>         onkey->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> -       if (!onkey->regmap) {
> -               dev_err(&pdev->dev, "Parent regmap unavailable.\n");
> -               return -ENXIO;
> -       }
> +       if (!onkey->regmap)
> +               return dev_err_probe(&pdev->dev, -ENXIO,
> +                                    "Parent regmap unavailable.\n");
>
>         onkey->key_power =3D !of_property_read_bool(pdev->dev.of_node,
>                                                   "dlg,disable-key-power"=
);
>
>         onkey->input =3D devm_input_allocate_device(&pdev->dev);
> -       if (!onkey->input) {
> -               dev_err(&pdev->dev, "Failed to allocated input device.\n"=
);
> -               return -ENOMEM;
> -       }
> +       if (!onkey->input)
> +               return dev_err_probe(&pdev->dev, -ENOMEM,
> +                                    "Failed to allocated input device.\n=
");

devm_input_allocate_device() only fails on OOM, so no need to
print anything.

>
>         onkey->input->name =3D onkey->config->name;
>         snprintf(onkey->phys, sizeof(onkey->phys), "%s/input0",
> @@ -221,12 +218,9 @@ static int da9063_onkey_probe(struct platform_device=
 *pdev)
>
>         error =3D devm_delayed_work_autocancel(&pdev->dev, &onkey->work,
>                                              da9063_poll_on);
> -       if (error) {
> -               dev_err(&pdev->dev,
> -                       "Failed to add cancel poll action: %d\n",
> -                       error);
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&pdev->dev, error,
> +                                    "Failed to add cancel poll action\n"=
);

devm_delayed_work_autocancel() only fails on OOM, so no need to
print anything.

>
>         irq =3D platform_get_irq_byname(pdev, "ONKEY");
>         if (irq < 0)
> @@ -236,11 +230,9 @@ static int da9063_onkey_probe(struct platform_device=
 *pdev)
>                                           NULL, da9063_onkey_irq_handler,
>                                           IRQF_TRIGGER_LOW | IRQF_ONESHOT=
,
>                                           "ONKEY", onkey);
> -       if (error) {
> -               dev_err(&pdev->dev,
> -                       "Failed to request IRQ %d: %d\n", irq, error);
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&pdev->dev, error,
> +                                    "Failed to request IRQ %d\n", irq);

platform_get_irq_byname() already prints an error message on failure.

>
>         error =3D dev_pm_set_wake_irq(&pdev->dev, irq);
>         if (error)
> @@ -251,11 +243,9 @@ static int da9063_onkey_probe(struct platform_device=
 *pdev)
>                 device_init_wakeup(&pdev->dev, true);
>
>         error =3D input_register_device(onkey->input);
> -       if (error) {
> -               dev_err(&pdev->dev,
> -                       "Failed to register input device: %d\n", error);
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&pdev->dev, error,
> +                                    "Failed to register input device\n")=
;

Looks like all non-OOM failure paths in input_register_device()
already print an error message, too...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

