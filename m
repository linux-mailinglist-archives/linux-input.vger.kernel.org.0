Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BED4342F1B
	for <lists+linux-input@lfdr.de>; Sat, 20 Mar 2021 20:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhCTTCC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Mar 2021 15:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTTBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Mar 2021 15:01:23 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF3DC061574
        for <linux-input@vger.kernel.org>; Sat, 20 Mar 2021 12:01:23 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so11830388otn.1
        for <linux-input@vger.kernel.org>; Sat, 20 Mar 2021 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1Vm+XKCn+Lg5JPd61qlKXYqefjHmlMzKUjJbssNsIQ=;
        b=e98cnPZsY+g2gzAPp6wPV0XkwK7m0vv0Fv07PeO2IyBY6a4n5nvnaAX/crJInYttyk
         p3WrwEvfdCEv3dPZ3WZE5FLe5GFAqeEGPyARYWadbqD867wlb91eE72s9vrELKN2hQDR
         ts15La5NVodXd9u3FV6qjwA0rt5YYXE8rDgClrBXmhUzouZrtfKps/EUUM7aYLzBaBZM
         vDdz/CZOBogwSaD2EKEBnXqEKK5Tu24HmdWm7IexKmjEZ9KgUbhsCbcpSbHOrf/bY9lG
         2L8NkdmCZmUqwBhuacT+ofGwgkFPEPRbIK61S+KQIJa/yNAAS+iW3QV1f+FM/WJAVt5F
         zZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1Vm+XKCn+Lg5JPd61qlKXYqefjHmlMzKUjJbssNsIQ=;
        b=c/t9FegTNQmNudOkNy7XYOnk6L9R9Yv+4Ow8+4XITy5m4TH+563yEjy0zV71X4IurN
         8802cicOsbDBqEBO21Efx8wd7UMX5X+/ruP8tWA+KWd/SxBsZJYjH4scQFOG0LgWEUPW
         7naVRLOdQn+2UpNvYEYXWk9pefN2L58ceWSJMQSlXv5qVXIPRl+iyNyemAlhDzzqOfLS
         exZggwXLQIsPaJJsqMhzFpiAffta3eqAVqN44Ik4ysSYxPQpnFIhtSAAr+8hAWT8KNYu
         z2qngAOqdmkGsYOKGivDBZl26VcAZczCvKBf2l09gXIY8cEz3pdW2JGWLmnuq1kXcHLj
         BtQA==
X-Gm-Message-State: AOAM53146/W5W7+dXxB3X/WD/2zpYkpXAE/ZiHTmRR7co7tYC1Md9NY+
        uj+IFh9kh+JGmV70pE6LoYQpvVSyRL71No5sXOjf62MjlNrWOWyq
X-Google-Smtp-Source: ABdhPJyhjaaB8Aqx0jsuzOMpvlYxfra2n2l84BXjraFIJzo7MWfldQ1H4P+/TM7kwycvzeNuCmiY0CMJoFRiQD0qohs=
X-Received: by 2002:a05:6830:18c6:: with SMTP id v6mr5560472ote.120.1616266882479;
 Sat, 20 Mar 2021 12:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
 <YEy5Ki/lF2cbQxCH@kroah.com> <CAAnY7J3KDb094ZDZ7QEUQ9biUBBSVr=ru0x7cWPSGsCi-=9quw@mail.gmail.com>
 <YE8M+/LZPDOrOCPh@kroah.com> <CAAnY7J3YQDe1=OR0U66UnS8JE4ALfV9CzugazwAYa7c4TX6F=w@mail.gmail.com>
 <YFKzuP2Phh1RRQ8V@google.com> <CAAnY7J0n5zKpGMXYbjBk+TPPv1CfjV7Uh_9RRjfJ+6NbxvLAbg@mail.gmail.com>
 <YFV0lm1IOZjaycXt@google.com>
