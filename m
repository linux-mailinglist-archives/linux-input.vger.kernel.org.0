Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E882FA7F5
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 18:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407197AbhARRvP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 12:51:15 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59661 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436649AbhARRqo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 12:46:44 -0500
Received: from mail-lf1-f69.google.com ([209.85.167.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l1Yb0-0004aL-Rw
        for linux-input@vger.kernel.org; Mon, 18 Jan 2021 17:45:53 +0000
Received: by mail-lf1-f69.google.com with SMTP id j70so6886171lfj.11
        for <linux-input@vger.kernel.org>; Mon, 18 Jan 2021 09:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ooFCSpxNJTp9XtUwL6uKTwDWwzCSip4jz+DezusF5A=;
        b=BBtLNK9xwT1CsVTa8+jl7U/LdKjfeZ4TLoIxbW4cYSBB1ezBqmMO7WWg9hudniKeuT
         aFqim4w5FgtS92CdpzIPbRKhhfWTw/43HuDo7IygVsuED5kdriNwftZ39qDc+ZpAawdA
         qDHPLpJXALDLX1FZJ0/9oyfdj9MWRtibfdei76ThyJmm8IPEbkbjLBYu/S0T/5UlvKFH
         DGcymT78hacvlrbmlOzwh+FJVYSI41FqJ0L1yHMdIS1uR3hCIKbmjVPNfwqj3Q/KKcuD
         7e3FArJzA9bdh0pBgxzuqTHzha5EmgSwzESAUrVacdofI2CIlQVaAJ3CFkoadnf0WmQx
         REqg==
X-Gm-Message-State: AOAM533xxsBb4wY9MEYoXdU+y0BT5LFk44SNKTwJ1EkP54vn+JRkPS9H
        OhjdhOpn+3Q7UH4oBjcegHWKc8JJ/U6DteBELb+ISAo2Y8KLagPVP3CE25E5kAIvUAQ68E73koD
        nThw4pRKn6CQYfRB2RzLl4u/XOv4fZ6/0RhhsAtYfmO6S2qNFSqny0u0K
X-Received: by 2002:ac2:561b:: with SMTP id v27mr96327lfd.425.1610991942362;
        Mon, 18 Jan 2021 09:45:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuGUEvNmZZQTHUk/701mXMBvtSTVf4z3qsKQY/HZdODD33tzB7RECpncnDEPw+84K5lE4EfDpC8UXPo4rOcIs=
X-Received: by 2002:ac2:561b:: with SMTP id v27mr96320lfd.425.1610991942149;
 Mon, 18 Jan 2021 09:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20210118134523.178605-1-kai.heng.feng@canonical.com> <CAO-hwJ+29t8D1RkEh23=k_x4vOWwo3HvR_3GAA9M2pPNMaGLNQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+29t8D1RkEh23=k_x4vOWwo3HvR_3GAA9M2pPNMaGLNQ@mail.gmail.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 19 Jan 2021 01:45:30 +0800
Message-ID: <CAAd53p4JHX5R1KxSuz_PMsdJiZ85rnJR_LwG-RmgNs-0hKubrQ@mail.gmail.com>
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

Hi,

On Mon, Jan 18, 2021 at 10:41 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 18, 2021 at 2:45 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > Palm ejection stops working on some Elan and Synaptics touchpad after
> > commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for
> > some devices").
> >
> > The commit changes the mt_class from MT_CLS_WIN_8 to
> > MT_CLS_WIN_8_FORCE_MULTI_INPUT, so MT_QUIRK_CONFIDENCE isn't applied
> > anymore.
> >
> > So also apply the quirk since MT_CLS_WIN_8_FORCE_MULTI_INPUT is
> > essentially MT_CLS_WIN_8.
> >
> > Fixes: 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk for some devices")
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Thanks for the patch.
>
> IIt seems I was too lazy to write a regression test for it, and this
> strikes back.
> Can you also work on a regression test for this at
> https://gitlab.freedesktop.org/libevdev/hid-tools ?

Of course. I'll do it later this week. Currently I have both affected
Elan and Synaptics touchpad in hand.
Will this be a blocker of getting the patch merged?

Kai-Heng

>
> Cheers,
> Benjamin
>
>
>
>
> > ---
> >  drivers/hid/hid-multitouch.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 0743ef51d3b2..8429ebe7097e 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -758,7 +758,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> >                         MT_STORE_FIELD(inrange_state);
> >                         return 1;
> >                 case HID_DG_CONFIDENCE:
> > -                       if (cls->name == MT_CLS_WIN_8 &&
> > +                       if ((cls->name == MT_CLS_WIN_8 ||
> > +                            cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
> >                                 (field->application == HID_DG_TOUCHPAD ||
> >                                  field->application == HID_DG_TOUCHSCREEN))
> >                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> > --
> > 2.29.2
> >
>
