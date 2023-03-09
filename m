Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E80A6B2043
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 10:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjCIJjI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 04:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjCIJjH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 04:39:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83D6457C5
        for <linux-input@vger.kernel.org>; Thu,  9 Mar 2023 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678354699;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HQWSofhy13XEmR+/PLxzyYhCDlmn9gHeLy19khs2lGs=;
        b=hu4iPjrl1vOfBU4e2WL3Hkhr8liZyPk7vKibSqVDhWTil2WxoXz7mTwbf8YZKFg8zceQyR
        pVZNjRi7/K91/ZAesn6WkBgJ6jvrHmYdREzLCpA+T2K5O2NlWPm2gs5xTFYj/OAC2BPiF5
        opGTMMzMOUr2w5XUlszO5kcdAyZZQYI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-S5Th3ze6NL2sVhvhr5qlCQ-1; Thu, 09 Mar 2023 04:38:15 -0500
X-MC-Unique: S5Th3ze6NL2sVhvhr5qlCQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16A5928043C2;
        Thu,  9 Mar 2023 09:38:15 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A62DD492C3E;
        Thu,  9 Mar 2023 09:38:13 +0000 (UTC)
Date:   Thu, 9 Mar 2023 10:38:11 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230309093811.se7exh6eocdgx5jv@mail.corp.redhat.com>
References: <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
 <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 08 2023, Andy Shevchenko wrote:
> On Wed, Mar 08, 2023 at 04:55:27PM +0100, Benjamin Tissoires wrote:
> > On Mar 08 2023, Daniel Kaehn wrote:
> > > On Wed, Mar 8, 2023 at 9:26 AM Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:
> > > > But if I refer "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", the IRQ is never assigned.
> > > > With the parent (CP21), it works.
> > > >
> > > > So I wonder if the cp2112 driver is correctly assigning the gc->parent
> > > > field.
> 
> > > Did you make a change to the CP2112 driver patch to look for uppercase
> > > "I2C" and "GPIO"?
> > 
> > yes, sorry I should have mentioned it. This is the only modification I
> > have compared to the upstream kernel plus your patch series.
> > 
> > > Otherwise, it won't assign those child nodes appropriately, and the
> > > gpiochip code will use
> > > the parent node by default if the gpiochip's fwnode isn't assigned (I believe).
> > 
> > I don't think it's a fwnode issue, but a problem with the assignment of
> > the parent of the gc:
> > ---
> > dev->gc.parent = &hdev->dev;
> > ---
> 
> I don't think so. The parent should point to the _physical_ device, which is
> CP2112, which is correct in my opinion.
> 

Right. I tend to agree, and then the problem seems to be relying in
gpiolib-acpi.c

> > Because the function acpi_gpiochip_find() in drivers/gpio/gpiolib-acpi.c
> > compares the acpi handle returned by fetching the ACPI path
> > ("\\_SB_.PCI0.USB0.RHUB.CP21.GPIO") and the one of gc->parent, which in
> > the hid-cp2112 case is the HID device itself.
> 
> We have specifically gc->fwnode for cases like this.

Looks like gpiolib-acpi.c doesn't care about fwnode at all.

if I do the following:

---
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index d8a421ce26a8..5aebc266426b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -126,7 +126,7 @@ static bool acpi_gpio_deferred_req_irqs_done;
 
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
-       return gc->parent && device_match_acpi_handle(gc->parent, data);
+       return ACPI_HANDLE_FWNODE(gc->fwnode) == data;
 }
 
 /**
---

I can now directly reference the GPIO ACPI node in my GpioInt()
declaration. And AFAICT this should be safe to do because gpiolib ensure
that gc->fwnode is set, using the one from the parent if it is not set
previously.

I need to check if this works with my icelake laptop, and if so I'll
send it to the list.

The reason the intel gpios are working (the only one I checked) is
because the \\SB.GPI0 node refers to the pinctrl controller (driver
pinctrl-icelake.c in my case, which then creates a subdevice for
handling the gpio).

> 
> ...
> 

Cheers,
Benjamin