In-Reply-To: <YFV0lm1IOZjaycXt@google.com>
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Date:   Sun, 21 Mar 2021 03:00:46 +0800
Message-ID: <CAAnY7J2mJ4bqkiTXGBv-VMZFmfThubbSXbku1nQB9GbexHTr8A@mail.gmail.com>
Subject: Re: [BUG]an input device can not support more than 568 keys due to
 uevent buffer too small
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 20, 2021 at 12:05 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Mar 18, 2021 at 12:54:48PM +0800, Zhai Zhaoxuan wrote:
> > On Thu, Mar 18, 2021 at 9:58 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Zhai,
> > >
> > > On Mon, Mar 15, 2021 at 07:58:58PM +0800, Zhai Zhaoxuan wrote:
> > > >
> > > > In the real world, I think, it is nearly impossible that a physical
> > > > device contains so many keys or buttons.
> > > >
> > > > But I think a virtual device may need this. Such as a server remote
> > > > management card, it simulates a virtual keyboard,
> > > > registers keys and forwards all keys from user's computer to server.
> > > > And the user's computer may have any keys. So the card needs to
> > > > register all possible keys and send them to the kernel.
> > >
> > > I believe the best approach is to forward input devices to the remote
> > > system one by one, exactly as they are on the local end, instead of
> > > trying to crate a frankenstein monster out of them. You will not be able
> > > to do that in a meaningful way anyway, as for example a touchscreen
> > > needs to be handled differently from a touchpad, and if you smash them
> > > all together into one composite device you will get a mess on your
> > > hands.
> > >
> > > >
> > > > I have tried to register only all **known** keys instead of all keys,
> > > > but it still fails on the kernel.
> > > > (The userspace source file has been placed in attachment.)
> > > >
> > > > > What functionality does it allow that we do not have today?
> > > >
> > > > If programs are unable to register all known keys on only 1 uinput
> > > > device, programs have to register
> > > > keys on two or more devices. But this may result in unexpected behavior.
> > > >
> > > > For example, the program registers Key A on device1, and registers Key
> > > > B on device2.
> > > > When the program needs to send a key combination A+B to a target
> > > > application, it has to:
> > > >      1. emit Key A down on device 1
> > > >      2. emit Key B down on device 2
> > > >      3. SYN_REPORT on device 1
> > > >      4. SYN_REPORT on device 2
> > > >      5. emit Key A up on device 1
> > > >      6. emit Key B up on device 2
> > > >      7. SYN_REPORT on device 1
> > > >      8. SYN_REPORT on device 2
> > > >
> > > > Then, the target application polls input events on both devices 1 & 2.
> > > > It reads on device 1, and gets Key A pressed down and then released,
> > > > so it does feature A.
> > > > Then, it reads on device 2, and gets Key B pressed down and then
> > > > released, so it does feature B.
> > > > Finally, the target application loses the A+B key combination.
> > >
> > > Which is exactly what would happen in a real life with 2 hardware
> > > devices.
> > >
> >
> > Yep, but what expected is not 2 hardware devices. It should be one device.
> >
> >
> > The user scripts just want to send a key combination. The user
> > definitely doesn't want the target application to ignore the key
> > combination.
> >
> > So, we are unable to do the key combination with only 1 input device.
> > And as you can see, it does not work if we separate key combinations
> > into two devices.
> > Finally, this is "we do not have today".
>
> If you want to create a contrived example - sure, you declare too many
> events and run against uevent limits.


This is a utility that helps the user press keys by reading and
executing user scripts.

At least, on Windows, there are many software programs that can record
users' mouse and keyboard action to a file, and replay the file.

So, do you mean that the user shouldn't be able to do this on linux?


>
> The point I am trying to make is that in more realistic use case, when
> you are dealing with remote management, it is not a good idea to smash
> all your input devices on the local side into one input device on the
> remote side. And if you forward hardware devices one by one to the
> remote side you will not run into this issue, as thankfully none of them
> have 500 keys.
>

The source of the keys may not come from real physical devices. The
events may be generated from a virtual device, a keyboard utility, or
just a window message. All keys are possible in this situation.

For example, the user can use RDP to connect to a relay server. Then
the user runs remote management software, and presses keys. The remote
management software should receive these keys from the window messages
and it is unable to access the physical keyboard.


> Thanks.
>
> --
> Dmitry
