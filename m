Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43C9215E6A
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 20:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgGFSf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 14:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729751AbgGFSf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 14:35:57 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B6BC061794
        for <linux-input@vger.kernel.org>; Mon,  6 Jul 2020 11:35:57 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id r7so8810592vkf.0
        for <linux-input@vger.kernel.org>; Mon, 06 Jul 2020 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ij6ynVLooZvFUU1WdE13blPhJSL1lkPuycUflF9mzkk=;
        b=S5E47DOPwDbYX9qAauzXw9PRmHeP+yPvDc6wa5lKnIARuccDh4qsjGVklgl9MMkude
         M7VvzR6wUEffCmaFNnfMs9T0CK2uI24oyJ9/a7dICYFwuhGoC/TfskyWpbxmXLwPpVCW
         Rmg+uA6dnC+5jpsYDsj8xGGD1Ho0cKYrMAI2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ij6ynVLooZvFUU1WdE13blPhJSL1lkPuycUflF9mzkk=;
        b=C3a6uoc4jeOqNrVK+KWH6PN1WU5W4XeafdIvMxLtqKDXLAJDMJpv9mmAWo69pWC+01
         u9mAOyYpSdfhBklHsogvVUHdBm7Fa3qTT4for1UxJy91gjaET/mj/YYbl1e5dpGw8T1R
         oYu46y7QayUHwjXcjynAdz8p2/fXu1ddGlM6CDG2v5LGCSdlKD3nfDXd8tbAZyUIj/96
         fnL9IuLkgVwDPZgVlS4m3MEpyTTM8dNW9y5xYKZPD+TxkBr5P3UsLL8X4wUrvTkwlwys
         YS4Nnf/wdy75TMtepZN5L2w0pWMlGtMDm4Tw791HAb89j07i5CyhkOEgpv/H0rE6xkMS
         +hfA==
X-Gm-Message-State: AOAM532bjR2uyOuzgsYDjQgRbmLy/Q29CuQXReWCs5AN9vztm6gir9pN
        OsEUjSk80FBDtlqrbl3rpXT7ao0XG2w=
X-Google-Smtp-Source: ABdhPJxG4YBC3CMRhPJIJMAMk1aPg5tfXLT6pA+T6HXEKa6v47J7btViGnucWOGJAbGbSCIsGn7nXw==
X-Received: by 2002:a1f:3113:: with SMTP id x19mr34922951vkx.91.1594060556111;
        Mon, 06 Jul 2020 11:35:56 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 73sm2830765vkw.13.2020.07.06.11.35.55
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 11:35:55 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id o15so21113254vsp.12
        for <linux-input@vger.kernel.org>; Mon, 06 Jul 2020 11:35:55 -0700 (PDT)
X-Received: by 2002:a67:1702:: with SMTP id 2mr5791561vsx.153.1594060554613;
 Mon, 06 Jul 2020 11:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <7d2c980f071487cecfd1534adb7561b33d922af3.1593968925.git.mail@maciej.szmigiero.name>
In-Reply-To: <7d2c980f071487cecfd1534adb7561b33d922af3.1593968925.git.mail@maciej.szmigiero.name>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Mon, 6 Jul 2020 11:35:43 -0700
X-Gmail-Original-Message-ID: <CA+jURcvL4B7xDObma5PZgTq4eaBbj6AGgBwDCSyf_mb7oRf+Lw@mail.gmail.com>
Message-ID: <CA+jURcvL4B7xDObma5PZgTq4eaBbj6AGgBwDCSyf_mb7oRf+Lw@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = " log messages
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 5 Jul 2020 at 10:09, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
>
> These messages appear each time the mouse wakes from sleep, in my case
> (Logitech M705), every minute or so.
> Let's downgrade them to the "debug" level so they don't fill the kernel log
> by default.
>
> While we are at it, let's make clear that this is a wheel multiplier (and
> not, for example, XY movement multiplier).

Looks good to me, thanks!

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

>
> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 1e1cf8eae649..b8b53dc95e86 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3146,7 +3146,7 @@ static int hi_res_scroll_enable(struct hidpp_device *hidpp)
>                 multiplier = 1;
>
>         hidpp->vertical_wheel_counter.wheel_multiplier = multiplier;
> -       hid_info(hidpp->hid_dev, "multiplier = %d\n", multiplier);
> +       hid_dbg(hidpp->hid_dev, "wheel multiplier = %d\n", multiplier);
>         return 0;
>  }
>
