Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBF32C97B9
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbgLAGzn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgLAGzn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:55:43 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AA4C0613CF
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 22:55:03 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f16so689289otl.11
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 22:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8gNh4uzJ/vrjUJz2fQVgW80e6ioAxOfUVSCAWYilQ0=;
        b=v2vGs5fNznQ/JodWPWIHsyKAZilmUAVVt1CJrkA7/FFu7WWA0AShtU3gkN9IHXVikp
         lZVDgRe8UXQtfj/TxkSfkbnw3jwV+RnRo0FiA6k4OuNFg34Dnpy+PpAWNHpScNIzGO5l
         bfEUltKddnMD0Iaxk+HILWlo9I/sX7e9ytnbdTkKVuPFVC0mwuzD19aoyzfpB/1ZiAng
         ivusSej8UfshPgnEENVEYmlLgDAL7zSK3me/GGopSmCTFFapkcZPnZZS0zB9FvQ8K/0O
         6SdX2dfswRmBIetXLUe11eC7/WbNXP62ziJbirmQl65QdtDXMEqjA75OHwnyRB10TfeY
         Kwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8gNh4uzJ/vrjUJz2fQVgW80e6ioAxOfUVSCAWYilQ0=;
        b=uMikU4C3f/IGObHzsqWxzRkhrxkISb2df6czOHVFElJ9rCSgZpIsTwJ6nLMcU8MDMG
         ndMjAqG2iQrec9OObXpcLZIHX6RhVu0BWLs4snHjIKEvaMcFY9Xb/7TdZwuWXb3jANJy
         r8amrJuU0gtUiQ/g16Q1DtuW4hZ2ghgapN+YQvo/8e/6aqAbdLJqn4SZHnFLMUuO8hBr
         E9nJCLxw34erEv6KDxk3CkrXSuHZIzQHaP9Xl/t8MZPuFp21wBq81MTkDplJ5wrIqG3A
         8wnYWeyd8cn1zn0pJZJ31Pw4KuRyc+D5d6EuZZajXByRKH/iSxklkDtrme/7mPyRmOcC
         Mr/w==
X-Gm-Message-State: AOAM532iSAeBitQoOR+N2nDDHT523wmTgLDley3GoWHQGEl8TTzw8Uqo
        CMnrZ3O9H789ZtmLPJ9VXKhlItYkRjFtZ0TQ8uiXVs+scPs=
X-Google-Smtp-Source: ABdhPJziejeDJXv5UJ+mV1sKpOCztprkqjQ4nyzjVsinqpmpzkyBTGlRJai/raYMfbDqjH7yclXxZYbuPhmb6gwHJ3Q=
X-Received: by 2002:a05:6830:1e7a:: with SMTP id m26mr981712otr.104.1606805702433;
 Mon, 30 Nov 2020 22:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20201201060050.1193986-1-furquan@google.com> <20201201062807.GO2034289@dtor-ws>
In-Reply-To: <20201201062807.GO2034289@dtor-ws>
From:   Furquan Shaikh <furquan@google.com>
Date:   Mon, 30 Nov 2020 22:54:46 -0800
Message-ID: <CAEGmHFGYuM91U+Tvq+YDt180cfHQKnOKMY5ToHZ7v44fOs-_8w@mail.gmail.com>
Subject: Re: [PATCH] input: raydium_ts_i2c: Do not split tx transactions
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

On Mon, Nov 30, 2020 at 10:28 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Furquan,
>
> On Mon, Nov 30, 2020 at 10:00:50PM -0800, Furquan Shaikh wrote:
> > Raydium device does not like splitting of tx transactions into
> > multiple messages - one for the register address and one for the
> > actual data. This results in incorrect behavior on the device side.
> >
> > This change updates raydium_i2c_read and raydium_i2c_write to create
> > i2c_msg arrays separately and passes those arrays into
> > raydium_i2c_xfer which decides based on the address whether the bank
> > switch command should be sent. The bank switch header is still added
> > by raydium_i2c_read and raydium_i2c_write to ensure that all these
> > operations are performed as part of a single I2C transfer. It
> > guarantees that no other transactions are initiated to any other
> > device on the same bus after the bank switch command is sent.
>
> i2c_transfer locks the bus [segment] for the entire time, so this
> explanation on why the change is needed does not make sense.

The actual problem is with raydium_i2c_write chopping off the write
data into 2 messages -- one for register address and other for actual
data. Raydium devices do not like that. Hence, this change to ensure
that the register address and actual data are packaged into a single
message. The latter part of the above comment attempts to explain why
the bank switch message is added to xfer[] array in raydium_i2c_read
and raydium_i2c_write instead of sending a separate message in
raydium_i2c_xfer i.e. to ensure that the read/write xfer and bank
switch are sent to i2c_transfer as a single array of messages so that
they can be handled as an atomic operation from the perspective of
communication with this device on the bus.

>
> Also, does it help if you mark the data message as I2C_M_NOSTART in case
> of writes?

That is a great suggestion. I think this would be helpful in this
scenario. Let me follow-up on this to see if it helps with the current
problem.

>
> I also wonder if we should convert the driver to regmap, which should
> help with handling the bank switch as well as figuring out if it can do
> "gather write" or fall back to allocating an additional send buffer.

I will start with the above suggestion and fallback to this if that
doesn't work.

Thanks for the quick response and the helpful suggestions Dmitry. I
will work on these pointers and get back to you. Thanks again.

- Furquan

>
> Thanks.
>
> --
> Dmitry
