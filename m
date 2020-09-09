Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC002636DE
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgIITtD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 15:49:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728443AbgIITtB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 15:49:01 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3152F20897;
        Wed,  9 Sep 2020 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599680941;
        bh=3R4p8duQAT+mum6skAEpmvoigfKOvgfHvzziJedrzsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cngdoWqB0m7T3YZTw8yhmP8HVpL42lJfhHjKPl6iKwXlcysC9yVoSgLyCb1ePrl3E
         BUY2AdLMlKTSPGZGTr4yrxbtoD2XuK8c6/ziHyVO1k/UN8Sko4Kv0Uf91WTWwoAlv6
         8jE3C0g4ilFlJR9x53vuytj+/tdfdI6K46Lx4Cy4=
Received: by mail-oi1-f179.google.com with SMTP id w16so3604469oia.2;
        Wed, 09 Sep 2020 12:49:01 -0700 (PDT)
X-Gm-Message-State: AOAM531uL0wrc2avsK2eUP2ayClujZgVnCpN7+6Mc6RJB3WnjjmGj06s
        rNPIwG5Ti0EXvc1Fwasu1ayw81EFVcQoATqJww==
X-Google-Smtp-Source: ABdhPJwmIIBieKiBgKub6+sUhN3HdNG5Hc7zk9mdSoIcxBQpfCH6k9NzxOLwcnl+EX589Mqy/1Z66dzbrHuoNlpsPeI=
X-Received: by 2002:aca:4cc7:: with SMTP id z190mr1720504oia.147.1599680940504;
 Wed, 09 Sep 2020 12:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200907204045.95530-1-sebastian.reichel@collabora.com> <20200907204045.95530-4-sebastian.reichel@collabora.com>
In-Reply-To: <20200907204045.95530-4-sebastian.reichel@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 9 Sep 2020 13:48:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8E4Y-kaksCXBC=_sEf4Nz8bZr-4=_g5_PjWtQJm8jsA@mail.gmail.com>
Message-ID: <CAL_JsqJ8E4Y-kaksCXBC=_sEf4Nz8bZr-4=_g5_PjWtQJm8jsA@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] Input: rotary-encoder - Use dev_err_probe
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 7, 2020 at 2:40 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Simplify driver a bit by making use of dev_err_probe.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/input/misc/rotary_encoder.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
> index e9a5dbb10513..16ad86fad7cb 100644
> --- a/drivers/input/misc/rotary_encoder.c
> +++ b/drivers/input/misc/rotary_encoder.c
> @@ -241,12 +241,8 @@ static int rotary_encoder_probe(struct platform_device *pdev)
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

I hadn't seen dev_err_probe...

Just FYI, I'm working on a different fix here which is to print errors
in the subsystems instead. We already do this for IRQs, so why not
everything else? The original reason was no resource is sometimes not
an error, but now we have *_optional calls to handle this case for
most all subsystems. It's a coccinelle script (hacked up from
platform_get_irq.cocci) to convert all the drivers.

Rob
