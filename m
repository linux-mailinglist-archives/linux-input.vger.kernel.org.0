Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9507C2E3324
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 23:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgL0Wio (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 17:38:44 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:37559 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgL0Wio (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 17:38:44 -0500
Date:   Sun, 27 Dec 2020 22:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609108681;
        bh=cn7hRzkUKldXhj8q/QTn+/jd3a7+O/Rxud4FzM/Q8ZA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Ad6NcCMJeszyiIo4oWqT5mRoQGAWe7duHsWBmDos6l06+Eh3RNDmV0DRQxFitdsv1
         53HQC4Jgk0hiQDkI/23oOxEDh1NJeg/zUtWyMZeVn26FTQ6n+Ltl2sBlG/efg/zX9J
         bRxxY6XBjB/wzbJDaYf+4XxERvcZh2JgZQarkk3s=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 13/13] HID: playstation: report DualSense hardware and firmware version.
Message-ID: <3lVD85P15aERBMBIFGdOJT7p4Y8XB0pZREzvTKNJ-OX-Wt7V_pkfwGzC1h_8xboI0UA18rXrh4Ye23kFVeF1udP8FjdGoi3dMlNiE74aCN8=@protonmail.com>
In-Reply-To: <CANndSKmch6bdv0N8qUFdAgKBqi50Y11kdK4EFm63xr4Kct5D=A@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com> <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com> <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com> <CANndSKmch6bdv0N8qUFdAgKBqi50Y11kdK4EFm63xr4Kct5D=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

2020. december 27., vas=C3=A1rnap 23:27 keltez=C3=A9ssel, Roderick Colenbra=
nder =C3=ADrta:

> [...]
> > > > -       ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_device_attr=
ibute_group);
> > > >
> > > >
> > >
> > > It's a minor thing, but I think `device_{add,remove}_group()` would b=
e better
> > > here in the sense that it expresses the fact that the group is added =
to a device,
> > > not just any object better.
> >
> > Agreed, that's nicer I wasn't aware of it. I try to follow what other
> > hid drivers do and they all used the kobj directly, which honestly
> > felt nasty. Will change it to this.
>
> Actually devm_device_add_group seems to be even nicer. Surprisingly it
> isn't widely used yet.
>
> Roderick


Well, indeed, although I believe that shouldn't be used here. Consider
what happens if the hid-playstation module is unloaded. The attributes
of the HID device will not be unregistered, but the backing functions/etc.
are unloaded, so reading/writing them will have undesirable effects - I ima=
gine.
So in either case, you'll need to use `[devm_]device_remove_group()`, and f=
or
that reason I think using the devm_* variant is less efficient.
Please note, that I am not 100% sure this hypothesis is correct, but I'm pr=
etty sure.


Regards,
Barnab=C3=A1s P=C5=91cze
