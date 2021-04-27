Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75A036BF09
	for <lists+linux-input@lfdr.de>; Tue, 27 Apr 2021 07:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhD0F5u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Apr 2021 01:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhD0F5u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Apr 2021 01:57:50 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA81C061574;
        Mon, 26 Apr 2021 22:57:06 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id z14so5988323ioc.12;
        Mon, 26 Apr 2021 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Z6J1GraQteFf4f1Kc+mAC+MgzcboSWCNdwYiT3xVpQ=;
        b=e8mtQE1L2sL0RTH5Hok1wFOmv/DUKnWoUGk68S8LPgYQs/72wT2Y26euaaVCijKziU
         SpE9/9YQYbk5kC1GN4xt0GNJ678iLq1DnRcHK8oAA5+wLUxoKkfjbMestEBfS4189Eec
         JMY4HCv+fTtzIIIo+k9EnKQ9bZlQUKndn6o0O03TdKiXrhp132aOZA2yzjVlYEyWuPqe
         kLkB6XOAzn/BSrSNjreY1Bwk36vIETe5sV9wLSg6mcdm8WxmYsrFhCnTpX7PoYK9lFkD
         TLZwerJhSZr56cpdFhi7J0C4DclRYuTvkHtcDoo2FXG20w7bNf3xzSq8aU+fGSrctyCW
         VpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Z6J1GraQteFf4f1Kc+mAC+MgzcboSWCNdwYiT3xVpQ=;
        b=k5+roDofPquYsPjOmd0DVr72mpfLMR8LROd1f+LWlW+woeKIrKerWoDRMSum1X8I2v
         GFk5m2kfkzWxB1Wyegx6olZ+xE5v7OW4Gdacmy866FoX0cC5+g83Rf8/cJ1fkkJUBSPG
         hDwATCCY0OCm0FASuxhb3hHZV58+JJ5c/K5iUIGYWyBJTjxZCRqYyaExzti2qH5OnmIl
         JidLXrrVjN1wTmMmxe08TumsKGoiY9PpKxZkh8qqYiBGctdo0Z4fS1/6zac/uMZurfrE
         eaFBzldBoW60XiocCgF60ZdPDosHgXg4q0jMYlDgD5I9oBo3rX6PUlO3psT3LkFQledY
         wNKw==
X-Gm-Message-State: AOAM533OKoaEmIT+mw5gC+XwCemj7VBLtobRR6y41XTc4R/TghKDmQJl
        fAeNUXuRAL8+PnU58zpJqBCBkk/IZi0VBMuTlUo=
X-Google-Smtp-Source: ABdhPJzorSmvhiHI0jjQtj/73v7KNl7LRR1mcxhJo/nLCvnyV8whvjK4sNKJwhHiHGDQi/5JjNXYqNHp/PWwYUfqV0w=
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr19828850jak.91.1619503026094;
 Mon, 26 Apr 2021 22:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210326015229.141-1-alistair@alistair23.me> <20210326015229.141-7-alistair@alistair23.me>
 <YGI5or9QsfbONo2e@google.com>
In-Reply-To: <YGI5or9QsfbONo2e@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 27 Apr 2021 15:56:40 +1000
Message-ID: <CAKmqyKPOnUOH7idpKa62fSgj2SVSFZLuenGS-LfHJ9uOqPZBpg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] Input: wacom_i2c - Add support for reset control
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alistair Francis <alistair@alistair22.me>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 6:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Alistair,
>
> On Thu, Mar 25, 2021 at 09:52:27PM -0400, Alistair Francis wrote:
> > From: Alistair Francis <alistair@alistair22.me>
> >
> > Signed-off-by: Alistair Francis <alistair@alistair22.me>
> > ---
> > v4:
> >  - Initial commit
> >
> >  drivers/input/touchscreen/wacom_i2c.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index 84c7ccb737bd..28004b1180c9 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -55,6 +55,7 @@ struct wacom_features {
> >  struct wacom_i2c {
> >       struct i2c_client *client;
> >       struct input_dev *input;
> > +     struct reset_control *rstc;
> >       struct touchscreen_properties props;
> >       u8 data[WACOM_QUERY_SIZE];
> >       bool prox;
> > @@ -175,6 +176,8 @@ static int wacom_i2c_open(struct input_dev *dev)
> >       struct wacom_i2c *wac_i2c = input_get_drvdata(dev);
> >       struct i2c_client *client = wac_i2c->client;
> >
> > +     reset_control_reset(wac_i2c->rstc);
>
> Why does this device need to be reset on every open compared to doing it
> in probe?
>
> > +
> >       enable_irq(client->irq);
> >
> >       return 0;
> > @@ -193,6 +196,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
> >  {
> >       struct wacom_i2c *wac_i2c;
> >       struct input_dev *input;
> > +     struct reset_control *rstc;
> >       struct wacom_features features = { 0 };
> >       int error;
> >
> > @@ -201,6 +205,12 @@ static int wacom_i2c_probe(struct i2c_client *client,
> >               return -EIO;
> >       }
> >
> > +     rstc = devm_reset_control_get_optional_exclusive(&client->dev, NULL);
> > +     if (IS_ERR(rstc)) {
> > +             dev_err(&client->dev, "Failed to get reset control before init\n");
> > +             return PTR_ERR(rstc);
> > +     }
>
> I think majority users will have this controller reset line connected to
> a GPIO. I briefly looked into reset controller code and I do not see it
> supporting this case. How is this device connected on your board?

That's a good question. I am going to drop this patch as I'm not
convinced it's required.

Alistair

>
> > +
> >       error = wacom_query_device(client, &features);
> >       if (error)
> >               return error;
> > @@ -214,6 +224,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
> >
> >       wac_i2c->client = client;
> >       wac_i2c->input = input;
> > +     wac_i2c->rstc = rstc;
> >
> >       input->name = "Wacom I2C Digitizer";
> >       input->id.bustype = BUS_I2C;
> > --
> > 2.31.0
> >
>
> Thanks.
>
> --
> Dmitry
