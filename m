Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3D5299532
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 19:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784573AbgJZSYS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 14:24:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33245 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1784549AbgJZSYS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 14:24:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id l20so5752588wme.0;
        Mon, 26 Oct 2020 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=etvGadW+3Q8LgTJlwqBN3viqL9TDU3OPQW5Mj92hM1M=;
        b=qLXPG59Gsqt6ffBX+s9FGywFCFRT0zE8R13zd7HwUYgijswWoDpF1+vlhjm+1ugFy2
         5L0d3I9u7f5H+lrBF/Sz6T3p+d210t/EerXOhoVshoDA0jSjvaJQxWxmHEAfknVJb52j
         RKAssGt+lmq1obeLlddpx8KDPBf5eautdn5/iArOGB4vGZ9AN2zfn07tx+B5cKmRV1/U
         QoQZtIl5lslAuBh9KcmEEGJOYNCej+AeOaePm5cTYTOLeL3BjTvnD1hsDSp152NyFVTz
         /+7IULo/SGTFPcGJKvKdF/30yPY2wGJiV3wWU6q9EMzx0csN3wyJlrJVz57mHQUneXWl
         9+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etvGadW+3Q8LgTJlwqBN3viqL9TDU3OPQW5Mj92hM1M=;
        b=gPC5WRYKJo/2kZBGayPHYGUX2PQXR6VomQDKJOhFbJY815h9f/Utrluo48st8unUCH
         lrynVP7C3f71ZM+e+Sc6j0dChxd/iUzKYbSWKtnaBd/P+HjdTCnCBWsPx3igGK+FZxw3
         ARZ2J2sjQHJvaIMVTW47FZQQhIrpaixB9pplQoMuYO0tGhc1LSrZ89xiJ6bxdKARDuFz
         7/Z3+6YymUF8sabizynNaUJsfO/oDLDaSoDLsHKGJV/XEZV3kKSpdWpVCX9wSuF5FJn/
         3KhvCZj+JfL4WV28JWlEoKswJbMFlXX0F0H0HSTJa7OMP3mpn7mIYpb2vFBGIEQUgxh3
         4tsg==
X-Gm-Message-State: AOAM532wrHjNGM8tytXpU/5HromyxRMpltHQuvzRUIYfzJbvC209AO4V
        o4nFDfSgEfCTclS9Qe7v6ex6lBrNBtLOnwdJT6M=
X-Google-Smtp-Source: ABdhPJz4bV0JFM77SRaYXyikcLHwfMO2Klyg87DVyBh54afs+S1MvMFy+2Gf0p/1uh68laXhnC3XK5+CSuwk/4yMaks=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr17167222wmb.22.1603736655213;
 Mon, 26 Oct 2020 11:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201024105111.15829-1-kholk11@gmail.com> <20201024105111.15829-3-kholk11@gmail.com>
In-Reply-To: <20201024105111.15829-3-kholk11@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 20:24:39 +0200
Message-ID: <CAHp75VeRagDvpZBFZ4+T8JgsjOKxuZjxRHw_azXKQx5O3Cx5yw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] Input: Add Novatek NT36xxx touchscreen driver
To:     kholk11@gmail.com
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>, priv.luk@gmail.com,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        Martin Botka <martin.botka1@gmail.com>,
        phone-devel@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 24, 2020 at 1:51 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This is a driver for the Novatek in-cell touch controller and
> supports various chips from the NT36xxx family, currently
> including NT36525, NT36672A, NT36676F, NT36772 and NT36870.
>
> Functionality like wake gestures and firmware flashing is not
> included: I am not aware of any of these DrIC+Touch combo
> chips not including a non-volatile memory and it should be
> highly unlikely to find one, since the touch firmware is
> embedded into the DriverIC one, which is obviously necessary
> to drive the display unit.
>
> However, the necessary address for the firmware update
> procedure was included into the address table in this driver
> so, in the event that someone finds the need to implement it
> for a reason or another, it will be pretty straightforward to.
>
> This driver is lightly based on the downstream implementation [1].
> [1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx

(From drafts, didn't have time to finish and see already v8, so please revisit)

...

> +#include <asm/unaligned.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/regulator/consumer.h>

Perhaps sorted? Also, asm/* usually go after linux/*.

...

> +#define TOUCH_MAX_PRESSURE      1000

Any units?

...

> +       ts = devm_kzalloc(&hw_client->dev, sizeof(struct nt36xxx_i2c), GFP_KERNEL);

sizeof(*ts) ?

> +       if (!ts)
> +               return -ENOMEM;
> +
> +       ts->supplies = devm_kcalloc(&hw_client->dev,
> +                                   NT36XXX_NUM_SUPPLIES,

> +                                   sizeof(struct regulator_bulk_data),

sizeof(*ts->supplies) ?

> +                                   GFP_KERNEL);
> +       if (!ts->supplies)
> +               return -ENOMEM;

...

> +       ret = devm_regulator_bulk_get(&hw_client->dev,
> +                                     NT36XXX_NUM_SUPPLIES,
> +                                     ts->supplies);

> +       if (ret != 0) {

if (ret)

> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&hw_client->dev,
> +                               "Cannot get supplies: %d\n", ret);
> +               return ret;
> +       }

...

> +       input->phys = devm_kasprintf(&hw_client->dev, GFP_KERNEL,
> +                                    "%s/input0", dev_name(&hw_client->dev));

NULL check?

...

> +       ret = devm_request_threaded_irq(&hw_client->dev, hw_client->irq, NULL,
> +                                       nt36xxx_i2c_irq_handler, IRQF_ONESHOT,
> +                                       hw_client->name, ts);
> +       if (ret) {
> +               dev_err(&hw_client->dev, "request irq failed: %d\n", ret);

> +               return ret;
> +       }
> +
> +       return 0;

return ret; ?

> +}


--
With Best Regards,
Andy Shevchenko
