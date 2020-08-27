Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A90254FDC
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 22:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgH0UMv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 16:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgH0UMu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 16:12:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B89BC061264;
        Thu, 27 Aug 2020 13:12:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w186so4140890pgb.8;
        Thu, 27 Aug 2020 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A5PiLj4dztwx4VDsM2EuGg6/hf1WiH3MIKIfKMjQjl8=;
        b=YBkij/IgGaz3F5J9Y7R/e47ULPqvCRDM6+srzsBtDTDR+WTrKLjHlmrjrqLZw5ckav
         F1DRjwDKKFxfe3qQgfDfYYz7eSHgkBDBbDLp/MpVff1ANsqgZjjaT1RIojPQ0U9IyVdQ
         +fKM+6XYEQs364gFd50hEE5i6ZOKG3zXRx054/sVqrH5alo05QbBMjQzgYoTqOj5J3sy
         ivpyWTZAgYcbQ/cCoxkg9bN5cCANK5ohZsMwTLgOgrXtCew6TA7Mh1q5Wv189DxJxMz5
         URk4g0kqwQfpx0qb82waARffLjcVzXRC6sWRyEMDy6sosZEZBPdtp7wKGWK0dTbq2UWy
         AIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5PiLj4dztwx4VDsM2EuGg6/hf1WiH3MIKIfKMjQjl8=;
        b=Wojhm70NC96JZ3elO9OWNYt/Xg/Mk48xBVlyO1g2se85hhN5/tWZg3aulCBoR6zgjO
         KBSzNQhtslnQjoa/GbTzEoP4lj2Qr8No778vodw9bEioPDsXVJ40tBdM7Sg1NuL/4leL
         +r4Pk06lv0vsniXOrDxu7b75SAUznNJIoqdWFnaDOaebTz0L2GlcYVW/jKX2S26MpkCj
         kefI2uc3KDaVYN/Yp/X20VXXzq4qa4NiFAXSLpywNWWOTUN5PMtfH6J9O6ZBllO6z0lk
         0CTtW0zdigVY4YN87PAXj5zBaBxSOMO3+lJt7UL7TlbSsvE22BYCtCerNGDihUL5Elfw
         Bg2Q==
X-Gm-Message-State: AOAM531Jw3tj5b0PMLKW0OYYfpmogPkRAKkN/eNkdaYBQsQn86F1mno4
        s64aTLm8QfUcDbP9EA95/HA8Gx4EtrZS8A8DpNE=
X-Google-Smtp-Source: ABdhPJzj5zoo92PansDUsNH086E2KFycsOBXmt7Kd/PuPYPU9WKx359RWnfh5xSRNiD1bbQjNLz0TXDZ/xChIgqzHao=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr17842045plr.321.1598559170111;
 Thu, 27 Aug 2020 13:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
In-Reply-To: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 23:12:33 +0300
Message-ID: <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "S, Shirish" <Shirish.S@amd.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 10:52 PM Raul E Rangel <rrangel@chromium.org> wrote:
>
> The i8042_mutex must be held by writers of the AUX and KBD ports, as
> well as users of i8042_command. There were a lot of users of
> i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> This resulted in i8042_commands being issues in between PS/2
> transactions.
>
> This change moves the mutex lock into i8042_command and removes the
> burden of locking the mutex from the callers.

Which is wrong according to your very patch. See below.

> It is expected that the i8042_mutex is locked before calling
> i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> layer via ps2_begin_command and ps2_end_command. Other modules
> (serio_raw) do not currently lock the mutex, so there is still a
> possibility for intermixed commands.

...

> +       mutex_lock(&i8042_mutex);
> +
>         spin_lock_irqsave(&i8042_lock, flags);
>         retval = __i8042_command(param, command);
>         spin_unlock_irqrestore(&i8042_lock, flags);
>
> +        mutex_unlock(&i8042_mutex);

Question 1. Why do you need mutex at all in the above situation? Spin
lock isn't enough?

...

> -       i8042_lock_chip();
> -
>         if (value == LED_OFF)
>                 i8042_command(NULL, CLEVO_MAIL_LED_OFF);
>         else if (value <= LED_HALF)
>                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
>         else
>                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> -
> -       i8042_unlock_chip();
> -

Now, these three commands are not considered as a transaction (no
atomicity). That's why your patch is wrong.

>  }

...

>         int rc;
>
> -       i8042_lock_chip();
>         rc = i8042_command(&param, A1655_WIFI_COMMAND);
> -       i8042_unlock_chip();
>         return rc;

rc become redundant.

-- 
With Best Regards,
Andy Shevchenko
