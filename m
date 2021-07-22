Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB53D1F61
	for <lists+linux-input@lfdr.de>; Thu, 22 Jul 2021 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGVHOl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jul 2021 03:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhGVHOl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jul 2021 03:14:41 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA450C061575
        for <linux-input@vger.kernel.org>; Thu, 22 Jul 2021 00:55:15 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id g8so3698872qtj.1
        for <linux-input@vger.kernel.org>; Thu, 22 Jul 2021 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppc4L7qqzJv1XPqEuG0fVsRJ1gOn3vM2LL5L40u/AQc=;
        b=aVwN7LGM13DdxTsXZACka+il/JqsaMJDK3NFNcHYu08jLLfBXHhb8GJbDDFxJicNpj
         CYyejIHNwuCFAmPYOmV59M+dOTiuqq33Yzn+H6hKehb5qY+kn+GHJdodlciPhEzQCS1R
         cxUxjgW1HMn6KFgXDCKMkIeiEuT7Crzed2xSNg3L4ttxxPZGarLndoakaKRSrrn3BZNR
         VQ5aBSkuEpOQYI/H/Ctorhp/tK1uMxyl9Kkc0YjgfKQB3pqyyoarajNWioP/cENpYvy0
         OKM6x2OCMlTeTYAtCmyFuTv6ALg7yKyaholJhAMivIqvhTrW+FQMgTWbrBGp70GL9s+M
         Ch9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppc4L7qqzJv1XPqEuG0fVsRJ1gOn3vM2LL5L40u/AQc=;
        b=YBl7rauw7gshaNnctFGemXl8ho2uXwoNEVoOcag+6Qn/P05GzvkAuijD9bQxm+Ltfy
         VSfH2BZoyYlj2R0ZIGFa3ze+G28oQmMWkS5/iwUYkvYfKOYAELlEOOhGXuy8avwZUr0T
         3U73QKGUvMarRPGI38gnhy35bqCHkLhAQ5OHlNC3T/VC2SSin3F0ZF8dktIQItnEwC/S
         yBVLScyI0mLr5fyMMabv00KZBhXn/gNi8t46XugFLkhNgL7zn9ziFU/jWaNIF/pocsWy
         GkdtIb7HLA4auQakbykPUmV1QQ8Wav46pLSihDa9s7DnbZP2uPUyWZlcvONaaVBRttYi
         QNpg==
X-Gm-Message-State: AOAM532fnvo65MiWkF7Q1h+g6WmkXJOIlsw8sTzvstXYHjFA8t3pswio
        UlNIOBItJSOsxTSPoA/rsw4VCskDfQvLgGJIVTk=
X-Google-Smtp-Source: ABdhPJymzMTgVZ3PcXI9/OqGrxgGTdQC3vXECSEEyZ60XAFqtzgBNZgCegFW4piEN0ny2D+JyyiFM4ZDrNkhBNqW4X4=
X-Received: by 2002:ac8:7fc2:: with SMTP id b2mr22192749qtk.59.1626940514919;
 Thu, 22 Jul 2021 00:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
 <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
 <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
 <CAKdAkRT=O5f7=bCOKUea0LDQnEUtV8Mu0yMbQNTcoB+7Q_3GNA@mail.gmail.com>
 <578761643e8a040fc1952ed1701371be15cb267a.camel@webspeed.dk>
 <8ea9fed2bbe1c1e23afa3103177511c9501ee580.camel@webspeed.dk> <CAKdAkRQ5N-Sk6=ddXHpj_wUkiDs1xUe6ZzePhHqg9sg3Xe0Gaw@mail.gmail.com>
