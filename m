Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3CE34DCB9
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 02:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhC3ABV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 20:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC3ABN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 20:01:13 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30247C061762;
        Mon, 29 Mar 2021 17:01:13 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id j26so14538347iog.13;
        Mon, 29 Mar 2021 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o1RVU8f6fFPGPUVdEsvhlniyHwKth2qLcDOfg9+oE/0=;
        b=LbXHkh8g6WyZtVYhBmbQvX79th/toetfxmG/3BXUKws+HCG2fZIw8+T4v7AUNIYaER
         xlY12DfqmmOZfPTYbMTAPukA+/jQmCsJZyvEKszt0Yp+5HfCJDfrInd38rHpOGSiJNSu
         LFWVYiD0WBvvdoOJgl6echMQSENrvRB8h2PDT9TwfVTsSl0Vk6Q1ZMvVuojVdccNFxvm
         zWOEtx31p92PcDDGAx9LVqkNZARhLm/i3bL0UStnZHogNZuNDqr+JRNQ0CZ3MM8RhsbF
         HzG1s03MzmHP8iPVGuVB85kgJwkQQmwtN9SAX4wKwcVd3SA4KqKntKAPRX+oddBs8rMs
         MKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1RVU8f6fFPGPUVdEsvhlniyHwKth2qLcDOfg9+oE/0=;
        b=IA6fgfs+X2uKSLuZW8zbyEqhXSPhxG9v6Vcna59GllgEZgMJ10aHo6LrTv1cd8hNG5
         Rta2sTGpJQb0h7hFHQBMQoAw24sjWow/BRzt9qfD+12f6CHP7lbN0DoIKpz/zFzcCFg/
         pBR5Gu3ZA6ArgbBpS8cLdOS2Fguj2NciuDCPiKyl2u3+Zzf+TypGw6zND7yjr8VWVugP
         yd8KAimn1RiFE4tpqxYlyWjVSzurM6LlzXYtfFMZLBA/523F1cMZ/vZRpHeXMTajWUtn
         0GEsZ+3E/hcC7SRNDiOv6NwZDLhGTd28xNUrE54uf/Upxehb3nn/15gJpVRQMSVgvdw8
         YdEQ==
X-Gm-Message-State: AOAM530yRkN5uhsY5zNuhd/APYJfdn1wMjzAraqffd8IcVxTJVxk1Qwy
        llL4LrJTcs2EgqPRSvpY+cWAeUF0yjo6r2JkGT4=
X-Google-Smtp-Source: ABdhPJxr0CEiheZvBWeaASYN88d9OZ9gNYBFA2ls0TFGGlukYXvpbz506hPqg6AS23RwGni3XVQOC3Ny1NcGD/wjW3w=
X-Received: by 2002:a6b:d60c:: with SMTP id w12mr6276709ioa.105.1617062472683;
 Mon, 29 Mar 2021 17:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210326015229.141-1-alistair@alistair23.me> <20210326015229.141-4-alistair@alistair23.me>
 <YGIlsLgvE9y/jiGk@google.com>
In-Reply-To: <YGIlsLgvE9y/jiGk@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Mon, 29 Mar 2021 20:00:41 -0400
Message-ID: <CAKmqyKPKCa14haos--fVX3w7UrVxxjLP+vg_Aku82uK4LkqTPw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] Input: wacom_i2c - Add touchscren properties
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

 On Mon, Mar 29, 2021 at 3:08 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Mar 25, 2021 at 09:52:24PM -0400, Alistair Francis wrote:
> > Connect touchscreen properties to the wacom_i2c.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> > v4:
> >  - Add touchscreen_report_pos() as well
> >
> >  drivers/input/touchscreen/wacom_i2c.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index eada68770671..ee1829dd35f4 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/slab.h>
> >  #include <linux/irq.h>
> > +#include <linux/input/touchscreen.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/of.h>
> >  #include <asm/unaligned.h>
> > @@ -33,6 +34,7 @@ struct wacom_features {
> >  struct wacom_i2c {
> >       struct i2c_client *client;
> >       struct input_dev *input;
> > +     struct touchscreen_properties props;
> >       u8 data[WACOM_QUERY_SIZE];
> >       bool prox;
> >       int tool;
> > @@ -188,6 +190,9 @@ static int wacom_i2c_probe(struct i2c_client *client,
> >       __set_bit(BTN_STYLUS2, input->keybit);
> >       __set_bit(BTN_TOUCH, input->keybit);
> >
> > +     touchscreen_parse_properties(input, true, &wac_i2c->props);
> > +     touchscreen_report_pos(input, &wac_i2c->props, features.x_max,
> > +                            features.y_max, true);
>
> ??? This goes into wacom_i2c_irq() where it previously used
> input_report_abs() for X and Y so that transformations (swap, mirrot)
> requested via device properties are applied to the coordinates.

Ah sorry. I misunderstood what touchscreen_report_pos() does (and
didn't read it).

Looking at the actual code it seems that I need to remove

input_report_abs(input, ABS_Y, y);
input_report_abs(input, ABS_X, x);

from wacom_i2c_irq() and add touchscreen_report_pos() to wacom_i2c_irq() instead

I'll do that in the next version.

Alistair

>
> Thanks.
>
> --
> Dmitry
