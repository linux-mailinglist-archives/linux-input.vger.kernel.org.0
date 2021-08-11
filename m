Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4218D3E8BD4
	for <lists+linux-input@lfdr.de>; Wed, 11 Aug 2021 10:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhHKIck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Aug 2021 04:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235282AbhHKIcj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Aug 2021 04:32:39 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60047C061798;
        Wed, 11 Aug 2021 01:32:16 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id t25so812613uar.13;
        Wed, 11 Aug 2021 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RZqRgzHZYgqEPRuuZiIkirwuR0fhVZEI60yV2LcBYEM=;
        b=ClIol3rlEDFuVYvxlE4Gr0oV80VY7+LLPMCiiyZVWP9vk0uP0Wdw9RJ32FMi8GDUPJ
         +VtGBzSIoh+x/k5Ga+alG493zgGuqt0zcdWNKsDL31eZPu/kPO2rS9TUgLDeDsCOXbRI
         TjI5Qi25wGxsQNbiVfN5R/i3mphru4QHi59KnoZEwnQ4mYaz+AWrQEI/ooHz1kvXZwEJ
         11vhvgYt1vk4Ttmdj5NTsxGyYHfBUWcRDA036HZA+Dthzt/WxZDqwH1YY+YenpvA07ZO
         FpHru3XJQ4kffcoIw5VrtIIcB6JSsI0RZcZ6bFwYN2ED/5Ysi4GyVrX1XTKcio/eKXtl
         4V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZqRgzHZYgqEPRuuZiIkirwuR0fhVZEI60yV2LcBYEM=;
        b=OoCo0e3DMmbpJuu2oyob8bnQtFHsOrl7JrmopN/whT0r3nwXyy/R1MrCSrAQVzDi2g
         uuAQyg3mDJUqQi1bZw1VThsOWJGSk6wzn12rsVLz5INz5ic6HSOTrXhk1d2bwAL57VyR
         EbvurpOQiDa6m/zo9Ck5ficRjNc2bSB2DNRinuYacLFuTBZMi8MjD01h/0205qplkttA
         qaK1nc1HQrfTOPVCGK2er3hcDbgBSZFogkiSRcGZaHHYw4c8QIC0dv9UKTVJkhTN6oYB
         2kzn+xRZF8DFW+sZKFiGorkgSbvMzrvPJMVDg5Lt20wxEF7ficLNly7NA5zJkoEcFaLw
         3haw==
X-Gm-Message-State: AOAM533g0uphmcufZoaCk3dtCB4cu4wDHZGAj4oIQltWnYRO1KesuiwY
        x2hd37Y4qik+TPGQZBz7N3tZLgSlw5NtZjhX4FU=
X-Google-Smtp-Source: ABdhPJx/FtlEX8Gvhh7PCGJu6XytwxgMeNnTLsEvzw+ktR01Q4J4q80hivLrP6/q966Wg++ZJAxvpfHyZ1D+NanMDgI=
X-Received: by 2002:ab0:849:: with SMTP id b9mr24512073uaf.43.1628670735534;
 Wed, 11 Aug 2021 01:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210809065505.6823-1-jbroadus@gmail.com>
In-Reply-To: <20210809065505.6823-1-jbroadus@gmail.com>
From:   =?UTF-8?B?6I6K5L2z6ZyW?= <johnny.chuang.emc@gmail.com>
Date:   Wed, 11 Aug 2021 16:32:04 +0800
Message-ID: <CA+B3HhpOM56c2VQF-nOH_deq3U7GduzY8J7X1mLA+2LopO-mmQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Fix Elan touchpad regression
To:     Jim Broadus <jbroadus@gmail.com>
Cc:     jikos@kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        kai.heng.feng@canonical.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> A quirk was recently added for Elan devices that has same device match
> as an entry earlier in the list. The i2c_hid_lookup_quirk function will
> always return the last match in the list, so the new entry shadows the
> old entry. The quirk in the previous entry, I2C_HID_QUIRK_BOGUS_IRQ,
> silenced a flood of messages which have reappeared in the 5.13 kernel.
>
> This change moves the two quirk flags into the same entry.
>

LGTM

Many thanks,
Johnny/ELAN

> Fixes: ca66a6770bd9 (HID: i2c-hid: Skip ELAN power-on command after reset)
> Signed-off-by: Jim Broadus <jbroadus@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 46474612e73c..517141138b00 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -171,8 +171,6 @@ static const struct i2c_hid_quirks {
>                 I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
>         { I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
>                 I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
> -       { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> -                I2C_HID_QUIRK_BOGUS_IRQ },
>         { USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
>                  I2C_HID_QUIRK_RESET_ON_RESUME },
>         { I2C_VENDOR_ID_SYNAPTICS, I2C_PRODUCT_ID_SYNAPTICS_SYNA2393,
> @@ -183,7 +181,8 @@ static const struct i2c_hid_quirks {
>          * Sending the wakeup after reset actually break ELAN touchscreen controller
>          */
>         { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> -                I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET },
> +                I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET |
> +                I2C_HID_QUIRK_BOGUS_IRQ },
>         { 0, 0 }
>  };
>
> --
> 2.31.1
>
