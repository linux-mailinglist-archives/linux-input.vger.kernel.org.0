Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154DE724B88
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 20:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjFFSi3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 14:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbjFFSi2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 14:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFFD10F3
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 11:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686076661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BagLP1pdl2jLuypkWVwHAzF6SlgrIs6dDABtbPpb9hk=;
        b=JDAvF2Vuxid6zENOg+fR78MMsunYYgWtchbvDj5JmqfWO3f1noeGsPo41jZ+DG6YhNcn+H
        R1wmATL6X0tLS3NZwLF1/sorepPnJCCFL6q1C1wczzvEud2RdcC56RXJwZ6fXuiw2iL1GX
        9Z6poxS5xt7WFzvbrtjfZomodKFW5ng=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-sQiRq4mONSqCMdeGSCvqXA-1; Tue, 06 Jun 2023 14:37:38 -0400
X-MC-Unique: sQiRq4mONSqCMdeGSCvqXA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-56942442eb0so94833097b3.1
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 11:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686076658; x=1688668658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BagLP1pdl2jLuypkWVwHAzF6SlgrIs6dDABtbPpb9hk=;
        b=O+bEQqGpRGqOLgUowfg9wcciSD9LIqMK2FBMsweHhGsPA5rb4FQR+HdtxuvsKPeMme
         FGmVk058bdEkClLJDOkwYCw65RBICcmCWl6IMWSRSzkZfz9MHX98EypCbZs6TLHuDv7c
         HgAV11SZ3c9y/zJFF9/usQujgS+VGvXYdvMnZMD4TQGsy/77FT7dvMxI5zB3rTU0leO8
         epH08Ut9MnHkHj7RNaovO5Ziw0GBJexK83+GsDK048Dvu8J0B4S84uq8ArC8W5Ff5WiK
         ICfC+cmp73ctstkHjkpjvMrJsiXmeqSPdmwjkVwoDWVFt2HBEsTXbBGnuhXf7cJuttcT
         kgBA==
X-Gm-Message-State: AC+VfDziCksoOzrB2UBHh3fdBlgikS1eBW/xPVNKsno/71Fwyj6Z9U7A
        eHDG7AutwtHM0s3yQVfz0GoxzUn3uRmKoTCjbdb6yDowGgmA1LL49CJpygJQBvFeskjrrs9KdPT
        RUvmE4h/+2rWS2rDvhlPERdOVEydApgoLBzob4Mc=
X-Received: by 2002:a81:7382:0:b0:568:f981:637d with SMTP id o124-20020a817382000000b00568f981637dmr3775413ywc.37.1686076658075;
        Tue, 06 Jun 2023 11:37:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7re4FVFZTSXw0hMl7FSwnSL12EtIwUHuIPlxIP2pUQnRK71jUCqnCDz3KKQ+Huu9Ly1XlLpLXQJfYDMdJbE1Y=
X-Received: by 2002:a81:7382:0:b0:568:f981:637d with SMTP id
 o124-20020a817382000000b00568f981637dmr3775388ywc.37.1686076657821; Tue, 06
 Jun 2023 11:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082428.21763-1-hadess@hadess.net> <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm> <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm> <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
In-Reply-To: <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 6 Jun 2023 20:37:26 +0200
Message-ID: <CAO-hwJL3RcfOxQvhqDFTwgfY=oAJqR5rsHmO5qDVwNUEh3K58Q@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Mark Lord <mlord@pobox.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 6, 2023 at 8:18=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
>
>
> On 06.06.23 15:27, Jiri Kosina wrote:
> > On Mon, 5 Jun 2023, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> >
> >>>>> If an attempt at contacting a receiver or a device fails because th=
e
> >>>>> receiver or device never responds, don't restart the communication,=
 only
> >>>>> restart it if the receiver or device answers that it's busy, as ori=
ginally
> >>>>> intended.
> >>>>>
> >>>>> This was the behaviour on communication timeout before commit 586e8=
fede795
> >>>>> ("HID: logitech-hidpp: Retry commands when device is busy").
> >>>>>
> >>>>> This fixes some overly long waits in a critical path on boot, when
> >>>>> checking whether the device is connected by getting its HID++ versi=
on.
> >>>>>
> >>>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> >>>>> Suggested-by: Mark Lord <mlord@pobox.com>
> >>>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when devi=
ce is busy")
> >>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217412
> >>> [...]
> >>>>
> >>>> I have applied this even before getting confirmation from the report=
ers in
> >>>> bugzilla, as it's the right thing to do anyway.
> >>>
> >>> Unfortunately it doesn't seem to cure the reported issue (while rever=
ting
> >>> 586e8fede79 does):
> >>
> >> BTW, remind me again: was fixing this by reverting 586e8fede79 for now=
 a
> >> option? I guess it's not, but if I'm wrong I wonder if that might at
> >> this point be the best way forward.
> >
> > This should now all be fixed by
> >
> >     https://git.kernel.org/linus/7c28afd5512e371773dbb2bf95a31ed5625651=
d9
>
> Jiri, Benjamin, many many thx for working on this.
>
> Hmmm. No CC: <stable... tag.
>
> Should we ask Greg to pick this up for 6.3 now, or better wait a few
> days? He currently already has 6199d23c91ce ("HID: logitech-hidpp:
> Handle timeout differently from busy") in his queue for the next 6.3.y
> release.

Well, the Fixes: tag supposedly is enough to let the stable folks to
pick it up. But you are right, let's Cc Greg for a quicker inclusion
in the 6.3 tree.

Greg, would you mind adding the commit above (7c28afd5512e37) onto the
6.3 stable queue? Thanks!

Cheers,
Benjamin

>
> Ciao, Thorsten
>
> P.S.: If the answer is along the lines of "let's backport this quickly",
> please consider directly CCing Greg.
>

