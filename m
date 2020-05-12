Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2961CF256
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 12:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgELK2Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 06:28:24 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41887 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgELK2W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 06:28:22 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MHG0U-1jLCc82Sv2-00DEJu; Tue, 12 May 2020 12:28:20 +0200
Received: by mail-qt1-f180.google.com with SMTP id y42so7097262qth.0;
        Tue, 12 May 2020 03:28:20 -0700 (PDT)
X-Gm-Message-State: AGi0PuYA2rM97A6BB72XvpRQ81qHsHeH0leCWPVjCbRDXUMJTZegpE/y
        B5ke0EU3n4RP0XdN64lWN0yzT82i3kb6nqKBbaw=
X-Google-Smtp-Source: APiQypID9P3IO33VSSILUAUK8JOXEo3/DbHEXUUySTRMkqv/o64ii1dm1lh05k5ftbIAxEWVzcphEuU5vm3ymxXvjhQ=
X-Received: by 2002:aed:2441:: with SMTP id s1mr14382814qtc.304.1589279299325;
 Tue, 12 May 2020 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200512043149.10719-1-Andrea.Ho@advantech.com.tw>
 <CAK8P3a1gKHir-hVoX_mFzqcOF=9NfM1NqO96kC-=6ZHf6Lojdg@mail.gmail.com> <20200512101511.GA3991701@kroah.com>
In-Reply-To: <20200512101511.GA3991701@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 12 May 2020 12:28:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2kqvxgV3oymtC+ppX5Y8+1C_LwmNb5-nz527hKKes-WQ@mail.gmail.com>
Message-ID: <CAK8P3a2kqvxgV3oymtC+ppX5Y8+1C_LwmNb5-nz527hKKes-WQ@mail.gmail.com>
Subject: Re: [V3,1/1] Input/misc: add support for Advantech software defined button
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrea.Ho@advantech.com.tw,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        voyandrea@gmail.com, amy.shih@advantech.com.tw,
        oakley.ding@advantech.com.tw, HY.Lee@advantech.com.tw
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UL9y76oYmONKSLO6P81Rqv6T48d2k1yuPlO287Bl946a4auqDWd
 NXn0br83Lli6w9mgVBGBighXT2glzkPSmjcbFoFu/tPHugpRVHA6ZvDD57glbbL+jwTBeLk
 S7eaproos0XLRvXvHdozbJnhT29+wPoww6TizJEFG/1Syt4G0tkK/yNmrWlvD3xtHDNCxuI
 +uThrU4OXyFtg+BsmoARQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FrKWeI4IP0w=:Ku+i4EA8XezXbDsWLa5SU2
 v1p+N3uAKxr1yuU2EoW3Lm46Xw8o/qAzS/tVzHhKL9hzTVRf4AmxsRJxDSuV4tQK4RJgqOHOM
 anZwFw3hCshMzwEp7my4VFUdUPUmI/InYGAgQNw+e2EK3zEzmSmkAMVDOt34oPaINQjILQOGD
 qEY0zrXtxZ6jZHJV/aRti/+NedYM3TS665Ao/Dh4qhkZoXhjYn2LSv3ltz2PdaAM69K9w3zkd
 pGmfs1sPOHwPWrDqjCzpsU5tySo2btuS53iK+nDWz5LCCuJj1lVLMOmrk+7qEq5NDgW1QHxcX
 63UqpZonXKUMrTU57IW6w34PoypJZP6kbniMV9CRrwJSKwMAQefycvzJC+7hcn4jo2L43aMDb
 lnOOyZHkXZf6563nsUwQKZTRAyAhNA2i1TkPnyFAN9broOCD33XD9j1Q4s6N5vZJRs58yvLxV
 ePew/YNpZv/QviU7qDSMW3nvL5wNawdkIhrKu3n5ZNHlqLZV31zFwYrGer7kA06thbbRbFwPp
 X3HwCO0hmparI+gNBOTc7BLvgJVNugArwpVW8RudIlpTVW5en0USEyZ8uUfWUu4W/wW4IVh3Y
 h3w2VMtfYq5eAGkS0ZsO2jWWeXscH2rCeV15tFIkSshxwRacR5WLH2ETDn9cFHJmAJ+qkW9q8
 nWZ1yGjbzBTXhX4aRXDFYATVCnMWY997zGvrbU77M7mKzawYxqgA46GEyJOt7+1e35g38zBIL
 Cn/L9VwC7T9X/9wi0BeCPYn/qeEXep/UYZZO2h7gzn4P3U9HJEm/uuFTXvgkGoiwEeZGmAo4Y
 GSEoyCMb7FhHVFLJs59ESne+kc8BU0r9qOxLnbdnQVtrAe9+N8=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 12:15 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 12, 2020 at 12:08:08PM +0200, Arnd Bergmann wrote:
> > > +MODULE_LICENSE("GPL");
> >
> > These generally go at the bottom of the file.
> >
> > The license tag here does not match the one in the SPDX header, after
> > you changed the other one to v2-only.
>
> Yes it does, they mean the same thing, see modules.h for the details if
> you are curious.

Ok, thanks for the clarification.

      Arnd
