Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2C7376649
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 15:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbhEGNjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 09:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46841 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236049AbhEGNjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 May 2021 09:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620394730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1lBldkVI1Lz29e5G5ZcuHtAMgpbsiACK1LzJjPj1N0E=;
        b=QtFOMDMtrDRZxn3NvdHBA7qR5/yAX/YGqpdT2acwX/+Obzp3OB1Fbt8pW0zZf55Db9J32U
        nBaAi5rl5w9S7M5TUHtU7uPxwh33iyppzUPT6LXWHn6he6rxjoy2VpAyaV0SAx2qv1jiDZ
        MfeJAAbLhVhwqXu71W8pSG0g2LtPNG4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-iMhHW3DgM6ymmRwc6ZEXyQ-1; Fri, 07 May 2021 09:38:48 -0400
X-MC-Unique: iMhHW3DgM6ymmRwc6ZEXyQ-1
Received: by mail-pj1-f71.google.com with SMTP id h8-20020a17090a7108b029015020b35657so5243616pjk.5
        for <linux-input@vger.kernel.org>; Fri, 07 May 2021 06:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lBldkVI1Lz29e5G5ZcuHtAMgpbsiACK1LzJjPj1N0E=;
        b=QOtJHYlDkUOQ5FlMOll/3uV7cu3dSuOzgJcbmFZoXOOOW5iy5pWQ1eaYZnKuWoiqJt
         UuyKRWGhylvNnQ0+PgyTUUYJYRlxhtfJnLPTHnm6H3Ph/gbFILqIyN7sl7HOHLnU4RFq
         vppV64mqbG+FsFoE5L/DDoLhYDq2hMNptFzOSkMKUTHW7Wcxyw1Y+SNqMp4kjosj9R+E
         0iIhGlHV2pbgGJM9Tc6bRU5Y+CcLbNC9PvMudltFEFLCx61x+/Eg2lzU+FnCnq8hdaMd
         RKno+VMZYP6odtqgz7MXocpX0jCVyBguojeirXSFME3bIijjgtpPZeN7sDdQ96BGWpWJ
         YgXA==
X-Gm-Message-State: AOAM531ArL7iXvNcsa1zfU+heyL48P3zaO2THqMIfdr1QCL/bajvThuB
        wNvGj3j9lGpaRoxLxokSuNPw4xh3eWo7Lehx/J4VBhhJQNFFbCJW8oegY0anZnH/9OS6pB++P5M
        CWLow2Y6UDklGTC2Kj/g+qFLs49RKyvFKvMwksSc=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr10768504pjr.234.1620394727615;
        Fri, 07 May 2021 06:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTx0E1DzDaW8HBGJ7bD9cKUSs/UfJO/Q2YfaYjiJSZQ898sjau4tHQZy81CQ3yjgb+FYIVmcN7sCgesANTjbs=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr10768485pjr.234.1620394727364;
 Fri, 07 May 2021 06:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 7 May 2021 15:38:36 +0200
Message-ID: <CAO-hwJL1RFXDTHaMj+rHrERBMhNhYv57TBM1VSoTx2a4OA25NQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: i2c-hid: Skip ELAN power-on command after reset
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Harry Cutts <hcutts@chromium.org>,
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

Hi Johnny,

Apologies fo the delay.

When I first saw your patch I wondered why we need a  special case for Elan.
But then, we need a special case for SIS, as mentioned by
43b7029f475e. Given that this patch was in for a year and a half, and
not many people seemed to complain about it, I decided to apply your
patch.


On Tue, Apr 13, 2021 at 3:21 AM Johnny Chuang
<johnny.chuang.emc@gmail.com> wrote:
>
> Fixes: 43b7029f475e ("HID: i2c-hid: Send power-on command after reset").

As requested per Doug, I have moved that Fixes tag at the end, though
I forgot to remove the extra '.' at the end :-(

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

I removed that extra second line.

Also added Cc: stable, and pushed to for-5.13/upstream-fixes

Cheers,
Benjamin

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

