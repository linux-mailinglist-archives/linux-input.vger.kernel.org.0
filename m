Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6728271290
	for <lists+linux-input@lfdr.de>; Sun, 20 Sep 2020 08:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgITGCd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Sep 2020 02:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgITGCd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Sep 2020 02:02:33 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B238C061755;
        Sat, 19 Sep 2020 23:02:33 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d190so11981703iof.3;
        Sat, 19 Sep 2020 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=54BL/Si3BlVb50ct9dniUNYj8jzIi7YaxPCf97uTw6M=;
        b=lZzajSWnacsUj8VlLJV5NuDCHgrdmhc4sIufiMBdqClvkCEPmE1PgQypHB5xTiM7C9
         /pht2mGojt/w+Lc8JT2nH3PDn8054wMa3M6txSjGL3l1Hud711dN7qDfLPYEx/hExEVp
         gcWNEaFssKnyYyeTI4iJGRl8zEIzGvoBztCzcMh9F+oIokr8K9pRM6PbeXsOiTE2qjpk
         hZDS08PsaKhJxM/sDgBaUYiHCN3veql1+P90tt79ASf3O4/fPaVjGvd7qp85/SHVFZAt
         s2CWr0xhU/msgzLXeFCcop9lbFa9uSlc/7vtCm4Nh7g3fC/dHDFYrZmb0ytcvuIdR6Cg
         8JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=54BL/Si3BlVb50ct9dniUNYj8jzIi7YaxPCf97uTw6M=;
        b=dwNB8ZO4A+CobDhDdzFGVBStC+vufjaWNtZdeT2YWbQ/5029tbeDBNyOz0mL39YPt1
         ZwaSkObvjd7E1nUZcMLw1Txnl8DC3STsSzqpEGsOoERArsJmQEpxE40QY7NTBiA2XOPO
         kdH1MpWz3OJ9vMay/gViJXIvgfk6sizFmOHWeOHPWY6JOkMgCCU+qqSiShk11GsSqh5a
         M2hw4Xp54YnlV97jyb14K1YM4oTvVsYQOxeizhB3fHEKX0ZpqABCzplQmKYvpozT8qJz
         oVfiIC0cjkHhX8AuzmDs9X9+pEUxyvKS/y4BkEuAq3u0OxrDl/qwTgI5HBUfQ1Xr5ldt
         Ya9w==
X-Gm-Message-State: AOAM533MtiMBigb5/81zxGTXa9hra1jeo96yADkooyJBiq1IcuR6V4yw
        k9UCM+E0LUQz2VRu+bwZVDyg+OV33qS90z8bjAE=
X-Google-Smtp-Source: ABdhPJwyR2MQa95NRLLWbJqJLQJSPsUgHrZFF4YAhsOAq+iRhyY9W+7SZe1UxSTPc7qsljsLGbN8QEN3P3mqYzo1i7U=
X-Received: by 2002:a6b:3a0b:: with SMTP id h11mr32323815ioa.109.1600581752611;
 Sat, 19 Sep 2020 23:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200918125601.8210-1-jiada_wang@mentor.com> <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com> <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
 <11e0052b-ae7a-71bc-1b28-9d5b42acfd11@gmail.com> <e9ad6ba7-05a3-af3b-85c3-94797fb33554@mentor.com>
In-Reply-To: <e9ad6ba7-05a3-af3b-85c3-94797fb33554@mentor.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Sat, 19 Sep 2020 23:02:23 -0700
Message-ID: <CAKdAkRQnvCb+E1-i3HaZgXBPSYoJnr3_wEVB_51cXw3FV+NW7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep mode
To:     "Wang, Jiada" <jiada_wang@mentor.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Nick Dyer <nick@shmanahar.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 19, 2020 at 10:28 PM Wang, Jiada <jiada_wang@mentor.com> wrote:
>
> Hi Dmitry
>
> On 2020/09/20 4:49, Dmitry Osipenko wrote:
> > 18.09.2020 18:55, Wang, Jiada =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ...
> >>>>    +static void mxt_wake(struct mxt_data *data)
> >>>> +{
> >>>> +    struct i2c_client *client =3D data->client;
> >>>> +    struct device *dev =3D &data->client->dev;
> >>>> +    struct device_node *np =3D dev->of_node;
> >>>> +    union i2c_smbus_data dummy;
> >>>> +
> >>>> +    if (!of_device_is_compatible(np, "atmel,mXT1386"))
> >>>> +        return;
> >>> I'm not sure whether you misses the previous answers from Dmitry
> >>> Torokhov and Rob Herring, but they suggested to add a new device-tree
> >>> property which should specify the atmel,wakeup-method.
> >>>
> >> I think Rob Herring prefers for the compatible solution than property.
> >
> > Actually, seems you're right. But I'm not sure now whether he just made
> > a typo, because it's actually a board-specific option.
> >
> Right, I think since it is a board specific issue,
> so "property" is the preferred way,

Why are you saying it is a board-specific issue? It seems to me that
it is behavior of a given controller, not behavior of a board that
happens to use such a controller?

> if I understand you correctly,
> compatible combine with property is what you are suggesting, right?

We should gate the behavior either off a compatible or a new property,
but not both.

>
> > It could be more preferred to skip the i2c_smbus_xfer() for the NONE
> > variant, but it also should be harmless in practice. I guess we indeed
> > could keep the current variant of yours patch and then add a clarifying
> > comment to the commit message and to the code, telling that
> > i2c_smbus_xfer() is harmless in a case of the hardwired WAKE-LINE.
> >
> I will skip dummy read for "NONE" variant.
>
> >>> There are 3 possible variants:
> >>>
> >>>     - NONE
> >>>     - GPIO
> >>>     - I2C-SCL
> >>>
> >>> Hence we should bail out from mxt_wake() if method is set to NONE or
> >>> GPIO.
> >>>
> >> for "GPIO", we still need 25 ms sleep. but rather than a dummy read,
> >> WAKE line need to be asserted before sleep.
> >
> > Correct, I just meant to bail out because GPIO is currently unsupported=
.
> >
>
> OK
>
> > ...
> >>>>    static int mxt_initialize(struct mxt_data *data)
> >>>>    {
> >>>>        struct i2c_client *client =3D data->client;
> >>>>        int recovery_attempts =3D 0;
> >>>>        int error;
> >>>>    +    mxt_wake(data);
> >>>> +
> >>>>        while (1) {
> >>>
> >>> I assume the mxt_wake() should be placed here, since there is a 3
> >>> seconds timeout in the end of the while-loop, meaning that device may
> >>> get back into deep-sleep on a retry.
> >>>
> >> Can you elaborate a little more why exit from bootload mode after slee=
p
> >> for 3 second could enter deep-sleep mode.
> >
> > The loop attempts to exit from bootload mode and then I suppose
> > mxt_read_info_block() may fail if I2C "accidentally" fails, hence the
> > deep-sleep mode still will be enabled on a retry.

If the controller is in bootloader mode it will not be in a deep sleep
mode. If the controller was just reset via reset GPIO it will not be
in deep sleep mode. The controller can only be in deep sleep mode if
someone requested deep sleep mode. I'd recommend moving the mxt_wake
in the "else" case of handling reset GPIO.

Thanks,

--=20
Dmitry
