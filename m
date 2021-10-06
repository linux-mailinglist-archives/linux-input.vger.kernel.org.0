Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D746342458A
	for <lists+linux-input@lfdr.de>; Wed,  6 Oct 2021 20:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237826AbhJFSEq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Oct 2021 14:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhJFSEq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Oct 2021 14:04:46 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023AFC061746;
        Wed,  6 Oct 2021 11:02:54 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id a73so3244914pge.0;
        Wed, 06 Oct 2021 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4TKwQXAYbjOvW/141fj+PXaCeAVVGq83heQrA5J1LOQ=;
        b=W4/ZzDzkX7XhETD7t2aYC5dKXknh47hi2hPwTpNi/nDOafO9vq6ZQQPxwU5Yo3dFxs
         d6zKU4R9mbGcwaeE4BPe28sppUef2LTy5ja5ncfKvWBX4GP5N2AG1Gac8zo5Ga6SlTNH
         dPTTxpwEAFW/WpjUG1iTTiT77UQwMaw/1oJDEdM7EW6oGah7vkVemyGT0jkfQaF19hzJ
         y8O9MYppp+zYv0+1iM24CElrOpl0eZixAxJP3O8ZhGat9SrrRY7AjyU5ALn8bO/HO9Xm
         wINzsC9aNBdBD/YQf4K2Ncl4J7b1Pf2vSjP1D1Q1rmoBG9oRo9If8bIA1UoiKKVM1DhT
         ZSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4TKwQXAYbjOvW/141fj+PXaCeAVVGq83heQrA5J1LOQ=;
        b=t+cZmknQa7RBkq2d1cng7bUsys9JdGJyG5nuO8xn+End8EPyv2Oc2JKnNcbJZ99JR2
         XBpK55XlDl9CgkZ2sAtl9ChHdkoBd9L8Wyq83dP4IvsbJh6NpqfoVbZ3GqFrfzKRyUPr
         YsPvxGigqUmZftFA4fw3jP8iHHKrqnb3FqHPevEc9CKlkYAVP1FqSKoxJdQEh6BFioM0
         CmFzh6DHHJYHgJF/i97a9nzclV+5lLMhKaHONCWgMBVwsDT9EHOdZaE57MVorzWyR36i
         eg58IPsngV3nWNLkBXtrNPtCNKIsdjdHKPXC6QBSxWss/fuOxsDRoz5vQvuwiMKuRaAW
         YFsg==
X-Gm-Message-State: AOAM531Vi817frlyeMaoIEcnq7zFIHRQnu017APkx22Xj5Qa9WfRSD7T
        C1fa5wsDNU0R5Z+IfdTWuDQ=
X-Google-Smtp-Source: ABdhPJzh6DiVWI8qJ6GdozQJiMoJPFRbLJyCkqaFQmQYqBYLD9FM9CjU97ZdyezEx26Pcww7Pbg8Eg==
X-Received: by 2002:a05:6a00:22c3:b0:447:b30c:ed36 with SMTP id f3-20020a056a0022c300b00447b30ced36mr39274563pfj.82.1633543373111;
        Wed, 06 Oct 2021 11:02:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:18f1:d20e:edb5:c807])
        by smtp.gmail.com with ESMTPSA id m22sm22209908pfo.176.2021.10.06.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:02:52 -0700 (PDT)
Date:   Wed, 6 Oct 2021 11:02:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>,
        linux-input <linux-input@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Tatsunosuke Tobita <junkpainting@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alistair23@gmail.com" <alistair23@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Message-ID: <YV3kyReNo7BkecAD@google.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <YTcBOskPYjbv4q61@google.com>
 <CAF8JNh+PcYuaLL=ToS0hOT62YbVmMWY9BCT-CGx_x+AkKuO_Tw@mail.gmail.com>
 <YThQUtE757b/ExR4@google.com>
 <PA4PR07MB7407540AC0904ADB6D58A46487D69@PA4PR07MB7407.eurprd07.prod.outlook.com>
 <PA4PR07MB7407EF5BE9140753388E12C187B09@PA4PR07MB7407.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR07MB7407EF5BE9140753388E12C187B09@PA4PR07MB7407.eurprd07.prod.outlook.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tatsunosuke,

On Wed, Oct 06, 2021 at 07:08:38AM +0000, Tobita, Tatsunosuke wrote:
> Hi Dmitry,
> 
> I now understand what you mean. The understandable example is USB. The
> most of the recent drivers for USB devices has bee released as HiD
> driver.  That said. It's glad if you can have comments too about my
> questions.  Especially, when someone doesn't want the whole HID
> driver, but a single I2C I/F'd input device driver.

