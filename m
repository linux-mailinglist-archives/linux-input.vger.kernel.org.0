Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BB83FE3F8
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 22:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhIAU3A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 16:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhIAU25 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 16:28:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAB4C061575;
        Wed,  1 Sep 2021 13:27:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i6so1526567wrv.2;
        Wed, 01 Sep 2021 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DQAD0N+udeECzx16YIJli0IUl03N+RKAVdrliP6oQj4=;
        b=gbbwDRg4pFi7AS5en8siz/ayh4gFKQdabvMpDfHgziwsZ699s1PX9bey9l2jHgvlyP
         2jsuo52+Q9X17Mf0thhHOZbazSOUBS2xIRCGa9Z+6tFbgYz8GwjGq8/qylo7UaupZfOO
         TWpgtClNm9onVITgW7iPYp+gr13NmmV5xFY5UeMhE0htzaGcCtzpCGJ7F4IYx73c3N9G
         Z/9FNB/GRRW/pqbiPlfXy+QVaC+nMBbMMF1uC1KmAFk+dBq+ktQWS4Hn1kyy5hs7gtv6
         rdUJKTcy/EBNXSDe571IGQR0pvJiiN3163pkjLIckhkWgsFiy8kWr+6VJFrm9abqkOnD
         SyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DQAD0N+udeECzx16YIJli0IUl03N+RKAVdrliP6oQj4=;
        b=Am5+dO5y7zQqxKUeIJDyNZoQExZlO5VRK6IwH6xEeA7Qp7Lee5xrwmGZoASTC08iYJ
         RYQlIolRqQNXTusOzhH3/MCNq1z+h6+v3mSN0P/403ca3yIRMYOEJWJSgPrpa0jsBNQs
         qAj3VlA/DIGXpgBPUkHfMN/opno1cgcf1brsIEI34ha8A4RqaUCIZSwWWOXGuHmj7UnQ
         1/euhYz+85dCZ7NC4FP/yebNyLhclikM61hN5ZmHAXzB78mfD1JvSqWZsZALwKf2+TaA
         tipP3WN58CX85uU+LPwhKlV5WK2tKEZH0d2/5XNiZct2oUdJ6OfeYethusp23dlDdIit
         BA/Q==
X-Gm-Message-State: AOAM531exr7vO7yRH+QBZ9/ZTyKhjlM89U+QVQGr1Pddqi0HLszukUTf
        Ix0gk+ccCS+NcUE7jgTcvicV1JOqNCB8ol4FMJhz+5KTDBI=
X-Google-Smtp-Source: ABdhPJwjxjBk07sOzJAdSIoAkbtVr3k87Cc0VMULoeaess9zkn5uqKv1yCG2Ia+gY/sgnLaceWzxYCzsdpofqZOCaDs=
X-Received: by 2002:adf:804a:: with SMTP id 68mr1338603wrk.236.1630528078536;
 Wed, 01 Sep 2021 13:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210901192229.29864-1-rpimentel.silva@gmail.com> <4e8ad91c-2554-4b8f-94db-aa5add5f524d@denx.de>
In-Reply-To: <4e8ad91c-2554-4b8f-94db-aa5add5f524d@denx.de>
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
Date:   Wed, 1 Sep 2021 17:27:47 -0300
Message-ID: <CAOkaPuUYQQHQZrjj3CcS1dOZrA=rH=nJJPKaPNNdBJaXO_t7ng@mail.gmail.com>
Subject: Re: [PATCH] Input: ili210x - Set the device name according to the
 device model
To:     Marek Vasut <marex@denx.de>
Cc:     dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 1, 2021 at 4:46 PM Marek Vasut <marex@denx.de> wrote:
>
> On 9/1/21 9:22 PM, Rogerio Pimentel wrote:
>
> [...]
>
> > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > index 30576a5f2f04..ca7af4a6f588 100644
> > --- a/drivers/input/touchscreen/ili210x.c
> > +++ b/drivers/input/touchscreen/ili210x.c
> > @@ -19,6 +19,8 @@
> >   #define ILI251X_DATA_SIZE1  31
> >   #define ILI251X_DATA_SIZE2  20
> >
> > +#define ILI_NAME_LEN         27
> > +
> >   /* Touchscreen commands */
> >   #define REG_TOUCHDATA               0x10
> >   #define REG_PANEL_INFO              0x20
> > @@ -394,6 +396,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >       struct input_dev *input;
> >       int error;
> >       unsigned int max_xy;
> > +     char *model_name;
> >
> >       dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
> >
> > @@ -440,7 +443,11 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >       i2c_set_clientdata(client, priv);
> >
> >       /* Setup input device */
> > -     input->name = "ILI210x Touchscreen";
> > +     input->name = "Ilitek         Touchscreen";
> > +     model_name = (char *)input->name;
> > +     snprintf(model_name, ILI_NAME_LEN, "Ilitek %s Touchscreen",
>
> Which ilitek devices do you have available exactly ?
>
> There is a firmware interface which does report the device type, but I
> don't know whether it works on all the ilitek touchscreen devices. If it
> does, then it could be used here to pull the type from the firmware and
> then use this instead
>
> snprintf(model_name, ILI_NAME_LEN, "Ilitek ILI%04x Touchscreen", type);
>
> Try this command against the touch controller, it sends it command 0x61
> and reads two bytes of the reply:
> i2ctransfer -f -y 1 w1@0x41 0x61 r2
> 0x10 0x25 # <---- on ILI2510 it reports 0x25 0x10 in reverse

Thanks for the comments and suggestions. I'll make the changes and send V2.
