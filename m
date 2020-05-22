Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6370C1DEFC5
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 21:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgEVTLf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 15:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730840AbgEVTLf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 15:11:35 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D50AC061A0E
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 12:11:34 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id b28so4618657vsa.5
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 12:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cRUStbLQuNBIq84O8G7HtKAz8qd5QsQR+PxkzfeRbV4=;
        b=L3xJ9Nf/qcHV3m4AA0hc8i1ugImvC+PTcUEIauPTuzs1i+Cip9jfqbjNkmrrU6XpDz
         rEVsOEjk3PzGMUOz+EDUJcE05TiN3Dgm8UBHZ6rYk1eR9iKN4HPqC7iOkSnjYaAKm2mP
         UV9usDqFZXXQdX2u6Z+yxae67wxZ0D+tbaod17lz3+wjbrluauVuoBBw/7v362mFLrXH
         vfjokyyDFVkJS8TX3ha39HaZl7fyaDZM7ZuQDyZ4mTvr1B4d+GX3kJB+zgUshhqV2C3f
         71tuqXKdW7njGW2rUBKqTo0ziailwJFXMpmzhufUv1RHYX0tUFN069z4CppWWrHt3QzE
         cFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cRUStbLQuNBIq84O8G7HtKAz8qd5QsQR+PxkzfeRbV4=;
        b=lMVDXS3nnIWmb8iPtLOO6bye9gr6KKpy9A119kKegtIu74iKwUbk67Nt6i+wkjHDmp
         6wy5qFjtHSsRaJriD7xkW3XI1l+pIR52rJ1GP6AluT3PkWNslT1UGqOgD4hbz07xOwjG
         C9jgAsMvvZCg44n5gT75BtjylnOFapEobmL7z3g0J+0zBw8o8UFQJl7/iakywFjU68IQ
         x4krI+iIgRYY4WWYI4wq7ZUup5rOrGCAmxvi1UvllSQkSUus6SiCHkRx7m4+wXi3F1L+
         bWQG7ixVGY6DtqxzFpmwWxtOuK39P1Y7sOaAV4SRixinvrbsJzrhQYpUPYtVnGxs/iWN
         VuZA==
X-Gm-Message-State: AOAM533mjykIBy8plC1mO5lQoSvOvJXEzAvY4x/kNgfCUd2dErCQn6I+
        wFADJdvGRQnWH18RHxutv2tkvpvLO0lMk3AWEv4=
X-Google-Smtp-Source: ABdhPJwRkq1442ho7g9zJXhr/MTcLDON/YKyAQh6htCrKWcIETUplYMkfw7kr2u5kiQjAXtsaLxuW7IHZ/EnN/E9Pnk=
X-Received: by 2002:a05:6102:2429:: with SMTP id l9mr11413780vsi.88.1590174693309;
 Fri, 22 May 2020 12:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
 <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
 <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com> <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
In-Reply-To: <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Fri, 22 May 2020 14:11:22 -0500
Message-ID: <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,

Apologies for the late reply. This thread sneaked past me somehow. If
we want to handle clone controllers with partial protocol
implementations, is it preferable to present them identically to
userspace, with non-existent functionality being no-ops? Or would it
be better to just not create the interfaces for missing functionality
(e.g. not create the led_classdevs for controllers without LEDs)? I
assume the latter makes more sense, since it doesn't lie to userspace.
Though it could potentially make the driver code messier.

Thanks,
Daniel

On Mon, Apr 27, 2020 at 3:56 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Sun, 2020-04-26 at 15:31 -0700, Roderick Colenbrander wrote:
> > On Sun, Apr 26, 2020 at 2:14 PM Bastien Nocera <hadess@hadess.net>
> > wrote:
> > > On Sun, 2020-04-26 at 13:42 -0700, Roderick Colenbrander wrote:
> > > <snip>
> > > > I really wonder how a device like this should be handled. It
> > > > looks
> > > > like the device can also handle a bunch of other classic Nintendo
> > > > controllers.
> > > >
> > > > Is there anyway of detection this adapter? It feels nasty to have
> > > > to
> > > > hack in quirks for this device...
> > >
> > > The end game isn't very different from how we handle XBox 360, or
> > > PS3/PS4 "clone" devices.
> > >
> > > Those devices (the adapters) work on the actual Nintendo Switch
> > > hardware, so should probably work with the driver that handles the
> > > same
> > > type of hardware on Linux.
> > >
> >
> > (resend in plain text)
> >
> > I agree it probably makes sense to handle in this driver. I'm worried
> > about the application level implications. We have been doing a lot of
> > work e.g. on Android to try to make gamepads consistent. It is weird
> > to have a "Switch controller" with different features as applications
> > make assumptions and don't expect there to be multiple versions of a
> > particular controller. Any button mapping files would potentially be
> > wrong for those too, certain features are not there (e.g. no sensors
> > or no lights or rumble) or if they are the behaviour is different
> > (e.g. HD rumble vs a classic rumble motor).
> >
> > Ideally we would do some kind of "fixup" to change the device name
> > and
> > or replace the device ids to at least separate them.
>
> All those would be detectable at runtime. I'm not sure that it's ever a
> good idea to presume that a particular VID/PID combination will have,
> say, rumble and LEDs available when the driver can answer those
> questions.
>
> For example, I'm not sure that those controllers have either features
> (though I'm not certain they identify as Switch Pro controllers, but
> for the sake of argument):
> https://store.nintendo.com/super-nintendo-entertainment-system-controller.html
> https://store.nintendo.com/nintendo-entertainment-system-controllers.html
>
> Cheers
>


-- 
Daniel Ogorchock
