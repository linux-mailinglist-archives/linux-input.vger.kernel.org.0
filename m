Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3E22FCF62
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 13:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbhATLYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 06:24:23 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38043 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730970AbhATKEX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 05:04:23 -0500
Received: from mail-lj1-f198.google.com ([209.85.208.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l2AKx-0002wW-F1
        for linux-input@vger.kernel.org; Wed, 20 Jan 2021 10:03:39 +0000
Received: by mail-lj1-f198.google.com with SMTP id j16so6389081ljb.9
        for <linux-input@vger.kernel.org>; Wed, 20 Jan 2021 02:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ohVJ0HRYhgdztW+nz1T2k3OrD7ph6b9HVx0qZkahvYg=;
        b=kRtUsAvzXDdCIuUKWBleFpG/1uV7tcxyki03LNLRQSSciIyYgMlLalz9jcR8dxmQfX
         xK59jExQC8mkTirQlh8rHjZryvUSWToMwxqoBJ0tIMh3D2qDRMnebidPh+7CmQ5ojtWx
         gs71UmugYXJWiURNXq4iP+jFOTx4xhWZzhcKgnm4xyw/mLkm7/l45EA5fWvA5ax5gpCv
         ubUTNQX9UG5LH1RlhD2eovk/a2Xfnxri8bGwCi5huy3aGewtGPfOzWBBKmo0ahUtsLSP
         O+K5rooWBu6XvVq5XHqv9j9w9wceq1Fver1MHpEZ1vGXO/dVV35jPe01bCKNBEkwvzfo
         BXWQ==
X-Gm-Message-State: AOAM5325BvWMFq2ADqyoCp5bibXexMHwaIuizucjkbwiwAi8CO/M2bLn
        dEBUGfe69/WzxR3V1V/UtMlBm10o7KsIrlJNUW5yETPPfWqZFITkwmhYkZKhb5taquJdM3iImYm
        VvUyQwpK27YbRL5Y2ytSqabc9bp1gfjKcuhQsLl3zKo616AojFVStaKlh
X-Received: by 2002:a05:651c:315:: with SMTP id a21mr4135831ljp.403.1611137018901;
        Wed, 20 Jan 2021 02:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUzdhs4rLnybp82M6lXCJDHLlJCd3OpIASD78lCMKYdopudjhdA8xpvtDOFQL2P+yjT4bQvPsCaH9DgK2N4Ds=
X-Received: by 2002:a05:651c:315:: with SMTP id a21mr4135819ljp.403.1611137018612;
 Wed, 20 Jan 2021 02:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20210118134523.178605-1-kai.heng.feng@canonical.com>
 <CAO-hwJ+29t8D1RkEh23=k_x4vOWwo3HvR_3GAA9M2pPNMaGLNQ@mail.gmail.com> <CAAd53p4JHX5R1KxSuz_PMsdJiZ85rnJR_LwG-RmgNs-0hKubrQ@mail.gmail.com>
In-Reply-To: <CAAd53p4JHX5R1KxSuz_PMsdJiZ85rnJR_LwG-RmgNs-0hKubrQ@mail.gmail.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Wed, 20 Jan 2021 18:03:27 +0800
Message-ID: <CAAd53p5-RPchCNZZd625z8=u9CUWK8i1DGCb10GcZie4RxyuXQ@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Apply MT_QUIRK_CONFIDENCE quirk for
 multi-input devices
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 19, 2021 at 1:45 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Hi,
>
> On Mon, Jan 18, 2021 at 10:41 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 18, 2021 at 2:45 PM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > Palm ejection stops working on some Elan and Synaptics touchpad after
> > > commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for
> > > some devices").
> > >
> > > The commit changes the mt_class from MT_CLS_WIN_8 to
> > > MT_CLS_WIN_8_FORCE_MULTI_INPUT, so MT_QUIRK_CONFIDENCE isn't applied
> > > anymore.
> > >
> > > So also apply the quirk since MT_CLS_WIN_8_FORCE_MULTI_INPUT is
> > > essentially MT_CLS_WIN_8.
> > >
> > > Fixes: 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for some devices")
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >
> > Thanks for the patch.
> >
> > IIt seems I was too lazy to write a regression test for it, and this
> > strikes back.
> > Can you also work on a regression test for this at
> > https://gitlab.freedesktop.org/libevdev/hid-tools ?
>
> Of course. I'll do it later this week. Currently I have both affected
> Elan and Synaptics touchpad in hand.
> Will this be a blocker of getting the patch merged?

I made a pull request:
https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/105

The tests don't pass for both Elan and Synaptics device, but let's fix it there.

Kai-Heng

>
> Kai-Heng
>
> >
> > Cheers,
> > Benjamin
> >
> >
> >
> >
> > > ---
> > >  drivers/hid/hid-multitouch.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > index 0743ef51d3b2..8429ebe7097e 100644
> > > --- a/drivers/hid/hid-multitouch.c
> > > +++ b/drivers/hid/hid-multitouch.c
> > > @@ -758,7 +758,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> > >                         MT_STORE_FIELD(inrange_state);
> > >                         return 1;
> > >                 case HID_DG_CONFIDENCE:
> > > -                       if (cls->name == MT_CLS_WIN_8 &&
> > > +                       if ((cls->name == MT_CLS_WIN_8 ||
> > > +                            cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
> > >                                 (field->application == HID_DG_TOUCHPAD ||
> > >                                  field->application == HID_DG_TOUCHSCREEN))
> > >                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> > > --
> > > 2.29.2
> > >
> >
