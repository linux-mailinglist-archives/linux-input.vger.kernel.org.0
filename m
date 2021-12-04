Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E03E468301
	for <lists+linux-input@lfdr.de>; Sat,  4 Dec 2021 07:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242089AbhLDGxW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Dec 2021 01:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242069AbhLDGxW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Dec 2021 01:53:22 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638B3C061751
        for <linux-input@vger.kernel.org>; Fri,  3 Dec 2021 22:49:57 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id i6so9627173uae.6
        for <linux-input@vger.kernel.org>; Fri, 03 Dec 2021 22:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=59yrejv6eddkkhWWLSsxx/S1xc2UH4xc6tjlZY8gaIg=;
        b=Yb1y5ErF/QpXnDnzbKOM7NNlEzO8rzRY1UA+ieu16UKpUH7WnM2F6sP6EWM0Svs8UM
         ihxwgDm4ykNgVNRndW6Ov73FQWfT4ZbljxoXgjSTeTt3USQVw27B20egDoMmnMgjzOFI
         5wVyuUWpngtvI39HDvVUTCl3H/Q5azt9i/FcuycS8kkywxiE7jjRkino5U/WsRPn6JAL
         JEj5fX8/Crc5SH+yjPp+X1nB/sFlYw8I34c9Vdh9mAfI/h1/a0xUiGRqqMhEMcIJXrEV
         oKVbug0HgfVP7LAzxT60SdpdyT61vFgy7/oahE0xgM8klJRP9lxudBCWj1GIvJlr3vzC
         GaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=59yrejv6eddkkhWWLSsxx/S1xc2UH4xc6tjlZY8gaIg=;
        b=m8a5jDo2Rhi3lwUPVQJ6rkkJWXhSe/8lezR4y/a9Yb3MzdPzOs7PcyvAGHDg67bvT7
         ThNOg0uzQriUOroEmE+xH6YqWHcMe1H60sBWMkmQRyWVkPDkP7WRIFkpAdE1qvCf+cq8
         sY0othylMlkizMgasqjCDKk8ZkpxmUW96+8bWi8wzdekm4yveTt2xxxaygAvy8894zn+
         0t0pbRZIUxV2lm9T6xZOTnBSwQfzC4+GcFC7yugxwFcLX6riP1wmA0sBU+uzfnM+SMqq
         65vEJsYArkQBAsxg/Y0gUFNLRBLxdV2euVOwKMTxfcFXyZ5TNwYvs6IFw+oaEH/gx5y5
         Vfdw==
X-Gm-Message-State: AOAM5315BP9/maeFfBEINDlTPhm9n4UbnXCkI1vGFJCBVwdlFY5Ka8pp
        vynlk2GmYlJ/0As5PXm+/Izq9ZDV4MwmzyF0unHPrv8uDOc=
X-Google-Smtp-Source: ABdhPJwE8jxub/Rid1mKY7k8u9JKdQSEDsHxoa1Pvj2JCVUDVPOM2nLwTlO1RQ3z367qTfeT4ycAYfFe0tAX9gtd3ys=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr26800743uai.89.1638600596452;
 Fri, 03 Dec 2021 22:49:56 -0800 (PST)
MIME-Version: 1.0
References: <CAM1wO0=2zM=WNmGyDJETLa4wsECE_Nxvq-gAa6_Wb_cMH43K9w@mail.gmail.com>
 <4ed664ce163ec2248244d0fbb15f2b81c3098225.camel@archlinux.org>
In-Reply-To: <4ed664ce163ec2248244d0fbb15f2b81c3098225.camel@archlinux.org>
From:   Koopa Koopa <codingkoopa@gmail.com>
Date:   Sat, 4 Dec 2021 01:49:45 -0500
Message-ID: <CAM1wO0mOcwNoCWzTxQ-VyZkYm5+7X3w=G7CtDscP8g0b18SQKw@mail.gmail.com>
Subject: Re: PROBLEM: Error logged when pressing mouse button
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all, I hope this finds you well. I can report that this issue still
occurs on kernel version 5.15.6-arch2-1. I apologize for not having
come back to this sooner!

Much thanks,
Koopa

On Wed, Feb 17, 2021 at 11:42 AM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
>
> On Tue, 2021-02-16 at 21:51 -0500, Koopa Koopa wrote:
> > Every time I press a button on my mouse, an error is logged in my
> > system journal.
> >
> > Starting recently, every time I press any button on my Logitech G602
> > mouse, the following is logged to my journal:
> >
> >     kernel: logitech-djreceiver 0003:046D:C537.0005: Unexpected input
> > report number 128
> >
> > This includes both primary mouse buttons, the middle mouse buttons,
> > the buttons on the side, and the buttons on the top controlling the
> > DPI. It seems that, with commit
> > e400071a805d6229223a98899e9da8c6233704a1
> > (https://github.com/torvalds/linux/commit/e400071a805d6229223a98899e9da=
8c6233704a1
> > ),
> > this driver was enabled for my mouse.
> >
> > My /proc/version:
> >
> >     Linux version 5.10.16-arch1-1 (linux@archlinux) (gcc (GCC) 10.2.0,
> > GNU ld (GNU Binutils) 2.36) #1 SMP PREEMPT Sat, 13 Feb 2021 20:50:18
> > +0000
> >
> > My kernel .config file: See here
> > (https://github.com/archlinux/svntogit-packages/blob/packages/linux/tru=
nk/config
> > ).
> >
> > Thanks!
>
> Hi Koopa,
>
> This was fixed in [1], which is in the for-5.11/upstream-fixes branch, so=
 this
> should be released soon-ish, I think.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=
=3Dfor-5.11/upstream-fixes&id=3Def07c116d98772952807492bd32a61f5af172a94
>
> Cheers,
> Filipe La=C3=ADns