In-Reply-To: <CAKdAkRQ5N-Sk6=ddXHpj_wUkiDs1xUe6ZzePhHqg9sg3Xe0Gaw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Thu, 22 Jul 2021 09:55:04 +0200
Message-ID: <CAN+gG=FrMYzohpc1QVGPK1mKgX=x8WDzgWQsgYHKSa6AYkQr5A@mail.gmail.com>
Subject: Re: Elantech touchpad not working on mainline kernels
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans Schultz <hans.schultz@webspeed.dk>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 21, 2021 at 10:42 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Jul 21, 2021 at 12:53 PM Hans Schultz <hans.schultz@webspeed.dk> wrote:
> >
> > On Wed, 2021-07-21 at 21:31 +0200, Hans Schultz wrote:
> > > Hi Dmitry,
> > >
> > > On Wed, 2021-07-21 at 12:14 -0700, Dmitry Torokhov wrote:
> > > > On Wed, Jul 21, 2021 at 11:09 AM Hans Schultz <
> > > > hans.schultz@webspeed.dk> wrote:
> > > > >
> > > > > On Wed, 2021-07-21 at 10:48 -0700, Dmitry Torokhov wrote:
> > > > > > Hi Hans,
> > > > > >
> > > > > > On Sun, May 30, 2021 at 2:12 AM Hans Schultz <
> > > > > > hans.schultz@webspeed.dk> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > > I have a problem getting my Elantech touchpad to work with
> > > > > > > the
> > > > > > > mainline
> > > > > > > kernels, and I need some assistance with the code to resolve
> > > > > > > the
> > > > > > > problem.
> > > > > > > The kernels that have tried are 5.9.11 and 5.11.11.
> > > > > > >
> > > > > > > With boot parameters i8042.notimeout i8042.nomux, the
> > > > > > > touchpad is
> > > > > > > detected but does not work. There is absolutely no response
> > > > > > > from
> > > > > > > it
> > > > > > > with any hid modules loaded.
> > > > > > >
> > > > > > > It is reported and seen working on a Lubuntu distro (bionic
> > > > > > > kernel)
> > > > > > > when inserting the i2c_hid module. The insertion of the
> > > > > > > i2c_hid
> > > > > > > module
> > > > > > > pulls in the hid_multitouch module when it works, no boot
> > > > > > > parameters
> > > > > > > necessary.
> > > > > > > In the case where it does not work, insering the i2c_hid
> > > > > > > module
> > > > > > > does
> > > > > > > not pull in the hid_multitouch module.
> > > > > > >
> > > > > > > I have the bionic kernel code, but I have not as of yet been
> > > > > > > able
> > > > > > > to
> > > > > > > detect what makes it work in contrast to the kernel.org
> > > > > > > kernels.
> > > > > > >
> > > > > > > This I think should lead to a kernel patch.
> > > > > >
> > > > > > There is not much to go on with. What is the hardware, your
> > > > > > kernel
> > > > > > .config, dmesg from unsuccessful boot? If you have logs from
> > > > > > the
> > > > > > working kernel that would help too.
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > >
> > > > > The best info I have on the hardware is from Xorg log with the
> > > > > working
> > > > > Lubuntu kernel:
> > > > > [ 130.980] (II) Loading
> > > > > /usr/lib/xorg/modules/input/synaptics_drv.so
> > > > > [ 130.982] (II) Module synaptics: vendor="X.Org Foundation"
> > > > > [ 130.982] (II) Using input driver 'synaptics' for '0X45 0X4C
> > > > > 0X41
> > > > > 0:00
> > > > > 04F3:308C Touchpad'
> > > > >
> > > > > I might be able to get the kernel messages when inserting the
> > > > > working
> > > > > module, but I think it will not tell much more.
> > > >
> > > > OK, if you say so. Then the only suggestion I have is to verify
> > > > that
> > > > your kernel config enables all necessary options for your hardware.
> > > > I'd double check if you have Designware I2C controller enabled,
> > > > ACPI
> > > > LPSS, etc.
> > > >
> > > > > To me it is clearly a code issue as the working kernel pulls in
> > > > > hid_multitouch when inserting i2c_hid, while the non-working does
> > > > > not.
> > > > >
> > > > > All kernels I have tried up to now from kernel.org do not work.
> > > > > The
> > > > > latest being 5.13.4.
> > > >
> > > > Thanks.
> > > >
> > >
> > > I have a thread with all the dmesg info for both the working and non-
> > > working cases here :
> > > https://gitlab.freedesktop.org/libinput/libinput/-/issues/544
> > >
> > > Benjamin has also asked for the acpidump info, which is there. (funny
> > > as the responses to my problem come at the same time after a long
> > > time.
> > > :-) )
> > >
> > > I will check my .config...
> > >
> > > Thanks,
> > > Hans
> >
> > Here are my I2C kernel settings. I only added what I could see as with
> > Intel hw, so no Designware!
>
> However if you consult the dmesg from the working kernel you will observe:
>
> [   79.964148] input: 0X45 0X4C 0X41 0:00 04F3:308C Mouse as
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-8/i2c-0X45 0X4C
> 0X41 0:00/0018:04F3:308C.0002/input/input24
> [   79.964222] input: 0X45 0X4C 0X41 0:00 04F3:308C Touchpad as
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-8/i2c-0X45 0X4C
> 0X41 0:00/0018:04F3:308C.0002/input/input26
>
> so it clearly uses designware-compatible IP block even though it is an
> Intel system.

FWIW, I think Intel platform *always* rely on designware for the I2C
adapter implementation. So if you haven't enabled that driver there is
no chance for you to have a working touchpad.

Cheers,
Benjamin

>
> Can you try grabbing config from the working kernel and use it if you
> want to compile your own? There are a lot of hardware dependencies in
> modern systems that may not be immediately obvious.
>
> Thanks.
>
> --
> Dmitry
