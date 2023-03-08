Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544A26B0CF7
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 16:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjCHPiI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 10:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjCHPhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 10:37:50 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5945A21A0;
        Wed,  8 Mar 2023 07:37:29 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id d12so11476344uak.10;
        Wed, 08 Mar 2023 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678289843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NlH41fVNmWKJg30ySlwfOHeo4JMbOfoiOL52pr0I3Y=;
        b=DHGEBOVAm4VU/+bMCa9w1ghUkTXuCKUwHlGF5+lP92bU1SNBwVOUBuEC39UwS5E1V1
         Icf95aUG8YOinaOu4JbOhnk3pqWKDwaa1p2ShunM2fIhpStjvpqxTf6t7RlncHudOck0
         ngsaOs6WjMGPBHDOPTevEpNaaYpkydh2lL+ugEhnwhEm4KpS3COw0VW+SrwPYZ5rkLnU
         fM/nBzDnnjXbYUYHmG4cJnfE4kzy2hmPAAiWlnzl3fPVFihdoDn5rWLpIqSbmQfBbfUO
         vDn96kW6uTLInXDVEmAITSk32CMADZZ0zDEuKJvi0ycMrFykP8jWTtTO2zMmYAMfcsWr
         qOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NlH41fVNmWKJg30ySlwfOHeo4JMbOfoiOL52pr0I3Y=;
        b=7MPw9JSdBP6QmgQkz0iHoR+glByTRnn2knMKS+NTv/Wju+24nU6voF0PHNnXa2VbAi
         HvuGKq0cCRivq/qQtkCWx113T3m85xr7PNg3ppWE0NiCFbSNI98vbBF4aokBqXonwHdj
         EGUO/+6YlDoncBVaXirlXhDTuWATRYiYKukF24cYxcsommBPI9rgMCCHUR0Dj4GrUPDh
         RwAjCPiFTy73iuXsj0+80FEB1imKY1O28lEQtPUnicA+izPOtRyhS3z5oJTMURu16tZM
         B5J09qxd2sdDo+9WYN+6/+MzC1B6uR1hXs3hL8qo0XfJ/udh1gvGZ3WPavMRt5G/2yiS
         38wQ==
X-Gm-Message-State: AO0yUKULcLBHPNEjh+h0ocAZd2OFDI8/WNrtQtcB36ZOb5L0/d0g290i
        OasJ3W0N5FF+TWxKOQuccBJvMFkIW8d/rk8GEss=
X-Google-Smtp-Source: AK7set9g2kNG0O93EVJdQQ65Nl7RgyvArn7fDU90rvrtWL7OwBH+m7Pe1NhcqTBW+9dhMICVo9kk6WMaAVDrJ2LGZQM=
X-Received: by 2002:a1f:3f8f:0:b0:3ea:b7e1:fb29 with SMTP id
 m137-20020a1f3f8f000000b003eab7e1fb29mr11882914vka.0.1678289843171; Wed, 08
 Mar 2023 07:37:23 -0800 (PST)
MIME-Version: 1.0
References: <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com> <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com> <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com> <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com> <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
In-Reply-To: <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Wed, 8 Mar 2023 09:37:11 -0600
Message-ID: <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 8, 2023 at 9:26=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mar 07 2023, Andy Shevchenko wrote:
> > On Tue, Mar 07, 2023 at 03:48:52PM +0100, Benjamin Tissoires wrote:
> > > On Mar 07 2023, Daniel Kaehn wrote:
> >
> > ...
> >
> > > So I can see that the device gets probed, and that all ACPI resources
> > > are tried to get the IRQ.
> > > Right now, I see that it's attempting to bind to the acpi resource in
> > > acpi_dev_resource_interrupt() (in file drivers/acpi/resources.c), but
> > > instead of having a ACPI_RESOURCE_TYPE_EXTENDED_IRQ I only get a
> > > ACPI_RESOURCE_TYPE_GPIO for the GpioInt() definition in the _CRS meth=
od.
> > >
> > > So I am missing the proper transition from GpioInt to IRQ in the acpi=
.
> >
> > I'm not sure I understand what this means.
> >
> > The Linux kernel takes either Interrupt() resource (which is
> > IOxAPIC / GIC / etc) or GpioInt() (which is GPIO based).
> >
> > In both cases I=C2=B2C framework submits this into client's IRQ field.
> >
>
> I finally managed to get past the retrieval of the GpioInt.
>
> Turns out that the function acpi_get_gpiod() matches on the parent of
> the gpio_chip (gc->parent), which means that, with the current code and
> my SSDT, it matches on the HID CP2112 ACPI node, not the GPIO one.
>
> For reference (with lots of boiler plate removed):
>
>         Device (CP21) { // the USB-hid & CP2112 shared node
>          Device (GPIO) {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
>
>             Name (_DSD, Package () {
>               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>               Package () {
>                 Package () { "gpio-line-names", Package () {
>                             "",
>                             "",
>                             "irq-rmi4",
>                             "",
>                             "power", // set to 1 with gpio-hog above
>                             "",
>                             "",
>                             "",
>                             ""}},
>               }
>             })
>          }
>
>   Scope (\_SB_.PCI0.USB0.RHUB.CP21.I2C)
>   {
>     Device (TPD0)
>     {
>       Name (_HID, "RMI40001")
>       Name (_CID, "PNP0C50")
>       Name (_STA, 0x0F)
>
>       Name (SBFB, ResourceTemplate ()
>       {
>           I2cSerialBusV2 (0x00c, ControllerInitiated, 100000,
>               AddressingMode7Bit, "\\_SB_.PCI0.USB0.RHUB.CP21.I2C",
>               0x00, ResourceConsumer,, Exclusive,
>               )
>       })
>       Name (SBFG, ResourceTemplate ()
>       {
>           GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
>               "\\_SB_.PCI0.USB0.RHUB.CP21", 0x00, ResourceConsumer, ,
>               )
>               {   // Pin list
>                   0x0002
>               }
>       })
> ---
>
> But if I refer "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", the IRQ is never assign=
ed.
> With the parent (CP21), it works.
>
> So I wonder if the cp2112 driver is correctly assigning the gc->parent
> field.


Did you make a change to the CP2112 driver patch to look for uppercase
"I2C" and "GPIO"?
Otherwise, it won't assign those child nodes appropriately, and the
gpiochip code will use
the parent node by default if the gpiochip's fwnode isn't assigned (I belie=
ve).

If that was indeed your problem all along (and I'm not missing
something else), sorry about that --
I made a comment above, but didn't add much spacing around it to make
it stand out (since I noticed you didn't reply to that part in your respons=
e)

> To get this to work -- I assume you had to change the driver to look
> for uppercase
> "GPIO" and "I2C", or some similar change?

Thanks,

Danny Kaehn
