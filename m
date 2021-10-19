Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9844D434216
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 01:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhJSXfy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 19:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJSXfy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 19:35:54 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC07C06161C;
        Tue, 19 Oct 2021 16:33:40 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id n7so22466127iod.0;
        Tue, 19 Oct 2021 16:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=25rWtVJ6antFlMKw+3pZxLgSVWLey+YCqrJLukUkDHQ=;
        b=H7c+hB7X91riOlLeouKV8ZaBVBWQqIcSjW+PmO/QGmd73wmuMDc4JL7WsuBVj+lL7Q
         /13w9EhRqmUY63kGcfV+4xEAUlLtDFQ2FJ5mGdE4NpJRqKG6kFBW1HLPekJGlnUhh/ox
         Y5gaRXfv48cdC61MNhnM4gtwCYcnGJGzEDe1raU31cXL2EYDLCotfjfJtY0f2yawAoZO
         cm66z9vFwmRiuO97lEWb4uLzKLo53nztTr/FGkKLmJ/jjKhb3HPKNjoGNLFTrbmEphac
         OVzM0OewPn2IjNFhHS1xAFOPagt7CpwuGieNYQNl0szHcgTLt9jpS0RwvSd8AtWJj3bt
         aBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=25rWtVJ6antFlMKw+3pZxLgSVWLey+YCqrJLukUkDHQ=;
        b=HVxeLL4WojxX7WPhLnYo2H5+LgVGJzOI7VuuTBaQwAq9olDvwnb6BnB6uN3vduE3v1
         B+oVGAxOUa9+7LiQG+aYJfFJ589V0VI/aVktlRBYhErCBIKgHa7HXAkbp/rQSU8ErXjh
         t1BZ04m5zPGpi4hyxYKoLuawT2DgBQFXGmWon9PnVB3MAxA25DZlcznX5clV1r/nIZge
         OYp1Y5wTouxLeQr2r7ciM+r651uiL+vKOO6/wUILbOjsfu4tK0zy8cMNAfajV4tgd0Sz
         LMGMDoBN+Ggf2N+HTfhBoJS7SNlhe8sZlcKmRSkrzEd825Ea/YZ1rWG0pu/xShy20MHR
         p65Q==
X-Gm-Message-State: AOAM530tVk40E3b1m+eChUVDxc7pjx7SvwsQMWVhsd7uR65mYQJkpjlM
        6NN2uTvt4+4t7LfuVaZziKRht+19CrtzqKMXSek=
X-Google-Smtp-Source: ABdhPJyRmICumBr3hkAN5zDPyjw6E2QPC/S9FYCXywaKJmpiMx6L5D0jjzwJBbXy+KoshuC/KwcAr8lxScqF1MH10zU=
X-Received: by 2002:a05:6638:1489:: with SMTP id j9mr4111709jak.18.1634686420144;
 Tue, 19 Oct 2021 16:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com> <YW4kgnI0DQHj4sw4@google.com>
In-Reply-To: <YW4kgnI0DQHj4sw4@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 20 Oct 2021 09:33:13 +1000
Message-ID: <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the data values
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Ping,
>
> On Mon, Oct 18, 2021 at 10:41:55AM -0700, Ping Cheng wrote:
> > Hi Alistair,
> >
> > On Sat, Oct 9, 2021, 4:44 AM Alistair Francis <alistair@alistair23.me>
> > wrote:
> >
> > > Add support to the Wacom HID device for flipping the values based on
> > > device tree settings. This allows us to support devices where the panel
> > > is installed in a different orientation, such as the reMarkable2.
> > >
> >
> > This device was designed for hid-generic driver, if it's not driven by
> > wacom_i2c.c or an out of tree driver.
> >
> > wacom.ko doesn't support vid 0x2d1f devices.
>
> I am really confused about this distinction. Could you please elaborate
> why wacom driver only supports 0x056a (and, curiously, some Lenovo)
> devices.
>
> Thanks.
>
>
> >
> > Nacked-by: Ping Cheng <Ping.Cheng@wacom.com>
> >
> > Sorry about that,
> > Ping
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > > ---
> > >  .../bindings/input/hid-over-i2c.txt           | 20 ++++++
> > >  drivers/hid/wacom_sys.c                       | 25 ++++++++
> > >  drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
> > >  drivers/hid/wacom_wac.h                       | 13 ++++
> > >  4 files changed, 119 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > > b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > > index c76bafaf98d2..16ebd7c46049 100644
> > > --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > > +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> > > @@ -33,6 +33,26 @@ device-specific compatible properties, which should be
> > > used in addition to the
> > >  - post-power-on-delay-ms: time required by the device after enabling its
> > > regulators
> > >    or powering it on, before it is ready for communication.
> > >
> > > +  flip-tilt-x:
> > > +    type: boolean
> > > +    description: Flip the tilt X values read from device
> > > +
> > > +  flip-tilt-y:
> > > +    type: boolean
> > > +    description: Flip the tilt Y values read from device
>
> Do these really need to be controlled separately from the main
> touchcsreen orientation?

I don't think so actually.

