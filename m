Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531F4257A9E
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 15:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgHaNkG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Aug 2020 09:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgHaNkC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Aug 2020 09:40:02 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C78C061575
        for <linux-input@vger.kernel.org>; Mon, 31 Aug 2020 06:40:01 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o18so8538958eje.7
        for <linux-input@vger.kernel.org>; Mon, 31 Aug 2020 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lddw3bdok3hAy1F/tQ2gv6hGO+6x8VFGDH1TfahaMjg=;
        b=gBplDfQqLrkZ52/3bG7dQRrqKdekFZEh45gXZ5MsUHY486B3HK7oI65JYt4l0R3ldF
         GNHW/tXR1MVsKES6Wqf1COb7UnAT3ZaQw63tIRNa5/T4qs0h8OMmXCsfgazVyJK79l8t
         jn385EO8CLCYrRbQ23bb6Sth0ZtPsuO6k4k7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lddw3bdok3hAy1F/tQ2gv6hGO+6x8VFGDH1TfahaMjg=;
        b=Rqo1zJNujhYt4rnErke1WfuJwvbejTguIeV6mOhQF8VF9trFAHUFsRkkB/a/ChGZ0n
         9a/hqFmWm3nWaSyaDyXB0+xgtjufT7rPNjpODwSrrN57R8auGAAY4fFJWlxaer9lBLN/
         nXjGgAr3AL7iUS/Cd7HSAFLBkhKzU1XXR+TSnRG+d0r6QlGtxzveMvCjzzDD6pGcYlFR
         eFCjoLSdz+cfAvA4WFZ/5XGTmzZSJHya/NV2CWstAbgfwJru8XsaFNUHuj0Tu17yX1uU
         6nWE1eLnYc2cV4wQTp4MKFPwdpn4vS5+Yom0jCw8vlBzPzjH4PeDcR8ML6XA0nNu1GII
         hcaQ==
X-Gm-Message-State: AOAM533oAbLYw/c8jOCGi02rL7FwCfDRjjBkz+F0GQGAVPXBElMDk9m+
        6JDUjtjs04b6Uz49Q0ccsGzmdNZBVHsYeA==
X-Google-Smtp-Source: ABdhPJyI9vCR2pKLez5+UodPWfz9DjMJn60kKFFyi3YZUXD+JJiGz3ZsB4NszZDELW9m/U7pICe+BQ==
X-Received: by 2002:a17:906:fb84:: with SMTP id lr4mr1309509ejb.282.1598881200094;
        Mon, 31 Aug 2020 06:40:00 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id oz4sm8096238ejb.106.2020.08.31.06.39.56
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 06:39:58 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id bo3so8518253ejb.11
        for <linux-input@vger.kernel.org>; Mon, 31 Aug 2020 06:39:56 -0700 (PDT)
X-Received: by 2002:a17:907:7292:: with SMTP id dt18mr1291762ejc.512.1598881195924;
 Mon, 31 Aug 2020 06:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
 <20200829074758.GA16838@amd>
In-Reply-To: <20200829074758.GA16838@amd>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 31 Aug 2020 07:39:44 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CuWSzaMNYSfh6Zr12Q1=GA_Yqpg0jaePDkFQjgsDDBPg@mail.gmail.com>
Message-ID: <CAHQZ30CuWSzaMNYSfh6Zr12Q1=GA_Yqpg0jaePDkFQjgsDDBPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "S, Shirish" <Shirish.S@amd.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 29, 2020 at 1:48 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Thu 2020-08-27 13:52:22, Raul E Rangel wrote:
> > The i8042_mutex must be held by writers of the AUX and KBD ports, as
> > well as users of i8042_command. There were a lot of users of
> > i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> > This resulted in i8042_commands being issues in between PS/2
> > transactions.
> >
> > This change moves the mutex lock into i8042_command and removes the
> > burden of locking the mutex from the callers.
> >
> > It is expected that the i8042_mutex is locked before calling
> > i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> > layer via ps2_begin_command and ps2_end_command. Other modules
> > (serio_raw) do not currently lock the mutex, so there is still a
> > possibility for intermixed commands.
>
>
> > @@ -343,10 +330,14 @@ int i8042_command(unsigned char *param, int command)
> >       unsigned long flags;
> >       int retval;
> >
> > +     mutex_lock(&i8042_mutex);
> > +
> >       spin_lock_irqsave(&i8042_lock, flags);
> >       retval = __i8042_command(param, command);
> >       spin_unlock_irqrestore(&i8042_lock, flags);
> >
> > +      mutex_unlock(&i8042_mutex);
> > +
> >       return retval;
>
> There's something wrong with whitespace here. Checkpatch?
>                                                                         Pavel
It's fixed in the v2 patch: https://patchwork.kernel.org/patch/11741855/

Thanks