So far I have not heard a good reason for "not wanting" to use a
standard, well tested solution that everyone else is using, and instead
having a custom driver that essentially reimplements everything that HID
layer already does. Is the additional memory requirements of HID layer
too onerous? Can we address that instead?

If we continue this train of thought, why are they concerned with HID,
but happy with using I2C layer? Why don't they require a driver that
bangs directly onto I2C master ports bypassing all the layersi and
communicating with the peripheral directly?

> And also, I want to make correction that ***not*** all of our devices
> support HID. Some old devices do not support HID; that's why I added
> the driver in 2011.

And that is a good reason to keep existing version of wacom_i2c in the
kernel, but we should not try to extend it to handle HID-compatible
devices.

Thanks,
Dmitry

> 
> Thanks,
> 
> Tats
> 
> -----Original Message-----
> From: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com> 
> Sent: Friday, September 10, 2021 1:10 PM
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Ping Cheng <pinglinux@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>; Cheng, Ping <Ping.Cheng@wacom.com>; linux-input <linux-input@vger.kernel.org>; linux-imx@nxp.com; kernel@pengutronix.de; Tatsunosuke Tobita <junkpainting@gmail.com>; linux-kernel@vger.kernel.org; alistair23@gmail.com; robh+dt@kernel.org; devicetree@vger.kernel.org
> Subject: RE: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
> 
> [EXTERNAL]
> 
> Hi Dmitry and Ping,
> 
> I understand that we should stick with HID as much as possible.
> However, there're certainly situations in which some do not want even whole HID, but only an individual functionality for a certain device.
> In that case, they may not even include the bit of the HID, but exclude HID. What about then; what they should do without HID?
> This would be also the questions if such situations happened to other vendors than Wacom.
> 
> Also, what I need to add is that the early generations of our I2C devices do not support HID which is why "wacom_i2c" was added in 2011.
> 
> 
> Tats
> 
> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Wednesday, September 8, 2021 2:56 PM
> To: Ping Cheng <pinglinux@gmail.com>
> Cc: Tobita, Tatsunosuke <tatsunosuke.tobita@wacom.com>; Alistair Francis <alistair@alistair23.me>; Cheng, Ping <Ping.Cheng@wacom.com>; linux-input <linux-input@vger.kernel.org>; linux-imx@nxp.com; kernel@pengutronix.de; Tatsunosuke Tobita <junkpainting@gmail.com>; linux-kernel@vger.kernel.org; alistair23@gmail.com; robh+dt@kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
> 
> [EXTERNAL]
> 
> Hi Ping,
> 
> On Tue, Sep 07, 2021 at 10:25:43PM -0700, Ping Cheng wrote:
> > Hi Dmitry,
> >
> > On Mon, Sep 6, 2021, 11:05 PM Dmitry Torokhov 
> > <dmitry.torokhov@gmail.com>
> > wrote:
> >
> > > Hi Tatsunosuke,
> > >
> > > On Thu, Sep 02, 2021 at 07:33:49AM +0000, Tobita, Tatsunosuke wrote:
> > > > Hi Dmitry,
> > > >
> > > > Yes, our firmware supports HID over I2C.  However, some of our 
> > > > customers often do not want to use HID to handle our hardware; 
> > > > even they don't install the generic HID driver neither.  In such 
> > > > case, we need to distinguish what generation of our device 
> > > > customer's has. And to do so, we check I2C HID descriptor even 
> > > > though the driver is not working with HID driver components, but 
> > > > this one.  That is why I2C HID descriptor is used there. It is 
> > > > called, but the situation with this driver is not supposed to work as a HID device.
> > >
> > > I would like to understand better why the customers do not want to 
> > > use HID.
> >
> >
> > Those customers normally run embedded Linux. Their hardwares have very 
> > specific use cases. They don't need to support any other HID devices 
> > except the Wacom i2c device.
> >
> > >
> > There needs to be a _very_ strong reason to essentially duplicate
> > > HID layer in a vendor driver and I inclined to say that such 
> > > customers
> >
> > would need to patch their kernels themselves.
> >
> >
> > They most likely don't want to duplicate HID layer. They just don't 
> > need most of the HID layer code.
> 
> They just need touchscreen support. Plus stylus support. And maybe battery support. And maybe something else down the road... And they need to introduce DT and ACPI descriptors to be able to mould the behavior to platform needs. Which is pretty much the purpose of HID layer.
> 
> > wacom_i2c simplifies their deployment and testing process. Most of 
> > those customers are very small companies...
> 
> And now please continue this train of thoughts and consider every touch vendor. Wacom is not unique. We have Elan, Cypress, Weida, Goodix, etc.
> etc. Vendor drivers were acceptable before we had I2C standard, but now it is much better for everyone to share the efforts and use HID instead of replicating it for every vendor.
> 
> Thanks.
> 
> --
> Dmitry
