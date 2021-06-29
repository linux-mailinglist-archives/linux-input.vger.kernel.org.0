Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F893B7A43
	for <lists+linux-input@lfdr.de>; Wed, 30 Jun 2021 00:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbhF2WKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Jun 2021 18:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbhF2WKB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Jun 2021 18:10:01 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2ADC061760
        for <linux-input@vger.kernel.org>; Tue, 29 Jun 2021 15:07:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id hc16so460932ejc.12
        for <linux-input@vger.kernel.org>; Tue, 29 Jun 2021 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1q7Ain0DLUkGOfXS9EwfmlJ7f9E2SKVgo1z1o4tW/v8=;
        b=sNJP561TgLPulHMOn7QGOO2ndcGumuoOg3lMJmx9mePF3ls5eTTIX0sGZ2zNpLEXaU
         J7rzQdc5YT5pdKkAAGvaAk0gQ9sll7hgjRY21wJm9/USdN0drvSZW32uTYMAM2y/HLO/
         dAIYpyHzjZ/TyDiws9b6v7fPcMCh7EaztHjSwWNPAjbO+vYfTnmJq+IpaWRfmneoCIAy
         b4IKFit61HKhQ1MVC1J8wb4lZcP8k1+gcu7hEHf1rK5xmTAsfk4k6bQcAKCyhXShefaf
         Rt11rvdrWGjo56phA0v1fYSWwwv+rhBsLbsecSW5JfB9H6yrLzroABGfbaWHPh4EyuVc
         A35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1q7Ain0DLUkGOfXS9EwfmlJ7f9E2SKVgo1z1o4tW/v8=;
        b=DTvDfeL18Miemwr1T6iA5ri0cGyj1izixjusxKmjkHpSYVSrWrLYlhBlGk8f8rW+W7
         NGkwfgTOyKCA9RbgpNylWaQQYAgsBdWLKOp1wpwFvgBO0dh65HTBhGIabqaPVjHqTp5z
         HTiSHYOlV0WqbSzl395QPGkk01F0lHu3+QymdHPWNuvzBBgBoorHW2cZmsRDEswM8QG6
         zHgtrD2sT/QBX2slcV8r+QCyayYQEnyKoI/+gzzCKpk3Gb5P2So+5lxPYNKmbfas2ypn
         1xjOgLUDmC35KOh00hrEuaXR1AQZ8YzKJjNNHruWYj2Ojo2i+qwwbD1HOuDch85eIGvA
         VV/w==
X-Gm-Message-State: AOAM5329gN40Zo6iZZwDewKDNx3KhSmB3o1GiO5+gGMhTpwHZ8vwB2gR
        m/KLMy1VjXte36cIBzI+VMI9WLRSmyDAGJsSnSo6uA==
X-Google-Smtp-Source: ABdhPJyFL8pCPijezwPCujfo677fGnEMrbfTjwpgNpqLmPtMLLSo5Wkmd3U8I7RWYi73MzJC1yy4wGds03Y/Y7Fh8OQ=
X-Received: by 2002:a17:906:70cf:: with SMTP id g15mr31769008ejk.366.1625004452346;
 Tue, 29 Jun 2021 15:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <YNtlrrKZVQY4byVa@google.com>
In-Reply-To: <YNtlrrKZVQY4byVa@google.com>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Tue, 29 Jun 2021 15:07:20 -0700
Message-ID: <CALvoSf7y2WRtX5R8-_Uo1Gzhq4i_WnMRw0AGMW+JQdZvXMX_Xg@mail.gmail.com>
Subject: Re: [PATCH] HID: input: do not report stylus battery state as "full"
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've tested it on a 5.4 derivative, and that works as expected. Looks
good to me.

- Kenneth Albanowski



- Kenneth


On Tue, Jun 29, 2021 at 11:25 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The power supply states of discharging, charging, full, etc, represent
> state of charging, not the capacity level of the battery (for which
> we have a separate property). Current HID usage tables to not allow
> for expressing charging state of the batteries found in generic
> styli, so we should simply assume that the battery is discharging
> even if current capacity is at 100% when battery strength reporting
> is done via HID interface. In fact, we were doing just that before
> commit 581c4484769e.
>
> This change helps UIs to not mis-represent fully charged batteries in
> styli as being charging/topping-off.
>
> Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> Reported-by: Kenneth Albanowski <kenalba@google.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-input.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index e982d8173c9c..e85a1a34ff39 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -417,8 +417,6 @@ static int hidinput_get_battery_property(struct power_supply *psy,
>
>                 if (dev->battery_status == HID_BATTERY_UNKNOWN)
>                         val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
> -               else if (dev->battery_capacity == 100)
> -                       val->intval = POWER_SUPPLY_STATUS_FULL;
>                 else
>                         val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
>                 break;
> --
> 2.32.0.93.g670b81a890-goog
>
> --
> Dmitry
