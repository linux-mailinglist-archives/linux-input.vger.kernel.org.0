Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD32B14AF23
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 06:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgA1Foj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 00:44:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27133 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725283AbgA1Foj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 00:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580190277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VJpTqTA1V1l/4RAIuldEf9W6s5EZnGafJo7d22PsaPk=;
        b=iB2P8oOtK5xLTGb0imf+MAlAxUEYrl3EBezZxsZdEKQCpmmh+36n9rZqi+Y0o06X9X0Kli
        7uqUDSrzXfgjwIQrfDMUbfTTQYQCkt2e8Rmblb2iIQXNrsLZ4DdAfx/yr2AZaddfjIcAr6
        rrOfowDoikAVz2Czekd8YMmdMwI5FWY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-YAbuI7YtPyS8SCJ6GZKxvQ-1; Tue, 28 Jan 2020 00:44:30 -0500
X-MC-Unique: YAbuI7YtPyS8SCJ6GZKxvQ-1
Received: by mail-qk1-f199.google.com with SMTP id 24so7756138qka.16
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2020 21:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJpTqTA1V1l/4RAIuldEf9W6s5EZnGafJo7d22PsaPk=;
        b=O6L57KCvFiG3vump4ln4YQiRNxYEJq68H4nzKcyqJ3vPprdvUPfGbBuB8Q3hjcBNvJ
         SEW3OZ2C6ReTzExTxWxUgaqCViQySX3s2AALrWzvpNgoKE7TlY1PUPm7hiLNQuMDG4+y
         ZdIbR5XTtgc/5cbUL2+HdM2tvjasJK/enASKg4EP9eo/FcvugrYNvilr0hKPIcWXn1oP
         5IFBB5xnDJIP+essUYTqpM/t3Oo/4VVenEv6jnzD1Dg+Vr9lvZ8/sjwzsCaP4ZKtUP0i
         SUR4seVhqYTuP8uGVwuCxq4+dsvwexpzPL74pScx7FZ8o4DbwKJkey73txpsw7c0yHdK
         Bi7A==
X-Gm-Message-State: APjAAAVXal8ro2mHWRiNUcqK0FWqSqjmcRh984RIsVW1WIDKUe/VhhtR
        xRNRaUkbLzQkJZ8yomcr0WHiF/wvsnLU2vW3Ted0NscCkNoSdxV4ZVl/ql35sKB41BWy57LIZkj
        FQxny/iVmlwEztFm7+iCsI57VcleFsQO/wSXCYrI=
X-Received: by 2002:ac8:6650:: with SMTP id j16mr19612063qtp.294.1580190269774;
        Mon, 27 Jan 2020 21:44:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgfhIdnJvNtBMIvdPB5iAOoStxldVG8ODdlwvv3ldaNIGPFA8MAOzBIzGbmqIKrCsHNCgtPgTG3eK5rUqIQ1k=
X-Received: by 2002:ac8:6650:: with SMTP id j16mr19612036qtp.294.1580190269403;
 Mon, 27 Jan 2020 21:44:29 -0800 (PST)
MIME-Version: 1.0
References: <CAKsRvPPjk7RZanEwO3hVa+UZ9_zq6xWakOxckBfx-a+_bEgUtA@mail.gmail.com>
 <CAKsRvPOfDDEN_BNPznCn2KyWLxMRtT7rC3fEwQ0TNzoRxA+UVg@mail.gmail.com>
In-Reply-To: <CAKsRvPOfDDEN_BNPznCn2KyWLxMRtT7rC3fEwQ0TNzoRxA+UVg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 28 Jan 2020 06:44:18 +0100
Message-ID: <CAO-hwJJbdZ1v9j9QHWCwnNJraYNjXSk5kNy=OrWK4p-CsezVbg@mail.gmail.com>
Subject: Re: [BUG + PATCH] HID ELAN9038 probe fails with "report is too long"
To:     js <sym.i.nem@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:41 PM js <sym.i.nem@gmail.com> wrote:
>
> i'm bumping this bug because i haven't heard anything from the
> maintainers for a week.

Apologies for the delay. I have been in a conference the past 2 weeks
in Australia, so couldn't handle much of upstream.
Furthermore, we are currently in the merge window, which means we
should not push patches to linux-next unless they are absolutely
needed.

> there's been no change in the git either.
> what's going on guys? this is a tiny patch for a very simple bug.
> it should be a fast review and commit to the kernel tree.

Nope, that is not that simple:

- please submit your patches following
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n340
Our tools require the patches to not be attached in an email so we can
process them
- this patch affects the core of the HID subsystem, which means we
should take extra care when dealing with it to not break other systems
- this patch seems to paper over a security patch
(8ec321e96e056de84022c032ffea253431a83c3c) by changing the return
value from an error to "yeah, that's fine". So unless there is a proof
that this is the correct way, it's going to be a nack from me until
proven otherwise
- this patch affects in the end hid-multitouch, and as mentioned in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-multitouch.c#n26
I'd like to have a reproducer in
https://gitlab.freedesktop.org/libevdev/hid-tools so we do not break
those devices in the future.

So I understand the frustration of having a HW regression, but this
patch is clearly not the correct solution given what I have here, so I
can not push it right now.

Cheers,
Benjamin

>
> js
>
> On Sun, Jan 19, 2020 at 1:14 PM js <sym.i.nem@gmail.com> wrote:
> >
> > i posted this bug to bugzilla with the attached patch.
> > this email is to notify the maintainers.
> > https://bugzilla.kernel.org/show_bug.cgi?id=206259
> >
> > thanks!
> >
> > js
> > ----
> >
> > ELAN i2c digitizer on microsoft surface go fails to initialize and
> > device is non-functional
> >
> > initialization fails on 4.19.96:
> > ----
> > [    5.507245] hid-generic 0018:04F3:261A.0005: report is too long
> > [    5.507256] hid-generic 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> > [    5.507290] hid-generic: probe of 0018:04F3:261A.0005 failed with error -22
> > [    5.556409] hid-multitouch 0018:04F3:261A.0005: report is too long
> > [    5.581641] hid-multitouch 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> > [    5.618495] hid-multitouch: probe of 0018:04F3:261A.0005 failed
> > with error -22
> >
> > initialization succeeds on 4.19.95:
> > ----
> > [    7.150887] hid-generic 0018:04F3:261A.0001: input,hidraw2: I2C HID
> > v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
> > [    8.253077] input: ELAN9038:00 04F3:261A as
> > /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input20
> > [    8.253219] input: ELAN9038:00 04F3:261A Pen as
> > /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input23
> > [    8.253330] hid-multitouch 0018:04F3:261A.0001: input,hidraw0: I2C
> > HID v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
> >
> > problem seems to be due to this commit:
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.19.y&id=31d06cc8e7caec36bedeb4f90444920431462f61
>

