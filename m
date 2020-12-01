Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75162C97EE
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727712AbgLAHQe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgLAHQe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:16:34 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF87C0613D2
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 23:15:53 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id h3so778172oie.8
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 23:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDbSgqB8TBwWDr3fisuZfe912stm4XxcE+IKNp264Wc=;
        b=CSKco7HlorgjzBLKbfyD7Jy+jMeUXFKIOK/8YmS7xa+YPLQ+GRpf8UGgnQECbPIX6p
         2mC2gx1YTuQWYyUsLyevlkkgymqhgiat2wwXlq1HU4ZBGePTaIyCJrTWnJJKp3lO9BR+
         z7gjybfJSfVCt+AvpaKeJLQeHrFk/mUJ/DH311rlB2K14+bLp40bZ40qbPFG11te5u6J
         KXONgmUMnbhSbeBnstAzC+MiC9YRvKw6+sipm9JOiiRJwbYavgl7DhdYhDsRi3jSGhvh
         RzuPGQ1C9FRT0uAnTOiJBXdM7UfmAXDe86cP1OSMkAIBVDA1e8vbLV7nZlF33xG7glGx
         Lkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDbSgqB8TBwWDr3fisuZfe912stm4XxcE+IKNp264Wc=;
        b=KTOGK7iM2WKte1Gv+MfnKPfHnY9qHLI0CX8MON3qcPNK4Pv4Fa2Q3Wxl1cOye0E5JC
         GVe4D/wleaMRynX2tqQvEh2avNaqIP76OtSy7w57jil2h0UClugGt3aZQ4GNuXQfSQQJ
         2/GQhG1fvj8qy86SyF36Bs62jgOC87CBJx/jP0gNyCeaIri3Qf2XYIHxEDcnJ2eL5L9t
         wRG6IDuxGaBF+yPSRCOSHh2m1lu0nu2QxdvoGRhz+MQ+1vuvQOEblhzMLb2h35vgs20g
         39pYhFmUPjXU+J3PmtNRrze+4Oglso4eMmowl6zxZr4qLv9zGwYY74irt+HW+HNO5/ZQ
         Q0Dw==
X-Gm-Message-State: AOAM533xWCNnbuBwz5lpV9xcLeH1qz6/D5LheOsiM/6+BLz4ZtO53S4C
        OHRK5CcffmJ/tkHoLF1YtQdsEMBk8mB7nX0VonwxfQ==
X-Google-Smtp-Source: ABdhPJwplnP4EdVZLDGQ8C/NDklzE2Qy/FQZb9AiK4SpVzBRWBDN0uneXv+GaoNhfqXbjcZvsW823m/trdX3ViXy5Hg=
X-Received: by 2002:aca:d594:: with SMTP id m142mr428879oig.17.1606806953018;
 Mon, 30 Nov 2020 23:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20201201060050.1193986-1-furquan@google.com> <20201201062807.GO2034289@dtor-ws>
 <CAEGmHFGYuM91U+Tvq+YDt180cfHQKnOKMY5ToHZ7v44fOs-_8w@mail.gmail.com> <20201201070615.GT2034289@dtor-ws>
In-Reply-To: <20201201070615.GT2034289@dtor-ws>
From:   Furquan Shaikh <furquan@google.com>
Date:   Mon, 30 Nov 2020 23:15:37 -0800
Message-ID: <CAEGmHFFuJHNpXOjzmBZ0Sjgsz-x19QFdSuns2v_uMFQyPQis=g@mail.gmail.com>
Subject: Re: [PATCH] input: raydium_ts_i2c: Do not split tx transactions
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 30, 2020 at 11:06 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Nov 30, 2020 at 10:54:46PM -0800, Furquan Shaikh wrote:
> > Hello Dmitry,
> >
> > On Mon, Nov 30, 2020 at 10:28 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Furquan,
> > >
> > > On Mon, Nov 30, 2020 at 10:00:50PM -0800, Furquan Shaikh wrote:
> > > > Raydium device does not like splitting of tx transactions into
> > > > multiple messages - one for the register address and one for the
> > > > actual data. This results in incorrect behavior on the device side.
> > > >
> > > > This change updates raydium_i2c_read and raydium_i2c_write to create
> > > > i2c_msg arrays separately and passes those arrays into
> > > > raydium_i2c_xfer which decides based on the address whether the bank
> > > > switch command should be sent. The bank switch header is still added
> > > > by raydium_i2c_read and raydium_i2c_write to ensure that all these
> > > > operations are performed as part of a single I2C transfer. It
> > > > guarantees that no other transactions are initiated to any other
> > > > device on the same bus after the bank switch command is sent.
> > >
> > > i2c_transfer locks the bus [segment] for the entire time, so this
> > > explanation on why the change is needed does not make sense.
> >
> > The actual problem is with raydium_i2c_write chopping off the write
> > data into 2 messages -- one for register address and other for actual
> > data. Raydium devices do not like that. Hence, this change to ensure
> > that the register address and actual data are packaged into a single
> > message. The latter part of the above comment attempts to explain why
> > the bank switch message is added to xfer[] array in raydium_i2c_read
> > and raydium_i2c_write instead of sending a separate message in
> > raydium_i2c_xfer i.e. to ensure that the read/write xfer and bank
> > switch are sent to i2c_transfer as a single array of messages so that
> > they can be handled as an atomic operation from the perspective of
> > communication with this device on the bus.
>
> OK, I see.
>
> >
> > >
> > > Also, does it help if you mark the data message as I2C_M_NOSTART in case
> > > of writes?
> >
> > That is a great suggestion. I think this would be helpful in this
> > scenario. Let me follow-up on this to see if it helps with the current
> > problem.
> >
> > >
> > > I also wonder if we should convert the driver to regmap, which should
> > > help with handling the bank switch as well as figuring out if it can do
> > > "gather write" or fall back to allocating an additional send buffer.
> >
> > I will start with the above suggestion and fallback to this if that
> > doesn't work.
>
> So my understanding is that not all I2C adapters support I2C_M_NOSTART
> so that is why regmap is nice as it hides it all away and figures things
> on its own.
>
> So simple solution of I2C_M_NOSTART might be a quick fix for Chrome OS
> kernel, but we'd either need to always use more expensive 2nd buffer as
> is in your patch, or regmap.

Ah I see. That makes sense. In that case, I think switching to regmap
would be better. As you suggested, I can use I2C_M_NOSTART as a quick
fix and work on enabling regmap.

>
> Thanks.
>
> --
> Dmitry
