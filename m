Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F03A2D60B
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2019 09:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfE2HQv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 29 May 2019 03:16:51 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37357 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfE2HQv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 May 2019 03:16:51 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so1356952qtk.4
        for <linux-input@vger.kernel.org>; Wed, 29 May 2019 00:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YBsWEZZfo+UgqHtldSmUeH6vzvpGKBEdjxmYs3cxrzQ=;
        b=RZInIeq8pvLqS92hvtcTLWcGnSTMjsWylLloTxkVmW/rL45Gw2+LbAlau1/Lz0W4yR
         Bktu2rox1e3c8VfpxOegb9pRq4hNYrI91rC7eM275F8FUT9kVY/+LysyiWx7xwgImXBi
         WrdOVgBB5V4EKnyJDomBbautlTzXVm1O67EWMZ8Ca11YADRfSU+6D0rVfA3NqSG0dPXD
         tyupSbvKoloEdoEeOMO8HQCZzbtU6lZYph/ZH1arUEt2uF99+2syHi2ohfGppdll+hkA
         Hiz+yUflo0d/7tyBgwJZp4H3e8MF+fRlScQ3nOrk5J0gNSxno7O3ColftmOh6qB5XUDb
         J9EQ==
X-Gm-Message-State: APjAAAVNJ7V/vPth9HxR+cM1EOm0IPdKuo6bj4RKbkOEsYUCjM1d27fw
        S3oW85eNANLi5L27yJWxH3+SPP484ZgOHI7mNuyrJg==
X-Google-Smtp-Source: APXvYqx3QpT7U52GOpJXgpspwc7C5sBUu9dZBrX+Y0X3RjiEndCbZ2+u1ir4OX62jHwIBBrVhwd28m50aYY5rJOeHMo=
X-Received: by 2002:ac8:224d:: with SMTP id p13mr6085549qtp.154.1559114210817;
 Wed, 29 May 2019 00:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-9-benjamin.tissoires@redhat.com> <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
 <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw> <20190528012101.GA193221@dtor-ws>
 <CA+jURcsWe=fZ-catnCaH=A85vAhrv1w1E5nSwpJvBAwgCTNYfw@mail.gmail.com> <CAOOzhkq+vD034Q2FKB2ryR7Q9nY=iQjdrREuihkZTaVcg+E_Xg@mail.gmail.com>
In-Reply-To: <CAOOzhkq+vD034Q2FKB2ryR7Q9nY=iQjdrREuihkZTaVcg+E_Xg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 29 May 2019 09:16:38 +0200
Message-ID: <CAO-hwJ+9tnmvD-K3_Ksesdvag1aNbLB7eJxb9ZKb7kM24unqQQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
To:     "Sean O'Brien" <seobrien@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Harry Cutts <hcutts@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 29, 2019 at 2:12 AM Sean O'Brien <seobrien@chromium.org> wrote:
>
> We do still use a maxed out major axis as a signal for a palm in the touchscreen
> logic, but I'm not too concerned because if that axis is maxed out, the contact
> should probably be treated as a palm anyway...
>
> I'm more concerned with this affecting our gesture detection for
> touchpad. It looks
> like this change would cause all contacts to reported as some percentage bigger
> than they are currently. Can you give me an idea of how big that percentage is?

On the P52, I currently have:
[  +0.000009] max:    (3045,1731) drivers/input/mouse/elan_i2c_core.c:428
[  +0.000003] traces: (24,14) drivers/input/mouse/elan_i2c_core.c:429

-> with the computation done in the kernel:
width_ratio: 126
height_ratio: 123

For my average finger, the reported traces are between 4 and 6:
With the ETP_FWIDTH_REDUCE:
Major between 144 to 216
Minor between 132 to 198

Without:
Major between 504 to 756
Minor between 492 to 738

So a rough augmentation of 350%

For the Synaptics devices (over SMBus), they send the raw value of the
traces, so you will get a major/minor between 2 to 5. Max on these
axes is 15, so we should get the same percentage of value comparing to
the range.
Which is why libinput has a database of which device reports which
pressure/major/minor ranges as otherwise the values are just
impossible to understand.

