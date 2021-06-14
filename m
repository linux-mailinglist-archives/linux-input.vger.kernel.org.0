Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90553A68E4
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 16:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhFNOYY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 10:24:24 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:47083 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbhFNOYX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 10:24:23 -0400
Received: by mail-pl1-f169.google.com with SMTP id e1so6632017pld.13;
        Mon, 14 Jun 2021 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VMw6ybFN2WF0KbkimdI7NN/EIenMBp5XxYJNc9Ynfls=;
        b=FdeGfnQ4NKzV9TfKbsR8/Hjgob6giWHtjdOxUAeNjzvE5f5GIHt5V7j1Y7LKZp31jg
         +yixkjrn973tIWytgcOfA4rVPzbzkBu+edVL4BjfY3SFpM7tYLFm1UFbvURuKTJeSgaY
         xBk7XXkUpU38tH2Xh4rL0clqxXBLmH1PQ1o/RcybwsNvcleOUJdOElf7NwcTBcbu3chJ
         ohBObR5+EZ1g8Q6L/RXjHLiGsdl/hZr4dG6vmaoqQjzbTCXrxb01pIC86ZVFr54bvLd+
         X019JjBMjUjepU5yvDozleEd7/ylLgoleNyJtVWnDVphBpkI/zhUjh+Tj3pK6+r7v+JP
         wO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VMw6ybFN2WF0KbkimdI7NN/EIenMBp5XxYJNc9Ynfls=;
        b=bd3+OnFiWW4lBnw2QzaFU12oimuFXRmNCEnk6XyJfhUf6J1Ol3az48wjFrdzpRq5vw
         OKCD7WzdaZzvDn/ALFX4ELiebnzc4K1dkJeknjHiQMwZ1f66kWhRUHKiJQ15o9E0kvkI
         1TwPuMWEMLx5JTSq1w3aN+uHIB1MJHTe21V8P3R0v29BkfNzd9RxrvQDbsLsFBcl9+JT
         +MJWNr4podpDQt6zjUhb0FunMchUsOrZ5k99iA2rQZocbhz0qI0GP1lDmvX01rEAFUp1
         rSX4PyL7RVjMMqCw5LhwoQY4OJLNHTU+vFCO/UBt6+dK9yjwaspASCPGhe6B2XwUcMKJ
         Y6PQ==
X-Gm-Message-State: AOAM531YrK/74bVx+kEqwJ5UX2+nGe5mzz3NXKnrX6RiA0c/YxEalOz0
        dZWkYc2NYguAdFuEOCABi0hFS+ba8x9juNQsnMw=
X-Google-Smtp-Source: ABdhPJz9U8kyhqlK7jTLcPTj8zW3ljzeWRYRrQUY1YyhvpY00oJNAybNwWNjVaAlGXAPPxexKKPCnbp74y6bBpu34qo=
X-Received: by 2002:a17:90a:400e:: with SMTP id u14mr24461445pjc.33.1623680469019;
 Mon, 14 Jun 2021 07:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210527071637.GA1516@raspberrypi> <nycvar.YFH.7.76.2106141510040.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2106141510040.28378@cbobk.fhfr.pm>
From:   Austin Kim <austindh.kim@gmail.com>
Date:   Mon, 14 Jun 2021 23:20:58 +0900
Message-ID: <CADLLry7U3h0bxztj3+GiXwmGFvvvbBbR0kDvPAJKEHLFc4rUOg@mail.gmail.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Fix minor typos in comments
To:     Jiri Kosina <jikos@kernel.org>
Cc:     srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?6rmA64+Z7ZiE?= <austin.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

2021=EB=85=84 6=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 10:10, =
Jiri Kosina <jikos@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, 27 May 2021, Austin Kim wrote:
>
> > Change "poiner" to "pointer" in comments.
> >
> > Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> > ---
> >  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/=
intel-ish-hid/ishtp-fw-loader.c
> > index d20d74a890e9..1b486f262747 100644
> > --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> > +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> > @@ -456,7 +456,7 @@ static void loader_cl_event_cb(struct ishtp_cl_devi=
ce *cl_device)
> >  /**
> >   * ish_query_loader_prop() -  Query ISH Shim firmware loader
> >   * @client_data:     Client data instance
> > - * @fw:                      Poiner to firmware data struct in host me=
mory
> > + * @fw:                      Pointer to firmware data struct in host m=
emory
> >   * @fw_info:         Loader firmware properties
> >   *
>
> Applied.

Great, thanks!

>
> --
> Jiri Kosina
> SUSE Labs
>
