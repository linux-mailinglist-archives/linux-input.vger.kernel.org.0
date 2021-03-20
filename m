Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D0342A51
	for <lists+linux-input@lfdr.de>; Sat, 20 Mar 2021 05:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhCTEFr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Mar 2021 00:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhCTEFq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Mar 2021 00:05:46 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AC4C061761
        for <linux-input@vger.kernel.org>; Fri, 19 Mar 2021 21:05:46 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id v2so4996563pgk.11
        for <linux-input@vger.kernel.org>; Fri, 19 Mar 2021 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eLR87YkHxZaZyrKF6MIKECspjzHF6OMn0gEJkHmwGqQ=;
        b=K8N1HfRGnEm51k2yPKETnj1QgEPSpAX+hAj2PgCjKhrtTaVqTGtpWQq4O4E9ZMa+sd
         8szTuhM4/qas1/BTYF47uJMBK8VpRHGd/uLJKBt5esivuLr2ozTVQMB6Q2fINDd4ll5h
         WtBhtwuf+ZLvbXPvGvOCuMZpkDl/tQF+AYpY9euKHNkljwqepxmK9S8yfme+wMs0bPls
         6bWmlIXctYZLmF+1zCkViy//q/e62a02kfs+oleLUBhqH65c4YHiaX2/lKWhxEUK0Jxk
         jYi8+bW6/eCtMCnZZwxMW0Er6PEPsWeMegkPaIenzNbWO7jXqWDTcb61SZ7eFPlsSdgO
         01Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eLR87YkHxZaZyrKF6MIKECspjzHF6OMn0gEJkHmwGqQ=;
        b=DOWWIl+/9SHu/lz41ficp4HYL2wLW3i5igVhugKnVbZQm7BydbzusQb87y8xozAqp8
         6PmzNs+ljzNAnC/6DoHAK2HIVdAdW+A1u0V0yUy5nbOiwGRu4ZoD7ssiXFAnNZjw9Amq
         efahpkjc9MdCPE0X9CcjjPjUy/4TRtQTKmdrZqxS0Tlh3IcH5Oba3quqsL7ziWoLSYl/
         9HzpE8PCR+eylKaexEZPb1Bc0Pa5avnFjAc59kZPoPhjg+xl8nl6CxPE42eywsm1jb12
         ho6MnR/HOjEns1X99mpv9PgVJStwUgaVt9Lm/T0Uk3CdBY4Ria485+hJ+cQS2H7xQlZR
         MLzQ==
X-Gm-Message-State: AOAM532ji0iEJV7z96GjHWX8sZBfcDc6iMBsJHUJlDDdpzJqS8fadUdt
        OU3B7OTHZisv3BriV4+WOiA=
X-Google-Smtp-Source: ABdhPJyrdf2XwSFsutTDf0m6d27ZQOVgiTWLXP8dMPdVIumQrcDGJvUnVsdu4oqA7Ja9N0gH9MFNRw==
X-Received: by 2002:aa7:940a:0:b029:1f1:5b58:24e5 with SMTP id x10-20020aa7940a0000b02901f15b5824e5mr12233993pfo.54.1616213145745;
        Fri, 19 Mar 2021 21:05:45 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a468:a574:c1f5:b1a1])
        by smtp.gmail.com with ESMTPSA id s12sm5948172pgj.70.2021.03.19.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 21:05:44 -0700 (PDT)
Date:   Fri, 19 Mar 2021 21:05:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhai Zhaoxuan <kxuanobj@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Subject: Re: [BUG]an input device can not support more than 568 keys due to
 uevent buffer too small
Message-ID: <YFV0lm1IOZjaycXt@google.com>
References: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
 <YEy5Ki/lF2cbQxCH@kroah.com>
 <CAAnY7J3KDb094ZDZ7QEUQ9biUBBSVr=ru0x7cWPSGsCi-=9quw@mail.gmail.com>
 <YE8M+/LZPDOrOCPh@kroah.com>
 <CAAnY7J3YQDe1=OR0U66UnS8JE4ALfV9CzugazwAYa7c4TX6F=w@mail.gmail.com>
 <YFKzuP2Phh1RRQ8V@google.com>
 <CAAnY7J0n5zKpGMXYbjBk+TPPv1CfjV7Uh_9RRjfJ+6NbxvLAbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAnY7J0n5zKpGMXYbjBk+TPPv1CfjV7Uh_9RRjfJ+6NbxvLAbg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 18, 2021 at 12:54:48PM +0800, Zhai Zhaoxuan wrote:
> On Thu, Mar 18, 2021 at 9:58 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Zhai,
> >
> > On Mon, Mar 15, 2021 at 07:58:58PM +0800, Zhai Zhaoxuan wrote:
> > >
> > > In the real world, I think, it is nearly impossible that a physical
> > > device contains so many keys or buttons.
> > >
> > > But I think a virtual device may need this. Such as a server remote
> > > management card, it simulates a virtual keyboard,
> > > registers keys and forwards all keys from user's computer to server.
> > > And the user's computer may have any keys. So the card needs to
> > > register all possible keys and send them to the kernel.
> >
> > I believe the best approach is to forward input devices to the remote
> > system one by one, exactly as they are on the local end, instead of
> > trying to crate a frankenstein monster out of them. You will not be able
> > to do that in a meaningful way anyway, as for example a touchscreen
> > needs to be handled differently from a touchpad, and if you smash them
> > all together into one composite device you will get a mess on your
> > hands.
> >
> > >
> > > I have tried to register only all **known** keys instead of all keys,
> > > but it still fails on the kernel.
> > > (The userspace source file has been placed in attachment.)
> > >
> > > > What functionality does it allow that we do not have today?
> > >
> > > If programs are unable to register all known keys on only 1 uinput
> > > device, programs have to register
> > > keys on two or more devices. But this may result in unexpected behavior.
> > >
> > > For example, the program registers Key A on device1, and registers Key
> > > B on device2.
> > > When the program needs to send a key combination A+B to a target
> > > application, it has to:
> > >      1. emit Key A down on device 1
> > >      2. emit Key B down on device 2
> > >      3. SYN_REPORT on device 1
> > >      4. SYN_REPORT on device 2
> > >      5. emit Key A up on device 1
> > >      6. emit Key B up on device 2
> > >      7. SYN_REPORT on device 1
> > >      8. SYN_REPORT on device 2
> > >
> > > Then, the target application polls input events on both devices 1 & 2.
> > > It reads on device 1, and gets Key A pressed down and then released,
> > > so it does feature A.
> > > Then, it reads on device 2, and gets Key B pressed down and then
> > > released, so it does feature B.
> > > Finally, the target application loses the A+B key combination.
> >
> > Which is exactly what would happen in a real life with 2 hardware
> > devices.
> >
> 
> Yep, but what expected is not 2 hardware devices. It should be one device.
> 
> 
> The user scripts just want to send a key combination. The user
> definitely doesn't want the target application to ignore the key
> combination.
> 
> So, we are unable to do the key combination with only 1 input device.
> And as you can see, it does not work if we separate key combinations
> into two devices.
> Finally, this is "we do not have today".

If you want to create a contrived example - sure, you declare too many
events and run against uevent limits.

The point I am trying to make is that in more realistic use case, when
you are dealing with remote management, it is not a good idea to smash
all your input devices on the local side into one input device on the
remote side. And if you forward hardware devices one by one to the
remote side you will not run into this issue, as thankfully none of them
have 500 keys.

Thanks.

-- 
Dmitry
