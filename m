Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3B254FF4
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 22:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgH0UUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 16:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0UUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 16:20:20 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F4AC06121B
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 13:20:19 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id b17so9386484ejq.8
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJdbXb7lKtzg07PSoJxVHersZO8RudU7Smq6g0vTttM=;
        b=FYzZW5Cd5RSujSjQPwdNgDJjjfNR7A4dRomdW7dLxRa0J1giWlmqnXVrtx5f2p+YiW
         sq2KyfVz6aB/SdQph2kP5SvVTo9qP8LoRviBbyqFIW5oMhqo6YH493ElB/Wo1MEi4sFK
         Q/jGZF4SQbMCVuWo3XPvT9g7pS0UT1VPw8LNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJdbXb7lKtzg07PSoJxVHersZO8RudU7Smq6g0vTttM=;
        b=ZNdW8W0rBaPEoh2R4nsJal4hw2VK4lkENCCAr/85+No68DajOjJwyYuTZhhAaRYG7k
         CcPdaNHb7GjS1PNsBduu7qi1ijlcyhs7exPcG7mXBchcGivggnIJGc4olzA8euNaLXwf
         Ee6hBGhH0SMEhV6naGAOsZUF0MWqGaqqfFgbuukhsRgpmYK0Dz7D+QfSmJFgM7n66A2b
         41shuhfPfYiz9YMObRgqZ9vA8LZn9AmoGEO1VWEZKCdJOOX4JjTMc4FyKgHSHd+YVGsK
         y3Mi/GNSRNoR9/F988JToV/Pje/pGT7Vbq7D/qV9kE+jh3NgtJeUH2t0yCwsnHc3mzVU
         PsoQ==
X-Gm-Message-State: AOAM532Cgh+5v7ZP/Ut+aujUNc/ciHVaBS8aofGf0a4j7Ecfr5JYdRKG
        HRZkqyS85qz/NE9u0WjvstqSn5+0vqbXuA==
X-Google-Smtp-Source: ABdhPJxBidkpATe1NYDAqNEKXWA4fWKLzpBIaetsgGlfuGMtCnWfe43hArWxbggIjIqO341VhH/baA==
X-Received: by 2002:a17:906:7f0b:: with SMTP id d11mr24375289ejr.116.1598559617992;
        Thu, 27 Aug 2020 13:20:17 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 94sm2303925edl.47.2020.08.27.13.20.16
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 13:20:17 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a26so9418761ejc.2
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 13:20:16 -0700 (PDT)
X-Received: by 2002:a17:906:410d:: with SMTP id j13mr22392017ejk.139.1598559616518;
 Thu, 27 Aug 2020 13:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
 <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
In-Reply-To: <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 27 Aug 2020 14:20:05 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CbzL290WQ6J-sZh_pLfZFqHE1xgpaLPX+BfEJWg+7p3A@mail.gmail.com>
Message-ID: <CAHQZ30CbzL290WQ6J-sZh_pLfZFqHE1xgpaLPX+BfEJWg+7p3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, Aug 27, 2020 at 2:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Aug 27, 2020 at 10:52 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > The i8042_mutex must be held by writers of the AUX and KBD ports, as
> > well as users of i8042_command. There were a lot of users of
> > i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> > This resulted in i8042_commands being issues in between PS/2
> > transactions.
> >
> > This change moves the mutex lock into i8042_command and removes the
> > burden of locking the mutex from the callers.
>
> Which is wrong according to your very patch. See below.
>
> > It is expected that the i8042_mutex is locked before calling
> > i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> > layer via ps2_begin_command and ps2_end_command. Other modules
> > (serio_raw) do not currently lock the mutex, so there is still a
> > possibility for intermixed commands.
>
> ...
>
> > +       mutex_lock(&i8042_mutex);
> > +
> >         spin_lock_irqsave(&i8042_lock, flags);
> >         retval = __i8042_command(param, command);
> >         spin_unlock_irqrestore(&i8042_lock, flags);
> >
> > +        mutex_unlock(&i8042_mutex);
>
> Question 1. Why do you need mutex at all in the above situation? Spin
> lock isn't enough?

No. PS/2 transactions/commands consist of multiple calls to ps2_do_sendbyte.
So the spin lock only helps with sending an individual byte. The mutex
is for the
whole transaction. We don't want i8042_commands being sent in between a PS/2
transaction.

>
> ...
>
> > -       i8042_lock_chip();
> > -
> >         if (value == LED_OFF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_OFF);
> >         else if (value <= LED_HALF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
> >         else
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> > -
> > -       i8042_unlock_chip();
> > -
>
> Now, these three commands are not considered as a transaction (no
> atomicity). That's why your patch is wrong.

These are all mutually exclusive. So there is no change in behavior.
>
> >  }
>
> ...
>
> >         int rc;
> >
> > -       i8042_lock_chip();
> >         rc = i8042_command(&param, A1655_WIFI_COMMAND);
> > -       i8042_unlock_chip();
> >         return rc;
>
> rc become redundant.

Good catch. I'll send a v2 with it removed.

>
> --
> With Best Regards,
> Andy Shevchenko