Cheers,
Benjamin



>
> On Tue, May 28, 2019 at 11:13 AM Harry Cutts <hcutts@chromium.org> wrote:
> >
> > On Mon, 27 May 2019 at 18:21, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Hi Benjamin, KT,
> > >
> > > On Mon, May 27, 2019 at 11:55:01AM +0800, 廖崇榮 wrote:
> > > > Hi
> > > >
> > > > -----Original Message-----
> > > > From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> > > > Sent: Friday, May 24, 2019 5:37 PM
> > > > To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
> > > > Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> > > > Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
> > > >
> > > > On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > > > >
> > > > > The width/height is actually in the same unit than X and Y. So we
> > > > > should not tamper the data, but just set the proper resolution, so
> > > > > that userspace can correctly detect which touch is a palm or a finger.
> > > > >
> > > > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > >
> > > > > --
> > > > >
> > > > > new in v2
> > > > > ---
> > > > >  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
> > > > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/input/mouse/elan_i2c_core.c
> > > > > b/drivers/input/mouse/elan_i2c_core.c
> > > > > index 7ff044c6cd11..6f4feedb7765 100644
> > > > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > > > @@ -45,7 +45,6 @@
> > > > >  #define DRIVER_NAME            "elan_i2c"
> > > > >  #define ELAN_VENDOR_ID         0x04f3
> > > > >  #define ETP_MAX_PRESSURE       255
> > > > > -#define ETP_FWIDTH_REDUCE      90
> > > > >  #define ETP_FINGER_WIDTH       15
> > > > >  #define ETP_RETRY_COUNT                3
> > > > >
> > > > > @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
> > > > >                         return;
> > > > >                 }
> > > > >
> > > > > -               /*
> > > > > -                * To avoid treating large finger as palm, let's reduce the
> > > > > -                * width x and y per trace.
> > > > > -                */
> > > > > -               area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
> > > > > -               area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
> > > > > +               area_x = mk_x * data->width_x;
> > > > > +               area_y = mk_y * data->width_y;
> > > > >
> > > > >                 major = max(area_x, area_y);
> > > > >                 minor = min(area_x, area_y); @@ -1123,8 +1118,10 @@
> > > > > static int elan_setup_input_device(struct elan_tp_data *data)
> > > > >                              ETP_MAX_PRESSURE, 0, 0);
> > > > >         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
> > > > >                              ETP_FINGER_WIDTH * max_width, 0, 0);
> > > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
> > > > >         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
> > > > >                              ETP_FINGER_WIDTH * min_width, 0, 0);
> > > > > +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);
> > > >
> > > > I had a chat with Peter on Wednesday, and he mentioned that this is dangerous as Major/Minor are max/min of the width and height. And given that we might have 2 different resolutions, we would need to do some computation in the kernel to ensure the data is correct with respect to the resolution.
> > > >
> > > > TL;DR: I don't think we should export the resolution there :(
> > > >
> > > > KT, should I drop the patch entirely, or is there a strong argument for keeping the ETP_FWIDTH_REDUCE around?
> > > > I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE existed.
> > > > Our FW team know nothing about ETP_FWIDTH_REDUCE ether.
> > > >
> > > > The only side effect will happen on Chromebook because such computation have stayed in ChromeOS' kernel for four years.
> > > > Chrome's finger/palm threshold may be different from other Linux distribution.
> > > > We will discuss it with Google once the patch picked by chrome and cause something wrong.
> > >
> > > Chrome has logic that contact with maximum major/minor is treated as a
> > > palm, so here the driver (which originally came from Chrome OS)
> > > artificially reduces the contact size to ensure that palm rejection
> > > logic does not trigger.
> > >
> > > I'm adding Harry to confirm whether we are still using this logic and to
> > > see if we can adjust it to be something else.
> >
> > I'm not very familiar with our touchpad code, so adding Sean O'Brien, who is.
