Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A5A42C0F4
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 15:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhJMNI2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Oct 2021 09:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhJMNI2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Oct 2021 09:08:28 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06390C061570;
        Wed, 13 Oct 2021 06:06:25 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id s3so2718664ild.0;
        Wed, 13 Oct 2021 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BmxCgvHnbMyDOEQoqKbrgihOPr63Ldit95e9FjkQGkY=;
        b=LHl8jelZkdKSOSnxp5vj9ZL3ON9uworyiozD56ig46/0AUiJC/OOaP+XbEGhgplWqg
         ZEVwNbjXXRmboHUK6HHlXdt/ps+5kQaLmntZ0vqB4nU/vAx7SGMx+QOjbCuQeuT0gIIa
         aPv1lP4oWEO8G8hQUdEHUMyp5aYBzXvfeRNrwb/m+GlKzMRCCbbbZzgWFwm85tMmD4kK
         YQfzNTGQTuarFj/4Co/IjiQWW7ybGIp4VAFpQqlxX1vYFxfrZbhgazYrm/S9Wdxbxyun
         JI4P0M0UpIB6dsdqyl1qiUR+mz5n0QvDBx0SNQOn3mmauWAdpE5nZGpuXlANxC0qZuGg
         gB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BmxCgvHnbMyDOEQoqKbrgihOPr63Ldit95e9FjkQGkY=;
        b=U8VvkvFJESWXkW6AoCS9uXEf0D7x2YsaxYFXTb5Bii76g8HUMcCZZTo+D02PCv3e5W
         81r0jrUk1Pu8dU260AyLNFc2zfG/qSn7oCafurCKyvObxjamYgtFXt3l45cakdQClXkR
         GOtDv8VftIzZis0xhi+Pfwjvx8rEd92Q4JYdOgZVLY9g/XZTZcNCK4UROG7zejH1u1F6
         RrIYun9HuUsjzmyXHgttR4CQ6H29xEdjDdY2lp1dZy80gdVulH7PSm/J0EHX2H46ERmB
         Nxt32Qa5aU3NQtl87KOg6j5vqeQcHpGANFQNRiuMWKvXR2B4AjIKCloJp4e5B+9LL2Ap
         ekog==
X-Gm-Message-State: AOAM530ZqguieJUrQMo5e5CjhKpT91NpGMHk7mTL6i12mz9A98mgyOsi
        n8FYeyTxnCKtjngDHfkEfwQO65RCw4eHBUeKsvRNSvuweMeOCg==
X-Google-Smtp-Source: ABdhPJz7yllMKyOK+RVnc+raYL/RVy8aTMFJ47kpkCoIaMcb25Xe1vjvtxhGvWvrPOmar75iSH34uVbEry20Opj/Azs=
X-Received: by 2002:a05:6e02:1ba8:: with SMTP id n8mr2714576ili.74.1634130384477;
 Wed, 13 Oct 2021 06:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211009113707.17568-1-alistair@alistair23.me> <YWZOL2ne/DSqaJuM@google.com>
In-Reply-To: <YWZOL2ne/DSqaJuM@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 13 Oct 2021 23:05:58 +1000
Message-ID: <CAKmqyKPvGYMyYSN3cSL_-2u-YoTwauMMO5DMWy8_Rk7D88u1Ow@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: wacom_i2c - Clean up the query device fields
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 1:10 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Alistair,
>
> On Sat, Oct 09, 2021 at 09:37:06PM +1000, Alistair Francis wrote:
> > Improve the query device fields to be more verbose.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  drivers/input/touchscreen/wacom_i2c.c | 49 ++++++++++++++++-----------
> >  1 file changed, 30 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index 22826c387da5..8d7267ccc661 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -14,13 +14,21 @@
> >  #include <linux/interrupt.h>
> >  #include <asm/unaligned.h>
> >
> > -#define WACOM_CMD_QUERY0     0x04
> > -#define WACOM_CMD_QUERY1     0x00
> > -#define WACOM_CMD_QUERY2     0x33
> > -#define WACOM_CMD_QUERY3     0x02
> > -#define WACOM_CMD_THROW0     0x05
> > -#define WACOM_CMD_THROW1     0x00
> > -#define WACOM_QUERY_SIZE     19
> > +// Registers
> > +#define WACOM_COMMAND_LSB   0x04
> > +#define WACOM_COMMAND_MSB   0x00
> > +
> > +#define WACOM_DATA_LSB      0x05
> > +#define WACOM_DATA_MSB      0x00
> > +
> > +// Report types
> > +#define REPORT_FEATURE      0x30
> > +
> > +// Requests / operations
> > +#define OPCODE_GET_REPORT   0x02
> > +
> > +#define WACOM_QUERY_REPORT   3
> > +#define WACOM_QUERY_SIZE     22
> >
> >  struct wacom_features {
> >       int x_max;
> > @@ -41,27 +49,30 @@ static int wacom_query_device(struct i2c_client *client,
> >                             struct wacom_features *features)
> >  {
> >       int ret;
> > -     u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
> > -                     WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
> > -     u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
> >       u8 data[WACOM_QUERY_SIZE];
> > +
> > +     u8 get_query_data_cmd[] = {
> > +             WACOM_COMMAND_LSB,
> > +             WACOM_COMMAND_MSB,
> > +             REPORT_FEATURE | WACOM_QUERY_REPORT,
> > +             OPCODE_GET_REPORT,
> > +             WACOM_DATA_LSB,
> > +             WACOM_DATA_MSB,
> > +     };
> > +
> >       struct i2c_msg msgs[] = {
> > +             // Request reading of feature ReportID: 3 (Pen Query Data)
> >               {
> >                       .addr = client->addr,
> >                       .flags = 0,
> > -                     .len = sizeof(cmd1),
> > -                     .buf = cmd1,
> > -             },
> > -             {
> > -                     .addr = client->addr,
> > -                     .flags = 0,
> > -                     .len = sizeof(cmd2),
> > -                     .buf = cmd2,
> > +                     .len = sizeof(get_query_data_cmd),
> > +                     .buf = get_query_data_cmd,
> >               },
> > +             // Read 21 bytes
> >               {
> >                       .addr = client->addr,
> >                       .flags = I2C_M_RD,
> > -                     .len = sizeof(data),
> > +                     .len = WACOM_QUERY_SIZE - 1,
>
> Why is this change? If we are indeed supposed to read 1 byte less this
> should be a separate patch.

It shouldn't be a change, we are still reading 21 bytes of data. We
are just using a macro instead of sizeof().

Alistair
