Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED556153FC7
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 09:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgBFIKL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 03:10:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47085 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727572AbgBFIKK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 03:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580976609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pNqlj/aIPtqooHVrOVDSEY2d6+X7P8FExh0I8Cp7N+M=;
        b=DqT3ekhuO8d5zQ2rjl9vTdVuI3L0N/t0+guUmieHOX6J14sGHJ/BNbrMUuMXLnCixpEYSI
        Y5LIjng9FfxCyYUOAhOSaeVZjhNlWio+N3/wrAg0MK5tj6dRoO87sac87BKXrImxQVn2o6
        Fh6l+9PY3kMzWQiVUDEUCo6IHEhpZ1s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-72UUtbpPMr2QpMxgx7QNtA-1; Thu, 06 Feb 2020 03:10:04 -0500
X-MC-Unique: 72UUtbpPMr2QpMxgx7QNtA-1
Received: by mail-qt1-f197.google.com with SMTP id c8so3273110qte.22
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 00:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNqlj/aIPtqooHVrOVDSEY2d6+X7P8FExh0I8Cp7N+M=;
        b=WdYIaUPMhcv9Dpq/xfbeuoF4cPXC7nrXm4YUnKzjNyH3l7E3VYjFYKiny4kpO++pWa
         CxY7aWvdcQQo5Q9Eb6B1lxz0ycNftUYFsYkiHrEPmKbJq1qZowVYTKl4j1Ql1J5gfNjp
         Jjzxwjx7WTZSq16d8I6dQPzMjE07X/xPXwoECGtBOrzAfSaegjmHqE0ZJ7QTAREmMsri
         oTyzwPAfk07VBDSG0mxc5lXZAQoXPKLD0vJuZdIpBPcneE3b88DlyrLwxfmX8aNxSBUZ
         zfPFAKOzlpLan5MCkQdqwYx44e3Mgg6Zud+itLlCdf1ldk3rNZrcblTWZl6d5XWlkxAK
         VMZQ==
X-Gm-Message-State: APjAAAVpYEDXaxdchhj87hVlx8bgIXHsU6y761tyEdyIhuNtr8Pw6sly
        cVIpMujuZ5W9RG83Oik8lJ81s+50NcFhS8a/EoagdY4kf2/bjgs1+ovR9a1BDatXOXatI6G8D12
        qyDiButFK/C7vqCFH57x4MOOT82qhgojpAcsUjRo=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr1392217qkg.27.1580976604392;
        Thu, 06 Feb 2020 00:10:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyF+uGZ8Ea+EIqllofbuMHnsKLrT5VS1cxbxgTen+ILjpjQqajo5Rbpeqqd2pOVLfnRIYnnbagS1R64wN2XaTQ=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr1392204qkg.27.1580976604136;
 Thu, 06 Feb 2020 00:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
 <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
 <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm> <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
 <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 6 Feb 2020 09:09:53 +0100
Message-ID: <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 12:23 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 3 Feb 2020, Benjamin Tissoires wrote:
>
> > I am definitely not in favour of that :(
> >
> > The basic problem we have here is that some vendors are overriding your
> > VID/PIDs, and this is nasty. And I do not see any reasons why you can't
> > say: "well, we broke it, sorry, but we only support *our* devices, not
> > third party ones".
>
> Well, it's not about "we broke it" in the first place, as far as I
> can tell.
>
> Roderick's concern is that 3rd party devices with overriden VID/PID
> malfunction for completely unrelated reason to (correctly working) changes
> done in favor of stock Sony devices, but it'll be Sony receiving all the
> reports/blame.

After re-reading the code, I am not sure we can easily detect the
clones. So at some point, I think we will break them, but there is not
much we can do. I don't really have a solution for that :(

>
> > One thing that comes to my mind (probably not the best solution), is to
> > taint the kernel if you are facing a non genuine product. We do that for
> > nvidia, and basically, we can say: "well, supporting the nvidia blob is
> > done on a best effort case, and see with them directly if you have an
> > issue". Tainting the kernel is a little bit rough, but maybe adding an
> > info message in the dmesg if you detect one of those can lead to a
> > situation were we can count on you for supporting the official products,
> > and you can get community support for the clones.
>
> Yeah; which I wouldn't like to do for upstream kernel, but Sony could
> definitely do this for the products they ship.
>
> The same way distros are tainting their kernels when unsupported modules
> (but otherwise perfectly fine wrt. GPL and everything else) are loaded
> into distro-supported kernels.
>
> > One last thing. Roderick, I am not sure if I mentioned that or not, but
> > I am heavily adding regression tests for HID in
> > https://gitlab.freedesktop.org/libevdev/hid-tools/
>
> ... and words can't express how thankful I am for that :)
>

OK, I played with that idea earlier this week:
https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/74
I only have a Sixaxis controller, and I only implemented the USB part
of it (AFAICT).
Currently this ensures the button mapping is correct, and that the
LEDs are working properly.
We are still missing a few bits and pieces, but the initialization
(requests made by the kernel to start the device and press on the PS
button) is handled properly.

If this is something Roderick would be interested in, we can then try
to extend this initial work on Bluetooth controllers and the DualShock
ones.
Adding the clones ones based on the current kernel code is something
doable, but I do not expect Sony to be involved in that process.

That being said, before we merge this particular patch about Gasia
controllers, now we need to implement a regression test first :)

Cheers,
Benjamin