>
> > > +
> > > +  flip-pos-x:
> > > +    type: boolean
> > > +    description: Flip the X position values read from device
> > > +
> > > +  flip-pos-y:
> > > +    type: boolean
> > > +    description: Flip the Y position values read from device
>
> We already have touchscreen-inverted-x/y defined in
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> why are they not sufficient?

The touchscreen-* properties aren't applied to HID devices though, at
least not that I can tell.

Alistair

>
> > > +
> > > +  flip-distance:
> > > +    type: boolean
> > > +    description: Flip the distance values read from device
>
> I am still confused of the notion of flipped distance.
>
> > > +
> > >  Example:
> > >
> > >         i2c-hid-dev@2c {
> > > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > > index 93f49b766376..47d9590b10bd 100644
> > > --- a/drivers/hid/wacom_sys.c
> > > +++ b/drivers/hid/wacom_sys.c
> > > @@ -10,6 +10,7 @@
> > >
> > >  #include "wacom_wac.h"
> > >  #include "wacom.h"
> > > +#include <linux/of.h>
> > >  #include <linux/input/mt.h>
> > >
> > >  #define WAC_MSG_RETRIES                5
> > > @@ -2730,6 +2731,28 @@ static void wacom_mode_change_work(struct
> > > work_struct *work)
> > >         return;
> > >  }
> > >
> > > +static void wacom_of_read(struct hid_device *hdev, struct wacom_wac
> > > *wacom_wac)
> > > +{
> > > +       if (IS_ENABLED(CONFIG_OF)) {
> > > +               wacom_wac->flip_tilt_x =
> > > of_property_read_bool(hdev->dev.parent->of_node,
> > > +                                                       "flip-tilt-x");
> > > +               wacom_wac->flip_tilt_y =
> > > of_property_read_bool(hdev->dev.parent->of_node,
> > > +                                                       "flip-tilt-y");
> > > +               wacom_wac->flip_pos_x =
> > > of_property_read_bool(hdev->dev.parent->of_node,
> > > +                                                       "flip-pos-x");
> > > +               wacom_wac->flip_pos_y =
> > > of_property_read_bool(hdev->dev.parent->of_node,
> > > +                                                       "flip-pos-y");
> > > +               wacom_wac->flip_distance =
> > > of_property_read_bool(hdev->dev.parent->of_node,
> > > +                                                       "flip-distance");
> > > +       } else {
> > > +               wacom_wac->flip_tilt_x = false;
> > > +               wacom_wac->flip_tilt_y = false;
> > > +               wacom_wac->flip_pos_x = false;
> > > +               wacom_wac->flip_pos_y = false;
> > > +               wacom_wac->flip_distance = false;
> > > +       }
> > > +}
> > > +
> > >  static int wacom_probe(struct hid_device *hdev,
> > >                 const struct hid_device_id *id)
> > >  {
> > > @@ -2797,6 +2820,8 @@ static int wacom_probe(struct hid_device *hdev,
> > >                                  error);
> > >         }
> > >
> > > +       wacom_of_read(hdev, wacom_wac);
> > > +
> > >         wacom_wac->probe_complete = true;
> > >         return 0;
> > >  }
> > > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > > index 33a6908995b1..c01f683e23fa 100644
> > > --- a/drivers/hid/wacom_wac.c
> > > +++ b/drivers/hid/wacom_wac.c
> > > @@ -3261,6 +3261,63 @@ static int wacom_status_irq(struct wacom_wac
> > > *wacom_wac, size_t len)
> > >         return 0;
> > >  }
> > >
> > > +static int wacom_of_irq(struct wacom_wac *wacom_wac, size_t len)
> > > +{
> > > +       const struct wacom_features *features = &wacom_wac->features;
> > > +       unsigned char *data = wacom_wac->data;
> > > +       struct input_dev *input = wacom_wac->pen_input;
> > > +       unsigned int x, y, pressure;
> > > +       unsigned char tsw, f1, f2, ers;
> > > +       short tilt_x, tilt_y, distance;
> > > +
> > > +       if (!IS_ENABLED(CONFIG_OF))
> > > +               return 0;
> > > +
> > > +       tsw = data[1] & WACOM_TIP_SWITCH_bm;
> > > +       ers = data[1] & WACOM_ERASER_bm;
> > > +       f1 = data[1] & WACOM_BARREL_SWITCH_bm;
> > > +       f2 = data[1] & WACOM_BARREL_SWITCH_2_bm;
> > > +       x = le16_to_cpup((__le16 *)&data[2]);
> > > +       y = le16_to_cpup((__le16 *)&data[4]);
> > > +       pressure = le16_to_cpup((__le16 *)&data[6]);
> > > +
> > > +       /* Signed */
> > > +       tilt_x = get_unaligned_le16(&data[9]);
> > > +       tilt_y = get_unaligned_le16(&data[11]);
> > > +
> > > +       distance = get_unaligned_le16(&data[13]);
>
> You are still parsing raw data. The point of HID is to provide common
> framework for scaling raw values.
>
> Thanks.
>
> --
> Dmitry
