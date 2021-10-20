Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC09434311
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 03:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhJTBrb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 21:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTBrb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 21:47:31 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F19C06161C;
        Tue, 19 Oct 2021 18:45:17 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id a8so20376784ilj.10;
        Tue, 19 Oct 2021 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lo/jOB9MRYPahQSJIGBGd5rI6irS5O6KXgLYFuOtSiA=;
        b=L9dglaaFTdi3X1M29JVYhAW3d45Ys+9bqoF7pCQ5K3NTWwBPhLZ7COQnEFHQENUo98
         xW85tOsgvCnasrSDlEX3dTobYD0VO53yYQHD0neekojcPCjdEeheNzK56abnnaQyTJ2m
         RQDrga4/kSdRQPoGCBuUuGb25X/WGX6rzTkm13/kQif5SU65AhddI13OITVcGqtFbzAj
         MHPH0RXDFCEzhqUY5mOORfrUbs8KeKrJdA7TgeAB5em9yJgiddiUn/+NvHv3GXSS9tfW
         tk1zDNHLIGNhSnzBlYaFZmmIdeyaZGfqSsMKQwAN4XRbDWYIbV7nvLhLfPksYG7zodAh
         z5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lo/jOB9MRYPahQSJIGBGd5rI6irS5O6KXgLYFuOtSiA=;
        b=m26qGMsHq3RQp29UrH9wItnqDz5RYFbGyMm3OrY0PAVSQyzYHaRVRju706spZBQMUd
         WusewdABhyf6DWryn+0BgPYw5nhICS4DKtEhi6Ayl3cgbC0YeXmgmr+zDXiGFgVSrads
         dszi5Z0k0uDbIFA8zBUAmNXetNu7Jk0lJ9sUQK/QUyNi9B5wvkoPt3y+lhn+FpyWt00r
         Ehf99Q9dFthGO4WTCSM7mYTfV5UNAdKo2/ljs/BimaZNi6Pwj18P7sbgSOiXHS889FI5
         MMBOJMpK1i5KcUyGR3o40jR6E+QaAB4QxlHsuOM1stEhM4x2xiQSZ4732GzOty2ysLVL
         iGaw==
X-Gm-Message-State: AOAM533NQflLbR2gNq0fX/rScdg0ZANJSo1+t5+10GzUYmvy+n7kMrkD
        Gc3KOSoDdO2ZG4DLoMP5ieaNViNm5Vh77Izk2/jeukwgVCkcew==
X-Google-Smtp-Source: ABdhPJwDrbnVyNBujwte7Z6f158pSxX3bIvESnjqXy/axaw0IMI5l0ezwjDH7TTLF9QihmXpF365Jzmlnimw7/ZoHH4=
X-Received: by 2002:a05:6e02:214a:: with SMTP id d10mr21663993ilv.290.1634694316599;
 Tue, 19 Oct 2021 18:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com> <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
 <YW9rRUsxPHTjeOGT@google.com>
In-Reply-To: <YW9rRUsxPHTjeOGT@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 20 Oct 2021 11:44:50 +1000
Message-ID: <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
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

On Wed, Oct 20, 2021 at 11:05 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> > On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > We already have touchscreen-inverted-x/y defined in
> > > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > > why are they not sufficient?
> >
> > The touchscreen-* properties aren't applied to HID devices though, at
> > least not that I can tell.
>
> No, they are not currently, but that does not mean we need to establish
> a new set of properties (property names) for HID case.

I can update the names to use the existing touchscreen ones.

Do you have a hint of where this should be implemented though?

Right now (without "HID: wacom: Add support for the AG14 Wacom
device") the wacom touchscreen is just registered as a generic HID
device. I don't see any good place in hid-core, hid-input or
hid-generic to invert the input values for this.

Even with my "HID: wacom: Add support for the AG14 Wacom device" patch
I don't see a good way of doing this without the raw data parsing.

Alistair

>
> Thanks.

>
> --
> Dmitry
