Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D9140264B
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 11:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhIGJla convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 7 Sep 2021 05:41:30 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:43828 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237269AbhIGJlZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 05:41:25 -0400
Received: by mail-vk1-f173.google.com with SMTP id b13so3060548vkl.10;
        Tue, 07 Sep 2021 02:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TAsz622F5qwEsYsm7MIr3hPdGKH/XCeo4WFM8+vk59k=;
        b=lo/n5d6ZHDIFD9l1rW48o5NgoYoMDbQGEZ3u23U41QfxqcQobPk5qJIq4Ncf3EZAdw
         9gYpMepeW9KkWJGfDEtoM+XnXo0FJ5sa/eRPc/0TToyq86eoOLdG8q3N/XefNHj5t8/+
         RM0/N9CbDDswbUtOqlKvxR95x/rnsNL9Dm2RmIqLVZfeG0GQVh8X7iqEh5TgTEip7izx
         8/yh35/JpmOtgem+tYpc7sEJ0i2YiXrHkvhfgLZGQrTcqfJGBvMwrmB3sfcLQ5beS0lX
         t26lyw7ODBjVXw8rkLLNz9gi77PXIrEW6tPZennG0UBr0WTzghJRczb0hrP1FhNK355H
         QQ0Q==
X-Gm-Message-State: AOAM531AVMWHckPtSKpzFZHyO2OPJWijeDmLUGBcJjh/7aOvBPpJocWh
        kz8X8KZZGk7MeMP6jg0jtMUKbjsGftiP5CF7uunKFfhA8KE=
X-Google-Smtp-Source: ABdhPJzQ0t5tcnTP03QklrT4XexfYsP+WK8uDqFFzGMqIs3w3FmCay2do6F6BXB1hl56v9lUvlPEizI40x10jX7ewIY=
X-Received: by 2002:a1f:fc8f:: with SMTP id a137mr7117795vki.19.1631007618885;
 Tue, 07 Sep 2021 02:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210907063335.2837366-1-linux@roeck-us.net>
In-Reply-To: <20210907063335.2837366-1-linux@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 11:40:07 +0200
Message-ID: <CAMuHMdV_jt4zRQV1WXL8yy-AUNtDvrV5U-TRLcNdvFhTLjfG1A@mail.gmail.com>
Subject: Re: [PATCH v2] Input: analog: Always use ktime functions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Günter,

On Tue, Sep 7, 2021 at 8:35 AM Guenter Roeck <linux@roeck-us.net> wrote:
> m68k, mips, s390, and sparc allmodconfig images fail to build with the
> following error.
>
> drivers/input/joystick/analog.c:160:2: error:
>         #warning Precise timer not defined for this architecture.
>
> Remove architecture specific time handling code and always use ktime
> functions to determine time deltas. Also remove the now useless use_ktime
> kernel parameter.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Drop helper functions and use ktime_get() and ktime_sub() directly
>     Drop 'speed' variable and use NSEC_PER_MSEC directly
>
>  drivers/input/joystick/analog.c | 103 ++++----------------------------
>  1 file changed, 11 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
> index f798922a4598..a9ec41f48068 100644
> --- a/drivers/input/joystick/analog.c
> +++ b/drivers/input/joystick/analog.c

> @@ -275,7 +210,7 @@ static int analog_cooked_read(struct analog_port *port)
>                 this |= data[i];
>                 for (j = 0; j < 4; j++)
>                         if (data[i] & (1 << j))
> -                               port->axes[j] = (delta(start, time[i]) << ANALOG_FUZZ_BITS) / port->loop;
> +                               port->axes[j] = (ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;

This is now a 64-by-32 division, triggering undefined references to __udivdi3
on some 32-bit platforms.

Assumed deltas are small, the simple solution of truncating to
32 bit (like delta() did before):

-  port->axes[j] = (ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
+ port->axes[j] = ((u32)ktime_sub(time[i], start) << ANALOG_FUZZ_BITS)
/ port->loop;

is probably safe.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
