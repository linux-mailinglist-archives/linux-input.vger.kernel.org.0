Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCEAA15481C
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 16:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgBFPbC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 10:31:02 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42856 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgBFPbC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 10:31:02 -0500
Received: by mail-qt1-f193.google.com with SMTP id j5so4764085qtq.9;
        Thu, 06 Feb 2020 07:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJIsnWtJ6n2evNGIpW9qH/hDzRO+9AreswAO5JLIKDM=;
        b=MWUru7EMpNINpFI2Kbou9inh2DohBOzojX5+OMJKMxaW2r8itjO0s36gd3ACqLwyU3
         hLIdaZWbtz5nNkCjE9ZhGPpsjluBWJDWJAIr1la9Fxzbk6k5xw/lre0Xmd7AVhdveCgH
         w0PuD5zBzeI8Wl8Dr/iif4VedjNmgy3LviMTcOHiheRNB1FeAny9mMNrdYOShLUx1euw
         Yw7x4gVgVj/vcsQ3oo7rzMkH5yROoBG+4m38qQRTXYRfhkcEstkp1a92uh0VArmNzTrW
         YAJ6ul2Eyvu07/2s1JkyH7PGYqtlY/94uOIWkbQFAJSPA5Yje6Po07oRJZWAzoJ2wsJH
         ugOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJIsnWtJ6n2evNGIpW9qH/hDzRO+9AreswAO5JLIKDM=;
        b=RRYMwzP4EvJRFESz9u/2mCbr7YGGHztyaym23Mc5CalPkSwlURO97ykPj8sS2QIYZs
         uVfga6SZ+VsPGT+cVsBfINSVJPgVzD85HH8ZAWE03AGJ2A1CBAOWKlqpWuJuRd5yUOLj
         x1d5idNQIjZjC9SmUNHYq6vxVB6YOhWGMo5R0p+z6T0UPjVzJlqNLD69Q6LUYPy7T4QY
         0Bdl5VU+vTosLIZy3tk11h3h4RCFUPyEa3dh6nz4BmeORApnWno6/Pxcasg9L7+6IWHh
         CJorTwJsTapi69xbh2EUxcMbAWV7HPdvNDIPezp8RdDa+EsBNo/YG72RcEaO/53DGrzp
         Jp6g==
X-Gm-Message-State: APjAAAXLNxvGQP1lCjv5zWs1jcqP0dwFYTmbS6EMBW2DFXnmwRc9k7Cb
        bZGlF6gqcaCB32HnliQ+QJgikk0hASD+QXeMwfo=
X-Google-Smtp-Source: APXvYqwVxU0jT2a+ihuCOqkMwiMwEf4kdq9gMTFUcT6Vwkd2kC5V5fzZ/S71M+n4aJujEVTGsfU0KXwnAy4uvDaUeCc=
X-Received: by 2002:ac8:70d5:: with SMTP id g21mr3073886qtp.46.1581003060838;
 Thu, 06 Feb 2020 07:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
 <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
 <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm> <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
 <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm> <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
In-Reply-To: <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 6 Feb 2020 07:30:49 -0800
Message-ID: <CAEc3jaDC5ddBPDy_Z96eZs-VZQ3051LVAb91-U_Oce9jj1wk8Q@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 6, 2020 at 12:10 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> On Mon, Feb 3, 2020 at 12:23 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Mon, 3 Feb 2020, Benjamin Tissoires wrote:
> >
> > > I am definitely not in favour of that :(
> > >
> > > The basic problem we have here is that some vendors are overriding your
> > > VID/PIDs, and this is nasty. And I do not see any reasons why you can't
> > > say: "well, we broke it, sorry, but we only support *our* devices, not
> > > third party ones".
> >
> > Well, it's not about "we broke it" in the first place, as far as I
> > can tell.
> >
> > Roderick's concern is that 3rd party devices with overriden VID/PID
> > malfunction for completely unrelated reason to (correctly working) changes
> > done in favor of stock Sony devices, but it'll be Sony receiving all the
> > reports/blame.
>
> After re-reading the code, I am not sure we can easily detect the
> clones. So at some point, I think we will break them, but there is not
> much we can do. I don't really have a solution for that :(
>
> >
> > > One thing that comes to my mind (probably not the best solution), is to
> > > taint the kernel if you are facing a non genuine product. We do that for
> > > nvidia, and basically, we can say: "well, supporting the nvidia blob is
> > > done on a best effort case, and see with them directly if you have an
> > > issue". Tainting the kernel is a little bit rough, but maybe adding an
> > > info message in the dmesg if you detect one of those can lead to a
> > > situation were we can count on you for supporting the official products,
> > > and you can get community support for the clones.
> >
> > Yeah; which I wouldn't like to do for upstream kernel, but Sony could
> > definitely do this for the products they ship.
> >
> > The same way distros are tainting their kernels when unsupported modules
> > (but otherwise perfectly fine wrt. GPL and everything else) are loaded
> > into distro-supported kernels.
> >
> > > One last thing. Roderick, I am not sure if I mentioned that or not, but
> > > I am heavily adding regression tests for HID in
> > > https://gitlab.freedesktop.org/libevdev/hid-tools/
> >
> > ... and words can't express how thankful I am for that :)
> >
>
> OK, I played with that idea earlier this week:
> https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/74
> I only have a Sixaxis controller, and I only implemented the USB part
> of it (AFAICT).
> Currently this ensures the button mapping is correct, and that the
> LEDs are working properly.
> We are still missing a few bits and pieces, but the initialization
> (requests made by the kernel to start the device and press on the PS
> button) is handled properly.
>
> If this is something Roderick would be interested in, we can then try
> to extend this initial work on Bluetooth controllers and the DualShock
> ones.

We can probably help out there (need to ask official permission). We
have similar tests in Android (still adding more). Just in case you
are not familiar this is their framework:
https://android.googlesource.com/platform/cts/+/master/tests/tests/hardware/src/android/hardware/input/cts/tests/

It is a small Java class and then there is a json blob with the actual
test (forgot where the json is). It defines the report descriptors
etcetera.

Thanks,
Roderick

> Adding the clones ones based on the current kernel code is something
> doable, but I do not expect Sony to be involved in that process.
>
> That being said, before we merge this particular patch about Gasia
> controllers, now we need to implement a regression test first :)
>
> Cheers,
> Benjamin
>
