Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F933446590
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 16:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhKEPTh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 11:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbhKEPTh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 11:19:37 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69454C061714;
        Fri,  5 Nov 2021 08:16:57 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id o26so17702127uab.5;
        Fri, 05 Nov 2021 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W7Ej9nUPelbvcg8WsAGskNxrFmjjze1zHOKgYJgl9Yg=;
        b=HruQYqomszar0rWSAQkS/UJbSjf223BYbu2VidWlBtREhSvPDKJX369KX7L2W/eYWR
         TD9/tKwkZpoqSs3K2HcEIimuiFazZ8wFtrU4ie5j3LfXE2bJq0EbuaZctCUTx3aHmktN
         xJeBSDwTOU18Adx5zR4vIaqtlraXy+1W1Yalmfu2CgQn8myC7itrd0YwczJNIHoV99Bu
         xbiQNHNfFcsQQ+/wRmcejzPF1M+T+KhNMMQdLKWjf9lY7Uh2+vRMUXotDFLEBRSlJ3LN
         Gv59XMjL9GSwT03KbNqo0GIOf1E2wa+P4OHP1m15caL3JyCKto+3lwKuZ/HdUrzMMVRq
         dX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W7Ej9nUPelbvcg8WsAGskNxrFmjjze1zHOKgYJgl9Yg=;
        b=B7kwBX0dvRjo+sNK7v86gHTuoAEc/op5IK0bhbZHXcjDcWCDIlQBDVMUqId3LowN8M
         XuxMIKBDDPSXCdeRettW1z8MRU87HHL3mFhzINRPjB1yM88L/qJWopWwnF7dxKOpV4P5
         Ne8iuEUt8z4ViceyrV5XGrKwNWCuU15V67zitFezhcC8P9wHHa6t0TQh8eJ34TbboScS
         dVuorr1qV2YtzNJW1NBF8Ucqh4Kj88d/LOHNfq5RSHVnJk+HyfSD4YmUQze+6J00eo3h
         teCZG+F3M6J7ntBoSJyOD4SHQo1bY5WbsqT1AwBnMYWtIA87o9ZpMYx/KnUvCmANWCx3
         fm3g==
X-Gm-Message-State: AOAM5316I3Sk+bSmBb5i3xmfjKuWFDbVgG+cIi9UhEaF7a5PZGzI7OqC
        g1n2tkHTbUYEVLErlnwaKHKRVrsGgl8pzvewIHhyI8ON8DM=
X-Google-Smtp-Source: ABdhPJx9DNu2/5tu+S/ya7hNgORi6bcfJUZPT5AQ3hGeRR+XJ4RLI5C4SxhqBNqRRvhoSn20zCI/UnyrU1iMEz7r9eg=
X-Received: by 2002:a67:ed8c:: with SMTP id d12mr72198197vsp.45.1636125416361;
 Fri, 05 Nov 2021 08:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211008222327.9324-1-angiolucci@gmail.com> <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
In-Reply-To: <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
From:   =?UTF-8?Q?Vin=C3=ADcius_Reis?= <itsme.vreis@gmail.com>
Date:   Fri, 5 Nov 2021 12:16:45 -0300
Message-ID: <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com>
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

Em qui., 28 de out. de 2021 =C3=A0s 13:07, Dmitry Torokhov
<dmitry.torokhov@gmail.com> escreveu:
>
> Hi Vin=C3=ADcius,
>
> On Fri, Oct 8, 2021 at 3:24 PM Vin=C3=ADcius Angiolucci Reis
> <itsme.vreis@gmail.com> wrote:
> >
> > On Windows systems, ASUS laptops uses the "turn display off" key
> > (usually fn+f6) to turn both display and keyboard backlit off. On Linux
> > systems, this key has no effect at all since most desktop enviroments
> > don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
> > instead, would enable desktop environments to handle this key as a
> > screen lock intent from the user, out of the box.
>
> But is it the intent of the user? The fact that current desktop
> environments do not handle this key is not a reason to change kernel
> behavior.
>
> If screen lock is simply your preference then you can change the
> mapping via udev on your system without the need to patch the kernel.
>
> Thanks.
>
> --
> Dmitry

(Sorry, I'm sending this response again because it seems the first
attempt didn't make it to the mailing lists for some reason.)

Hi Dmitry,

I've picked up this particular key event because it would trigger a close
behavior to the one seen on Windows. It is far from being my preference,
which would be an exact mimic of the Windows behavior (and can be
achieved by xset dpms force on/off from user space).

The idea of this patch is to improve the user experience, by giving that ke=
y a
behavior as close as possible to what users might experience on Windows.
Because most Linux desktop environments also turn the display off after
locking the screen, this would be a good approximation to what happens on
Windows. I think it is more about giving (consistent) behavior to it
than changing it.

I agree it is possible to control that via udev or something else. But
most regular
users won't be able to do that, ending up with an unused key, though.
The hardcore user that would prefer a very different key behavior
could keep using
udev to do that.

So IMHO I think that setting this up on the kernel would be a good
approach in this case.

Thanks.

Vin=C3=ADcius
