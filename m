Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228C735CFE1
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 19:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243969AbhDLR5Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 13:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243494AbhDLR5Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 13:57:24 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35161C06174A
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 10:57:04 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id b18so1934298vso.7
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=feoSzfSzzICsbE+fv1IwHe4MfBON3tlUFar87ABJi80=;
        b=FZKnfcIruj9tL0DbGjpeC+AKWO+kQ6WO0G6f+2rbc9gBBvrv7i8qfTC/pDFiHZcTG2
         DCgk7N0cKY/9tN5xgGOzuXjAtJGooEimt9864G+rNnnUjWHRzDCQ12GYQfCl4DvH9AIs
         Eq0h9CYLVKNstqtZhvA5ffs3PnoppDHRKpgh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feoSzfSzzICsbE+fv1IwHe4MfBON3tlUFar87ABJi80=;
        b=lK+2R96/240K/pPu5DMGN5z+rCB4tYtvZwM7YVV/JQCmdUpPzfzCIHzrxaKByPtCYm
         GwbIihRLay3soFcAOUo+b9ivXhjq9QC5aGdbs1HPTR4DslilXLLGuHFbd8KsjDY3Z02k
         qVsgMP/NzDSnLKnMJ5pbxX2/juc7MGyZ31OpPOqBTfEFqFFZe5rBosSAFWUxO8Ltl4kS
         IwotBZEK0ALQ0n6xTxR4PhtIGWhQ80AhxJfnURo4SKxBrTm0gXHC+VVyV1cGJYDwm9h+
         rT5UxxO5oX9r9RANqvOUkYVDRK1OBJ9yq50ZzvySOyjVzs4NawNBkpuJptIkYPxLywMk
         3M0A==
X-Gm-Message-State: AOAM530BQm7y9rx5BIYjk3NycHsc/tBAsicpipk5J+tHy3XM7a110JZt
        qIC90Nmdxv/FFUyaW3qSxMwQfrJ6kJPAMg==
X-Google-Smtp-Source: ABdhPJwrYXdPtwCShXeI/pp0+7Mj2b5Mw9a54UhWvjwe/jUPV8SIvWfJ5G9PkOw2f9+DWh52zoCbLQ==
X-Received: by 2002:a67:cf41:: with SMTP id f1mr20956460vsm.42.1618250222955;
        Mon, 12 Apr 2021 10:57:02 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 3sm1019444vsx.1.2021.04.12.10.57.01
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 10:57:02 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id b18so1934106vso.7
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 10:57:01 -0700 (PDT)
X-Received: by 2002:a67:33d5:: with SMTP id z204mr2793658vsz.45.1618250221333;
 Mon, 12 Apr 2021 10:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <1618190463-12993-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1618190463-12993-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Mon, 12 Apr 2021 10:56:49 -0700
X-Gmail-Original-Message-ID: <CA+jURcu2a91quZc+gto=HixCH+O_V+fPVdKrO_9HvR2pcu9RmQ@mail.gmail.com>
Message-ID: <CA+jURcu2a91quZc+gto=HixCH+O_V+fPVdKrO_9HvR2pcu9RmQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Skip ELAN power-on command after reset
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

On Sun, 11 Apr 2021 at 18:21, Johnny Chuang <johnny.chuang.emc@gmail.com> wrote:
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

It's probably a good idea to add a Fixes: tag, like so:

    Fixes: 43b7029f475e ("HID: i2c-hid: Send power-on command after reset")

Other than that,

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

> ---
> Changes in v2:
>     - move comment to quirk entry
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 9993133..957d865 100644
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
> +/*
> + * Sending the wakeup after reset actually break ELAN touchscreen controller
> + * Add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
> + */
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
