Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20E2E6B7D
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 00:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbgL1Wz4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Dec 2020 17:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729678AbgL1Wq2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Dec 2020 17:46:28 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB33C0613D6
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 14:45:47 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id f26so10167121qka.0
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 14:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uptuQpMvAp8EqiroFkntcZevF81VveHZTB+MxLKWmao=;
        b=NOVjbDEqs8cIMLD3X5i0+aO6Oq77JBzTA0/zwuNOIVNHU5RqdM2uyi2X7gPjn/E+JB
         24ZMrP3ZClERIIArusEiBr0cNjdt2tf9dhEXdkXEJxpt2QUPhZCcNIcHTwHMi8qPJtZT
         E+L43H5O74cimi5/2ENUQKSlKdO1Xc4OzIRMj0dqCie6jKd25cSocDqSnKk/DjSHKO5T
         yMg9OL40FrcunAwwNenGKJvwqYgst0uQdC7iHPK7q9rorQfdJCzpLpkaAfc/AqDwx+GB
         vX0g5dlGh1zJaLQjH2fn4kdgwfK2KPzMkFsTLlJhiRJjIJjPZkMRtsEWxgxC1F7zswVO
         o6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uptuQpMvAp8EqiroFkntcZevF81VveHZTB+MxLKWmao=;
        b=ddO/FbvmYsIa3WWmhMQFdZkNNJ1uAD1zhjksYSaqn0ZUvA0y2VTj0CJnk4LrlolW7E
         9Yw8Up0dmmZG5QqtBfB52ra9KrVNmHOB48X/2EOSBvW9dMhXz49mNFJZiy7xCEzydGya
         jRBELbE7ulLBlR2WFhQefw1FNbtrkI4JCk11H6asrvT1SX6lQ/F8Vrz2XO8hgs3Gl9/4
         DKen53QwUUC3aY6Bcq5hA/onOvkEYlRm92Vevh/2eACeFEA18bYInGpQRoDAVllQ4Tfl
         v3PC4NuNRzE1lYfoeKO3CjxOTDjkMb4mcKV3mAziI9zLvL3wY4y0NMP5GVe+JbIbIID7
         KmPw==
X-Gm-Message-State: AOAM533UvHYgf2ox2fKsXZrQDmbrwamD2btxVakNGhKiadwyvVZeOOtT
        qFReMTxVyFrgnA/qllIw/DfgHjX+7KEuhhFf6NoAzg==
X-Google-Smtp-Source: ABdhPJwGAuY+oCUF91Tbj8RWYCD1BaCw/T9afId1IIAC2lxXhJEsvmbr8xR8IW5QCl9YBg7dBSrcbEfbtxcsgdoFiPM=
X-Received: by 2002:ae9:e64d:: with SMTP id x13mr45938518qkl.464.1609195546784;
 Mon, 28 Dec 2020 14:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com>
 <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com>
 <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com>
 <CANndSKmch6bdv0N8qUFdAgKBqi50Y11kdK4EFm63xr4Kct5D=A@mail.gmail.com> <3lVD85P15aERBMBIFGdOJT7p4Y8XB0pZREzvTKNJ-OX-Wt7V_pkfwGzC1h_8xboI0UA18rXrh4Ye23kFVeF1udP8FjdGoi3dMlNiE74aCN8=@protonmail.com>
In-Reply-To: <3lVD85P15aERBMBIFGdOJT7p4Y8XB0pZREzvTKNJ-OX-Wt7V_pkfwGzC1h_8xboI0UA18rXrh4Ye23kFVeF1udP8FjdGoi3dMlNiE74aCN8=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 28 Dec 2020 14:45:35 -0800
Message-ID: <CANndSK=v53UMTLrV8YSho2FRJ9_ZAWer4SmiOC0RS_pvf-bwVQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] HID: playstation: report DualSense hardware and
 firmware version.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 27, 2020 at 2:38 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> 2020. december 27., vas=C3=A1rnap 23:27 keltez=C3=A9ssel, Roderick Colenb=
rander =C3=ADrta:
>
> > [...]
> > > > > -       ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_device_at=
tribute_group);
> > > > >
> > > > >
> > > >
> > > > It's a minor thing, but I think `device_{add,remove}_group()` would=
 be better
> > > > here in the sense that it expresses the fact that the group is adde=
d to a device,
> > > > not just any object better.
> > >
> > > Agreed, that's nicer I wasn't aware of it. I try to follow what other
> > > hid drivers do and they all used the kobj directly, which honestly
> > > felt nasty. Will change it to this.
> >
> > Actually devm_device_add_group seems to be even nicer. Surprisingly it
> > isn't widely used yet.
> >
> > Roderick
>
>
> Well, indeed, although I believe that shouldn't be used here. Consider
> what happens if the hid-playstation module is unloaded. The attributes
> of the HID device will not be unregistered, but the backing functions/etc=
.
> are unloaded, so reading/writing them will have undesirable effects - I i=
magine.
> So in either case, you'll need to use `[devm_]device_remove_group()`, and=
 for
> that reason I think using the devm_* variant is less efficient.
> Please note, that I am not 100% sure this hypothesis is correct, but I'm =
pretty sure.
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze

I did some more digging into 'devm_device_add_group' as I was curious.
It is widely used for touchscreen drivers apparently and some other
devices and generally used from 'probe' as you would expect. None of
the drivers I found call devm_device_remove_group. Though, none of the
drivers use HID.

I tried using the call and it seems to work fine even after driver
unloads/reloads without a 'devm_device_remove_group' call. I don't
believe any sysfs entries are kept around (also based on watching the
contents of the sysfs directory for the device). If they were I'm sure
the kernel would have thrown some errors during a future
'devm_device_add_group' call as you know sysfs gets quite unhappy if
you added a duplicate node.

This makes me believe it is getting cleaned up, but I'm not sure how.
I suspect it happens when the HID driver is unregistered
(hid_unregister_driver) from the bus, which follows a bus rescan. When
the driver is removed, device_driver_detach is called, which triggers
a lot of cleanup logic in 'device_driver_release_internal'. I haven't
traced this call, but I think its call 'devres_release_all(dev)' is
what is doing the magic.

Any thoughts?

Regards,
Roderick
