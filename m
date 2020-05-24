Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74D31DFEAD
	for <lists+linux-input@lfdr.de>; Sun, 24 May 2020 13:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728618AbgEXLhU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 May 2020 07:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgEXLhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 May 2020 07:37:20 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B3EC061A0E
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 04:37:19 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id y17so12867198ilg.0
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JRTTDnVHSm5mEORxi72v7IeB97V55+J90iajuweop/I=;
        b=tbod9dfXc453XEmupA+nPiQrxW65xYGxx8MwOAbDZuE5bZyURqB4wK+HFgl9kTTnZS
         ZL+rrepI4wNGmJvvEIQDmNZU2BwZUD4FBosNiFdyD/YQcIRoYHPcfXlKJYM5a6VOAOAZ
         A7oIujWtn8ZPyx/uf6W4tK8SyKIEqwOEuGhXZ+ihspsSICWThw1gIsuhirqSdahGA4Er
         eHfNyNcb22weZZQM6dv3dI0VSly//IS4K8S8AEGlcD62IwFvYmShh0yOhjuXQRgaFviD
         ztmchcx3Kd+1KOzESch6S2kzDC/mrTRBXI8s/KHhRLr9eRfFlvEIaHhelpWAUMJ6e3bV
         /fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JRTTDnVHSm5mEORxi72v7IeB97V55+J90iajuweop/I=;
        b=WDL6ZniZaVqTdlhHsC2mQMDWyLfIgf7Qw8XGB7T95ue/P2rvizeiEQJ92aSfrUZyip
         rUDEbnftHjX20UZ1/zaXzSW/Biffh7yRlLKGH+o0iBhKVcNuRoBUJjZk/vI+DdPT2o7j
         h7AoIoExqQcYz1AB/buHDiC7S9sB0UtUsX4LwUOxBG7WHuqkAo9IqU5ra7bnKCpfSdgq
         wcpT+NyyflmKe3DZ6D3UwveOY/O9/cpXSq+keMq7ZNH6zjxwGBr88F4t6+ipHx28bo/X
         syvb/RYdJOHpgHwINsXe75FYpsMJkPADOf1doGS/ahMIlyKsPvl/8JpPOF5ev2cYAUvx
         FL9A==
X-Gm-Message-State: AOAM531wXr4DTrQoDS/hhVNazG5HBbOE9pfbxfW/NHt7f6yAU9nBD1j2
        SIb0xyp/qwY6X806OK+T/kGmz4eb1u/09v9nniLZWXYf
X-Google-Smtp-Source: ABdhPJxgtN3k1UhHZem+1QK79B0DXLfJJ7H5wqPO11St3EzntXiIW2ZLwr+weAVF/WCf0NGaq99/cuvgZb2CjzKpVxY=
X-Received: by 2002:a92:485c:: with SMTP id v89mr19543390ila.122.1590320238122;
 Sun, 24 May 2020 04:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws> <20200512051925.GA48688@koala>
 <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
 <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com>
 <20200523183734.GC89269@dtor-ws> <CAEwx+Qr=nJ0tPcuHhjO4=Mw_OHr17QcqeqTvcEzgZ0EcoNc8GQ@mail.gmail.com>
 <20200523211841.GD89269@dtor-ws>
In-Reply-To: <20200523211841.GD89269@dtor-ws>
From:   Yariv <oigevald+kernel@gmail.com>
Date:   Sun, 24 May 2020 14:36:42 +0300
Message-ID: <CAEwx+Qr5orAO3cm2OwsxfYTQeeXiEHHYg5tv=kahR5DYP-Mbyw@mail.gmail.com>
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery (regression)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Yep, that solved the problem.
I also verified that there are no apparent regressions.

Thanks!

On Sun, May 24, 2020 at 12:18 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Sat, May 23, 2020 at 10:11:50PM +0300, Yariv wrote:
> > Hi,
> >
> > I omitted what looks unrelated, please let me know if you need other
> > details or the full content.
> > Also I wasn't sure how to find the relevant driver, so I pasted the
> > relevant dmesg snippets. If there is a more precise way to identify
> > the driver please let me know and I'll send the missing items.
> >
> > Gen1:
> >
> > dmesg
> >
> > [   11.307056] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> > [   11.307060] Bluetooth: HIDP socket layer initialized
> > [   11.310541] magicmouse 0005:05AC:030E.0005: unknown main item tag 0x=
0
> > [   11.310657] input: john=E2=80=99s Trackpad as
> > /devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hci0/hci0=
:70/0005:05AC:030E.0005/input/input21
> > [   11.310776] magicmouse 0005:05AC:030E.0005: input,hidraw4:
> > BLUETOOTH HID v1.60 Mouse [john=E2=80=99s Trackpad] on 00:1a:7d:da:71:0=
9
>
> Ok, awesome. Can you please try the patch below?
>
> --
> Dmitry
>
> HID: magicmouse: do not set up autorepeat
>
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Neither trackpad, nor the mouse want input core to generate autorepeat
> events for their buttons, so let's reset the bit (as hid-input sets it
> for these devices based on the usage vendor code).
>
> Reported-by: Yariv <oigevald+kernel@gmail.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-magicmouse.c |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index 34138667f8af..7ea78be11c84 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -535,6 +535,12 @@ static int magicmouse_setup_input(struct input_dev *=
input, struct hid_device *hd
>                 __set_bit(MSC_RAW, input->mscbit);
>         }
>
> +       /*
> +        * hit-input may mark device as using autorepeat, but neither
> +        * the trackpad, nor the mouse actually want it.
> +        */
> +       __clear_bit(EV_REP, input->evbit);
> +
>         return 0;
>  }
>
