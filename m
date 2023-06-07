Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FAD725B47
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 12:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235492AbjFGKIU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 06:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbjFGKIS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 06:08:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4699199D
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 03:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686132456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EvYvWP/dmRw7dcP93qz9byoXzFOKtvhvKrmHdFETiw8=;
        b=hFQt+zzV9g18wi7vRgxAXej8rHQgDFhUzY77vbvOPRLEz56WOrlDPRVfeo+UvIURXic66D
        +taC+Cvz4IdSQM2kFmUcteJFtFSmAPi5jPL4h3O90OgPtwwAGp1KQbUabB4tRgtKgMrLQN
        dsHFISDKaa7yJP5Kl5grHfQnTvJ3el0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-PVF07wQGOsuYTcY2ZQWgnw-1; Wed, 07 Jun 2023 06:07:33 -0400
X-MC-Unique: PVF07wQGOsuYTcY2ZQWgnw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-bb0cb2e67c5so10375102276.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 03:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686132452; x=1688724452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvYvWP/dmRw7dcP93qz9byoXzFOKtvhvKrmHdFETiw8=;
        b=ZJMrdQq1/0BsXgYLLKzo097tWKPy87klnseNgcdA5HLoBrlmV26AemX0s8pW0D8Gos
         0RYR36L+efIOBcpiIsYV41qXZnKQIdV0fc87yeo3JAeF7duIZUd2qk+YxFbulKEekzXZ
         7Rbek5BVsSiRPA5lj1w9GhP6SQFFeCcj2zZFSH28mipZMrYzXw3a2rPdPekOIn532dnJ
         cEJN0S5lKGsETi3oZb4tEmH6Qy9CMdBoUd9PsRC4fmIYy7hhMX5qUMNeaIA9acgcuR+s
         iApkod8tNalfv2XYFPb349ma+jyFZxCu2pbNZY3exG2JTwaB6LPKjV+grJuxLem22KUF
         JAsQ==
X-Gm-Message-State: AC+VfDzmsNgJ332ws0aHMchffZauBXD8eODEQYPQ735Dua5TGrxqXTqE
        ndcLz77zoUVIHOaGrTB4zYUorhl1AnDRlLjFdC5pYR4X10muDjZOxwI9OtJ21ednh6jEpXPOQZJ
        +ej1IkJtyEs050G4V3GREfujmQ/Qe+bvC7NgCDjE=
X-Received: by 2002:a25:b90e:0:b0:b9e:5055:ce7e with SMTP id x14-20020a25b90e000000b00b9e5055ce7emr5436822ybj.55.1686132452439;
        Wed, 07 Jun 2023 03:07:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qr+y7gbTb42/JGVX0Drco0Mo+DgGu0Fu1MKsKD0cM9YVxkXtnAWRmjd4kaGRA2Sy+E6o6RFSwWPGuilreMio=
X-Received: by 2002:a25:b90e:0:b0:b9e:5055:ce7e with SMTP id
 x14-20020a25b90e000000b00b9e5055ce7emr5436799ybj.55.1686132452198; Wed, 07
 Jun 2023 03:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082428.21763-1-hadess@hadess.net> <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm> <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
 <nycvar.YFH.7.76.2306061527080.29760@cbobk.fhfr.pm> <42b6e582-f642-7521-135a-449140984211@leemhuis.info>
 <CAO-hwJL3RcfOxQvhqDFTwgfY=oAJqR5rsHmO5qDVwNUEh3K58Q@mail.gmail.com> <2023060703-colony-shakily-3514@gregkh>
In-Reply-To: <2023060703-colony-shakily-3514@gregkh>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Jun 2023 12:07:21 +0200
Message-ID: <CAO-hwJJxZuXP=kgTxEc-F+OtcFsR59iGE3Vw3ptZs48+MotNtA@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Mark Lord <mlord@pobox.com>
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

On Wed, Jun 7, 2023 at 11:46=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 06, 2023 at 08:37:26PM +0200, Benjamin Tissoires wrote:
> > On Tue, Jun 6, 2023 at 8:18=E2=80=AFPM Linux regression tracking (Thors=
ten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > >
> > >
> > >
> > > On 06.06.23 15:27, Jiri Kosina wrote:
> > > > On Mon, 5 Jun 2023, Linux regression tracking (Thorsten Leemhuis) w=
rote:
> > > >
> > > >>>>> If an attempt at contacting a receiver or a device fails becaus=
e the
> > > >>>>> receiver or device never responds, don't restart the communicat=
ion, only
> > > >>>>> restart it if the receiver or device answers that it's busy, as=
 originally
> > > >>>>> intended.
> > > >>>>>
> > > >>>>> This was the behaviour on communication timeout before commit 5=
86e8fede795
> > > >>>>> ("HID: logitech-hidpp: Retry commands when device is busy").
> > > >>>>>
> > > >>>>> This fixes some overly long waits in a critical path on boot, w=
hen
> > > >>>>> checking whether the device is connected by getting its HID++ v=
ersion.
> > > >>>>>
> > > >>>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > >>>>> Suggested-by: Mark Lord <mlord@pobox.com>
> > > >>>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when =
device is busy")
> > > >>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217412
> > > >>> [...]
> > > >>>>
> > > >>>> I have applied this even before getting confirmation from the re=
porters in
> > > >>>> bugzilla, as it's the right thing to do anyway.
> > > >>>
> > > >>> Unfortunately it doesn't seem to cure the reported issue (while r=
everting
> > > >>> 586e8fede79 does):
> > > >>
> > > >> BTW, remind me again: was fixing this by reverting 586e8fede79 for=
 now a
> > > >> option? I guess it's not, but if I'm wrong I wonder if that might =
at
> > > >> this point be the best way forward.
> > > >
> > > > This should now all be fixed by
> > > >
> > > >     https://git.kernel.org/linus/7c28afd5512e371773dbb2bf95a31ed562=
5651d9
> > >
> > > Jiri, Benjamin, many many thx for working on this.
> > >
> > > Hmmm. No CC: <stable... tag.
> > >
> > > Should we ask Greg to pick this up for 6.3 now, or better wait a few
> > > days? He currently already has 6199d23c91ce ("HID: logitech-hidpp:
> > > Handle timeout differently from busy") in his queue for the next 6.3.=
y
> > > release.
> >
> > Well, the Fixes: tag supposedly is enough to let the stable folks to
> > pick it up.
>
> No, not at all, please see:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.
>
> (hint, we need a cc: stable@ in the signed-off-by area.)
>
> We only pick up stuff with "Fixes:" semi-often, sometimes never,
> depending on our workload.  Never rely on that.

Oh right. Given that those patches eventually end up in stable sooner
or later I made the shortcut in my head. Thanks for correcting that :)

>
> It's been this way for 18+ years now, nothing new :)
>
> > But you are right, let's Cc Greg for a quicker inclusion
> > in the 6.3 tree.
> >
> > Greg, would you mind adding the commit above (7c28afd5512e37) onto the
> > 6.3 stable queue? Thanks!
>
> Now queued up, thanks.

Great thanks!

Cheers,
Benjamin

