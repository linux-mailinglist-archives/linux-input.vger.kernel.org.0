Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CD46B110F
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 19:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjCHScW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 13:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCHScV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 13:32:21 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA44E9545E;
        Wed,  8 Mar 2023 10:32:19 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id m5so11826993uae.11;
        Wed, 08 Mar 2023 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678300338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmuerfw8Ur6h3JGTK+BP3f3JA1e5MyImxVSuuo55auY=;
        b=euJRJpaB0qqFn+ksAlxALAtjvu9uZ3U2/cnNtTPxSsd0Hqv78UjHw8LraH/XDIK8Wd
         EQSPkJttgV09DJLhbt+Rha5PDTEhdPDJRvxsCRh5Dt47vlnC7xCNStNcCr/uDogE72ah
         /W65XmhVNB+NwUeQZVJqOIP+J11OzPLAaMSaHhz/V0kaG5EAJlLPo04FszrCjNFY9Fko
         WYBySFWQOHU4pX2SYEal2v3u52sAxkqyvykTqU6Pdxgz4Yds4YzIR/VSNWhyffyiuun/
         PXqh9A9JJQZt6r0kXcCLs32MC1/KIkegk7TLY5JauoyE2U77GWEvVlh9femfJZAAyK2E
         8YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678300338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmuerfw8Ur6h3JGTK+BP3f3JA1e5MyImxVSuuo55auY=;
        b=MyCzjtzbgU8tLxTiP2XN/+ZbAxEwZXvXVyjB3AFqwbfwK6MEJDFs5O+EfAazsNl4po
         VtwL6NZkkR4zcYZnzfeJ2YaB5kc8y67tEHdE/xH9i2YZcfxCTzxIv3iKrqm5cshfGt5T
         o6XiNdnXMY9AAegT+e8oCx6Q1DqcKpSn7aHgQy+yPRnXWhGIrZsFwwQE88YOQpuXekWE
         iFt/5QmUMZZmNSB0gn/PRGVIjvYce7j2/8qcd3pMHLHYxH5o5U7byc4ymFAJZS3NVKog
         K1ZMReYA33bBamNsuWWhwkzmUBkgffYvCp/glTyS3nuz7+RWHiCR7uoc3cL860h2MRrX
         CXOQ==
X-Gm-Message-State: AO0yUKU87FYeatOhinc/BAlGzZlMxvY2bUc7+Dtu9D6jgs3xEVxzExHn
        QmXyRYVr2jM9+GdnYmjCwgvmh23kabyE4cYP9rOsH6SkmIJzGw==
X-Google-Smtp-Source: AK7set/bt7L5OSCcUNREgK600x5ojvvPSYlccoeVJgCm6856V8KMpPVaBWm5v9Cxhpgto38k0Xv9sMuRmtvfjXj8+oA=
X-Received: by 2002:a1f:2d50:0:b0:401:4daf:d581 with SMTP id
 t77-20020a1f2d50000000b004014dafd581mr12360561vkt.0.1678300338641; Wed, 08
 Mar 2023 10:32:18 -0800 (PST)
MIME-Version: 1.0
References: <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com> <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com> <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com> <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com> <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
 <ZAi5esmc158Bd2oL@smile.fi.intel.com>
In-Reply-To: <ZAi5esmc158Bd2oL@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Wed, 8 Mar 2023 12:32:07 -0600
Message-ID: <CAP+ZCCdziub809WKJ8-tAhYvg+axsiuXrvrZczj_x2K0bGzd7w@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 8, 2023 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 06:30:46PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 08, 2023 at 04:55:27PM +0100, Benjamin Tissoires wrote:
> > > On Mar 08 2023, Daniel Kaehn wrote:
> > > > On Wed, Mar 8, 2023 at 9:26=E2=80=AFAM Benjamin Tissoires
> > > > <benjamin.tissoires@redhat.com> wrote:
>
> ...
>
> > >                     ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> > >                     Package () {
> > >                             Package () { "cell-names", Package () { "=
i2c", "gpio" }
> > >                     }
> >
> > Yeah, looking at this, I think it still fragile. First of all, either t=
his is
> > missing, or simply wrong. We would need to access indices. ACPI _ADR is=
 in the
> > specification. As much as with PCI it may be considered reliable.
> >
> > So, that said, forget about it, and simply use _ADR as indicator of the=
 node.
> > See how MFD (in the Linux kernel) cares about this. Ex. Diolan DLN-2 dr=
iver.
>
> And that said, maybe CP2112 should simply re-use what MFD _already_ provi=
des?

Great point -- it definitely seems like this driver belongs in the mfd
directory to begin with.

It seems like aside from rewriting the CP2112 driver into an mfd
driver and two platform drivers,
my route forward for now would be to just do something like this (not
yet tested):

+ struct acpi_device *adev =3D ACPI_COMPANION(&hdev->dev);
+ if (adev)
+    ACPI_COMPANION_SET(&dev->adap.dev, acpi_find_child_device(adev,
0x0, false));
+ else
+     device_set_node(&dev->adap.dev,
device_get_named_child_node(&hdev->dev, "i2c"));

(and the same for the gpiochip)

The follow-up question -- does there exist something analogous to DT
bindings for ACPI devices,
other than the ACPI spec itself, where this should be documented? Or
will consumers truly have to
read the driver code to determine that _ADR 0 is I2C and _ADR 1 is
GPIO? (I haven't seen anything
in my search so far -- but knowing that it truly doesn't exist would
make me respect people developing
embedded ACPI-based systems all the more!)

Thanks for your patience in working through all of this, especially
considering how long of an email
chain this has become!

Thanks,

Danny Kaehn
