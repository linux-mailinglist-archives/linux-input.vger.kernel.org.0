Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56F4EEB51
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 22:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbfKDVnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 16:43:45 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44119 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDVno (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 16:43:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id n48so15763699ota.11;
        Mon, 04 Nov 2019 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HqgsGp53OtlR6neqVOzYFTFQROyiEWTcquDxocb9OCI=;
        b=rKoYLnzq0DyJN6YnznKHfWTUnH5xlWLMgunCpjXOUAPQKbi1s6hW12cgqc3z997Wix
         hWVHKAy61sZDse7QZAV+1H38ZXD9uNumjjaRBfocXsAIpbbY71tB4DwG0VUItBdm20A8
         fqKmjl4B4Ut0f/MNYMe+B5xxZff7P1mTrGJWNUmJSj0uPUESmoLEwYehsRFqXXec1QTH
         NsC5T3xvpLWeFfsyJXkeogzBN3mwhMy4liDUO3iHmEQtwndgYAw/I7Td4fQEuvdatGQU
         4v/u2ZsxDfX2T+xZHmxLMLCFicFRRog6ueCEX1IX2Sie1oblMnoxMrpqtIcvFgw8MTWc
         l80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HqgsGp53OtlR6neqVOzYFTFQROyiEWTcquDxocb9OCI=;
        b=NNeWiqtv+IhnrjF1Us3fB9aRz1UwPROjn8qIiVnVkMIudGNjqnm3GvkES+89goGYv0
         JU/T14ML3OAse+vVlzrvve7+/VYKpYDSdpTHrPQQEYaOPtvcKaUnV8Pw4P6CKpldfmZ0
         vIXGg0c8GzKUBcvvr+jthSFICYzWL5t2sHu0ILOvL9kRd265DNJ33qquUW4Nf548jiiL
         HVI+n65DsmdZWNfGTCL/y8lo3fFxzVau5V1kQMX2vexHBqllWglWVvz3tW/hKgPMpY33
         LDEX/Zyuk+yzKuJ3rGfQUakY3SBXRhRNmjJqlvgc0M6NQbA+6poSeZ5vb1ySYKs35VJO
         xt+A==
X-Gm-Message-State: APjAAAXg0aLBDmAbr2XOzKWVBfiADBmSbd0QwS0CtC7Popc1unHtvN52
        zXJl4YCkUzDE06kNE4NWRW0+oHSvk7uN9+Cz0AKkkGp9
X-Google-Smtp-Source: APXvYqyBkkUvqZgxzUUjvR+AW6uTCN7bzCA6HUt9VFBPvsLnErJvmzyH79ZRpGqofhHq5x2faMIpi0D+Zn+saszXe90=
X-Received: by 2002:a05:6830:11d2:: with SMTP id v18mr15278490otq.116.1572903823498;
 Mon, 04 Nov 2019 13:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
In-Reply-To: <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 4 Nov 2019 16:43:32 -0500
Message-ID: <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Adam Ford <aford173@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adam,

On Mon, Nov 4, 2019 at 4:28 PM Adam Ford <aford173@gmail.com> wrote:
>
> I am using IRQ_TYPE_EDGE_RISING for the 2117A.  Is that correct?  For
> my touchscreen, the IRQ line is low until a touch is detected, so I
> assume we want to capure on the rising edge.

That is correct for the 2117A, as far as I know. I am using the same
setting.

>
> Regarding Dmitry's patch,
> Is it a good idea to use msleep in an IRQ?  It seems like using the
> schedule_delayed_work() call seems like it will get in and get out of
> the ISR faster.
>
> If we use msleep and scan again, isn't it possible to starve other processes?

I believe using msleep() is ok because this is not a "real" interrupt handler,
but a threaded one. It runs in a regular kernel thread, with its interrupt
turned off (but all other interrupts remain enabled). Its interrupt is
re-enabled automatically after the threaded handler returns.

See
https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L50

> > @@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> >                 }
> >
> >                 touch = ili210x_report_events(priv, touchdata);
> > -               keep_polling = touch || chip->continue_polling(touchdata);
> > +               keep_polling = chip->continue_polling(touchdata, touch);
> >                 if (keep_polling)
>
> Why not just check the value of touch instead of invoking the function
> pointer which takes the value of touch in as a parameter?
>

The value of touch must be checked inside the callback, because
some variants use it to decide if they should poll again, and
some do not, such as the ili211x.

If I have misinterpreted your suggestion, could you perhaps
express it in C, so I can understand better?
