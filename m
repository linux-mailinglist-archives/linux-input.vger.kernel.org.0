Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA95535A4B1
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 19:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhDIRdT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 13:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhDIRdS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Apr 2021 13:33:18 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96DBC061760
        for <linux-input@vger.kernel.org>; Fri,  9 Apr 2021 10:33:05 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id h20so3321020vsu.1
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oabdM8jRxHNDcjomZqbQRjSlgoKt15wAzyQGzFiwnNw=;
        b=BwX/YPvs1OM4ve4WFxiRz+9C6cY4rhSvlDXWbnqT2g9Dy3ic1FdirzwvJkmnOx7K/m
         1lfLwV/RMnDmcOZL6MEVM+O56lcYlgcq4Le21TXLQfUAUZ4qF0SyM+jkEJGF7WlPHOTp
         uamBsSUhRBHdb7eJWIbK9yoSq0yY0ZtViDoAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oabdM8jRxHNDcjomZqbQRjSlgoKt15wAzyQGzFiwnNw=;
        b=KDAK7MtbN/z9rpueXhwE/jeX8qbb10GIrFfgeJkjutbxMYQz4pJsv47VNz/0JUFKf4
         SVyYzztufcDiuZWmbeFy6GiEHCP50vQD2lSlgyfL9fnrHifGNSRMcKzpCgE+Zs+6TgPi
         ZjF1dfiudl1xKyRRYjc61bU9jiSKMVp+B9P++yk4Jdk//JTcVqvY34KJwAikDxlU6Sjv
         Dr4QjDAasXDOuN6oTma7lh2d/3Bv+pQKSnw/67v0tIvzZ8uAwT0AfIS6U+/G2yC6c44M
         d/nbTRjVVw93/wLpFX5h6T3BlC8QwL1sHuycSWziv/paf1jw1zCtDOYRJnyYBjpYBP4H
         JmTA==
X-Gm-Message-State: AOAM532Egh7Q8DO5AA4n1YElYuRQGK6do8y0XvR22z/X8wGbgXH3UVwu
        0cgl97Haw1kzJjTZ9r0riLP6Cl7vGbQmxABw
X-Google-Smtp-Source: ABdhPJyASNBwUisw19ojCnrK3q6c7IZrCM1EsKt3Mgto1kLeSNxvwFdKHlzVfXV0rehiWzosfVttnQ==
X-Received: by 2002:a67:b90f:: with SMTP id q15mr12568487vsn.37.1617989584223;
        Fri, 09 Apr 2021 10:33:04 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id c129sm300606vke.47.2021.04.09.10.33.03
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 10:33:03 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id g4so3305259vsq.8
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 10:33:03 -0700 (PDT)
X-Received: by 2002:a67:d994:: with SMTP id u20mr12243960vsj.29.1617989582125;
 Fri, 09 Apr 2021 10:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <1617778157-11007-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1617778157-11007-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Fri, 9 Apr 2021 10:32:50 -0700
X-Gmail-Original-Message-ID: <CA+jURcvgOf5NYONj8u-WN6euBkyYbBOv7GJxF=iiDmZ-y8dA_A@mail.gmail.com>
Message-ID: <CA+jURcvgOf5NYONj8u-WN6euBkyYbBOv7GJxF=iiDmZ-y8dA_A@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Skip ELAN power-on command after reset
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>,
        Douglas Anderson <dianders@chromium.org>,
        Jingle <jingle.wu@emc.com.tw>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 6 Apr 2021 at 23:49, Johnny Chuang <johnny.chuang.emc@gmail.com> wrote:
>
> Previous commit 43b7029f475e ("HID: i2c-hid:
> Send power-on command after reset"), it fixed issue for SIS touchscreen.
>
> For ELAN touchscreen, we found our boot code of IC was not flexible enough
> to receive and handle this command.
> Once the FW main code of our controller is crashed for some reason,
> the controller could not be enumerated successfully to be recognized
> by the system host. therefore, it lost touch functionality.
>
> Add quirk for skip send power-on command after reset.
> It will impact to ELAN touchscreen and touchpad on HID over I2C projects.
>
> Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 9993133..6b407f7 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -45,6 +45,7 @@
>  #define I2C_HID_QUIRK_BOGUS_IRQ                        BIT(4)
>  #define I2C_HID_QUIRK_RESET_ON_RESUME          BIT(5)
>  #define I2C_HID_QUIRK_BAD_INPUT_SIZE           BIT(6)
> +#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET    BIT(7)
>
>
>  /* flags */
> @@ -157,6 +158,10 @@ struct i2c_hid {
>         struct i2chid_ops       *ops;
>  };
>
> +/*
> + * Sending the wakeup after reset actually break ELAN touchscreen controller
> + * So add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
> + */

You should put this comment next to the quirk entry itself, since it
doesn't apply to the whole list.

>  static const struct i2c_hid_quirks {
>         __u16 idVendor;
>         __u16 idProduct;
> @@ -178,6 +183,8 @@ static const struct i2c_hid_quirks {
>                  I2C_HID_QUIRK_RESET_ON_RESUME },
>         { USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
>                 I2C_HID_QUIRK_BAD_INPUT_SIZE },

(comment should go here)

> +       { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> +                I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET },
>         { 0, 0 }
>  };
>
> @@ -461,7 +468,8 @@ static int i2c_hid_hwreset(struct i2c_client *client)
>         }
>
>         /* At least some SIS devices need this after reset */
> -       ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
> +       if (!(ihid->quirks & I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET))
> +               ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
>
>  out_unlock:
>         mutex_unlock(&ihid->reset_lock);
> --
> 2.7.4
>
