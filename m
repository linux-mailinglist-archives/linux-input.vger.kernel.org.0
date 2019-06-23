Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5124FAB5
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 10:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFWIAe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 04:00:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38184 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWIAe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 04:00:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id y15so1094469pfn.5;
        Sun, 23 Jun 2019 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7+C8Lei0q51lbExNSU5ZV84hyLUu9eRIgJUVftHVQk8=;
        b=HxHStgLkP/Kljc7DF2bp6TeseSiVXDSTOw30gA6GLc4223pOBsL6HqNB+U+PtJeC65
         xDT57VEkJ437GhZ3Rrq+N2tKA2GAU0/oErqqoxFwLQXIgXuyUWqU9QwR0h6jblbbjN2F
         9klJB3847qtYKfoRMoeX1s04FADQ0t4WjC5hJg+W44B/mWT6f+vX2lvXzIQAyYdC6Ik2
         2e1AEXYw5O1Fc8hsrAYiOZAcP9q1pJLGsIPPOQNpt02xf1gDKkIDSSOdQgBhG35WLI4p
         fMFoDwEhOeIcG2SGgo8Co0BiElUH0HrA3Qdud4xJZLsNcgdB2lvDBg3xeAzq2Wy5uzYx
         1NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+C8Lei0q51lbExNSU5ZV84hyLUu9eRIgJUVftHVQk8=;
        b=UWjrERxIQPoYTChtPus6Dg0+MUjzmhMdMF19o6ekiyXQS9fSyy9GPJyNzpWLSud7lN
         cuasG8tklTHYPXOijVOIJ0TOTysa4/fA/qIcDhGCZWWwpfalcgYFx2Q0sacXu1CjTGEP
         LLB/aUx/2b23FiyXNHp550uVT4OrEPfBtwUxjqWe2PVWoA4d0I3id6lo4kRCJucbLZd6
         JGc0zLchQXjJ0DDqlDEyqvpWc9ozVxHDw4tLiziVq8nY/MlEc0hkgbeoOuM/h8sq10yi
         DaTninYnFd0hQphZbzWF/T99dgMpMQjW16WgXG5/sU2ld/wzcfoljbO3MmBNH4zM2eS+
         FeQA==
X-Gm-Message-State: APjAAAXaueoTsYuVZVO9Qp9cBDmCLQLPZ5YbryFDwFIyyJeIKU3ARB9+
        eDNGi5a2roBWpgofMgqRaSamWAF63chsC9CzpI0sYp62P+c=
X-Google-Smtp-Source: APXvYqw8RP5rsVhtChDxSsYUu8EbJifJBvGaYgZmnIZXUE1rFnz2v/kLSfDI0tbN9BV6eA4YYGT5ptIXZCURqTDg0Ug=
X-Received: by 2002:a17:90a:35e6:: with SMTP id r93mr17542758pjb.20.1561276833682;
 Sun, 23 Jun 2019 01:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20190623063153.261546-1-dmitry.torokhov@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 23 Jun 2019 11:00:22 +0300
Message-ID: <CAHp75VfJWGiZ2gAwAE-G+AnjrWC1mmS7uYknutNaQKW+CuCwvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 23, 2019 at 9:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Instead of doing conversion by hand, let's use the proper accessors.
>

The code looks fine to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I can test it later next week (Wednesday or so).

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c639ebce914c..ec770226e119 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -27,6 +27,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <asm/unaligned.h>
>
>  #define WORK_REGISTER_THRESHOLD                0x00
>  #define WORK_REGISTER_REPORT_RATE      0x08
> @@ -239,8 +240,8 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
>                 if (tsdata->version == EDT_M06 && type == TOUCH_EVENT_DOWN)
>                         continue;
>
> -               x = ((buf[0] << 8) | buf[1]) & 0x0fff;
> -               y = ((buf[2] << 8) | buf[3]) & 0x0fff;
> +               x = get_unaligned_be16(buf) & 0x0fff;
> +               y = get_unaligned_be16(buf + 2) & 0x0fff;
>                 /* The FT5x26 send the y coordinate first */
>                 if (tsdata->version == EV_FT)
>                         swap(x, y);
> --
> 2.22.0.410.gd8fdbe21b5-goog
>


-- 
With Best Regards,
Andy Shevchenko
