Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C8B434A0A
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 13:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhJTLbL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 07:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhJTLbI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 07:31:08 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F6AC061749;
        Wed, 20 Oct 2021 04:28:54 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id o184so12133457iof.6;
        Wed, 20 Oct 2021 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D2uZaiJiI2i/dpwLl4qWPBL5p8QJTn3vObzFGg2hT7Q=;
        b=MbV9/TOAqfuU7EfpWkQS0SdpRjW/Dz102RlzRuU5PrFFAbm8vzeH4f0fw6HsPDcIll
         F6KcEJwfipw/9pb3sjkeoJYOXj4hgER981MPxQgA/N5iQ7QWxdidg8pBPPo2UuDttDl5
         x2Uh/753SokhOQd96TVEYHr4W1oKL0GDIuH8MCikUnBR3PfcOCprUobP6m49fhbnZkDJ
         8PlY3EoroNQj/DfdI3z4qYw3D/FhH5CH/cIlyCbL9A6JlbEhCx9GodTLdPgD3wUZbqRx
         muy5Cvht2gwx+ZIdMi5SyW7oziglbiiqPPLu5y6SwXxDNadJjqH0c9min+vYNb8/ImfH
         NRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D2uZaiJiI2i/dpwLl4qWPBL5p8QJTn3vObzFGg2hT7Q=;
        b=DuW4NzI1tyS1ragZE2qRsieZYwPZhQ17rfca7DlniHIsVsh9dg0WoQR3Dp+wwKrvDP
         1y8E/J2RdVhyl9+FF4F8/tEQh4DLgy7FqQZnuU0rr2iOB9rxpV7AW3Ws4kDR3HfYJiR7
         keYdxYw5EiikIoOxqcySPOjC8xFWtAJeYhzUKiTVmfZRFLjhkKjkTMQu7D9LVVcoQUgH
         kT/BlunKiW91EZ09AIaiylPNdxChpjYNbrQkHpl6LSH8zDhWFJc9z4auEUXpZgE+ELh0
         1+q92OV01mqfpZ/SzPnL8Oh6R/AB1zSvTxOKfUDMV31pQR8IOe7ZPJoQj5G1FV8ub75g
         22+A==
X-Gm-Message-State: AOAM5332OSoBAVAL+LAb5u8OPWYqT0KUo4jsbKciKRtCBe8YALE8/LYO
        JyLj39BAaKBDRB9oKyxE6twtpT/Q9bsDY3xcwQw=
X-Google-Smtp-Source: ABdhPJxDvABu/e6obdx9VXQPJ7pCCoZh3DN2kF9ExUk9NUgpvYKON+hABTPCpQ0FCqaKSHlT8taPiQvoDLnLppRqMAQ=
X-Received: by 2002:a05:6638:1192:: with SMTP id f18mr8182669jas.114.1634729333931;
 Wed, 20 Oct 2021 04:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com> <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
 <YW9rRUsxPHTjeOGT@google.com> <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
 <YW97lwsMrLHetJGy@google.com>
In-Reply-To: <YW97lwsMrLHetJGy@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 20 Oct 2021 21:28:27 +1000
Message-ID: <CAKmqyKMHoJWv=O0p_y6u34--njcsYxnWHg+EYzOFUnS3MFTvow@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 12:14 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Oct 20, 2021 at 11:44:50AM +1000, Alistair Francis wrote:
> > On Wed, Oct 20, 2021 at 11:05 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> > > > On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >
> > > > > We already have touchscreen-inverted-x/y defined in
> > > > > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > > > > why are they not sufficient?
> > > >
> > > > The touchscreen-* properties aren't applied to HID devices though, at
> > > > least not that I can tell.
> > >
> > > No, they are not currently, but that does not mean we need to establish
> > > a new set of properties (property names) for HID case.
> >
> > I can update the names to use the existing touchscreen ones.
> >
> > Do you have a hint of where this should be implemented though?
> >
> > Right now (without "HID: wacom: Add support for the AG14 Wacom
> > device") the wacom touchscreen is just registered as a generic HID
> > device. I don't see any good place in hid-core, hid-input or
> > hid-generic to invert the input values for this.
>
> I think the transformation should happen in
> hid-multitouch.c::mt_process_slot() using helpers from
> include/linux/input/touchscreen.h

Thanks for the help!

I have managed to get the device to be a hid-multitouch (instead of
hid-generic).

I also think I have figured out a way to get the properties to
hid-multitouch from the i2c-hid device. It requires a change to
touchscreen.c, but it's not a big change.

The main problem now is that hid-multitouch.c::mt_process_slot() isn't
actually called. The code just calls input_sync() from
hid-multitouch.c::mt_report(). It doesn't get to mt_process_slot() due
to rdata->is_mt_collection not being true. Setting
rdata->is_mt_collection to true causes userspace not to see the wacom
input any more.

Alistair

>
> I think the more challenging question is to how pass/attach struct
> touchscreen_properties * to the hid device (i expect the properties will
> be attached to i2c-hid device, but maybe we could create a sub-node of
> it and attach properties there.
>
> Thanks.
>
> --
> Dmitry
