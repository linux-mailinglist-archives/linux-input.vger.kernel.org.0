Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA70F3CFEFA
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 18:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhGTPcy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 11:32:54 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:47062 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236233AbhGTPai (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 11:30:38 -0400
Received: by mail-vk1-f173.google.com with SMTP id bc26so4643948vkb.13
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ec0bN+F2FYcAgixe06akg3xYKmKZd2jngWxTSS45B8I=;
        b=WGBcU9P0qQ49uNJ6iccFbQk6nSstw1hhIRMiRCTKNLg5+moD8FWQSfrLatHJrXdgSB
         S/SYBQcvNABDjqakTw3UjK7sLHBVUnCdpqR0tEYKuPScb2j0ySE/XnxtIOzR4+0aycqK
         Jiw54aWMK09rjOsj5RD3Ri7ksN5cpNrWrjXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ec0bN+F2FYcAgixe06akg3xYKmKZd2jngWxTSS45B8I=;
        b=QWZLFKhfJrPY6yHkv4UjXAdNzQtA3jSeEeIYAxQAsiKf1U+GMFy7ibBOLZN0ST6uYF
         tZVMGgw6YZETrXK1hUrcFBThtXaPfEZ7S/FZSPmYjylvdnDJPOzX/4zI16wNwmQ8lQsx
         juIBs3/sOWFQGwKI/196AVBNbjozzI9BW7XBjYTWQcmCnxHgCUtnCr5Fbsy19+qxK/kP
         gAa2vXAxO/EzboT+Y/9qm6u2k9g1hqqt1fByzyf43DynaV0RXJ1ZLTGP+8QPq2xDUITU
         xFTv/lHOWiLK+Eajb1WgPO+IilifvLVvktvjgHhVkD1Ugi0b/TSaQLrc18Sr1CI99+Ky
         LRPQ==
X-Gm-Message-State: AOAM532DdBqcI39KrOTXXyzPjnK/pRe10BEbEOHFmtgKFk4P0GkgCyGj
        j0Ay7OsarOV08g/Vg+Pix43Xa1VaSdI6xQ==
X-Google-Smtp-Source: ABdhPJzTW/1UBwgyPLbhNYkmkmQScFlDeDo3G0gs3sP611RQ68bih8lRSkBB9LrNVALFRjMHGHHeCg==
X-Received: by 2002:a1f:8f4f:: with SMTP id r76mr16160334vkd.8.1626797412887;
        Tue, 20 Jul 2021 09:10:12 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id x85sm2782563vsx.10.2021.07.20.09.10.11
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 09:10:12 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id h5so11490380vsg.12
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 09:10:11 -0700 (PDT)
X-Received: by 2002:a67:c986:: with SMTP id y6mr29636747vsk.52.1626797410875;
 Tue, 20 Jul 2021 09:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
 <nycvar.YFH.7.76.2107152150060.8253@cbobk.fhfr.pm> <CAO-hwJJp-qg0pRZNk1PKhha6S=Zd2_r1UDjZUgm9Yq0MFL69MQ@mail.gmail.com>
In-Reply-To: <CAO-hwJJp-qg0pRZNk1PKhha6S=Zd2_r1UDjZUgm9Yq0MFL69MQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 20 Jul 2021 09:09:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U980_xkfMt-x9cv6LgyK0qfRt81HYEtu_sW3c+PqFN9A@mail.gmail.com>
Message-ID: <CAD=FV=U980_xkfMt-x9cv6LgyK0qfRt81HYEtu_sW3c+PqFN9A@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: goodix: Tie the reset line to true state
 of the regulator
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Jul 20, 2021 at 1:01 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Thu, Jul 15, 2021 at 9:50 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Fri, 25 Jun 2021, Douglas Anderson wrote:
> >
> > > The regulator for the touchscreen could be:
> > > * A dedicated regulator just for the touchscreen.
> > > * A regulator shared with something else in the system.
> > > * An always-on regulator.
> > >
> > > How we want the "reset" line to behave depends a bit on which of those
> > > three cases we're in. Currently the code is written with the
> > > assumption that it has a dedicated regulator, but that's not really
> > > guaranteed to be the case.
> > >
> > > The problem we run into is that if we leave the touchscreen powered on
> > > (because someone else is requesting the regulator or it's an always-on
> > > regulator) and we assert reset then we apparently burn an extra 67 mW
> > > of power. That's not great.
> > >
> > > Let's instead tie the control of the reset line to the true state of
> > > the regulator as reported by regulator notifiers. If we have an
> > > always-on regulator our notifier will never be called. If we have a
> > > shared regulator then our notifier will be called when the touchscreen
> > > is truly turned on or truly turned off.
> > >
> > > Using notifiers like this nicely handles all the cases without
> > > resorting to hacks like pretending that there is no "reset" GPIO if we
> > > have an always-on regulator.
> > >
> > > NOTE: if the regulator is on a shared line it's still possible that
> > > things could be a little off. Specifically, this case is not handled
> > > even after this patch:
> > > 1. Suspend goodix (send "sleep", goodix stops requesting regulator on)
> > > 2. Other regulator user turns off (regulator fully turns off).
> > > 3. Goodix driver gets notified and asserts reset.
> > > 4. Other regulator user turns on.
> > > 5. Goodix driver gets notified and deasserts reset.
> > > 6. Nobody resumes goodix.
> > >
> > > With that set of steps we'll have reset deasserted but we will have
> > > lost the results of the I2C_HID_PWR_SLEEP from the suspend path. That
> > > means we might be in higher power than we could be even if the goodix
> > > driver thinks things are suspended. Presumably, however, we're still
> > > in better shape than if we were asserting "reset" the whole time. If
> > > somehow the above situation is actually affecting someone and we want
> > > to do better we can deal with it when we have a real use case.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Applied, thanks Doug.
>
> Thanks Jiri for taking this one in.
>
> FWIW, I am really glad Doug made the effort of splitting i2c-hid-core
> and i2c-hid-goodix, because this is the kind of patch that would have
> been a nightmare to make it generic :)

Yeah, it was a bunch of work to split it but I think it worked out
pretty well overall. :-)

Looking at this patch today with fresh eyes, I just spotted a bug
though! :( I should have used the "devm" variant of
regulator_register_notifier() since otherwise nothing is
unregistering. Oops. I'll quickly send a fixup.

OK, it's should show up here:

https://lore.kernel.org/r/20210720090736.1.Idc6db7d0f2c2ecc6e533e5b918a651a66f337b2f@changeid

-Doug
