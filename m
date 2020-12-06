Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19912D05A6
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 16:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgLFPVq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 10:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgLFPVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 10:21:46 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F45C0613D1
        for <linux-input@vger.kernel.org>; Sun,  6 Dec 2020 07:21:05 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id f11so69264ljm.8
        for <linux-input@vger.kernel.org>; Sun, 06 Dec 2020 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2jMJwesYEXerkWw0MU6aVmUBHRRKSZdzK4M16yygf0=;
        b=trqlRO+RUgL6oM2i+qz8n57YuG8b3zo5dQODxU9+BWmqK2K3YjygtCfmMfCcO1nlmt
         ZnZ2qSg1VGt3u6UZLGy56VJmIxubCYh39sN6LFx6j4FlmCFBC1KTWLu2SLb/AMrm5Waq
         5vfMkMw7+08PCfqsfCdO9rbW6LcBD63qZroCTGQa4c4p3/UBYfYZxoutMrbIdPcDTO/g
         peS3elfKb6M7QiHk1OZcJ+HQ7MFdS8+9wim4R/S5i7PiOtplFKZA7FyiYjwQcQUvoHqm
         86qJ537/dlxHZ0u2rJgEE9iQoWr0ICFhsWcv5ueA2b4XAHYWvQCDMXNSIY8ozmJHalLD
         XwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2jMJwesYEXerkWw0MU6aVmUBHRRKSZdzK4M16yygf0=;
        b=iFp1gEDWKXT+urMcRcj08vtivSHL0a6IVlAZ17DZFvp99nexQph/VZYQUN6rb6sGG2
         1TSuoMNW2oyFJQHKean0zM7VViKx/MDkROkAnwlZ0mju+9AHb43ejARAWqR2NhWijNdl
         oYl9epWnp/ElgAE2/Ex7uVQOztyFYHbnMAWVnCwF4aBA7YgY1r4Wy71LKbM5H1PMo7Ov
         DTl5c/xUSnPXwNEZDHdLvlTWs/Gf7a1m+jr6XsalkAOKKqOeI/4cgHFfUnUjqqf83//R
         cWN45Hjgo39babxp3vDsaXSzjIqQvSiWI9wJK8YGxDZETKylMkSp3sELvFI9BkPWk/Hb
         h/vg==
X-Gm-Message-State: AOAM530gk8TkvnP1aKDuCy9M+8BBAhPrBMfqfCdbrJLoJS+dMNhejykj
        n4B+Z8GKHlrdz1pGNxq3eL6qlOEJ0LsWF5iGDT5mqA==
X-Google-Smtp-Source: ABdhPJyzUPomIjJYXfFaqoDPfewszugEjgkBqy17YgWyc6uo0N691jeA252Ulgf8kt7Ye3tK0ZNQijAby1yx6tBHGK4=
X-Received: by 2002:a2e:780d:: with SMTP id t13mr3229946ljc.144.1607268039459;
 Sun, 06 Dec 2020 07:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20201205054749.26487-1-digetx@gmail.com> <20201205054749.26487-3-digetx@gmail.com>
In-Reply-To: <20201205054749.26487-3-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 16:20:28 +0100
Message-ID: <CACRpkdZoxsamwCpckeMOVSkK_DQOqakmZ3fHzYb8CeSGZ1V_NA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Input: atmel_mxt_ts - support wakeup methods
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 5, 2020 at 6:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> According to datasheets, chips like mXT1386 have a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with it via
> the I2C-compatible interface.
>
> If the WAKE line is connected to a GPIO line, the line must be asserted
> 25 ms before the host attempts to communicate with the controller. If the
> WAKE line is connected to the SCL pin, the controller will send a NACK on
> the first attempt to address it, the host must then retry 25 ms later.
>
> Implement the wake-up methods in the driver. Touchscreen now works
> properly on devices like Acer A500 tablet, fixing problems like this:
>
>  atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-121)
>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>  atmel_mxt_ts 0-004c: Trying alternate bootloader address
>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>  atmel_mxt_ts: probe of 0-004c failed with error -121
>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

OK looks interesting!

> +       /* Request the WAKE line as asserted so controller won't sleep */
> +       data->wake_gpio = devm_gpiod_get_optional(&client->dev,
> +                                                 "wake", GPIOD_OUT_HIGH);
> +       if (IS_ERR(data->wake_gpio)) {
> +               error = PTR_ERR(data->wake_gpio);
> +               dev_err(&client->dev, "Failed to get wake gpio: %d\n", error);
> +               return error;
> +       }

That is a bit brutal, don't you think? Now you force the controller
to be on at all times. Even across suspend/resume.

Shouldn't the same patch drive this low in mxt_suspend()
and driver it high + wait 25 ms in mxt_resume()?
Waiting 25ms in mxt_resume() is chill, it is anyway on the
slowpath.

Yours,
Linus Walleij
