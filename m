Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D3F322798
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhBWJOe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:14:34 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37607 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhBWJO2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:14:28 -0500
Received: by mail-ot1-f50.google.com with SMTP id s6so14864946otk.4;
        Tue, 23 Feb 2021 01:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=earOzTSoESZMgCDtbmy/TeQboFDUK2ANNfrRO7IYBm8=;
        b=J0ZZ6MFnbY3pYXvJgFKgaDM06+YHvzT+A+wEPG5fAIe373TPkLSYYtdsUJNZEIxWEr
         3+geuoEBSPPbuJ4tW/m2bSv0q81LFSfukwxJZ1yBC+WxJFR6MMMJB9QdfLH+Mqjavk/X
         G6Y+0l9VYpDntDsvPQI5xLq1NvfWytv3n8WDBoKOKLdPUlqy8RQlbvl1HXXueOxgqZyE
         B38OUmDiVkP5E8CFv50ccN7EshqUAatjJU8z6ypMiu6LW8ar04bFmY0/K8q19t72x0er
         JXJIzfBRL2KNmiT61wRxZTQqLrw/MSRASFrv7HcJNeZHXw9eVGpO8Y9Z2luUsntnnZot
         6F2w==
X-Gm-Message-State: AOAM532aO8V35/wBcSs0azUFiSBf8SrFiZv/KjkPeJilDPEExs9dXiaj
        XEs++9YoYWm2sj2tX3nwdVD9Y9OYcp1EGwamEfE=
X-Google-Smtp-Source: ABdhPJy7giY8UrB2BJzwsmPQNrZRlJ/8YK/5vtxBnbEt8YrhjCitO7AYHriAWe1SUd7UJvHTvGmhUJekCNkoC9Zo7ZI=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr19594789otq.250.1614071627930;
 Tue, 23 Feb 2021 01:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20210219110556.1858969-1-m.tretter@pengutronix.de>
In-Reply-To: <20210219110556.1858969-1-m.tretter@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Feb 2021 10:13:36 +0100
Message-ID: <CAMuHMdVcwcMezuRQU0TkwKGP9rWOmD6_gk9jC5ynj2aHij-qkA@mail.gmail.com>
Subject: Re: [PATCH] Input: st1232 - add IDLE state as ready condition
To:     m.tretter@pengutronix.de
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andrej.valek@siemens.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michael,

Thanks for your patch!

On Fri, Feb 19, 2021 at 12:06 PM Michael Tretter
<m.tretter@pengutronix.de> wrote:
> The st1232 can switch from NORMAL to IDLE state after the configured
> idle time (by default 8 s). If the st1232 is not reset during probe, it
> might already be ready but in IDLE state. Since it does not enter NORMAL
> state in this case, probe fails.
>
> Fix the wait function to report the IDLE state as ready, too.

Sorry for breaking your setup.  In fact I should have noticed, as I do
have a second board (KZM-A9-GT) with an st1232 that does not have the
reset line wired.  Unfortunately the display on that board is broken, so
I don't test display-related features on that board.  I've just verified
the touchscreen still works though, and does exhibit your problem.

> Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -94,7 +94,7 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
>
>         for (retries = 10; retries; retries--) {
>                 error = st1232_ts_read_data(ts, REG_STATUS, 1);
> -               if (!error && ts->read_buf[0] == (STATUS_NORMAL | ERROR_NONE))
> +               if (!error && ts->read_buf[0] == (STATUS_NORMAL | STATUS_IDLE | ERROR_NONE))

NORMAL (0x0) and IDLE (0x4) are really two different states. Hence you
cannot check for both using a bitmask, as that checks for IDLE only,
breaking operation for devices that are in NORMAL state.
The retry period is also much shorter than the default 8s it takes for
the device to enter IDLE state, so probing fails on Armadillo-800-EVA.

As Dmitry has already applied your fix, I have sent a new fix on top
"[PATCH] Input: st1232 - Fix NORMAL vs. IDLE state handling"
https://lore.kernel.org/r/20210223090201.1430542-1-geert+renesas@glider.be

>                         return 0;
>
>                 usleep_range(1000, 2000);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
