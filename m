Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1647233FE58
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 05:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCREzy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 00:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCREzZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 00:55:25 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159A1C06174A
        for <linux-input@vger.kernel.org>; Wed, 17 Mar 2021 21:55:25 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id a8so484464oic.11
        for <linux-input@vger.kernel.org>; Wed, 17 Mar 2021 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEUVQVwcjVtQ5HELoaMp7ZNDiBldiFUlJffnn8KM7EA=;
        b=KmVd+Sghz4Ow0NU9hQtCulBJO1vnGJI8MFtUjZDygZOTitW9Xh4FP8gv0EOO6WpIUP
         aT1GcZP8Bc+wgGAJ82coNGrCm9CgM1TuA/WbRi9xn6ZlR0BufZgTrip3yBhlOmXYif98
         A33AXJQTpRiIV31FxjjQdhGNRWUiltAYxXHhflWSz9bicxh5SaQRO3wb9k/k9v11LVTR
         4B3A0w0F/CB6YTdmpcQnYrBbvs5cLO8u0I81aGKLRsyoZnmtTadgRMC/DZS2WpSlIkpe
         ah9GggVZyNBBytexuOAnAuQWh3N5odweD8sNtfVBi5ZZdz8VE+aUbNKVya2EGU7wrFBw
         Q3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEUVQVwcjVtQ5HELoaMp7ZNDiBldiFUlJffnn8KM7EA=;
        b=n9AH+ZdG/s33TBcE/j1US+aSjeftrhuenoz39XGA5HCCWF/gCUHq3t8TA/WkRv46zC
         nZl9sVhMsYt46IF+yeV/fAyhlvYBLUNrV0ab5ITQ03Y6FsRV/2n/lGaxGvjLSwSlPwh9
         1tBx9PXAntty3BXWIw+wqGyBQNXZEVN4k+aIyn2Wjpqnm5bERYeOw+YY22FUYLJEIA00
         ekN+bjASO9WTw/oxIc9Q1CIyKnfPBTdksW047aQLB4r/pUUm6+VlKpUqHL/9CSDfIdtH
         GM1k4DeqDBnLOhzNvbsNCh/UsddGXJeYdqCabsuwizbQInZCc6Bq/SEtxh86mENRDBgI
         MmPQ==
X-Gm-Message-State: AOAM531aQaY1dEsD6BzqflatXjMvDNOeuZrEI0WELds7azrgEwXE87JE
        56rLdwH7/5b7EysvYaJHQqPG1f9xeZGRgU8imEQ=
X-Google-Smtp-Source: ABdhPJx3b/cn6gBVZDBfVqxNZ7WJU5OVcyK1epN6LCRZSLgfPLELB6VIeOD2U86LAL5iqQPlfsh3zgPmpGpVGBjrBXs=
X-Received: by 2002:aca:ed95:: with SMTP id l143mr1825616oih.110.1616043324356;
 Wed, 17 Mar 2021 21:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
 <YEy5Ki/lF2cbQxCH@kroah.com> <CAAnY7J3KDb094ZDZ7QEUQ9biUBBSVr=ru0x7cWPSGsCi-=9quw@mail.gmail.com>
 <YE8M+/LZPDOrOCPh@kroah.com> <CAAnY7J3YQDe1=OR0U66UnS8JE4ALfV9CzugazwAYa7c4TX6F=w@mail.gmail.com>
 <YFKzuP2Phh1RRQ8V@google.com>
In-Reply-To: <YFKzuP2Phh1RRQ8V@google.com>
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Date:   Thu, 18 Mar 2021 12:54:48 +0800
Message-ID: <CAAnY7J0n5zKpGMXYbjBk+TPPv1CfjV7Uh_9RRjfJ+6NbxvLAbg@mail.gmail.com>
Subject: Re: [BUG]an input device can not support more than 568 keys due to
 uevent buffer too small
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 18, 2021 at 9:58 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Zhai,
>
> On Mon, Mar 15, 2021 at 07:58:58PM +0800, Zhai Zhaoxuan wrote:
> >
> > In the real world, I think, it is nearly impossible that a physical
> > device contains so many keys or buttons.
> >
> > But I think a virtual device may need this. Such as a server remote
> > management card, it simulates a virtual keyboard,
> > registers keys and forwards all keys from user's computer to server.
> > And the user's computer may have any keys. So the card needs to
> > register all possible keys and send them to the kernel.
>
> I believe the best approach is to forward input devices to the remote
> system one by one, exactly as they are on the local end, instead of
> trying to crate a frankenstein monster out of them. You will not be able
> to do that in a meaningful way anyway, as for example a touchscreen
> needs to be handled differently from a touchpad, and if you smash them
> all together into one composite device you will get a mess on your
> hands.
>
> >
> > I have tried to register only all **known** keys instead of all keys,
> > but it still fails on the kernel.
> > (The userspace source file has been placed in attachment.)
> >
> > > What functionality does it allow that we do not have today?
> >
> > If programs are unable to register all known keys on only 1 uinput
> > device, programs have to register
> > keys on two or more devices. But this may result in unexpected behavior.
> >
> > For example, the program registers Key A on device1, and registers Key
> > B on device2.
> > When the program needs to send a key combination A+B to a target
> > application, it has to:
> >      1. emit Key A down on device 1
> >      2. emit Key B down on device 2
> >      3. SYN_REPORT on device 1
> >      4. SYN_REPORT on device 2
> >      5. emit Key A up on device 1
> >      6. emit Key B up on device 2
> >      7. SYN_REPORT on device 1
> >      8. SYN_REPORT on device 2
> >
> > Then, the target application polls input events on both devices 1 & 2.
> > It reads on device 1, and gets Key A pressed down and then released,
> > so it does feature A.
> > Then, it reads on device 2, and gets Key B pressed down and then
> > released, so it does feature B.
> > Finally, the target application loses the A+B key combination.
>
> Which is exactly what would happen in a real life with 2 hardware
> devices.
>

Yep, but what expected is not 2 hardware devices. It should be one device.


The user scripts just want to send a key combination. The user
definitely doesn't want the target application to ignore the key
combination.

So, we are unable to do the key combination with only 1 input device.
And as you can see, it does not work if we separate key combinations
into two devices.
Finally, this is "we do not have today".


Thanks

Zhai
