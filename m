Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9663A35E50D
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 19:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347188AbhDMRa4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 13:30:56 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:39580 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347187AbhDMRa4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 13:30:56 -0400
Received: by mail-vs1-f47.google.com with SMTP id r4so4768051vsq.6
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJEhIE4vihT2Owsc6wUtrNP/XIiOpOQ3etGCIsAaU9c=;
        b=AckIjkwx4FEDkORJKZgpOkQWycL4WE85rLbuKXcaLTLjjLjVs3YT20WyqdEnDarpey
         +M/Hd8oRNX1EZ67bpQhd/7I4ETJXaQ+an4BsfZujfJPilai/yhAJKqZ7OQMM2z459kFU
         prCwm4q71osfsJc63hGEhKVwWa8ywOeLGbvok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJEhIE4vihT2Owsc6wUtrNP/XIiOpOQ3etGCIsAaU9c=;
        b=LA5xUmiwDvlu3S214QIU3EpIwEDnls/OEYmo82CpgdiPjzvcD5u5j8HNgBDRPKA51Z
         LOI+Gfca+nY2yCjk+K4MWrevHboqhaH0gl7qqQvkljYcaJrYkf/EeZO62PAkQjco522r
         jeaJ80nqzkCW3C+S6gky4hFHKe52nAEsKZO3UNXyHsmKDP5Z728QX2NafwgomVBvTvrT
         RqvkfAwl9GD4XE64eGQqUxRX0Q7tvYSTqZtUynzSq70NDUiLCQQfwBRn+to14U3k22UM
         nk8yNKHxdu9iNXO3O9F97BoxXapuvSLDAFj3HlXUrooqDfFSMmnt+u08INZPYDTaw8wy
         zy0w==
X-Gm-Message-State: AOAM530R6lZt6OLG8TwGzRm+6myBr+wPwmyFt9mPrF2jgn6Rd4TKb/mY
        +R5zjLiR8P+f4SX8gpmkpzWNirzZNJtZJQ7a
X-Google-Smtp-Source: ABdhPJxAoWm/kwcDZSf/3asTEGwbyJAasmTWqB/4PdjDRS+ltEh+lNt2HxXdxD36vLZW74oa+d+Qlg==
X-Received: by 2002:a67:e06:: with SMTP id 6mr25006257vso.58.1618334975501;
        Tue, 13 Apr 2021 10:29:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id f190sm1695218vkf.51.2021.04.13.10.29.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 10:29:34 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id k124so8944393vsk.3
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 10:29:34 -0700 (PDT)
X-Received: by 2002:a67:d994:: with SMTP id u20mr25110324vsj.29.1618334973954;
 Tue, 13 Apr 2021 10:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Tue, 13 Apr 2021 10:29:22 -0700
X-Gmail-Original-Message-ID: <CA+jURcuD_qr0AwQJsVbpTGdVEdkr5eFtt87xGaMYSmPpBH3ZBg@mail.gmail.com>
Message-ID: <CA+jURcuD_qr0AwQJsVbpTGdVEdkr5eFtt87xGaMYSmPpBH3ZBg@mail.gmail.com>
Subject: Re: [PATCH v3] HID: i2c-hid: Skip ELAN power-on command after reset
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

On Mon, 12 Apr 2021 at 18:20, Johnny Chuang <johnny.chuang.emc@gmail.com> wrote:
>
> Fixes: 43b7029f475e ("HID: i2c-hid: Send power-on command after reset").
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
> Changes in V3:
>     - intent the comment at qurik entry
>     - add Fixes:flag for previous commit id
>
> Changes in v2:
>     - move comment to quirk entry

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 9993133..32e3287 100644
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
> @@ -178,6 +179,12 @@ static const struct i2c_hid_quirks {
>                  I2C_HID_QUIRK_RESET_ON_RESUME },
>         { USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
>                 I2C_HID_QUIRK_BAD_INPUT_SIZE },
> +       /*
> +        * Sending the wakeup after reset actually break ELAN touchscreen controller
> +        * Add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
> +        */
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
