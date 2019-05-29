Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C0B2D2B4
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 02:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfE2AMZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 20:12:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42116 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfE2AMZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 20:12:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id 33so191693pgv.9
        for <linux-input@vger.kernel.org>; Tue, 28 May 2019 17:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LNTyn5rchJW4MmryhfQlOh+K3KT5VsOVQqxARSU5a5Y=;
        b=GLrQuc8zvIQ9LqRDpZL+InFTHuHVBXyl5wM6E6Sh92l9bW5OSzGUc0Ytg36DUxyAFO
         /Zk7ByaMl+LSBP8e2ZF3/15UWSIx8wokhWJWrhGY5Y6aKqu+GvlwEkeZfKjz1CV4qizr
         v08tzdALVjk6vCqjNiBYYRVnB9TtCyAENKbIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LNTyn5rchJW4MmryhfQlOh+K3KT5VsOVQqxARSU5a5Y=;
        b=Vxqgf1fN3QkRo/a/EIIke/SMlRJT8Xr0PHTH6Q/qh6Pr3teTl5cqsST19XqSpxNWjD
         4wZ7TYQFJ7WwInH1i151GsMTkDyvgMsGGB0LfvEWGmdcHTnwRochmWWOda5Qsu9Ctmkq
         ZnHKIU6haooskS8768aiICxt3vRSQrY4B4w1JXeRpm+ShxGwI4tEn1t6BfdGfKy/GJIC
         XzjmuysX1eIdsRWc4b3wWx7XlLSwqgmIZBsdcZNs4MKO+UDhKMpkUCM0sDVuPJpU3Rxy
         fSIgdVoD3pfa1Y/zEAwGrnpVQZjjqCYQ+a5ze/kfiXjxAZEunZeiBOMITCjInUojAyZa
         /bKw==
X-Gm-Message-State: APjAAAVBonlfezUskc8OdyKgvYnAicSwv8x1apN4pKSxyOeRHF6R0+sU
        sXtX3XIQzIFv0v+SAmNuoLkI+XL31kPkSPcBYwqNdw==
X-Google-Smtp-Source: APXvYqzrIwNPLIdmXwLRMGzet52o+hE+W9RSDh7AWebEvlLNrdUllaWE/Z8q1yjFRcK8e2eWGV4bmFNOxlPrnUvHPPw=
X-Received: by 2002:a17:90a:33c5:: with SMTP id n63mr9111023pjb.16.1559088743794;
 Tue, 28 May 2019 17:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-9-benjamin.tissoires@redhat.com> <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
 <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw> <20190528012101.GA193221@dtor-ws>
 <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com>
In-Reply-To: <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com>
From:   "Sean O'Brien" <seobrien@chromium.org>
Date:   Tue, 28 May 2019 17:12:12 -0700
Message-ID: <CAOOzhkq+vD034Q2FKB2ryR7Q9nY=iQjdrREuihkZTaVcg+E_Xg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
To:     Harry Cutts <hcutts@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We do still use a maxed out major axis as a signal for a palm in the touchs=
creen
logic, but I'm not too concerned because if that axis is maxed out, the con=
tact
should probably be treated as a palm anyway...

I'm more concerned with this affecting our gesture detection for
touchpad. It looks
like this change would cause all contacts to reported as some percentage bi=
gger
than they are currently. Can you give me an idea of how big that percentage=
 is?

On Tue, May 28, 2019 at 11:13 AM Harry Cutts <hcutts@chromium.org> wrote:
>
> On Mon, 27 May 2019 at 18:21, Dmitry Torokhov <dmitry.torokhov@gmail.com>=
 wrote:
> >
> > Hi Benjamin, KT,
> >
> > On Mon, May 27, 2019 at 11:55:01AM +0800, =E5=BB=96=E5=B4=87=E6=A6=AE w=
rote:
> > > Hi
> > >
> > > -----Original Message-----
> > > From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> > > Sent: Friday, May 24, 2019 5:37 PM
> > > To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
> > > Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> > > Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/hei=
ght
> > >
> > > On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoire=
s@redhat.com> wrote:
> > > >
> > > > The width/height is actually in the same unit than X and Y. So we
> > > > should not tamper the data, but just set the proper resolution, so
> > > > that userspace can correctly detect which touch is a palm or a fing=
er.
> > > >
> > > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > >
> > > > --
> > > >
> > > > new in v2
> > > > ---
> > > >  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
> > > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > > > b/drivers/input/mouse/elan_i2c_core.c
> > > > index 7ff044c6cd11..6f4feedb7765 100644
> > > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > > @@ -45,7 +45,6 @@
> > > >  #define DRIVER_NAME            "elan_i2c"
> > > >  #define ELAN_VENDOR_ID         0x04f3
> > > >  #define ETP_MAX_PRESSURE       255
> > > > -#define ETP_FWIDTH_REDUCE      90
> > > >  #define ETP_FINGER_WIDTH       15
> > > >  #define ETP_RETRY_COUNT                3
> > > >
> > > > @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp=
_data *data,
> > > >                         return;
> > > >                 }
> > > >
> > > > -               /*
> > > > -                * To avoid treating large finger as palm, let's re=
duce the
> > > > -                * width x and y per trace.
> > > > -                */
> > > > -               area_x =3D mk_x * (data->width_x - ETP_FWIDTH_REDUC=
E);
> > > > -               area_y =3D mk_y * (data->width_y - ETP_FWIDTH_REDUC=
E);
> > > > +               area_x =3D mk_x * data->width_x;
> > > > +               area_y =3D mk_y * data->width_y;
> > > >
> > > >                 major =3D max(area_x, area_y);
> > > >                 minor =3D min(area_x, area_y); @@ -1123,8 +1118,10 =
@@
> > > > static int elan_setup_input_device(struct elan_tp_data *data)
> > > >                              ETP_MAX_PRESSURE, 0, 0);
> > > >         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
> > > >                              ETP_FINGER_WIDTH * max_width, 0, 0);
> > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
> > > >         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
> > > >                              ETP_FINGER_WIDTH * min_width, 0, 0);
> > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);
> > >
> > > I had a chat with Peter on Wednesday, and he mentioned that this is d=
angerous as Major/Minor are max/min of the width and height. And given that=
 we might have 2 different resolutions, we would need to do some computatio=
n in the kernel to ensure the data is correct with respect to the resolutio=
n.
> > >
> > > TL;DR: I don't think we should export the resolution there :(
> > >
> > > KT, should I drop the patch entirely, or is there a strong argument f=
or keeping the ETP_FWIDTH_REDUCE around?
> > > I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE e=
xisted.
> > > Our FW team know nothing about ETP_FWIDTH_REDUCE ether.
> > >
> > > The only side effect will happen on Chromebook because such computati=
on have stayed in ChromeOS' kernel for four years.
> > > Chrome's finger/palm threshold may be different from other Linux dist=
ribution.
> > > We will discuss it with Google once the patch picked by chrome and ca=
use something wrong.
> >
> > Chrome has logic that contact with maximum major/minor is treated as a
> > palm, so here the driver (which originally came from Chrome OS)
> > artificially reduces the contact size to ensure that palm rejection
> > logic does not trigger.
> >
> > I'm adding Harry to confirm whether we are still using this logic and t=
o
> > see if we can adjust it to be something else.
>
> I'm not very familiar with our touchpad code, so adding Sean O'Brien, who=
 is.
