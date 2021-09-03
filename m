Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42840400458
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 19:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349763AbhICRyT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 13:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbhICRyT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 13:54:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9064C061575;
        Fri,  3 Sep 2021 10:53:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so95022wme.0;
        Fri, 03 Sep 2021 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pk0Q354IrXxixlRQHeke950f5UvT47k0Ru8D7glXhLk=;
        b=I0kDz44NaaUGfpVwEdOlm6iK+RHXn37fTVSK9nJ2fDLDsvGvcxb1tWDpVu5o7vduMK
         DS5cqAQc4kGp1UV8RzonhmUCu4ATyHx+NL4cDHeuN45EKmIAyrq6l69AQyghn+ljwA86
         tkC8wSkP2cNQjEiyCcXBYIVi3v7x6JS/yMEvtCGq4SpTTISUFziEKIfJapHYi0EzIMGP
         DiKjfVwdIjVpc2y58IUqXzRKPBTRxqFjzLrAbSqij9nD+H1B1RwhtU/o2hjDH63Vyscp
         HqWyevTGrXBYWfyNSCYTnNNgM6jPmclKALxuEfg5WoMrgtOziNBImnhRnp4Buo/VqPpV
         0c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pk0Q354IrXxixlRQHeke950f5UvT47k0Ru8D7glXhLk=;
        b=PPaRyhcpfS3Wa8Y326qRuK9o+ggassyIW7cC/m20FEEMsFH/Iz1TbKlUmWACnjRG6Q
         k3u8cmxUBI2F48XYw0MjW8Hltn0w1jEHHP49zpv8rY6CTZXm9pnEQgIbvKimqHD+kk3c
         8VytG8fGflM3E175oyrP+mt8kB1w/YF7jWj4w/ebtW498djt4DscVZfh+CAvoz/jGeaC
         DGwUU7+4M70BPDzruZ35BXR6/hgIvsZkAiJOdFV2Oa9uKWro3XxgVs2YmucBw33Jvcea
         buO9AyHBlmbVvtT8wHIAYVf/k/Z38JtEyULxBRecjgVLQWIr86KhF3k4YD7YeL0QjMz6
         Zigw==
X-Gm-Message-State: AOAM5311CQGR6WjPm7juXlOgpVxNdL84bbsFc2/peJlDJVjKG2iHp/t+
        m9PDTMIVj+fMRaNDppHQ+1ToVAB0ggOtp9Rv6Lo=
X-Google-Smtp-Source: ABdhPJw8SCnJ7Hxhs6Pk3UmdBsQRkAcEHelOPldkBzpqqUBDJzZ+tQLNZN7HgJVRssti7hfbv/khINhdvDVgqIFNeOI=
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr77427wmm.16.1630691597209;
 Fri, 03 Sep 2021 10:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210903165448.26545-1-rpimentel.silva@gmail.com> <6bd7c7e4-2dab-088e-cd2f-f8311ef8b1b6@denx.de>
In-Reply-To: <6bd7c7e4-2dab-088e-cd2f-f8311ef8b1b6@denx.de>
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
Date:   Fri, 3 Sep 2021 14:53:05 -0300
Message-ID: <CAOkaPuWECCHxk=t5U+=nnvkwpPXp0dbuBmqU1wKskQi+7OJ1bg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: ili210x - Set the device name according to the
 device model
To:     Marek Vasut <marex@denx.de>
Cc:     dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 3, 2021 at 2:05 PM Marek Vasut <marex@denx.de> wrote:
>
> On 9/3/21 6:54 PM, Rogerio Pimentel wrote:
> > Adding the device model into the device name is useful when
> > applications need to set different parameters according to the
> > touchscreen being used, e.g. X11 calibration points.
> >
> > Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> > ---
> >
> > Changes since v1: Get the device ID from touchscreen controller
> > instead of driver's device list.
> >
> >   drivers/input/touchscreen/ili210x.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > index 199cf3daec10..7a897a03ed70 100644
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c
> > @@ -19,10 +19,14 @@
> >   #define ILI251X_DATA_SIZE1  31
> >   #define ILI251X_DATA_SIZE2  20
> >
> > +#define ILI_NAME_LEN         27
> > +#define ILITEK_TS_NAME "Ilitek ILI%x%x Touchscreen"
> > +
> >   /* Touchscreen commands */
> >   #define REG_TOUCHDATA               0x10
> >   #define REG_PANEL_INFO              0x20
> >   #define REG_CALIBRATE               0xcc
> > +#define REG_TS_MODEL         0x61
>
> Have a look at the following patch for the extra register names:
> [PATCH v3 2/3] Input: ili210x - export ili251x version details via sysfs

Ok, I will.

>
> >   struct ili2xxx_chip {
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
> > +     priv->chip->read_reg(priv->client, REG_TS_MODEL, buf, 2);
>
> Please check return value of ^ that function.

Ok, I will make the changes.

>
> > +     snprintf(model_name, ILI_NAME_LEN, input->name, buf[1], buf[0]);
> >       input->id.bustype = BUS_I2C;
>
> This was still tested only on ili2511, right ?

Yes, by now I have only tested ili2511.
