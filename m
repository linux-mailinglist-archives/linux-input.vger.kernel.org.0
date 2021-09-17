Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3523C41005A
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 22:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhIQUoz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 16:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhIQUoy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 16:44:54 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE20C061574;
        Fri, 17 Sep 2021 13:43:31 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id ay33so21331916qkb.10;
        Fri, 17 Sep 2021 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cURptoPnmh8nPXIL1WD6aR8XbtjzUJTY/I85DjzE1Ec=;
        b=YcJex6R4/YUKGwpA6LHeDHupG0hrNWpM/T6wzWN2Bijs6ouIHqTsAbOc66oyRRwm/t
         kM2xx/EnAkyOF+Vmxjo6M5h8sy6EP9tz/SrKPJDzJP+x+xa+MBYuTFKsWo/BYvPyLZkz
         3vuSbwXl/mFsKk3zheWHSrFPfn4096fdAmzOrJbDoh+4r/Vyf801DJcMQkYpz06fb2Re
         Xnzj+Q7e+TMpE8w7PcvL7Quwl32ucZq2E4QL8z1qsp17ee2kXkl6ESldNLzDMJCOQTvH
         qofNSTbs+Fy+VtYr+SpN0JlvqBrDSOrg6/nUZQ6A467Wyx3BceKoQzNh9ZY9wIpRmqq+
         6VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cURptoPnmh8nPXIL1WD6aR8XbtjzUJTY/I85DjzE1Ec=;
        b=HXw8/2iHy+NBrcjELADUn8Ui3PL8x5fY0SdG9gPenP/9bVYGV4LkFotOxqHWgsPKnN
         7Xlzy1kNoMtnoyS1WyVyAMrHWvEf/Bt6cKeMqAAgla9dH6UuzJPXpIe0+vRqU+aypCao
         4Ic/DnANGhQeMjjPwu+UVsYjKFcaWi3z0URetfpKGuoY5fktZ8R+SjutbOaTPvIot9/Z
         z/LkMti2sNAbXtgvofVJdrlqq/xtH4QEZNohaiU/StzuHmJ+3gFz+vDvYIHFAVynC4uo
         Wu2/q4QoKOPZA6C6GHW7DijHxVEgm8oxCyIpx2nKz86yUv/00G5bmx0eFraW4OiEcF/3
         Nk0Q==
X-Gm-Message-State: AOAM5302gb4NfhzZb4ZHFI+17BusGzAZzLoHj12KVzbpoHRVleMFUZHz
        UDwemCcT18wB2jZZIAc2IwfmV7+49nLiShHzgDA=
X-Google-Smtp-Source: ABdhPJwnUutnkolgj1UH1xmlNTDKws6K+v3ZaKVneH1VoEvZTRGXVtZh18KndhJ1hiUo/Bha3srK+W3HoiBrqMkBz88=
X-Received: by 2002:a37:e14:: with SMTP id 20mr12927560qko.229.1631911410908;
 Fri, 17 Sep 2021 13:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210829091925.190-1-alistair@alistair23.me> <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com> <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com> <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
In-Reply-To: <YThQUtE757b/ExR4@google.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Fri, 17 Sep 2021 13:43:18 -0700
Message-ID: <CAF8JNhJL_AzqnpzPw5PRR1xczhMBscxwLHMN7tE2EGRH8PHu4A@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alistair Francis <alistair@alistair23.me>
Cc:     "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        linux-input <linux-input@vger.kernel.org>, linux-imx@nxp.com,
        kernel@pengutronix.de, Tatsunosuke Tobita <junkpainting@gmail.com>,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Sep 7, 2021 at 10:55 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> > > >
> > > > Yes, our firmware supports HID over I2C.  However, some of our
> > > > customers often do not want to use HID to handle our hardware; even
> > > > they don't install the generic HID driver neither.  In such case, we
> > > > need to distinguish what generation of our device customer's has. And
> > > > to do so, we check I2C HID descriptor even though the driver is not
> > > > working with HID driver components, but this one.  That is why I2C HID
> > > > descriptor is used there. It is called, but the situation with this
> > > > driver is not supposed to work as a HID device.
> > >
> > > I would like to understand better why the customers do not want to use
> > > HID.
> >
> >
> > Those customers normally run embedded Linux. Their hardwares have very
> > specific use cases. They don't need to support any other HID devices except
> > the Wacom i2c device.
> >
> > >
> > There needs to be a _very_ strong reason to essentially duplicate
> > > HID layer in a vendor driver and I inclined to say that such customers
> >
> > would need to patch their kernels themselves.
> >
> > They most likely don't want to duplicate HID layer. They just don't need
> > most of the HID layer code.
>
> They just need touchscreen support. Plus stylus support. And maybe
> battery support. And maybe something else down the road... And they need
> to introduce DT and ACPI descriptors to be able to mould the behavior to
> platform needs. Which is pretty much the purpose of HID layer.

I see your point.

> > wacom_i2c simplifies their deployment and
> > testing process. Most of those customers are very small companies...
>
> And now please continue this train of thoughts and consider every touch
> vendor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
> etc. Vendor drivers were acceptable before we had I2C standard, but now
> it is much better for everyone to share the efforts and use HID instead
> of replicating it for every vendor.

And I agree with you that we should share our efforts on the main tasks.

However, with the same token of sharing efforts, I see the benefit of
merging this set of patches upstream. From the version number we can
tell the patchset has gone through at least 10 rounds of review and
update. Alistair has put a lot of effort to get this far (Thank you
Alistair for your time and effort!). A few community developers have
also reviewed the patches. This set of patches thoroughly touched all
parts of the components that related to an input i2c driver, which is
much better than the original version. This patchset would be a great
starting point for vendors to create their out of tree drivers, when
necessary. It would also offer vendors a clear picture of what
components they need to change/update to make their i2c input device
work under kernel input subsystem.

So, merging the patchset will benefit more people and preserve the
effort that went into the patchset so far. If you like, you can add a
comment in the patch mentioning that future effort should be directed
to the i2c-hid subsystem, etc...

I think the ultimate goal is to encourage more people to contribute to
open source projects and to make Linux a great platform that everyone
can work on easily.

Thank you for your consideration and support,
Ping
