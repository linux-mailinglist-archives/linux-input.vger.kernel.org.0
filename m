Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74AD82CE49
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 20:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfE1SNo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 14:13:44 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:44626 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfE1SNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 14:13:44 -0400
Received: by mail-yb1-f196.google.com with SMTP id x187so8198515ybc.11
        for <linux-input@vger.kernel.org>; Tue, 28 May 2019 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OqpexmVIKfsSkeW7hmtnhVKKfuuGya/sOg3ZfntORRU=;
        b=VodMu0yhrGnCVbNkgm5tlDgPMsXnAXDomdWv8QS4b9vlsNi7ToWufDvlLlPJz2v8xj
         IQ/WNbRlith2/cUER8VYTKT9r1p+4sjc1hRNb6bifRXi6jo/AX6guQdLXHVgJhVFtjiH
         qQYe3EUxB9+WSPSxWEhHN6+jamT0NYHcHUeHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OqpexmVIKfsSkeW7hmtnhVKKfuuGya/sOg3ZfntORRU=;
        b=XY9QrXE+4vO+fXtMphRAtbsy/u7H1mO07qVCvD/UIogfsbPqAi6u2P9OFNALOBCwH3
         1OqXbXewHqeLZawmMJdHVeBWFdSDj6V+1UkW3Dx+fpRos7noLoBihodgjS24kDtyrpsD
         8Ql85Ks9LhFJ4c3xjkLhD8nyBuS7FX8RfdcFqYMiXMCdeze/B7cCuTBlpR9X6My/EM/E
         YUiHI37HlVChyIuY5eJK7gUdcHDHvyQebzY0GdWGywt+1hwkjHFL2sANtb5mJPOGt6xj
         +apbzcQmOc9AeeefgCpnKiDYRBRNrXkh7Ljk3gxWWnsZEiJ4gDZMPdF412Iv/rotVS7A
         Ww/w==
X-Gm-Message-State: APjAAAW4DuVZVeZ5I7BjEcO5QVmOWXGOpe/MdCOoiZETovP0StXSiOCd
        bub+sYnCCJ+HOYyLIjylxqXhbJ+zX/g=
X-Google-Smtp-Source: APXvYqwzYRbFbHsZpBc4wYwB9AZkgVP7WCum6zeQGlDTqT8Nq6vOigjqdQQ2ezKjUcSE95J0SKL8Fw==
X-Received: by 2002:a25:a029:: with SMTP id x38mr60089034ybh.137.1559067222949;
        Tue, 28 May 2019 11:13:42 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id y70sm3498157ywy.22.2019.05.28.11.13.41
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:13:42 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id m18so24053229qki.8
        for <linux-input@vger.kernel.org>; Tue, 28 May 2019 11:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:12d9:: with SMTP id e25mr15891334qkl.279.1559067221416;
 Tue, 28 May 2019 11:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-9-benjamin.tissoires@redhat.com> <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
 <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw> <20190528012101.GA193221@dtor-ws>
In-Reply-To: <20190528012101.GA193221@dtor-ws>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Tue, 28 May 2019 11:13:30 -0700
X-Gmail-Original-Message-ID: <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com>
Message-ID: <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        seobrien@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 27 May 2019 at 18:21, Dmitry Torokhov <dmitry.torokhov@gmail.com> w=
rote:
>
> Hi Benjamin, KT,
>
> On Mon, May 27, 2019 at 11:55:01AM +0800, =E5=BB=96=E5=B4=87=E6=A6=AE wro=
te:
> > Hi
> >
> > -----Original Message-----
> > From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> > Sent: Friday, May 24, 2019 5:37 PM
> > To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
> > Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/heigh=
t
> >
> > On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoires@=
redhat.com> wrote:
> > >
> > > The width/height is actually in the same unit than X and Y. So we
> > > should not tamper the data, but just set the proper resolution, so
> > > that userspace can correctly detect which touch is a palm or a finger=
.
> > >
> > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > --
> > >
> > > new in v2
> > > ---
> > >  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
> > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > > b/drivers/input/mouse/elan_i2c_core.c
> > > index 7ff044c6cd11..6f4feedb7765 100644
> > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > @@ -45,7 +45,6 @@
> > >  #define DRIVER_NAME            "elan_i2c"
> > >  #define ELAN_VENDOR_ID         0x04f3
> > >  #define ETP_MAX_PRESSURE       255
> > > -#define ETP_FWIDTH_REDUCE      90
> > >  #define ETP_FINGER_WIDTH       15
> > >  #define ETP_RETRY_COUNT                3
> > >
> > > @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_d=
ata *data,
> > >                         return;
> > >                 }
> > >
> > > -               /*
> > > -                * To avoid treating large finger as palm, let's redu=
ce the
> > > -                * width x and y per trace.
> > > -                */
> > > -               area_x =3D mk_x * (data->width_x - ETP_FWIDTH_REDUCE)=
;
> > > -               area_y =3D mk_y * (data->width_y - ETP_FWIDTH_REDUCE)=
;
> > > +               area_x =3D mk_x * data->width_x;
> > > +               area_y =3D mk_y * data->width_y;
> > >
> > >                 major =3D max(area_x, area_y);
> > >                 minor =3D min(area_x, area_y); @@ -1123,8 +1118,10 @@
> > > static int elan_setup_input_device(struct elan_tp_data *data)
> > >                              ETP_MAX_PRESSURE, 0, 0);
> > >         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
> > >                              ETP_FINGER_WIDTH * max_width, 0, 0);
> > > +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
> > >         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
> > >                              ETP_FINGER_WIDTH * min_width, 0, 0);
> > > +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);
> >
> > I had a chat with Peter on Wednesday, and he mentioned that this is dan=
gerous as Major/Minor are max/min of the width and height. And given that w=
e might have 2 different resolutions, we would need to do some computation =
in the kernel to ensure the data is correct with respect to the resolution.
> >
> > TL;DR: I don't think we should export the resolution there :(
> >
> > KT, should I drop the patch entirely, or is there a strong argument for=
 keeping the ETP_FWIDTH_REDUCE around?
> > I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE exi=
sted.
> > Our FW team know nothing about ETP_FWIDTH_REDUCE ether.
> >
> > The only side effect will happen on Chromebook because such computation=
 have stayed in ChromeOS' kernel for four years.
> > Chrome's finger/palm threshold may be different from other Linux distri=
bution.
> > We will discuss it with Google once the patch picked by chrome and caus=
e something wrong.
>
> Chrome has logic that contact with maximum major/minor is treated as a
> palm, so here the driver (which originally came from Chrome OS)
> artificially reduces the contact size to ensure that palm rejection
> logic does not trigger.
>
> I'm adding Harry to confirm whether we are still using this logic and to
> see if we can adjust it to be something else.

I'm not very familiar with our touchpad code, so adding Sean O'Brien, who i=
s.
