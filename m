Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA3B403C64
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 17:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbhIHPTq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 11:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239472AbhIHPTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 11:19:43 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A5CC061575;
        Wed,  8 Sep 2021 08:18:35 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so1840355wms.2;
        Wed, 08 Sep 2021 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TXNpwq2ZA19YDxcovVdDZYV04t8wKrTS33mAVLEbOHg=;
        b=T8Oku7rjZb52qcR9974WFcaIs4nucE+UBffZCsKTMWeaWMtqE8knTD7jb2Ka7Pg1VY
         pvlUyFmmtdWcd4BK1/EVnQsZT2RS8FLjBrFkPY3Ffv2/Us2Ni+L9H1ZBMK7+tGEmRHKz
         GdLrWpMX/PPLPD40cBDFjvKePDvGz5l9eta4M+72EaCwjzH5qk6qN3Pfny6a7DzCSCWl
         O9PFfzNzNBKCmjSOHb6SVzXuoZzeiZQX3TsTo/jzKSBw/dlUQwabEcBcAjNCggUVrZSl
         iRFyLK9dGpLu354UUU/pn20VNjrTXCa6djQMGXvWYC+AnEajqqxnGwRehveZYfp0+1XI
         chWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TXNpwq2ZA19YDxcovVdDZYV04t8wKrTS33mAVLEbOHg=;
        b=ELUxMRTzaYy/QnMBAsHCqaBXUAesjUoqVJDc4xzCSmXzsAzYB9Igf0RBPNMQGPOCEA
         c8UVso+AaSaR5sSZQbOrJ0kMQBH6ObWzH43D0UbVhzZBwB7XvYWt/2wIri3KwzKh3LMH
         VbRnB4G91fbE17IzvbxDFITYKCNt4854t4azanTFSRcaTrixoD2R7MK6RsmEMeu7QpMB
         jcuNODQrfGLKEMZubF/P6D4RHkMlbBlNrAi/fglfCY4KESX5ioQWe7dzWB71JgljiD74
         AfGREQs1sBUWXve/vabst4+O7dsukYFS38wSmM7J7El6Tnpydw1M9YyuAKNlN4VYULy+
         N22A==
X-Gm-Message-State: AOAM53132Iv8IC5u6eMCcAHaZ8jL9Y52gi5KKSl9frpJlMpS56O2REAR
        Pv5HHtEyLSPR0zg8keD8GrUiNZtaVCA0fnZvtlc=
X-Google-Smtp-Source: ABdhPJxlyqz6Yhj+IV6BkpimYRd6LGuEgWGRILRagDBtzzWe4GX0CcKnFN86Cd1IcVNzCnBtVCI1IL8xb/SzWYeqYSY=
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr4073124wmm.16.1631114313657;
 Wed, 08 Sep 2021 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210903165448.26545-1-rpimentel.silva@gmail.com> <YTMPYJK44lujITCk@google.com>
In-Reply-To: <YTMPYJK44lujITCk@google.com>
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
Date:   Wed, 8 Sep 2021 12:18:22 -0300
Message-ID: <CAOkaPuW9dkRztRxG4MQdQ_SCfQcjd8_mmMa_3=0vO9x7cqju5A@mail.gmail.com>
Subject: Re: [PATCH v2] Input: ili210x - Set the device name according to the
 device model
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     hansemro@outlook.com, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 4, 2021 at 3:17 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rogerio,
>
> On Fri, Sep 03, 2021 at 01:54:48PM -0300, Rogerio Pimentel wrote:
> > Adding the device model into the device name is useful when
> > applications need to set different parameters according to the
> > touchscreen being used, e.g. X11 calibration points.
>
> Typically model would go into input->id.product and optionally
> input->id.version.
>
> >
> > Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> > ---
> >
> > Changes since v1: Get the device ID from touchscreen controller
> > instead of driver's device list.
> >
> >  drivers/input/touchscreen/ili210x.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > index 199cf3daec10..7a897a03ed70 100644
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c
> > @@ -19,10 +19,14 @@
> >  #define ILI251X_DATA_SIZE1   31
> >  #define ILI251X_DATA_SIZE2   20
> >
> > +#define ILI_NAME_LEN         27
> > +#define ILITEK_TS_NAME "Ilitek ILI%x%x Touchscreen"
> > +
> >  /* Touchscreen commands */
> >  #define REG_TOUCHDATA                0x10
> >  #define REG_PANEL_INFO               0x20
> >  #define REG_CALIBRATE                0xcc
> > +#define REG_TS_MODEL         0x61
> >
> >  struct ili2xxx_chip {
> >       int (*read_reg)(struct i2c_client *client, u8 reg,
> > @@ -384,6 +388,8 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >       struct input_dev *input;
> >       int error;
> >       unsigned int max_xy;
> > +     unsigned char buf[2];
> > +     char *model_name;
> >
> >       dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
> >
> > @@ -430,7 +436,10 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >       i2c_set_clientdata(client, priv);
> >
> >       /* Setup input device */
> > -     input->name = "ILI210x Touchscreen";
> > +     input->name = ILITEK_TS_NAME;
> > +     model_name = (char *)input->name;
>
> Umm, no. Smashing RO data is not nice.
>
> > +     priv->chip->read_reg(priv->client, REG_TS_MODEL, buf, 2);
> > +     snprintf(model_name, ILI_NAME_LEN, input->name, buf[1], buf[0]);
> >       input->id.bustype = BUS_I2C;
> >
> >       /* Multi touch */
> > --
> > 2.17.1
> >
>
> Thanks.
>
I agree with the comments.
Please, discard this patch.

Rogerio
> --
> Dmitry
