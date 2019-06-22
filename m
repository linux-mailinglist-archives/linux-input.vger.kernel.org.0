Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD0D4F544
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2019 12:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfFVKhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jun 2019 06:37:22 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36090 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFVKhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jun 2019 06:37:22 -0400
Received: by mail-pl1-f193.google.com with SMTP id k8so4229784plt.3;
        Sat, 22 Jun 2019 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7WwvfoXcI9tUq1QBP5Qa53cchl1EqJ0ZRy8gPW9E2U=;
        b=Qp+prU1Uyz7rNgMqX7M2/jSrk263qzuLkbqskPYzA09GNMAG73M84ZuQ09Xudui6oA
         85VZY8BDvGieV/3z04BkofYhPzsgQDmo9EdkydCZuzwGf+PNgG8/NsRZ434YyTVLSk22
         AKlihU4XZC7A5NXLs46BKA7brzaDSZotW7Km/h8fy4drxh0qx+hNV8aFjAEb31JMNMAT
         0M9EQo1bI7x/dS9ubge6Q4rEllFZ2+/0/kqyP0LP5ttZeDbyOaQQpWyo8p0CV83u/Jdc
         3BRnLQbwDaT63cfiLz6NWUgvdaljiFIuyUzUYy4HempKil6f645jvo4D5dibs6qbefrx
         sOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7WwvfoXcI9tUq1QBP5Qa53cchl1EqJ0ZRy8gPW9E2U=;
        b=XEgAnTsfiR7yCWhmcz9mcchFx9G5X9YaDVvmEG/btO4/8SJRdnT00VJI7M4hX3v+l+
         rKaF1bfL4D4N/ylO8tjDl79QIGcW7Xmtsd9S72hX4NLtob8ilsUYSDow7/cZ8W9PBI0F
         1BtbiTC7pSfPDAwuMGY1L+9vbYtgCU2AbzhPf0PLtsLjj+Qnjvi4y3sB5AmF1o8WZaXq
         8titS4tS6X9Jdu0kCNLreLvGAZFv4KpAPJABK2DH9BxzrMCyVqIcYwtcrRSjmry2e7UV
         0S4X6tQPN75qASss7AzIYkK3oWaEasSS/DS6yauiizgLLys/OHDwxHFVO7HM58UsVh+N
         /A3Q==
X-Gm-Message-State: APjAAAVkjfe0sO39ARx22IDlZ3FMvmlQOk17Hf6L5YexLO+ZsIoQGWiy
        tuKJXa/KcIm5mSKsntu+kKYUaOFGwp8X3Ca4E2EiE5Ar4d0=
X-Google-Smtp-Source: APXvYqxDnivc13+v/PVx3hq9zSxPEhSaIol/UOLy7n6Cp7ndIlWq60PooDxABHP9fNxmpI0AoEgmdE8cD/sxRKzDfbA=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr62666076plt.255.1561199841171;
 Sat, 22 Jun 2019 03:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190621185124.28966-1-bparrot@ti.com>
In-Reply-To: <20190621185124.28966-1-bparrot@ti.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 22 Jun 2019 13:37:10 +0300
Message-ID: <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
Subject: Re: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during suspend
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 21, 2019 at 9:53 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> As a wakeup source when the system is in suspend there is little point
> trying to access a register across the i2c bus as it is probably still
> inactive. We need to prevent the irq handler from being called during
> suspend.
>

Hmm... But how OS will know what the event to handle afterwards?
I mean shouldn't we guarantee somehow the delivery of the event to the
input, in this case, subsystem followed by corresponding user space?

> Without this modification upon wakeup you would see the following kernel
> error:
>
> [ 118.733717] PM: Wakeup source GPIO0
> [ 118.751933] edt_ft5x06 1-0038: Unable to fetch data, error: -13
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c639ebce914c..c885bfe783a4 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1200,8 +1200,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
>  {
>         struct i2c_client *client = to_i2c_client(dev);
>
> -       if (device_may_wakeup(dev))
> +       if (device_may_wakeup(dev)) {
>                 enable_irq_wake(client->irq);
> +               disable_irq(client->irq);
> +       }
>
>         return 0;
>  }
> @@ -1210,8 +1212,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
>  {
>         struct i2c_client *client = to_i2c_client(dev);
>
> -       if (device_may_wakeup(dev))
> +       if (device_may_wakeup(dev)) {
>                 disable_irq_wake(client->irq);
> +               enable_irq(client->irq);
> +       }
>
>         return 0;
>  }
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
