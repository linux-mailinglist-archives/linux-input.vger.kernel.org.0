Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D4A3FEDE3
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 14:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344316AbhIBMkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Sep 2021 08:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhIBMkc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Sep 2021 08:40:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC76C061575;
        Thu,  2 Sep 2021 05:39:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n5so2663335wro.12;
        Thu, 02 Sep 2021 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=csJI04gD3zaIbD2bwDlVjNA1ZtD/B7+S6sqXXeIBark=;
        b=Ms0uIm39URlPnIU7XBTUH0zhkU1enB8aBLgjRSwhb9I5CpeEDb9LCv3+rRh88Xk5IP
         unAe4xOQbBG6CgtO5iZqQ/LrhzBVf4WgaGTfN/bOdwDz25s7HFIkbN511xYILeaZdmCg
         SueO1/o6j9TdiXUL3OgwSGgOMsjHVjbnOdt7U87ZvY+cr9kQIyBQEOTigmDyhICt21gQ
         axRjG8bA2wYa/J6ILvFwInqJA5b7UwpknNQ8OMgNKpoUQVRMqIKx3Gwx5P9CK74qg9KF
         HALFAhl5LiChxLzn+MEPqdQPNW8vEjYc1vs3sh8k3FoJrmSyOZBhTLdsMWV+jWxEa3cC
         GoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csJI04gD3zaIbD2bwDlVjNA1ZtD/B7+S6sqXXeIBark=;
        b=Sbow6F8am/p1AJJYk8nOCg2Vz/tPzc3McHAFNY2ewhecyUvCJruzohKaMM84mzTb8r
         RUqHeG+cI6K36axckgBpkGtpso4f0eDpwU7iCoxci/YvhVOWdO4ruDydUF+3lYFNUWfo
         DjyXCdE8xgWvIxvaiit4qOuuCz7SIkJvjPaeGKJ62fJpyA+TVe/Vf31LC0us9FP3+UZc
         8Mr0EUn9tD/pNYNWg+pb9c1b4QGemw7z4dFh/9nJadpiOErtt7RNN95XabdlK1AJLgsq
         Hpibyom+QQOPH4PeMWkci6sXHNCrNmnM1P2yWwKisR+FL0OaD2p1w/zCo0I39EwA+xUe
         ozxg==
X-Gm-Message-State: AOAM533I36lRWO4mGBKIyPV1xB8TMDKzUpAcaejt94LzlYR/xsnjkBSN
        O5OZS+wGZzuIKY3P5kLFntJh5HoMIlNe9XxbkISySZMy+7ELPSHs
X-Google-Smtp-Source: ABdhPJwF4/ldHk+8n4ZwSPvIeSIvkU+DAZuAm5eSduttkrF9qmebi0KijiSUPbi27iXvDGWJ/d21YzcPQP8Jx3pGPy0=
X-Received: by 2002:adf:804a:: with SMTP id 68mr3520579wrk.236.1630586371541;
 Thu, 02 Sep 2021 05:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210901192229.29864-1-rpimentel.silva@gmail.com>
 <4e8ad91c-2554-4b8f-94db-aa5add5f524d@denx.de> <CAOkaPuUYQQHQZrjj3CcS1dOZrA=rH=nJJPKaPNNdBJaXO_t7ng@mail.gmail.com>
 <c0f13f0f-48c8-f58d-4589-ad78b64fe809@denx.de>
In-Reply-To: <c0f13f0f-48c8-f58d-4589-ad78b64fe809@denx.de>
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
Date:   Thu, 2 Sep 2021 09:39:20 -0300
Message-ID: <CAOkaPuVV3HK8OvVMQxjRPh1S_pFjvbEgsR-5UB51H8aguCw6Lw@mail.gmail.com>
Subject: Re: [PATCH] Input: ili210x - Set the device name according to the
 device model
To:     Marek Vasut <marex@denx.de>
Cc:     dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 1, 2021 at 5:48 PM Marek Vasut <marex@denx.de> wrote:
>
> On 9/1/21 10:27 PM, Rogerio Pimentel wrote:
> > On Wed, Sep 1, 2021 at 4:46 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 9/1/21 9:22 PM, Rogerio Pimentel wrote:
> >>
> >> [...]
> >>
> >>> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> >>> index 30576a5f2f04..ca7af4a6f588 100644
> >>> --- a/drivers/input/touchscreen/ili210x.c
> >>> +++ b/drivers/input/touchscreen/ili210x.c
> >>> @@ -19,6 +19,8 @@
> >>>    #define ILI251X_DATA_SIZE1  31
> >>>    #define ILI251X_DATA_SIZE2  20
> >>>
> >>> +#define ILI_NAME_LEN         27
> >>> +
> >>>    /* Touchscreen commands */
> >>>    #define REG_TOUCHDATA               0x10
> >>>    #define REG_PANEL_INFO              0x20
> >>> @@ -394,6 +396,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >>>        struct input_dev *input;
> >>>        int error;
> >>>        unsigned int max_xy;
> >>> +     char *model_name;
> >>>
> >>>        dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
> >>>
> >>> @@ -440,7 +443,11 @@ static int ili210x_i2c_probe(struct i2c_client *client,
> >>>        i2c_set_clientdata(client, priv);
> >>>
> >>>        /* Setup input device */
> >>> -     input->name = "ILI210x Touchscreen";
> >>> +     input->name = "Ilitek         Touchscreen";
> >>> +     model_name = (char *)input->name;
> >>> +     snprintf(model_name, ILI_NAME_LEN, "Ilitek %s Touchscreen",
> >>
> >> Which ilitek devices do you have available exactly ?
> >>
> >> There is a firmware interface which does report the device type, but I
> >> don't know whether it works on all the ilitek touchscreen devices. If it
> >> does, then it could be used here to pull the type from the firmware and
> >> then use this instead
> >>
> >> snprintf(model_name, ILI_NAME_LEN, "Ilitek ILI%04x Touchscreen", type);
> >>
> >> Try this command against the touch controller, it sends it command 0x61
> >> and reads two bytes of the reply:
> >> i2ctransfer -f -y 1 w1@0x41 0x61 r2
> >> 0x10 0x25 # <---- on ILI2510 it reports 0x25 0x10 in reverse
> >
> > Thanks for the comments and suggestions. I'll make the changes and send V2.
>
> Can you tell which ILI2xxx touch controller you have exactly ?

Now I have only the ILI2511. Will also have to support ILI2510 and ILI2118.

> Can you share the output of the 'i2ctransfer' (from i2c-tools) command
> above ?

# i2ctransfer -f -y 3 w1@0x41 0x61 r2
0x11 0x25
