Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326ED412DED
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 06:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhIUEhD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Sep 2021 00:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhIUEhC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Sep 2021 00:37:02 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3C0C061574;
        Mon, 20 Sep 2021 21:35:34 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id z14-20020a17090a8b8e00b0019cc29ceef1so1072843pjn.1;
        Mon, 20 Sep 2021 21:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EUTLBzAnCWX0F3Dgus2ou8/Lo1MoK62EjQVc8oyVbHM=;
        b=Q2YenMXQCLnT/cunHkHMgK6REWgufE4nuDTsR6CrPSOBHITrQM8hHKgnyli9Cf23Sz
         +oGzuEaK6o8tA4neCD681JblVu3tQcsfsKPeEp8znVXSvy3S/DBvw5fQpR0UbDAjlt+d
         VKCT+iXCX8t+N8b4SL4RH4qggGzxFoNSyGOjp0XpZNaImjEWWPsBQYvKH4j0SWMXs4kd
         QUT/DCSfpScszcFS9XbM/LFOoohhd+bqo0Yla3bkJ1DVLR7ane3HCNxltUmNBqyXJhC6
         DyMMTBK2t8osS29swZcPTa06+Poj/SkbrXLjjBinsPoVK0Jpkt6bHB6LHu5K3ZReoIhV
         Z9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EUTLBzAnCWX0F3Dgus2ou8/Lo1MoK62EjQVc8oyVbHM=;
        b=q9THbCf8sj2S9AO5l9v719EIdeUkeCwDhg555HehNsNJ/zrL4AT2s3WsfADN6nJTNb
         dtnSA9p/dcae/U5cl8+8sk0eP3/Y8L/VCNS7J6Hj4uCZVTFL/WA2rvOokm9q1YTH7vxl
         X133PXF2re6AsSc8aX1MjHVkmCmOrqfu0coE502bosorrwWoaImpIX/td4MLT+WM8o0g
         khGiXW0c3I921d9JM/PA7OOCsZrDGFsymSrHEiJuNswnQeDu+bm2HNPZZRqVq2EUWm+J
         6C1cfVJB5v55x8cq+DKMK/ceYQQ2DQU92pR8L7lsmt9yR+j7MynM2G/cztNLDZD/P9tq
         A0hQ==
X-Gm-Message-State: AOAM531byfmwI1XYY6fAzf0k4ACmRFgZDmEown4eramYDeBQtfWQ6OaZ
        p2O/f9WAC5jRsxQbdrmSJVk=
X-Google-Smtp-Source: ABdhPJxNZXowpZtbN3hOxjtLGCmzZz/apO015JEF6i/z1tbhSuHx7CsEhkfQXvsdpQm74nOGPcNqnA==
X-Received: by 2002:a17:90b:1a92:: with SMTP id ng18mr2960352pjb.218.1632198934126;
        Mon, 20 Sep 2021 21:35:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a5b4:f272:6a63:5b57])
        by smtp.gmail.com with ESMTPSA id x21sm6791036pfa.186.2021.09.20.21.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 21:35:33 -0700 (PDT)
Date:   Mon, 20 Sep 2021 21:35:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        linux-input <linux-input@vger.kernel.org>, linux-imx@nxp.com,
        kernel@pengutronix.de, Tatsunosuke Tobita <junkpainting@gmail.com>,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Message-ID: <YUlhEj/+gzrQLG8u@google.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
 <CAF8JNhJL_AzqnpzPw5PRR1xczhMBscxwLHMN7tE2EGRH8PHu4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNhJL_AzqnpzPw5PRR1xczhMBscxwLHMN7tE2EGRH8PHu4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ping,

On Fri, Sep 17, 2021 at 01:43:18PM -0700, Ping Cheng wrote:
> Hi Dmitry,
> 
> On Tue, Sep 7, 2021 at 10:55 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > > > >
> > > > > Yes, our firmware supports HID over I2C.  However, some of our
> > > > > customers often do not want to use HID to handle our hardware; even
> > > > > they don't install the generic HID driver neither.  In such case, we
> > > > > need to distinguish what generation of our device customer's has. And
> > > > > to do so, we check I2C HID descriptor even though the driver is not
> > > > > working with HID driver components, but this one.  That is why I2C HID
> > > > > descriptor is used there. It is called, but the situation with this
> > > > > driver is not supposed to work as a HID device.
> > > >
> > > > I would like to understand better why the customers do not want to use
> > > > HID.
> > >
> > >
> > > Those customers normally run embedded Linux. Their hardwares have very
> > > specific use cases. They don't need to support any other HID devices except
> > > the Wacom i2c device.
> > >
> > > >
> > > There needs to be a _very_ strong reason to essentially duplicate
> > > > HID layer in a vendor driver and I inclined to say that such customers
> > >
> > > would need to patch their kernels themselves.
> > >
> > > They most likely don't want to duplicate HID layer. They just don't need
> > > most of the HID layer code.
> >
> > They just need touchscreen support. Plus stylus support. And maybe
> > battery support. And maybe something else down the road... And they need
> > to introduce DT and ACPI descriptors to be able to mould the behavior to
> > platform needs. Which is pretty much the purpose of HID layer.
> 
> I see your point.
> 
> > > wacom_i2c simplifies their deployment and
> > > testing process. Most of those customers are very small companies...
> >
> > And now please continue this train of thoughts and consider every touch
> > vendor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
> > etc. Vendor drivers were acceptable before we had I2C standard, but now
> > it is much better for everyone to share the efforts and use HID instead
> > of replicating it for every vendor.
> 
> And I agree with you that we should share our efforts on the main tasks.
> 
> However, with the same token of sharing efforts, I see the benefit of
> merging this set of patches upstream. From the version number we can
> tell the patchset has gone through at least 10 rounds of review and
> update. Alistair has put a lot of effort to get this far (Thank you
> Alistair for your time and effort!).

I am sorry, but the fact that a developer spent a lot of time writing
code can not be used as a justification for merging said code.

> A few community developers have
> also reviewed the patches. This set of patches thoroughly touched all
> parts of the components that related to an input i2c driver, which is
> much better than the original version. This patchset would be a great
> starting point for vendors to create their out of tree drivers, when
> necessary. It would also offer vendors a clear picture of what
> components they need to change/update to make their i2c input device
> work under kernel input subsystem.

And they can do that by looking at the mailing list archive and they can
also follow this discussion and see why what they are doing is quite
wrong. I mean, why would they stop at dropping HID only? Why not bypass
I2C system as well and poke at the I2C controller directly. Skip PCI as
well?

> 
> So, merging the patchset will benefit more people and preserve the
> effort that went into the patchset so far. If you like, you can add a
> comment in the patch mentioning that future effort should be directed
> to the i2c-hid subsystem, etc...

No, we should not merge the patch set that we agreed is wrong in its
approach. Maybe if I (and other community reviewers) realized that the
device was HID compliant we could stop this effort earlier, but
unfortunately it did not happen, so effort was wasted, but this happens
sometimes.

Thanks.

-- 
Dmitry
