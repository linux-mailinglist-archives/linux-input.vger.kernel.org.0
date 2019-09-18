Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A85B673A
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 17:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbfIRPfe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Sep 2019 11:35:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44134 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730667AbfIRPfe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Sep 2019 11:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568820932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jl3xf+SlbbmgNVj3rIhprzvu6KTO4+fHOB8Vm/+azHE=;
        b=f2VNA+3yOycD8qpXIaSZfyrRAbT0w8RGKq/hLDe1gq67+l+5BdMwIsKqDT9RQP9sFsnsLl
        qlpRcBJHHg6byj4WcjMPTpIqp3W0Cn8GbaAGe4zzb0hF+M1pvQ9mKbbcZA0l6NzujslaEO
        R416CoZ6vIL6uBIdRBFAyGe4Gjzaoh4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-ZjoEqhQUPFeJZEZjrip7kw-1; Wed, 18 Sep 2019 11:35:31 -0400
Received: by mail-qt1-f198.google.com with SMTP id m6so418302qtk.23
        for <linux-input@vger.kernel.org>; Wed, 18 Sep 2019 08:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5euqK1Uayja2/4T0pIwBXXljs7m3c7t7lzxpmy9RYE=;
        b=sqsVaq5SJLR1/trnrJzA/YUMSLVXa5DCiSsVOoyaGHr3fZ/xRYXPvAz9YMCcdTjuDs
         +y033N9JkWWTqsNsQiglnIushA6GX3VRNMV+5Uw4FIMs/olLyL5iXMu3d+ifbdsmKABL
         kkltnCGZ2Ebaivq6TptHQeUFh6igeNtta0DUiKNGpNbRQDeGhDsNBRbJQw7k1peaw6YU
         3wDgC4ALb2k0Jeg/tgcN9GqNUrWnSo7oC2xq8gCs6q2yZ3GwoJOwJeI0zEhgVPRVzYnX
         5yNIybNLdrDTIgNVS0sHDmMUWNQk3mw9hnk3PHXhFAZ5SwK0G/kYXwLBLPe7BXh+KPBv
         MXnQ==
X-Gm-Message-State: APjAAAXJGeP1/r/aWF4DuhhYsCVpZrwIG87zjinj52Al693b/u83+f3f
        uOJWTJW0NYb5/oyP5NVw++ve8c3iD8nlcrh4SLuVx/W+CnfQepErOoQCdc0EOMWMa0l0kWCm0PP
        qiq5RN/d2J/qo4Qsb0RNgNhGcEFMyJfFG7H1fA80=
X-Received: by 2002:ac8:4251:: with SMTP id r17mr4751032qtm.260.1568820930808;
        Wed, 18 Sep 2019 08:35:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMAkC4LzPBLYmzrgRhTnQzsI/ZM7Fw1Sk0DnmqW0xRDSNMXxOjuj8sChl5/Ge6r4tOqKvUzYmuesragQTuOrU=
X-Received: by 2002:ac8:4251:: with SMTP id r17mr4751014qtm.260.1568820930584;
 Wed, 18 Sep 2019 08:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190812152022.27963-1-stillcompiling@gmail.com>
 <20190812152022.27963-4-stillcompiling@gmail.com> <CAMB+bfK9Oge1T96aJkuvpoAdUSsm+YxY1W70b62gUMMBKfD8vg@mail.gmail.com>
In-Reply-To: <CAMB+bfK9Oge1T96aJkuvpoAdUSsm+YxY1W70b62gUMMBKfD8vg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Sep 2019 17:35:19 +0200
Message-ID: <CAO-hwJLVS0G+TtShbBQ6j9_aCAKjb_AsvoN2HkR+zKpd98MKRw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] HID: core: fix dmesg flooding if report field
 larger than 32bit
To:     Joshua Clayton <stillcompiling@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>
X-MC-Unique: ZjoEqhQUPFeJZEZjrip7kw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 29, 2019 at 1:26 AM Joshua Clayton <stillcompiling@gmail.com> w=
rote:
>
> ping?
> I'd love to see this get in.
> with distro kernel I have effectively no dmesg due to this issue

Apologies for the delay.

I really thought we should find a better way of fixing this, until I
got a laptop affected by it. This series is a must have.

Applied to for-5.4/core

Cheers,
Benjamin

>
> On Mon, Aug 12, 2019 at 9:20 AM <stillcompiling@gmail.com> wrote:
> >
> > From: Joshua Clayton <stillcompiling@gmail.com>
> >
> > Only warn once of oversize hid report value field
> >
> > On HP spectre x360 convertible the message:
> > hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (=
192) > 32! (kworker/1:2)
> > is continually printed many times per second, crowding out all else.
> > Protect dmesg by printing the warning only one time.
> >
> > The size of the hid report field data structure should probably be incr=
eased.
> > The data structure is treated as a u32 in Linux, but an unlimited numbe=
r
> > of bits in the USB hid spec, so there is some rearchitecture needed now=
 that
> > devices are sending more than 32 bits.
> >
> > Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 210b81a56e1a..3eaee2c37931 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -1311,8 +1311,8 @@ u32 hid_field_extract(const struct hid_device *hi=
d, u8 *report,
> >                         unsigned offset, unsigned n)
> >  {
> >         if (n > 32) {
> > -               hid_warn(hid, "hid_field_extract() called with n (%d) >=
 32! (%s)\n",
> > -                        n, current->comm);
> > +               hid_warn_once(hid, "%s() called with n (%d) > 32! (%s)\=
n",
> > +                             __func__, n, current->comm);
> >                 n =3D 32;
> >         }
> >
> > --
> > 2.21.0
> >

