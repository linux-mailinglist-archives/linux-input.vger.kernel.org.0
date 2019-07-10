Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68856643E9
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2019 10:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbfGJI6y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jul 2019 04:58:54 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39205 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfGJI6y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jul 2019 04:58:54 -0400
Received: by mail-io1-f66.google.com with SMTP id f4so3078885ioh.6;
        Wed, 10 Jul 2019 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uA2No6QVt9wdOYNPWysRV0rTiNNXcnR1a0unn8liVIo=;
        b=CUPTKU6B9ue+G87vzCA2/SKs+OCfZP6SxxQ9vBphfmnZ/O6MPYcY4f3NXcpJBdqFHj
         mJCy+V2HlX+eOPEa7h/Y7TdFFkEAi5IzTen/a1p42P7DPOKAoYA6nUub4dopPNUNeFrZ
         U/eqGXhOffKt2IzFm0JgfT4E3BefKkwq0JqXHKrVAOqiKTv0FqrmdbUselJ/pYinwLvM
         u5yYnMWxPrxmRTtOVFeqYUI4DdGcUN562YG15z7tmadVjqNlZoV6CbQEYag7xdgJNxa2
         OG/E1L1JPrMHEFPYNch+lcLm90Pp/sXoPLs50ne6lMBuMBpsaYxipUW+19x4q0GavV0q
         QB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uA2No6QVt9wdOYNPWysRV0rTiNNXcnR1a0unn8liVIo=;
        b=mkHFHAoge1RgR424vVeESLYfpY4qa/quYsIZ3tOPSsAc2OiXBYRmNqPQOa7BYVAt/g
         nmHettctGaVKqjgLbe7jayeUTrIIyjkxK4ZgdbnYTadnQvy4Yy+1WHhkL00x+xYnRwXR
         YC8x/uwIDOANoDiHO53S23K5UiNnrxM0NDanZH8eMPWuGmzCDwN4Hz2wtEdVVlBW8S1L
         Qo5cbDaAJ9kHh1TC4MVVFu0QI0P5UXwRFQrkd/1NkcR/uhA26QBugdFtkfPFLfPSktEc
         RFFpKltjJyQq+CtKess+0vsGm/9Bz6KMcGmIGk3+bF63tG8WZcBDt3WrSAots51JG/t8
         rxJA==
X-Gm-Message-State: APjAAAWT9Qk1Ur20a6kMql27/6spSar7D1/ULZXGoWkA3aDui54KGgQ8
        Z19u8EjtGPzmieMAlq0EUxCD1Q4hT5cSEHBSeTE=
X-Google-Smtp-Source: APXvYqwfjOqCTAL0HtLf70MMCfT2U67F5rYDDxdV+OsDquJYjlIIwuPjw8N7E6bdZfzCpNNOrHSWAG3ZfRL9F79hF9s=
X-Received: by 2002:a5d:8b52:: with SMTP id c18mr11958098iot.89.1562749132167;
 Wed, 10 Jul 2019 01:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190710025859.6025-1-crag0715@gmail.com>
In-Reply-To: <20190710025859.6025-1-crag0715@gmail.com>
From:   Crag Wang <crag0715@gmail.com>
Date:   Wed, 10 Jul 2019 16:58:40 +0800
Message-ID: <CAP-8N0hTEXkK3iqGP=+gtuVVcqo-+KYHC_N6+8Q90ndf_UVJpA@mail.gmail.com>
Subject: Re: [PATCH] input: touchscreen: add delay time to device power on
To:     yjjung@melfas.com, jsj1012@melfas.com, leesh832@lgdisplay.com
Cc:     Mario Limonciello <mario_limonciello@dell.com>,
        chrome.os.engineering@dell.com, "Crag.Wang" <crag.wang@dell.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding more

On Wed, Jul 10, 2019 at 10:59 AM <crag0715@gmail.com> wrote:
>
> From: "Crag.Wang" <crag.wang@dell.com>
>
> Delay time for MELFAS MIP4 controller is required at power on stage
> regardless the existence of GPIO consumer lookup from devicetree or
> ACPI device table.
>
> There is an issue if GPIO ce is undefined in the ACPI results no delay
> time for deive power on, the controller ended up in an abnormal state.
>
> TEST=echo i2c-MLFS0000:00 > /sys/bus/i2c/drivers/mip4_ts/unbind
>      verify the touch function is off
>
>      echo i2c-MLFS0000:00 > /sys/bus/i2c/drivers/mip4_ts/bind
>      verify the touch function is on
>
> Signed-off-by: Crag.Wang <crag.wang@dell.com>
> ---
>  drivers/input/touchscreen/melfas_mip4.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index 430a2bc5f7ca..8e803658fb43 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -374,12 +374,11 @@ static int mip4_query_device(struct mip4_ts *ts)
>
>  static int mip4_power_on(struct mip4_ts *ts)
>  {
> -       if (ts->gpio_ce) {
> +       if (ts->gpio_ce)
>                 gpiod_set_value_cansleep(ts->gpio_ce, 1);
>
> -               /* Booting delay : 200~300ms */
> -               usleep_range(200 * 1000, 300 * 1000);
> -       }
> +       /* Booting delay : 200~300ms */
> +       usleep_range(200 * 1000, 300 * 1000);
>
>         return 0;
>  }
> --
> 2.20.1
>
