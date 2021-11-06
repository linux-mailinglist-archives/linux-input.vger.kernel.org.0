Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E1E447100
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 00:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhKFXvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Nov 2021 19:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhKFXvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Nov 2021 19:51:22 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5C2C061570;
        Sat,  6 Nov 2021 16:48:40 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id p22so4682516vke.7;
        Sat, 06 Nov 2021 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tu9T2J9TAcoCDpx4Vd+FJ/FqlL4Rlpy89On20h1Qvh4=;
        b=qDWZ9tC9zWVNwcgx+rxlqo0t09MAo2a0wunmk+MOO65UfkkManF13w+7484U5zKjyI
         yHkdYFHIMW5ymUbyg6GToFcV68LdTL3f5hkViAL9N6dgXCHTSmzmT+B+gmf/u2765Jbu
         A4r1BZgby7JUfDLzO0/Gop6JpcS+JaNK1zcd3eHPGQ3vogrEzx0H6GkQOMo4MMzaBXA6
         ADnHBHb+V0GP2rwRWI0QgQtfUzpy3LGFPg/4I1ZDxnxMUuA2KXZsyiyWGAUxNl9uVDDo
         QckKHxhc2LvuLJJbG2ThVF5+fOU1k4s5vL76XBcoUInXk1mLkcuA7BDEeJeODHyPsu9l
         SVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Tu9T2J9TAcoCDpx4Vd+FJ/FqlL4Rlpy89On20h1Qvh4=;
        b=C7tsxlFv4huwKFthSOWx0B7c7IJOftcQrilXfp4r95Yy0QDuXXTDb4RxWcLyMKerSJ
         X4oGaDqDKvscTwCzIBz3+cANsOgltzSbeM9CCQ5eW3rVp848p1eInbYN/R8JXXwI7hlk
         9IZZSiclcX3mPDtapR7Eee5lxe+VgFWG3lGD0J7o1PQL4m0/7xV6ScB5rJVwuu9zdeUz
         tnp53BtQfg1oK+3/cY5+AD1fOdK/whTpDb6g4Sve3M3C/J54FRfZCaLHbnvy8n1p8Yn6
         JHqnOjqXhS9IOUh4ylKgWjab04UYmpcBLjwWfnwliNjdm8T2Wll9xpr3PWngak+v0n6b
         Q8vw==
X-Gm-Message-State: AOAM531Mhg639VK+UAcR+vgMKyoOeI8HSO/wRmpulXK4KN6Opkg58JVf
        cn1HoDXEEf64iCRhD8zpu5HqbHqJupnsYLD3R86s5d9BfVk=
X-Google-Smtp-Source: ABdhPJxhgETgFOtWD0ABWXXRK2qi15hKfcB4EWicQZkRdQiTIO2645oT6I+62pCB0IxAp4PdNalbsKwknhiW/6eTTyM=
X-Received: by 2002:a1f:b697:: with SMTP id g145mr83862543vkf.1.1636242519785;
 Sat, 06 Nov 2021 16:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211008222327.9324-1-angiolucci@gmail.com> <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
 <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com> <YYWoRW9NRC58zQ9w@google.com>
In-Reply-To: <YYWoRW9NRC58zQ9w@google.com>
From:   =?UTF-8?Q?Vin=C3=ADcius_Reis?= <itsme.vreis@gmail.com>
Date:   Sat, 6 Nov 2021 20:48:29 -0300
Message-ID: <CALawNGBookRkFSGdGJrW1hboJ8kpsPj_rwAkNXQ3mU32oDv-sA@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to KEY_SCREENLOCK
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Em sex., 5 de nov. de 2021 =C3=A0s 18:55, Dmitry Torokhov
<dmitry.torokhov@gmail.com> escreveu:
>
> On Fri, Nov 05, 2021 at 12:16:45PM -0300, Vin=C3=ADcius Reis wrote:
> > Em qui., 28 de out. de 2021 =C3=A0s 13:07, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> escreveu:
> > >
> > > Hi Vin=C3=ADcius,
> > >
> > > On Fri, Oct 8, 2021 at 3:24 PM Vin=C3=ADcius Angiolucci Reis
> > > <itsme.vreis@gmail.com> wrote:
> > > >
> > > > On Windows systems, ASUS laptops uses the "turn display off" key
> > > > (usually fn+f6) to turn both display and keyboard backlit off. On L=
inux
> > > > systems, this key has no effect at all since most desktop enviromen=
ts
> > > > don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
> > > > instead, would enable desktop environments to handle this key as a
> > > > screen lock intent from the user, out of the box.
> > >
> > > But is it the intent of the user? The fact that current desktop
> > > environments do not handle this key is not a reason to change kernel
> > > behavior.
> > >
> > > If screen lock is simply your preference then you can change the
> > > mapping via udev on your system without the need to patch the kernel.
> > >
> > > Thanks.
> > >
> > > --
> > > Dmitry
> >
> > (Sorry, I'm sending this response again because it seems the first
> > attempt didn't make it to the mailing lists for some reason.)
> >
> > Hi Dmitry,
> >
> > I've picked up this particular key event because it would trigger a clo=
se
> > behavior to the one seen on Windows. It is far from being my preference=
,
> > which would be an exact mimic of the Windows behavior (and can be
> > achieved by xset dpms force on/off from user space).
> >
> > The idea of this patch is to improve the user experience, by giving tha=
t key a
> > behavior as close as possible to what users might experience on Windows=
.
> > Because most Linux desktop environments also turn the display off after
> > locking the screen, this would be a good approximation to what happens =
on
> > Windows. I think it is more about giving (consistent) behavior to it
> > than changing it.
> >
> > I agree it is possible to control that via udev or something else. But
> > most regular
> > users won't be able to do that, ending up with an unused key, though.
> > The hardcore user that would prefer a very different key behavior
> > could keep using
> > udev to do that.
> >
> > So IMHO I think that setting this up on the kernel would be a good
> > approach in this case.
>
> I am sorry, I disagree. I understand that patching the kernel might be
> easier than implementing new shortcut/behavior in various desktop
> environments, but that does not make it the right approach.
>
> Thanks.
>
> --
> Dmitry

Hi Dmitry,

Thanks for explaining this a little bit more, I've got the point: The curre=
nt
key code triggered by the kernel is correct, the real issue is the lack of
support for that particular code by current desktop environments.

I'm new to contributing to the Linux kernel; the proper way to rollback
this would be by me just sending a revert patch to the respective
maintainer?

Thank you,
Vin=C3=ADcius.
