Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C81841C027
	for <lists+linux-input@lfdr.de>; Wed, 29 Sep 2021 09:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244720AbhI2Hw4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 03:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244241AbhI2Hw4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 03:52:56 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF22C06161C;
        Wed, 29 Sep 2021 00:51:15 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id r75so1964095iod.7;
        Wed, 29 Sep 2021 00:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xi6oRIcFueXmlR0CndpQTgi+G0fdFD2P4KfyLXWhJ8Y=;
        b=PKqZZypg6csaTv3HE1FO87oqCEGr0wbO13cFCh+c0xxgS5VMGaEUBxL630JE8yAhJq
         hgXNZRHyP9uyDoqryh/gmUMaMkahvyRFncMgzToSWmJNelm1OU+yl2Sv3mt8ey3UuVoj
         F91o0c4hRVl1Ba92PrG/8w+0q4NOH5A0m1JmjaC4LHnVgKxiyET+yJu3bOryaFwlR5iS
         GQd3pG0JhDB2MOKFuVT/tyBXsBX4J36B/nSyf0OC8pLtIhcZil6A/p+Ekg9NrR9rIgBb
         I/YzulOivM58C9cjXbntzN+m2EqEApUyZwFYA/saERRsBYQbLDD4ZtZCi3NoUKBxOLwE
         6MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xi6oRIcFueXmlR0CndpQTgi+G0fdFD2P4KfyLXWhJ8Y=;
        b=PN9q+XwEe3PXXReMFwyqS5Y0kEyLCaQlPjgH5sFWEW0wq/quJQcGwKvTB7GJMDq/F5
         rNwyybf3Xd0rT/mXPsNu/4a5A9jbfbNDgN6rGAS+GABJ6fQdpDrCArUmTp5owXPcLY3m
         P19NqRsNukyzDFBUxSTTry+I5qC7wfFQajALSoJUybPr4SP4ATJSxetY8ek5fs3qJQ5w
         CmJPmoWqyU7k0ZVwko0NbMpAeNO5ThAwMJhuCsKxJvY58uAkHlpDXEdTof+1OHQb7R30
         LQKCSkvi5m0EsvR86u78nkycuzJZB5ydwZ9uhu7zbgV/gX067hpDlsQAEbIAULAuqR7F
         5l7Q==
X-Gm-Message-State: AOAM531bTQzm+2VPykqQnENMprzAC/xbn00qqV8ByOAEhK+PnHvWyEB4
        N5iJL3fZ4A1dW1UVlAdJ4crezchmnZyyO4PcgZkPQSGd8SsX2Nq8
X-Google-Smtp-Source: ABdhPJwdPHD8TkHYd9RMPyqQj5husCjTRerMSyATA7K0i70RHLCD2Qk8VoSvKfw1HNpXlLJLlrJIEfSoYPeMuv/hnDM=
X-Received: by 2002:a05:6638:61c:: with SMTP id g28mr8104263jar.117.1632901874910;
 Wed, 29 Sep 2021 00:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210829091925.190-1-alistair@alistair23.me> <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com> <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com> <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com> <CAF8JNhJL_AzqnpzPw5PRR1xczhMBscxwLHMN7tE2EGRH8PHu4A@mail.gmail.com>
 <YUlhEj/+gzrQLG8u@google.com>
In-Reply-To: <YUlhEj/+gzrQLG8u@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 29 Sep 2021 17:50:00 +1000
Message-ID: <CAKmqyKMgvTGS7-A9axCNRSu6n-FPxrq55yyzt1U3sHWWoLTCtg@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        linux-input <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Tatsunosuke Tobita <junkpainting@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 21, 2021 at 2:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Ping,
>
> On Fri, Sep 17, 2021 at 01:43:18PM -0700, Ping Cheng wrote:
> > Hi Dmitry,
> >
> > On Tue, Sep 7, 2021 at 10:55 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > > > >
> > > > > > Yes, our firmware supports HID over I2C.  However, some of our
> > > > > > customers often do not want to use HID to handle our hardware; even
> > > > > > they don't install the generic HID driver neither.  In such case, we
> > > > > > need to distinguish what generation of our device customer's has. And
> > > > > > to do so, we check I2C HID descriptor even though the driver is not
> > > > > > working with HID driver components, but this one.  That is why I2C HID
> > > > > > descriptor is used there. It is called, but the situation with this
> > > > > > driver is not supposed to work as a HID device.
> > > > >
> > > > > I would like to understand better why the customers do not want to use
> > > > > HID.
> > > >
> > > >
> > > > Those customers normally run embedded Linux. Their hardwares have very
> > > > specific use cases. They don't need to support any other HID devices except
> > > > the Wacom i2c device.
> > > >
> > > > >
> > > > There needs to be a _very_ strong reason to essentially duplicate
> > > > > HID layer in a vendor driver and I inclined to say that such customers
> > > >
> > > > would need to patch their kernels themselves.
> > > >
> > > > They most likely don't want to duplicate HID layer. They just don't need
> > > > most of the HID layer code.
> > >
> > > They just need touchscreen support. Plus stylus support. And maybe
> > > battery support. And maybe something else down the road... And they need
> > > to introduce DT and ACPI descriptors to be able to mould the behavior to
> > > platform needs. Which is pretty much the purpose of HID layer.
> >
> > I see your point.
> >
> > > > wacom_i2c simplifies their deployment and
> > > > testing process. Most of those customers are very small companies...
> > >
> > > And now please continue this train of thoughts and consider every touch
> > > vendor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
> > > etc. Vendor drivers were acceptable before we had I2C standard, but now
> > > it is much better for everyone to share the efforts and use HID instead
> > > of replicating it for every vendor.
> >
> > And I agree with you that we should share our efforts on the main tasks.
> >
> > However, with the same token of sharing efforts, I see the benefit of
> > merging this set of patches upstream. From the version number we can
> > tell the patchset has gone through at least 10 rounds of review and
> > update. Alistair has put a lot of effort to get this far (Thank you
> > Alistair for your time and effort!).
>
> I am sorry, but the fact that a developer spent a lot of time writing
> code can not be used as a justification for merging said code.
>
> > A few community developers have
> > also reviewed the patches. This set of patches thoroughly touched all
> > parts of the components that related to an input i2c driver, which is
> > much better than the original version. This patchset would be a great
> > starting point for vendors to create their out of tree drivers, when
> > necessary. It would also offer vendors a clear picture of what
> > components they need to change/update to make their i2c input device
> > work under kernel input subsystem.
>
> And they can do that by looking at the mailing list archive and they can
> also follow this discussion and see why what they are doing is quite
> wrong. I mean, why would they stop at dropping HID only? Why not bypass
> I2C system as well and poke at the I2C controller directly. Skip PCI as
> well?
>
> >
> > So, merging the patchset will benefit more people and preserve the
> > effort that went into the patchset so far. If you like, you can add a
> > comment in the patch mentioning that future effort should be directed
> > to the i2c-hid subsystem, etc...
>
> No, we should not merge the patch set that we agreed is wrong in its
> approach. Maybe if I (and other community reviewers) realized that the
> device was HID compliant we could stop this effort earlier, but
> unfortunately it did not happen, so effort was wasted, but this happens
> sometimes.

Should I prepare a patch to remove the wacom I2C driver entirely then?

Alistair

>
> Thanks.
>
> --
> Dmitry
