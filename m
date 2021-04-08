Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53887359057
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 01:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhDHXco (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 19:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhDHXco (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 19:32:44 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39AFC061760
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 16:32:32 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id v8so1825035plz.10
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hqAYdAb3xu9WlPGxicAE6TcVLtRvPzrH7JvI3P+M9pk=;
        b=S3oBNpguwrTeog2i2P6qmaVZIYWzjl8HaKj23HnDoIKRd2nin3OPngid/NXnZszn3Z
         zK0V/iKMTaTXXCSDy4hSxnkesak3Ist7MeQ1bJ2383lR8i0S7ISHG62xsNnwZY2OLuks
         IOfa9SxZr/p1BrIMWUnVpYdJbiOltKtqxaZvrwtohflHRJ+1ktVDeYVvYPs5QVVPMmyg
         A05iqXBU8oDr5xEqQU4gGInMyFV9nek6MspjZFT7kb5O5bD6D86IwOVfsTQUKTiiRssh
         4E5t7hY0EIfMF293o/wvNvCIP4I1hJyB1r0D+gEZZU4HsOEKFTfcks0UJlpTIHxvmGVK
         kTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hqAYdAb3xu9WlPGxicAE6TcVLtRvPzrH7JvI3P+M9pk=;
        b=GmI9OVlSQTgpwsSUs4MKtAQC87CVZIOIGr1m/ND9bs+q/Ws+Y6Py7NAEfhSQY4fzhn
         e9yEg7sbv8jeXBd5ajWMY2BM7eApPaq4oD3rk2i+M2EixzZ1tl5cJVI7gv9UmppvZAOT
         yjQJw2a8OYcXlYs314/NVPP3cZyf5EjMDndvPaARG3UmuLM2XqjguWJ1ygTJnhyv+e9S
         cMHkxa2XKMXPN2cjhpUkwMWYPES9IXZtdEXTrMLtGhUthsQkkwYasJ1DE5YViCNgGdvZ
         7kFdYwG9IK6YKn0l0jxeT6CzRNuEPuGMBuXJp3BRgIdaIRM+6TtLCxsX32fyTlk4mZ2S
         0tOw==
X-Gm-Message-State: AOAM532CvAbDQiZ3rcuz1+0RmaJ5svLFaEQ77mA/MBLUDkuH9pKPyftj
        mZoGFm7BgWeN43p6zBy4qDihqf4Pm9IeTOFbTaLrqiYtBzQ=
X-Google-Smtp-Source: ABdhPJyeirhFB4cHeIyR69h0KIg+gvEzExT9SIIMqJ2JjO9W2k22J+CujrbcudIWxNF1P083W1hZNqn1YU5n6SVXbM4=
X-Received: by 2002:a17:902:9b92:b029:e6:b640:ad46 with SMTP id
 y18-20020a1709029b92b02900e6b640ad46mr10171243plp.56.1617924752018; Thu, 08
 Apr 2021 16:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
 <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
 <CALvoSf63YbXdK8-yEUnnJqaGeZ4VF2A+8u4M9tpoSB7OHOxHXQ@mail.gmail.com> <VI1PR07MB5821FB3E0E4B570C9B18FEC9ED749@VI1PR07MB5821.eurprd07.prod.outlook.com>
In-Reply-To: <VI1PR07MB5821FB3E0E4B570C9B18FEC9ED749@VI1PR07MB5821.eurprd07.prod.outlook.com>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Thu, 8 Apr 2021 16:32:20 -0700
Message-ID: <CALvoSf4BO_57CCFZeXNnvCf4teQzy1Th-+h7H2AMFMemT1isug@mail.gmail.com>
Subject: Re: Supporting 64-bit Digitizer Serial Numbers?
To:     "Gerecke, Jason" <Jason.Gerecke@wacom.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 8, 2021 at 3:19 PM Gerecke, Jason <Jason.Gerecke@wacom.com> wro=
te:
>
> First of all, my apologies for the likely-wonky email formatting. For som=
e reason I'm missing messages from linux-input in my Gmail so I'm forced to=
 reply from Outlook (which doesn't exactly make inline plain-text replies e=
asy).

No worries.

> > As far as I can see, the Wacom S/N (stuffed into MSC_SERIAL) is indeed
> > always truncated to 32 bits; introducing MSC_SERIAL2 should be suitable
> > for the wacom driver as well if they want to publish the high bits.
>
> ABS_MISC and MSC_SERIAL are nominally the tool type and serial number fie=
lds. A given serial number may be re-used across tool types, however, and s=
o the two fields must be combined to get a globally unique ID. It's not *qu=
ite* that simple though:
>
>     * The ABS_MISC field is sometimes intentionally mangled for compatibi=
lity with an ancient wacom.ko bug
>     * A 32-bit MSC_SERIAL is sometimes not quite large enough to store th=
e nominal serial number
>     * The way the values are assembled varies between devices (i.e. on so=
me devices ABS_MISC is the high "n"-bits, on others it is the low "n"-bits,=
 and "n" may vary).
>
> I'd love to have a way for our driver to report an unmangled 64-bit uniqu=
e ID which matches what you'd get on Windows and OSX, but I don't think MSC=
_SERIAL2 quite solves that problem for us. We could use it with devices whi=
ch have MSC_SERIAL as the low 32 bits of the unique ID, but not those that =
have ABS_MISC as the low "n"-bits).

Noted, thanks for explaining.

> > > If changing MSC_SERIAL is deemed too risky for compatibility, then it=
's
> > > easy to just leave MSC_SERIAL as-is, and put in a separate MSC_SERIAL=
1
> > > (MSC_SERIAL0?) that has the pristine low bits -- just at a cost of ye=
t
> > > one more MSC_ field per report, and using up the last MSC_ bit before
> > > we need to bump MSC_MAX.
> > >
> > > This approach doesn't affect Wacom evdev events at all, all of that
> > > logic is separate from hid-input.
> >
> > There is a whole ecosystem for wacom, but we are pretty much in
> > control of all the pieces. So I would prefer involving wacom from the
> > beginning, and have a common representation to the user space.
>
> Providing a separate MSC_SERIAL1 (or zero) in addition to MSC_SERIAL2 cou=
ld be the solution to the problems above. Our driver can be taught how to a=
ssemble the 64-bit IDs and then split them into events for the high- and lo=
w-order bytes. We might want to consider using a different prefix than MSC_=
SERIAL if we go this route, however. It could be very confusing to understa=
nd how all three events do (and don't) relate to each other if their names =
are too similar.

Yes, we have just enough free slots within MSC_MAX to keep MSC_SERIAL
and set up new MSC_TRANSDUCER_ID0 and MSC_TRANSDUCER_ID1 -- better
names welcome. Since MSC_SERIAL has been weird and probably is often
logically clamped in strange ways, I'm happy with keeping it entirely
separate from the new clean ID events.

(Any guess how much pain we are in for if we want to expand MSC_MAX?)

> Of course, it'd also be great if the input structs could fit 64-bit integ=
ers, but that's probably not possible (and also doesn't help with devices t=
hat want to report e.g. 128-bit numbers).

For what it's worth, the variation I'm looking at now involves
handling the longer fields in an arbitrary number of 32-bit slices, so
it's not 64-bit specific on the hid-core side. Obviously it
(currently) needs to fit back through evdev, so that is the
bottleneck.

- Kenneth


- Kenneth
