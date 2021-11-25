Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1009E45D786
	for <lists+linux-input@lfdr.de>; Thu, 25 Nov 2021 10:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350208AbhKYJtl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 04:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354245AbhKYJrk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 04:47:40 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15554C0613E0;
        Thu, 25 Nov 2021 01:44:29 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id a11so4995981ilj.6;
        Thu, 25 Nov 2021 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9a5bV9LZZFkZgyNbN5tPhqHaUTXaCLITHSR34/CxUg=;
        b=fS2SBr8H4T8Rng0kmmP8oOh8keqeipk4mrJ7X1y4YFTPofvszHJcTTbwlpHVx8cZgg
         FKvkZ4RQlATTb41oOSC87PjWCZOrMZT42J1ZyrWAEPxsj68yZR/i53EfB/mJL8eYtQfA
         x4RSqh/gBp/uvNOsxYQuWaK/Wgzo/tj+soRwEZHp6jBsOfHPLLQHWqxIZo1vf2J7ymnl
         2oD8trZjTdI2dTSLoIvaSOmwxe5Z27hysI4i0A61TwIZ7LbvM52Ze1kXZCMsFH4cwByO
         nMQIoq9T0px3uGlFzlKHu/nf25pv753uyQR21mR16JcVQmleMhmdPaAmB4Fx80cA8a1f
         N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9a5bV9LZZFkZgyNbN5tPhqHaUTXaCLITHSR34/CxUg=;
        b=u7T2MXhSzIdn/cYQsuHiXYATpXN57Rp1jdwbaMF1FHki/mJk5O+mPWnCApWgPYKcdE
         ggkGFNAZ+5qmNwtSU3Kja6b+voQ9QAU7GpXULFQryrluaB7Xd9jCgzpjGJ4EWbZeOxNn
         Tn7rwgf68ZQdvJ1cvJLXM4oA/p5Uy9OybvirZOHzA/IQvLJS5prBgx/aY9x7RRGLJtDX
         qktvWdrZrb76myYCjkSAD6noDc+bFS4bFRN/Eg5thVz8CSvxs68FGIwagBVOhEUnkNyS
         lNZLofzIwKzQMq0vDzPN9zMmpkrap2Ccy9593A5YhHs8krLk+VgBtyhGZSh+5H6dxLh5
         buEw==
X-Gm-Message-State: AOAM530xc1WKn8y0xurzz1e7b3ZYm4CiWPieRl7JPsh5fre6cksZuTjk
        p1giDNYr6GNvh6rwTOuAIM9EPto2n73U4xO4j8A=
X-Google-Smtp-Source: ABdhPJz2l6LFynD07YfugB6JEhfbDRm1UMwOoQ1vXZYonYtlXIEg+cZFaGDAdOlhbMD4KeV802Iodblv6js9rkcK4VM=
X-Received: by 2002:a05:6e02:16c9:: with SMTP id 9mr19518396ilx.221.1637833468562;
 Thu, 25 Nov 2021 01:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20211103114830.62711-1-alistair@alistair23.me> <20211105155243.7b635651@aktux>
In-Reply-To: <20211105155243.7b635651@aktux>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Thu, 25 Nov 2021 19:44:02 +1000
Message-ID: <CAKmqyKP2ZXtmGGeoVO13E0pJs+TcnC8GigFiKvrEmNjgsutU-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add support for the Cypress cyttsp5
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Nov 6, 2021 at 12:52 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Hallo Alistair,
>
> my Xorg (debian buster installation) does not like that:
> [  3112.462] (**) cyttsp5: Applying InputClass "evdev touchscreen catchall"
> [  3112.462] (**) cyttsp5: Applying InputClass "libinput touchscreen catchall"
> [  3112.462] (II) Using input driver 'libinput' for 'cyttsp5'
> [  3112.463] (**) cyttsp5: always reports core events
> [  3112.463] (**) Option "Device" "/dev/input/event1"
> [  3112.463] (**) Option "_source" "server/udev"
> [  3112.496] (II) event1  - cyttsp5: is tagged by udev as: Touchscreen
> [  3112.498] (EE) event1  - cyttsp5: kernel bug: device has min == max on ABS_X
> [  3112.498] (II) event1  - cyttsp5: was rejected
> [  3112.498] (II) event1  - not using input device '/dev/input/event1'.
> [  3112.499] (EE) libinput: cyttsp5: Failed to create a device for /dev/input/event1
>
> # evtest /dev/input/event1
> Input driver version is 1.0.1
> Input device ID: bus 0x0 vendor 0x0 product 0x0 version 0x0
> Input device name: "cyttsp5"
> Supported events:
>   Event type 0 (EV_SYN)
>   Event type 1 (EV_KEY)
>     Event code 330 (BTN_TOUCH)
>   Event type 2 (EV_REL)
>   Event type 3 (EV_ABS)
>     Event code 0 (ABS_X)
>       Value      0
>       Min        0
>       Max        0 <-- upsets xorg
>     Event code 1 (ABS_Y)
>       Value      0
>       Min        0
>       Max        0
>     Event code 47 (ABS_MT_SLOT)
>       Value      0
>       Min        0
>       Max       31
>     Event code 48 (ABS_MT_TOUCH_MAJOR)
>       Value      0
>       Min        0
>       Max      255
>     Event code 49 (ABS_MT_TOUCH_MINOR)
>       Value      0
>       Min        0
>       Max      255
>     Event code 53 (ABS_MT_POSITION_X)
>       Value      0
>       Min        0
>       Max     1447
>     Event code 54 (ABS_MT_POSITION_Y)
>       Value      0
>       Min        0
>       Max     1071
>     Event code 57 (ABS_MT_TRACKING_ID)
>       Value      0
>       Min        0
>       Max    65535
>     Event code 58 (ABS_MT_PRESSURE)
>       Value      0
>       Min        0
>       Max      255
>
> I specified touchscreen-size-x and touchscreen-size-y in my devicetree.
> No idea why it is like this yet.

Thanks! I see the same problem on my side as well. I'm not using X so
I don't see a crash and didn't notice the error.

I'll work on fixing this.

Alistair
