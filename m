Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAD1386E33
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 02:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344869AbhERARI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 20:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239197AbhERARH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 20:17:07 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997E3C061573
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 17:15:50 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id u188so4024196vsu.8
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7fdRHc9Wi7UG6lD/9HPxLLCPuJpaTRjDV9ZqVM+M7I=;
        b=Y5JZPZDUm6GUMAmEQQ4jiFpsrosr3DsdfYLaUg8NUs3T4SREERUGcXeYJ+gPlk73sN
         oPx/W3nJCBvN3N8S5Ozb5XOPioNQS/dkRdgWnhbH5AGbMhjhC5+wiwbsyTQ7BClGHq/F
         rxAQkwD90r8Y0Z4zxxvLgQkT9Xm8UNOJziHqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7fdRHc9Wi7UG6lD/9HPxLLCPuJpaTRjDV9ZqVM+M7I=;
        b=bVEm5O1swUFccwBuARYx43cSSOzLCwy4fgn/LLLFsj6UNYEJppQRpw0Bo8pHvjcqh0
         pQ1rRrT6QpYEcJ2jt5ik+S/GVoKoEAv9LgSkmlLbLFBsBfje/wb/eJinHJmh8uuRr+Oq
         My5n7hrK+ARMJ88qq3tL8xg/XktIKsi1V6KLEc3xY4OuPOTdYh8l8FB+X8UcwvdzFjQQ
         ke9BrEhCOPr4zFWd7sJCK0qanbQ1IGre1GsiPdKR0Sy+ce6Wsb0qw+eItIvawoFQ9tI7
         chDf9mGdNo5OEd34FhwM766FuKEHOYRbd8I/mImSkvoDWjws8juqz8uScD6SorMUpmtP
         AAnA==
X-Gm-Message-State: AOAM530davy8xz/hnkfxjOEaG2CstlKJeHEf4XHjHpX6I+Ek5AWGBD6y
        m0VbYoVmaSDKJAvl6nu2pXdccH9LD1XEtktZ
X-Google-Smtp-Source: ABdhPJzuzmgRvEqfw2SunqKathbtErb7ZxaMjmHyqESriM6j0DwZGrLXAjC6pXTRiBbydkXfIplDXw==
X-Received: by 2002:a67:fe57:: with SMTP id m23mr3131613vsr.47.1621296949518;
        Mon, 17 May 2021 17:15:49 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id z6sm2871935ual.14.2021.05.17.17.15.48
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 17:15:49 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id f15so2716445vsq.12
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 17:15:48 -0700 (PDT)
X-Received: by 2002:a67:1ac4:: with SMTP id a187mr3159847vsa.45.1621296948281;
 Mon, 17 May 2021 17:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <1621295824-12730-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1621295824-12730-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Mon, 17 May 2021 17:15:37 -0700
X-Gmail-Original-Message-ID: <CA+jURcv-o3g3C6zZhGio7KKtco-b+dGk+vm=3Nj8ps_-yMQRNA@mail.gmail.com>
Message-ID: <CA+jURcv-o3g3C6zZhGio7KKtco-b+dGk+vm=3Nj8ps_-yMQRNA@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Add I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON to
 optimize timing
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
        Jingle <jingle.wu@emc.com.tw>, Paris Yeh <pyeh@google.com>,
        "sukumar . ghorai" <sukumar.ghorai@intel.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 17 May 2021 at 16:57, Johnny Chuang <johnny.chuang.emc@gmail.com> wrote:
>
> There is a hard coding 60ms delay after I2C_HID_PWR_ON commadn.
> Elan didn't need the delay, so we add a quirk to reduce boot time and resume time.
>
> Optimized: eef4016243e9("HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands")

I don't think Optimized: is a valid commit tag, though I'm not sure if
it'll cause any problems.

>
> Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 9993133..e7ec280 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> [...snip...]
> @@ -178,6 +179,11 @@ static const struct i2c_hid_quirks {
>                  I2C_HID_QUIRK_RESET_ON_RESUME },
>         { USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
>                 I2C_HID_QUIRK_BAD_INPUT_SIZE },
> +       /*
> +        * Optimize boot time and resume time
> +        */

This comment is a bit too vague to be useful; maybe state that Elan
devices don't need the delay instead, or just remove the comment.

Other than that,

Reviewed-by: Harry Cutts <hcutts@chromium.org>

> +       { USB_VENDOR_ID_ELAN, HID_ANY_ID,
> +                I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON },
>         { 0, 0 }
>  };
>
> @@ -427,7 +433,8 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>          * PWR_ON requests. Testing has confirmed that several devices
>          * will not work properly without a delay after a PWR_ON request.
>          */
> -       if (!ret && power_state == I2C_HID_PWR_ON)
> +       if (!ret && power_state == I2C_HID_PWR_ON &&
> +           !(ihid->quirks & I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON))
>                 msleep(60);
>
>         return ret;
> --
> 2.7.4
>
