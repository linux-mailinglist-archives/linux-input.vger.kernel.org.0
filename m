Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B613CF5DF
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 10:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhGTHcF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 03:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22488 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232461AbhGTHbF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 03:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626768704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8tWwaf4dTIHdf1q4elmIekQnjUsOuFALRymZ2CR/Mz8=;
        b=YORi5SJel/ryu1UJbkMUa2dpabqYx9NkgOO/5hhhLwc4CiBbU9SWwSMcsd3TLhP+GMBlgW
        Qb21KCqnUWjG2Aj5yYMGEodzwWZVu51w8DWXg1MJnmQKnXwWbY2P1gjGW0hyOVlmy8SDKI
        Z0BaCJ03NJ9O9D97ARYws0e2SDcxD14=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-e2R3x8n-OzOWMpmo1RpjQw-1; Tue, 20 Jul 2021 04:11:42 -0400
X-MC-Unique: e2R3x8n-OzOWMpmo1RpjQw-1
Received: by mail-pj1-f71.google.com with SMTP id 11-20020a17090a0f8bb0290175eac3b1c8so1955671pjz.3
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 01:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8tWwaf4dTIHdf1q4elmIekQnjUsOuFALRymZ2CR/Mz8=;
        b=UScGlm7y2DkgW6PGcVcO2EqpI2r2QVJI1+8o2lKAqRl6fWplFsBKKJHiDKnNerVLs3
         8O1Fy051d1xKLabfcN+Yabr1lZl7wV7a2ui/2vRI49KH6FoGWRnZE8fYq9aqoBh6gtyt
         UQJR6Kx2GVRX41Eh8vDTJsSYW2qWFOhueyB+mHAtDu1FLCxL53R12xX5zyKBB8XEoEDj
         oiaZpHbgSQU8LzpsfHfENOvKcamilGh6JLlTE9ysaHY4oAswALj444tt/ePHunPLu3Eq
         42ffgZyeMvSyDmZIGRwWA67bcpowO6TAsSpiROYzMIwxUaknDznOS/hnhQ8VFRwDxeW8
         Fokg==
X-Gm-Message-State: AOAM532inDZUK9alNcayICsOASkF63/UCfVVjckeYbQQRYAlJU24/KIr
        iGv0L04R7In59B+7qadxcIedisO68U9IdXDaeLIu29jGwwOXfgCo8kvRIIPPQty9EeYjWgY3mye
        ZUu4jAK4AjqcTDGG2NwEFlUzTdFbXVj4e6Y3O9XA=
X-Received: by 2002:a63:4c49:: with SMTP id m9mr29195077pgl.419.1626768701669;
        Tue, 20 Jul 2021 01:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG8j4cQo0sSikEalWGBNDUfUQlpvmHm2octMwKwSNSbMu6pAwQfKzrA9J4vL7ZOt5nG9PGH8PsXO2guK9oqrk=
X-Received: by 2002:a63:4c49:: with SMTP id m9mr29195063pgl.419.1626768701476;
 Tue, 20 Jul 2021 01:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210704104906.78490-1-linux@weissschuh.net> <nycvar.YFH.7.76.2107152059330.8253@cbobk.fhfr.pm>
 <2f89257c-b074-45ed-8103-e3e70db2c1c6@t-8ch.de> <nycvar.YFH.7.76.2107152114020.8253@cbobk.fhfr.pm>
 <a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de>
In-Reply-To: <a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Jul 2021 10:11:30 +0200
Message-ID: <CAO-hwJJ1q2UC_QHqX_=vdQiDcMEhyO5Nxg65s=1h-smQNCiMoA@mail.gmail.com>
Subject: Re: [PATCH] HID: add cmedia-fixup driver
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.or>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 15, 2021 at 9:45 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> On Do, 2021-07-15T21:14+0200, Jiri Kosina wrote:
> > On Thu, 15 Jul 2021, Thomas Wei=C3=9Fschuh wrote:
> >
> > > > > This driver provides HID fixups for CMedia audio chips.
> > > > > For now this enables the recognition of the microphone mute butto=
n for the
> > > > > HS-100B.
> > > > >
> > > > > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > > > ---
> > > > >  drivers/hid/Kconfig            |  6 +++
> > > > >  drivers/hid/Makefile           |  1 +
> > > > >  drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++=
++++++
> > > > >  drivers/hid/hid-ids.h          |  1 +
> > > > >  drivers/hid/hid-quirks.c       |  3 ++
> > > > >  5 files changed, 93 insertions(+)
> > > > >  create mode 100644 drivers/hid/hid-cmedia-fixup.c
> > > >
> > > > Can you please drop the '-fixup' from the driver name? We have quit=
e a
> > > > couple of drivers that do report descriptor modifications, but we'r=
e not
> > > > using this '-fixup' naming scheme for them either.
> > >
> > > There is already an existing driver "hid-cmedia":
> > > "HID driver for CMedia CM6533 audio jack controls".
> > >
> > > This driver works in a completely different way from mine, so I thoug=
ht
> > > to keep them separate. The idea was for the new driver to be a
> > > collection of simple, similar report fixups.
> > >
> > > Should they be combined?
> >
> > If it's the same vendor, then yes. We generally (with exceptions, of
> > course :) ) group the HID drivers by vendor, even if completely differe=
nt
> > quirks are needed for different devices from the same vendor.
>
> Will do.
>
> Should I merge it into the existing `struct hid_driver` and do id checks =
in
> every member function or declare a dedicated `struct hid_driver`?

Adding checks for every function is less than ideal because that would
add useless calls for every raw event.
But adding a new `struct hid_driver` is tempting given how different
the 2 drivers are. However, you would have to write a new
module_init/exit for it to register 2 drivers.

Worse case, if you can not create 2 drivers in one module, you could
always not set `.raw_event` in the main `struct hid_driver`, and
assign it in the `.probe` once you know which device you are facing.
In both cases, this is not something we already have in the HID
subsystem, but we need a first, right?

I also have a small nitpick on the patch itself, will comment in the
original submission email.

Cheers,
Benjamin

>
> Thanks!
>

